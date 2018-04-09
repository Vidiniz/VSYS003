unit uDAOSales;

interface

uses System.Generics.Collections, uModelSales, FireDAC.Comp.Client,
  System.SysUtils, System.Classes, System.Variants, uConnection, uModelProduct;

type
  TDAOSales = class
    public
      class function RetunrItemSale(AValue: String; var AObject: TSalesItems): TSalesItems;
      class function VerifyReturnOrder(AValue: String): Boolean;
      class function ReturnOrderList(AValue: String;
      var AListSales: TObjectList<TSalesHeader>):TObjectList<TSalesHeader>;
      class function ReturnProductList(ACode, ADescription, ABarCode,
      AProvider, ADepartment: String;
      var AListSales: TObjectList<TProduct>):TObjectList<TProduct>;
      class function ReturnNumberSales: String;
      class function SubmitOrderSale(AHeader: TSalesHeader): Boolean;
      class function SubmitOrderEditSale(AHeader: TSalesHeader): Boolean;
      class function ReturnOrderHeader(AValue: String;var AHeader: TSalesHeader): TSalesHeader;
      class function CancelOrderSale(AValue: String): Boolean;
  end;

implementation

uses
  FireDAC.Comp.Script, Data.DB, FireDAC.Stan.Param;

{ TDAOSales }

class function TDAOSales.VerifyReturnOrder(AValue: String): Boolean;
var  lvSQLQuery: TFDQuery;
     lvQuery: String;
begin
  lvQuery:=  'SELECT COUNT(VPEDIDO.numpedido)                                    '+
             '  FROM VPEDIDO, VFILIAL, VPLPAGAMENTO                              '+
             ' WHERE VPEDIDO.codfilial = VFILIAL.CODFILIAL                       '+
             '   AND VPEDIDO.codplano  = vplpagamento.codplano                   '+
             '   AND VPEDIDO.codcliente = '+AValue;
  try
    lvSQLQuery := TFDQuery.Create(nil);
    lvSQLQuery.Connection := TConnection.GetConnection;
    lvSQLQuery.Open(lvQuery);
    try
      if lvSQLQuery.Fields[0].AsInteger > 0 then
        Result:= True
      else
        Result:= False;
    except
      raise Exception.Create('Erro ao executar consulta no banco de dados!');
    end;
  finally
    FreeAndNil(lvSQLQuery);
    TConnection.ReleaseConnection;
  end;
end;

class function TDAOSales.ReturnOrderHeader(AValue: String;var AHeader: TSalesHeader): TSalesHeader;
var
  lvSQLQuery: TFDQuery;
  lvQueryItems: TStringList;
  lvQueryHeader: TStringList;
  lvCount: Integer;
  lvItemsSales: TSalesItems;
begin
  try
    lvQueryHeader := TStringList.Create;
    lvQueryItems := TStringList.Create;
    lvQueryHeader.Add('SELECT VPEDIDO.NUMPEDIDO, VFILIAL.CODFILIAL, VFILIAL.FILIAL, VCLIENTE.CODCLIENTE,');
    lvQueryHeader.Add('       VCLIENTE.NOME, VPLPAGAMENTO.CODPLANO, VPLPAGAMENTO.DESCRICAO, VPEDIDO.DATA,');
    lvQueryHeader.Add('       VPEDIDO.VLTOTAL, VPEDIDO.VLDESCONTO, VPEDIDO.STATUS, COALESCE(VPEDIDO.VTABELA,0)AS VTABELA ');
    lvQueryHeader.Add('  FROM VPEDIDO, VFILIAL, VCLIENTE, VPLPAGAMENTO');
    lvQueryHeader.Add(' WHERE VPEDIDO.CODFILIAL = VFILIAL.CODFILIAL');
    lvQueryHeader.Add('   AND VPEDIDO.CODCLIENTE = VCLIENTE.CODCLIENTE');
    lvQueryHeader.Add('   AND VPEDIDO.CODPLANO = VPLPAGAMENTO.CODPLANO');
    lvQueryHeader.Add('   AND VPEDIDO.DTCANCEL IS NULL');
    lvQueryHeader.Add('   AND VPEDIDO.STATUS = ' + QuotedStr('A'));
    lvQueryHeader.Add('   AND VPEDIDO.NUMPEDIDO = :NUMPED');
    lvQueryItems.Add('SELECT VITEMPEDIDO.CODPRODUTO, VPRODUTO.DESCRICAO, VPRODUTO.CODBARRAS,');
    lvQueryItems.Add('       VITEMPEDIDO.QTDE, COALESCE(VITEMPEDIDO.PRECO,0) AS PRECO,  COALESCE(VITEMPEDIDO.VLDESC,0) AS VLDESC,');
    lvQueryItems.Add('       COALESCE(VITEMPEDIDO.TOTALPRECO,0) AS TOTALPRECO, COALESCE(VITEMPEDIDO.VLTABELA,0) AS VLTABELA, COALESCE(VITEMPEDIDO.NUMSEQ,0) AS NUMSEQ ');
    lvQueryItems.Add('  FROM VITEMPEDIDO, VPRODUTO');
    lvQueryItems.Add(' WHERE VITEMPEDIDO.CODPRODUTO = VPRODUTO.CODPRODUTO');
    lvQueryItems.Add('   AND VITEMPEDIDO.NUMPEDIDO = :NUMPED');
    lvSQLQuery := TFDQuery.Create(nil);
    lvSQLQuery.Connection := TConnection.GetConnection;
    lvSQLQuery.Params.CreateParam(ftInteger, 'NUMPED', ptInput);
    lvSQLQuery.Params[0].AsInteger := StrToInt(AValue);
    lvSQLQuery.SQL.AddStrings(lvQueryHeader);
    try
      lvSQLQuery.Open;
    except
      raise Exception.Create('Erro ao buscar informações do cabeçalho do pedido de venda!');
    end;
    if lvSQLQuery.RowsAffected > 0 then
    begin
      // Atribuindo dados ao objeto
      AHeader.OrderNumber := lvSQLQuery.Fields[0].AsString;
      AHeader.BranchNumber := lvSQLQuery.Fields[1].AsString;
      AHeader.BranchName := lvSQLQuery.Fields[2].AsString;
      AHeader.ClientNumber := lvSQLQuery.Fields[3].AsString;
      AHeader.ClientName := lvSQLQuery.Fields[4].AsString;
      AHeader.PlanNumber := lvSQLQuery.Fields[5].AsString;
      AHeader.PlanName := lvSQLQuery.Fields[6].AsString;
      AHeader.DateOrder := lvSQLQuery.Fields[7].AsString;
      AHeader.TotalValue := lvSQLQuery.Fields[8].AsString;
      AHeader.Discount := lvSQLQuery.Fields[9].AsString;
      AHeader.Status := lvSQLQuery.Fields[10].AsString;
      AHeader.TotalOriginal := lvSQLQuery.Fields[11].AsString;
    end;
    // Carregando objetos na lista de pedidos
    lvSQLQuery.Close;
    lvSQLQuery.SQL.Clear;
    lvSQLQuery.Params.CreateParam(ftInteger, 'NUMPED', ptInput);
    lvSQLQuery.Params[0].AsInteger := StrToInt(AValue);
    lvSQLQuery.SQL.AddStrings(lvQueryItems);
    try
      lvSQLQuery.Open;
    except
      raise Exception.Create('Erro ao buscar informações do Itens do pedido de venda!');
    end;
    if lvSQLQuery.RowsAffected > 0 then
    begin
      for lvCount := 0 to pred(lvSQLQuery.RowsAffected) do
      begin
        lvItemsSales := TSalesItems.Create;
        lvItemsSales.Code := lvSQLQuery.Fields[0].AsString;
        lvItemsSales.Description := lvSQLQuery.Fields[1].AsString;
        lvItemsSales.Barcode := lvSQLQuery.Fields[2].AsString;
        lvItemsSales.Amount := lvSQLQuery.Fields[3].AsString;
        lvItemsSales.Price := lvSQLQuery.Fields[4].AsString;
        lvItemsSales.Discount := lvSQLQuery.Fields[5].AsString;
        lvItemsSales.TotalPrice := lvSQLQuery.Fields[6].AsString;
        lvItemsSales.OrginalPrice := lvSQLQuery.Fields[7].AsString;
        lvItemsSales.Sequence := lvSQLQuery.Fields[8].AsString;
        AHeader.AddItemList(lvItemsSales);
        lvSQLQuery.Next;
      end;
    end;
    Result := AHeader;
  finally
    FreeAndNil(lvSQLQuery);
    FreeAndNil(lvQueryHeader);
    FreeAndNil(lvQueryItems);
    //FreeAndNil(lvItemsSales);
    TConnection.ReleaseConnection;
  end;

end;

class function TDAOSales.ReturnOrderList(
  AValue: String;
  var AListSales: TObjectList<TSalesHeader>): TObjectList<TSalesHeader>;
var  lvSQLQuery: TFDQuery;
     lvQuery: String;
     lvCount: Integer;
     lvSalesHeader: TSalesHeader;
begin
  lvQuery:=  'SELECT VPEDIDO.numpedido, VPEDIDO.codfilial, vfilial.filial,       '+
             '       VPEDIDO.codplano, vplpagamento.descricao, VPEDIDO.data,     '+
             '       VPEDIDO.vltotal, VPEDIDO.vldesconto, COALESCE(VPEDIDO.vtabela,0) as vtabela'+
             '  FROM VPEDIDO, VFILIAL, VPLPAGAMENTO                              '+
             ' WHERE VPEDIDO.codfilial = VFILIAL.CODFILIAL                       '+
             '   AND VPEDIDO.codplano  = vplpagamento.codplano                   '+
             '   AND VPEDIDO.DTCANCEL IS NULL                                    '+
             '   AND VPEDIDO.STATUS = '+QuotedStr('A')+
             '   AND VPEDIDO.codcliente = '+AValue;
  try
    lvSQLQuery:= TFDQuery.Create(nil);
    try
      lvSQLQuery.Connection := TConnection.GetConnection;
      lvSQLQuery.Open(lvQuery);
      if (lvSQLQuery.RowsAffected > 0) then
        begin
          for lvCount := 0 to pred(lvSQLQuery.RowsAffected) do
            begin
              lvSalesHeader := TSalesHeader.Create;
              AListSales.Add(lvSalesHeader);
              AListSales[lvCount].OrderNumber   :=  lvSQLQuery.Fields[0].AsString;
              AListSales[lvCount].BranchNumber  :=  lvSQLQuery.Fields[1].AsString;
              AListSales[lvCount].BranchName    :=  lvSQLQuery.Fields[2].AsString;
              AListSales[lvCount].PlanNumber    :=  lvSQLQuery.Fields[3].AsString;
              AListSales[lvCount].PlanName      :=  lvSQLQuery.Fields[4].AsString;
              AListSales[lvCount].DateOrder     :=  lvSQLQuery.Fields[5].AsString;
              AListSales[lvCount].TotalValue    :=  lvSQLQuery.Fields[6].AsString;
              AListSales[lvCount].Discount      :=  lvSQLQuery.Fields[7].AsString;
              AListSales[lvCount].TotalOriginal :=  lvSQLQuery.Fields[8].AsString;
              lvSQLQuery.Next;
            end;
          Result:= AListSales;
        end
      else
        Result:= AListSales;
    except
      raise Exception.Create('Erro ao retornar consulta do banco de dados!');
    end;
  finally
    FreeAndNil(lvSQLQuery);
    TConnection.ReleaseConnection;
  end;
end;

class function TDAOSales.CancelOrderSale(AValue: String): Boolean;
var lvSQLQuery: TFDQuery;
    lvQuery: String;
begin
  lvQuery := 'UPDATE VPEDIDO SET DTCANCEL = CAST('+QuotedStr('NOW')+' AS DATE), '+
             'STATUS = '+QuotedStr('C')+' WHERE NUMPEDIDO = '+AValue;
  try
    lvSQLQuery := TFDQuery.Create(nil);
    lvSQLQuery.Connection := TConnection.GetConnection;
    lvSQLQuery.Connection.StartTransaction;
    try
      lvSQLQuery.SQL.Text := lvQuery;
      lvSQLQuery.ExecSQL;
      lvSQLQuery.Connection.Commit;
      Result:= True;
    except
      lvSQLQuery.Connection.Rollback;
      Result:= False;
      raise Exception.Create('Erro ao cancelar pedido de venda!');
    end;
  finally
    FreeAndNil(lvSQLQuery);
    TConnection.ReleaseConnection;
  end;
end;

class function TDAOSales.RetunrItemSale(AValue: String;
var AObject: TSalesItems): TSalesItems;
var lvSQLQuery: TFDQuery;
    lvQuery: String;
begin
    lvQuery:= 'SELECT VPRODUTO.CODPRODUTO, VPRODUTO.DESCRICAO, VPRODUTO.QTUNITCX,'+
              '       VPRODUTO.CODBARRAS, VPRECO.PVENDA,                         '+
              '      (VPRODUTO.QTUNITCX * VPRECO.PVENDA ) as PTOTAL              '+
              '  FROM VPRODUTO, VPRECO                                           '+
              ' WHERE VPRODUTO.CODPRODUTO = VPRECO.CODPRODUTO                    '+
              '   AND VPRODUTO.CODPRODUTO = '+AValue;
  try
    lvSQLQuery := TFDQuery.Create(nil);
    lvSQLQuery.Connection := TConnection.GetConnection;
    try
      lvSQLQuery.Open(lvQuery);
      if lvSQLQuery.RowsAffected = 1 then
        begin
          AObject.Code         := lvSQLQuery.Fields[0].AsString;
          AObject.Description  := lvSQLQuery.Fields[1].AsString;
          AObject.Amount       := lvSQLQuery.Fields[2].AsString;
          AObject.Barcode      := lvSQLQuery.Fields[3].AsString;
          AObject.Price        := lvSQLQuery.Fields[4].AsString;
          AObject.Discount     := '0';
          AObject.OrginalPrice := lvSQLQuery.Fields[4].AsString;
          AObject.TotalPrice   := lvSQLQuery.Fields[5].AsString;
          Result:= AObject;
        end;
    except
      raise Exception.Create('Erro ao executar consulta no banco de dados');
    end;
  finally
    FreeAndNil(lvSQLQuery);
    TConnection.ReleaseConnection;
  end;
end;

class function TDAOSales.ReturnNumberSales: String;
var lvSQLQuery: TFDQuery;
    lvQuerySelect: String;
    lvQueryUpdate: String;
begin
  lvQuerySelect := 'SELECT NUMPED FROM VNUMERADOR WHERE CODNUMERADOR = 1';
  lvQueryUpdate := 'UPDATE VNUMERADOR SET NUMPED = (SELECT NUMPED FROM VNUMERADOR WHERE CODNUMERADOR = 1)+1 WHERE CODNUMERADOR = 1;';
  try
    lvSQLQuery := TFDQuery.Create(nil);
    lvSQLQuery.Connection := TConnection.GetConnection;
    try
      lvSQLQuery.Open(lvQuerySelect);
      Result:= lvSQLQuery.Fields[0].AsString;
      lvSQLQuery.SQL.Clear;
      lvSQLQuery.SQL.Text := lvQueryUpdate;
      lvSQLQuery.Connection.StartTransaction;
      lvSQLQuery.ExecSQL;
      lvSQLQuery.Connection.Commit;
    except
      lvSQLQuery.Connection.Rollback;
      raise Exception.Create('Error ao executar consulta!');
    end;
  finally
    FreeAndNil(lvSQLQuery);
    TConnection.ReleaseConnection;
  end;
end;

class function TDAOSales.ReturnProductList(ACode, ADescription, ABarCode,
  AProvider, ADepartment: String;
  var AListSales: TObjectList<TProduct>): TObjectList<TProduct>;
var lvSQLQuery: TFDQuery;
    lvProduct: TProduct;
    lvQuery: TStringList;
    lvCount: Integer;
begin
  lvQuery:= TStringList.Create;
  lvQuery.Add('SELECT FIRST 100 VPRODUTO.CODPRODUTO, VPRODUTO.DESCRICAO,         ');
  lvQuery.Add('       VPRODUTO.CODFORNECEDOR, VFORNECEDOR.NOME,                  ');
  lvQuery.Add('       VPRODUTO.CODDEPARTAMENTO, VDEPARTAMENTO.DESCRICAO,         ');
  lvQuery.Add('       VPRODUTO.CODFABRICA, VPRODUTO.CODBARRAS, VESTOQUE.QTDE,    ');
  lvQuery.Add('       VPRECO.PVENDA                                              ');
  lvQuery.Add(' FROM VPRODUTO, VPRECO, VESTOQUE, VFORNECEDOR, VDEPARTAMENTO      ');
  lvQuery.Add('WHERE VPRODUTO.CODPRODUTO = VPRECO.CODPRODUTO                     ');
  lvQuery.Add('  AND VPRODUTO.CODPRODUTO = VESTOQUE.CODPRODUTO                   ');
  lvQuery.Add('  AND VPRODUTO.CODFORNECEDOR = VFORNECEDOR.CODFORNECEDOR          ');
  lvQuery.Add('  AND VPRODUTO.CODDEPARTAMENTO = VDEPARTAMENTO.CODDEPARTAMENTO    ');
  if (ACode <> EmptyStr) then
  lvQuery.Add('  AND VPRODUTO.CODPRODUTO = '+ACode                                );
  if (ADescription <> EmptyStr) then
  lvQuery.Add('  AND VPRODUTO.DESCRICAO LIKE '+QuotedStr('%'+ADescription+'%')    );
  if (ABarCode <> EmptyStr) then
  lvQuery.Add('  AND VPRODUTO.BARCODE LIKE '+QuotedStr('%'+ABarCode+'%')          );
  if (AProvider <> EmptyStr) then
  lvQuery.Add('  AND VPRODUTO.CODFORNECEDOR = '+AProvider                         );
  if (ADepartment <> EmptyStr) then
  lvQuery.Add('  AND VPRODUTO.CODDEPARTAMENTO = '+ADepartment                     );
  try
    lvSQLQuery := TFDQuery.Create(nil);
    lvSQLQuery.Connection := TConnection.GetConnection;
    lvSQLQuery.SQL := lvQuery;
    try
      lvSQLQuery.Open;
      if lvSQLQuery.RowsAffected > 0 then
        begin
          for lvCount := 0 to pred(lvSQLQuery.RowsAffected) do
            begin
              lvProduct := TProduct.Create;
              AListSales.Add(lvProduct);
              AListSales[lvCount].Number            := lvSQLQuery.Fields[0].AsString;
              AListSales[lvCount].Description       := lvSQLQuery.Fields[1].AsString;
              AListSales[lvCount].Provider.Number   := lvSQLQuery.Fields[2].AsString;
              AListSales[lvCount].Provider.Name     := lvSQLQuery.Fields[3].AsString;
              AListSales[lvCount].Department.Number := lvSQLQuery.Fields[4].AsString;
              AListSales[lvCount].Department.Name   := lvSQLQuery.Fields[5].AsString;
              AListSales[lvCount].FactoryCode       := lvSQLQuery.Fields[6].AsString;
              AListSales[lvCount].Barcode           := lvSQLQuery.Fields[7].AsString;
              AListSales[lvCount].Stock             := lvSQLQuery.Fields[8].AsString;
              AListSales[lvCount].Price             := lvSQLQuery.Fields[9].AsString;
              lvSQLQuery.Next;
           end;
           Result := AListSales;
        end
        else
          Result := AListSales;
    except
      raise Exception.Create('Erro ao executar consulta do banco de dados!');
    end;
  finally
    FreeAndNil(lvSQLQuery);
    FreeAndNil(lvQuery);
    TConnection.ReleaseConnection;
  end;
end;

class function TDAOSales.SubmitOrderEditSale(AHeader: TSalesHeader): Boolean;
var lvSQLQuery: TFDQuery;
    lvQueryHeader, lvQueryDeleteItems, lvQueryInsertItems: String;
    lvCount: Integer;
begin
  lvQueryHeader := 'UPDATE VPEDIDO SET CODFILIAL = :CODFILIAL, CODPLANO = :CODPLANO, '+
                   'DATA = :DATA, VLTOTAL = :VLTOTAL, VLDESCONTO = :VLDESCONTO, '+
                   'STATUS = :STATUS, VTABELA = :VTABELA, CODUSURALT = :CODUSURALT '+
                   'WHERE NUMPEDIDO = :NUMPEDIDO ';
  lvQueryDeleteItems := 'DELETE FROM VITEMPEDIDO WHERE NUMPEDIDO = :NUMPED';
  lvQueryInsertItems := 'INSERT INTO VITEMPEDIDO ( NUMPEDIDO, CODPRODUTO, QTDE, PRECO,'+
                        ' CODBARRAS, VLDESC, VLTABELA, TOTALPRECO , NUMSEQ) VALUES '+
                        '(:P1, :P2, :P3, :P4, :P5, :P6, :P7, :P8, :P9) ';
  try
    lvSQLQuery := TFDQuery.Create(nil);
    lvSQLQuery.Connection := TConnection.GetConnection;
    lvSQLQuery.Connection.StartTransaction;
    try
      lvSQLQuery.SQL.Text := lvQueryDeleteItems;

      // Criando parametros da query de execução
      lvSQLQuery.Params.CreateParam(ftInteger,'NUMPED',ptInput);
      lvSQLQuery.ParamByName('NUMPED').AsInteger := StrToInt(AHeader.OrderNumber);

      // Executando Query de Delete
      lvSQLQuery.ExecSQL;

      lvSQLQuery.SQL.Clear;
      lvSQLQuery.SQL.Text := lvQueryInsertItems;

      // Criando parametros para inserção
      with lvSQLQuery.Params do
        begin
          CreateParam(ftInteger,'P1',ptInput);
          CreateParam(ftInteger,'P2',ptInput);
          CreateParam(ftFloat,'P3',ptInput);
          CreateParam(ftFloat,'P4',ptInput);
          CreateParam(ftString,'P5',ptInput);
          CreateParam(ftFloat,'P6',ptInput);
          CreateParam(ftFloat,'P7',ptInput);
          CreateParam(ftFloat,'P8',ptInput);
          CreateParam(ftInteger,'P9',ptInput);
          ParamByName('P1').ArrayType := atArray;
          ParamByName('P2').ArrayType := atArray;
          ParamByName('P3').ArrayType := atArray;
          ParamByName('P4').ArrayType := atArray;
          ParamByName('P5').ArrayType := atArray;
          ParamByName('P6').ArrayType := atArray;
          ParamByName('P7').ArrayType := atArray;
          ParamByName('P8').ArrayType := atArray;
          ParamByName('P9').ArrayType := atArray;
          ArraySize:= AHeader.RetriveList.Count;
        end;

      for lvCount  := 0 to pred(AHeader.RetriveList.Count) do
        begin
          with lvSQLQuery.Params do
            begin
              ParamByName('P1').AsIntegers[lvCount] := StrToInt(AHeader.OrderNumber);
              ParamByName('P2').AsIntegers[lvCount] := StrToInt(AHeader.RetriveList[lvCount].Code);
              ParamByName('P3').AsFloats[lvCount]   := StrToFloat(AHeader.RetriveList[lvCount].Amount);
              ParamByName('P4').AsFloats[lvCount]   := StrToFloat(AHeader.RetriveList[lvCount].Price);
              ParamByName('P5').AsStrings[lvCount]  := AHeader.RetriveList[lvCount].Barcode;
              ParamByName('P6').AsFloats[lvCount]   := StrToFloat(AHeader.RetriveList[lvCount].Discount);
              ParamByName('P7').AsFloats[lvCount]   := StrToFloat(AHeader.RetriveList[lvCount].OrginalPrice);
              ParamByName('P8').AsFloats[lvCount]   := StrToFloat(AHeader.RetriveList[lvCount].TotalPrice);
              ParamByName('P9').AsIntegers[lvCount] := StrToInt(AHeader.RetriveList[lvCount].Sequence);
            end;
        end;

      // Executando Insert dos Items
      lvSQLQuery.Execute(AHeader.RetriveList.Count,0);

      // Criando parametros da query de execução
      lvSQLQuery.SQL.Clear;
      lvSQLQuery.SQL.Text := lvQueryHeader;
      with lvSQLQuery.Params do
        begin
          CreateParam(ftInteger,'CODFILIAL',ptInput);
          CreateParam(ftInteger,'CODPLANO',ptInput);
          CreateParam(ftDate,'DATA',ptInput);
          CreateParam(ftFloat,'VLTOTAL',ptInput);
          CreateParam(ftFloat,'VLDESCONTO',ptInput);
          CreateParam(ftString,'STATUS',ptInput);
          CreateParam(ftFloat,'VTABELA',ptInput);
          CreateParam(ftString,'CODUSURALT',ptInput);
          CreateParam(ftInteger,'NUMPEDIDO',ptInput);
          ParamByName('CODFILIAL').AsInteger  := StrToInt(AHeader.BranchNumber);
          ParamByName('CODPLANO').AsInteger   := StrToInt(AHeader.PlanNumber);
          ParamByName('DATA').AsDate          := StrToDate(AHeader.DateOrder);
          ParamByName('VLTOTAL').AsFloat      := StrToFloat(AHeader.TotalValue);
          ParamByName('VLDESCONTO').AsFloat   := StrToFloat(AHeader.Discount);
          ParamByName('STATUS').AsString      := AHeader.Status;
          ParamByName('VTABELA').AsFloat      := StrToFloat(AHeader.TotalOriginal);
          ParamByName('CODUSURALT').AsInteger := StrToInt(AHeader.UserNumber);
          ParamByName('NUMPEDIDO').AsInteger  := StrToInt(AHeader.OrderNumber);
        end;
      lvSQLQuery.ExecSQL;
      lvSQLQuery.Connection.Commit;
      Result := True;
    except
      lvSQLQuery.Connection.Rollback;
      Result := False;
      raise Exception.Create('Erro ao alterar pedido de venda!');
    end;
  finally
    FreeAndNil(lvSQLQuery);
    TConnection.ReleaseConnection;
  end;
end;

class function TDAOSales.SubmitOrderSale(AHeader: TSalesHeader): Boolean;
var lvSQLQuery1, lvSQLQuery2: TFDQuery;
    lvTrans: TFDTransaction;
    lvQueryHeader, lvQueryItems: String;
    lvCount, lvSize: Integer;
begin
  lvSize := AHeader.RetriveList.Count;
  lvQueryHeader := 'INSERT INTO VPEDIDO VALUES(:P1, :P2, :P3, :P4, :P5, :P6, :P7, :P8, NULL, :P10, :P11, NULL, NULL)';
  lvQueryItems  := 'INSERT INTO VITEMPEDIDO VALUES(:PI1, :PI2, :PI3, :PI4, :PI5, :PI6, :PI7, :PI8, :PI9)';
  try
    // Criando TFDQuery
    lvSQLQuery1:= TFDQuery.Create(nil);
    lvSQLQuery2:= TFDQuery.Create(nil);
    lvTrans:= TFDTransaction.Create(nil);

    lvSQLQuery1.Transaction := lvTrans;
    lvSQLQuery1.Connection := TConnection.GetConnection;
    lvSQLQuery2.Transaction := lvTrans;
    lvSQLQuery2.Connection := TConnection.GetConnection;
    lvTrans.Connection:= TConnection.GetConnection;

    lvSQLQuery1.SQL.Text := lvQueryHeader;
    lvSQLQuery2.SQL.Text := lvQueryItems;
    // Criando paramtros
    with lvSQLQuery1.Params do
      begin
        CreateParam(ftInteger,'P1',ptInput);
        CreateParam(ftInteger,'P2',ptInput);
        CreateParam(ftInteger,'P3',ptInput);
        CreateParam(ftInteger,'P4',ptInput);
        CreateParam(ftDate,'P5',ptInput);
        CreateParam(ftFloat,'P6',ptInput);
        CreateParam(ftFloat,'P7',ptInput);
        CreateParam(ftString,'P8',ptInput);
        CreateParam(ftFloat,'P10',ptInput);
        CreateParam(ftInteger,'P11',ptInput);
        ParamByName('P1').AsInteger  := StrToInt(AHeader.OrderNumber);
        ParamByName('P2').AsInteger  := StrToInt(AHeader.BranchNumber) ;
        ParamByName('P3').AsInteger  := StrToInt(AHeader.ClientNumber);
        ParamByName('P4').AsInteger  := StrToInt(AHeader.PlanNumber);
        ParamByName('P5').AsDate     := StrToDate(AHeader.DateOrder);
        ParamByName('P6').AsFloat    := StrToFloat(AHeader.TotalValue);
        ParamByName('P7').AsFloat    := StrToFloat(AHeader.Discount);
        ParamByName('P8').AsString   := AHeader.Status;
        ParamByName('P10').AsFloat   := StrToFloat(AHeader.TotalOriginal);
        ParamByName('P11').AsInteger := StrToInt(AHeader.UserNumber);
      end;

    with lvSQLQuery2.Params do
      begin
        CreateParam(ftInteger,'PI1',ptInput);
        CreateParam(ftInteger,'PI2',ptInput);
        CreateParam(ftFloat,'PI3',ptInput);
        CreateParam(ftFloat,'PI4',ptInput);
        CreateParam(ftString,'PI5',ptInput);
        CreateParam(ftFloat,'PI6',ptInput);
        CreateParam(ftFloat,'PI7',ptInput);
        CreateParam(ftFloat,'PI8',ptInput);
        CreateParam(ftInteger,'PI9',ptInput);
        ParamByName('PI1').ArrayType := atArray;
        ParamByName('PI2').ArrayType := atArray;
        ParamByName('PI3').ArrayType := atArray;
        ParamByName('PI4').ArrayType := atArray;
        ParamByName('PI5').ArrayType := atArray;
        ParamByName('PI6').ArrayType := atArray;
        ParamByName('PI7').ArrayType := atArray;
        ParamByName('PI8').ArrayType := atArray;
        ParamByName('PI9').ArrayType := atArray;
        ArraySize:= AHeader.RetriveList.Count;
      end;

    for lvCount := 0 to pred(AHeader.RetriveList.Count) do
      begin
        with lvSQLQuery2.Params do
          begin
            ParamByName('PI1').AsIntegers[lvCount] := StrToInt(AHeader.OrderNumber);
            ParamByName('PI2').AsIntegers[lvCount] := StrToInt(AHeader.RetriveList[lvCount].Code);
            ParamByName('PI3').AsFloats[lvCount]   := StrToFloat(AHeader.RetriveList[lvCount].Amount);
            ParamByName('PI4').AsFloats[lvCount]   := StrToFloat(AHeader.RetriveList[lvCount].Price);
            ParamByName('PI5').AsStrings[lvCount]  := AHeader.RetriveList[lvCount].Barcode;
            ParamByName('PI6').AsFloats[lvCount]   := StrToFloat(AHeader.RetriveList[lvCount].Discount);
            ParamByName('PI7').AsFloats[lvCount]   := StrToFloat(AHeader.RetriveList[lvCount].OrginalPrice);
            ParamByName('PI8').AsFloats[lvCount]   := StrToFloat(AHeader.RetriveList[lvCount].TotalPrice);
            ParamByName('PI9').AsIntegers[lvCount] := StrToInt(AHeader.RetriveList[lvCount].Sequence);
          end;
      end;
    try
      lvTrans.StartTransaction;
      lvSQLQuery1.ExecSQL;
      lvSQLQuery2.Execute(lvSize,0);
      lvTrans.Commit;
      Result:= True;
    except
      lvTrans.Rollback;
      Result:= False;
      raise Exception.Create('Erro ao inserir pedido de venda!');
    end;
  finally
    FreeAndNil(lvSQLQuery1);
    FreeAndNil(lvSQLQuery2);
    FreeAndNil(lvTrans);
    TConnection.ReleaseConnection;
  end;
end;

end.
