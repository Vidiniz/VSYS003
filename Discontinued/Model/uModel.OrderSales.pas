(*******************************************************************************
 * Unit : uModel.OrderSales                                                    *
 * Autor : Vinícius Diniz da Costa                                             *
 * Data : 19/02/2018                                                           *
 * Função : Unit de Ordem de Venda                                             *
 *******************************************************************************)
unit uModel.OrderSales;

interface

uses
  System.SysUtils, FireDAC.Comp.Client, uConnection, math , System.Generics.Collections,
  Data.DB, FireDAC.Comp.Script, FireDAC.Stan.Param, Vcl.Dialogs;

type
  TOrderSalesItem = class
    private
      FAmount: Double;
      FBarCode: String;
      FCode: Integer;
      FDescription: String;
      FDiscount: Double;
      FItemTotalPrice: Double;
      FOriginalPrice: Double;
      FPrice: Double;
      FSequence: Integer;
    protected
      function GetAmount: String;
      function GetBarCode: String;
      function GetCode: String;
      function GetDescription: String;
      function GetDiscount: String;
      function GetItemTotalPrice: String;
      function GetOriginalPrice: String;
      function GetPrice: String;
      function GetSequence: String;
      procedure SetAmount(const Value: String);
      procedure SetDiscount(const Value: String);
      procedure SetItemTotalPrice(const Value: String);
      procedure SetPrice(const Value: String);
    public
      property Sequence: String read GetSequence;
      property Code: String read GetCode;
      property Description: String read GetDescription;
      property Amount: String read GetAmount write SetAmount;
      property BarCode: String read GetBarCode;
      property Price: String read GetPrice write SetPrice;
      property Discount: String read GetDiscount write SetDiscount;
      property OriginalPrice: String read GetOriginalPrice;
      property ItemTotalPrice: String read GetItemTotalPrice;
      procedure RetriveData(pValue: String);
      procedure CalcTotalPrice;
      procedure SubmitDiscount;
      procedure SubmitPrice;
      procedure SubmitOriginalPrice;
    published
      { published declarations }
    end;

  TOrderSalesHeader = class
    private
      FBranchCode: Integer;
      FBranchName: String;
      FCancelDate: TDate;
      FClientCode: Integer;
      FClientName: String;
      FDateOrder: TDate;
      FNumberOrder: Integer;
      FPayPlanCode: Integer;
      FPayPlanName: String;
      FStatusOrder: String;
      FTotalPrice: Double;
      FTotalDiscount: Double;
      FTotalOriginal: Double;
      FUserCode: Integer;
      FUserName: String;
      FTotalItems: Integer;
      FListProducts: TObjectList<TOrderSalesItem>;
    protected
      function GetBranchCode: String;
      function GetBranchName: String;
      function GetCancelDate: String;
      function GetClientCode: String;
      function GetClientName: String;
      function GetDateOrder: String;
      function GetNumberOrder: String;
      function GetPayPlanCode: String;
      function GetPayPlanName: String;
      function GetStatusOrder: String;
      function GetTotalDiscount: String;
      function GetTotalOriginal: String;
      function GetTotalPrice: String;
      function GetUserCode: String;
      function GetUserName: String;
      procedure SetBranchCode(const Value: String);
      procedure SetBranchName(const Value: String);
      procedure SetCancelDate(const Value: String);
      procedure SetClientCode(const Value: String);
      procedure SetClientName(const Value: String);
      procedure SetDateOrder(const Value: String);
      procedure SetNumberOrder(const Value: String);
      procedure SetPayPlanCode(const Value: String);
      procedure SetPayPlanName(const Value: String);
      procedure SetStatusOrder(const Value: String);
      procedure SetTotalDiscount(const Value: String);
      procedure SetTotalOriginal(const Value: String);
      procedure SetTotalPrice(const Value: String);
      procedure SetUserCode(const Value: String);
      procedure SetUserName(const Value: String);
    public
      property NumberOrder: String read GetNumberOrder write SetNumberOrder;
      property ClientCode: String read GetClientCode write SetClientCode;
      property ClientName: String read GetClientName write SetClientName;
      property PayPlanCode: String read GetPayPlanCode write SetPayPlanCode;
      property PayPlanName: String read GetPayPlanName write SetPayPlanName;
      property BranchCode: String read GetBranchCode write SetBranchCode;
      property BranchName: String read GetBranchName write SetBranchName;
      property DateOrder: String read GetDateOrder write SetDateOrder;
      property UserCode: String read GetUserCode write SetUserCode;
      property UserName: String read GetUserName write SetUserName;
      property CancelDate: String read GetCancelDate write SetCancelDate;
      property StatusOrder: String read GetStatusOrder write SetStatusOrder;
      property TotalPrice: String read GetTotalPrice write SetTotalPrice;
      property TotalDiscount: String read GetTotalDiscount write SetTotalDiscount;
      property TotalOriginal: String read GetTotalOriginal write SetTotalOriginal;
      constructor Create;
      destructor Destroy;
      procedure NewNumberOrder;
      procedure AddItemList(pObject: TOrderSalesItem);
      procedure RemoveItemList(pIndex: Integer);
      function VerifyItemList(pCode: String): Boolean;
      procedure TotalizerOrderSale(pType: Char; pIndex: Integer);
      function SubmitOrderSale:Boolean;
      function SubmitOrderHeader: Boolean;
      function SubmitOrderItem: Boolean;
    published
      { published declarations }
    end;

implementation

{------------------------------------------------------------------------------}
{-------------------------------- TOrderSalesHeader ---------------------------}
{------------------------------------------------------------------------------}

(*******************************************************************************
 * Metodos Funcionais                                                          *
 *******************************************************************************)
procedure TOrderSalesHeader.NewNumberOrder;
var lvSQLQuery: TFDQuery;
    lvQuery, lvUpdate: String;
begin
  lvQuery  := 'SELECT NUMPED FROM VNUMERADOR WHERE CODNUMERADOR = 1';
  lvUpdate := 'UPDATE VNUMERADOR SET NUMPED = (SELECT NUMPED FROM VNUMERADOR  '+
              ' WHERE CODNUMERADOR = 1)+1 WHERE CODNUMERADOR = 1';
  try
    lvSQLQuery := TFDQuery.Create(nil);
    lvSQLQuery.Connection := TConnection.GetConnection;
    try
      lvSQLQuery.Close;
      lvSQLQuery.Open(lvQuery);
      if lvSQLQuery.RowsAffected = 1 then
        FNumberOrder := lvSQLQuery.Fields[0].AsInteger;
      lvSQLQuery.Close;
      lvSQLQuery.SQL.Clear;
      lvSQLQuery.SQL.Text := lvUpdate;
      lvSQLQuery.Connection.StartTransaction;
      lvSQLQuery.ExecSQL;
      lvSQLQuery.Connection.Commit;
    except
      lvSQLQuery.Connection.Rollback;
      raise Exception.Create('Erro ao executar consulta no banco de dados!');
    end;
  finally
    FreeAndNil(lvSQLQuery);
    TConnection.ReleaseConnection;
  end;
end;

procedure TOrderSalesHeader.RemoveItemList(pIndex: Integer);
begin
  if pIndex >= 0 then
   FListProducts.Delete(pIndex);
end;

procedure TOrderSalesHeader.AddItemList(pObject: TOrderSalesItem);
var lvSeq : Integer;
begin
    FListProducts.Add(pObject);
    lvSeq := FListProducts.Count -1;
    FListProducts[lvSeq].FSequence       := lvSeq;
    FListProducts[lvSeq].FCode           := pObject.FCode;
    FListProducts[lvSeq].FDescription    := pObject.FDescription;
    FListProducts[lvSeq].FAmount         := pObject.FAmount;
    FListProducts[lvSeq].FPrice          := pObject.FPrice;
    FListProducts[lvSeq].FOriginalPrice  := pObject.FOriginalPrice;
    FListProducts[lvSeq].FItemTotalPrice := pObject.FItemTotalPrice;
    FTotalItems := FListProducts.Count;
end;

function TOrderSalesHeader.VerifyItemList(pCode: String): Boolean;
var lvCount: Integer;
begin
  if FListProducts.Count > 0 then
    begin
      for lvCount := 0 to FListProducts.Count -1 do
        begin
          if (FListProducts[lvCount].FCode = StrToInt(pCode)) then
            begin
              Result := False;
              Break;
            end
          else
            begin
              Result := True;
            end;
        end;
    end
  else
    Result := True;
end;

function TOrderSalesHeader.SubmitOrderHeader: Boolean;
var lvSQLQuery: TFDQuery;
    lvQuery: String;
//    lvStorPrc: TFDStoredProc;
begin
  lvQuery := 'insert into vpedido values(:NUMPED, :CODFILIAL, :CODCLIENTE, '+
             ' :CODPLANO, :DATA, :VLTOTAL, :VLDESCONTO, :STATUS, :DTCANCEL,'+
             ' :VLTABELA, :CODUSURINC, :CODUSURALT, :CODUSURCANC)';
  try
    lvSQLQuery := TFDQuery.Create(nil);
    lvSQLQuery.Connection := TConnection.GetConnection;
    lvSQLQuery.Params.CreateParam(ftInteger,'NUMPED',ptInput);
    lvSQLQuery.Params.CreateParam(ftInteger,'CODFILIAL',ptInput);
    lvSQLQuery.Params.CreateParam(ftInteger,'CODCLIENTE',ptInput);
    lvSQLQuery.Params.CreateParam(ftInteger,'CODPLANO',ptInput);
    lvSQLQuery.Params.CreateParam(ftDate,'DATA',ptInput);
    lvSQLQuery.Params.CreateParam(ftFloat,'VLTOTAL',ptInput);
    lvSQLQuery.Params.CreateParam(ftFixedChar,'STATUS',ptInput);
    lvSQLQuery.Params.CreateParam(ftFMTBcd,'VLTABELA',ptInput);
    lvSQLQuery.Params.CreateParam(ftFMTBcd,'VLDESCONTO',ptInput);
    lvSQLQuery.Params.CreateParam(ftInteger,'CODUSURINC',ptInput);
    lvSQLQuery.Params.ParamByName('NUMPED').AsInteger := FNumberOrder;
    lvSQLQuery.Params.ParamByName('CODFILIAL').AsInteger := FBranchCode;
    lvSQLQuery.Params.ParamByName('CODCLIENTE').AsInteger := FClientCode;
    lvSQLQuery.Params.ParamByName('CODPLANO').AsInteger := FPayPlanCode;
    lvSQLQuery.Params.ParamByName('DATA').AsDate := FDateOrder;
    lvSQLQuery.Params.ParamByName('VLDESCONTO').AsFloat := FTotalDiscount;
    lvSQLQuery.Params.ParamByName('VLTOTAL').AsFloat := FTotalPrice;
    lvSQLQuery.Params.ParamByName('STATUS').AsString := 'L';
    lvSQLQuery.Params.ParamByName('VLTABELA').AsFloat := FTotalOriginal;
    lvSQLQuery.Params.ParamByName('CODUSURINC').AsInteger := FUserCode;
    try
      lvSQLQuery.SQL.Text := lvQuery;
      lvSQLQuery.Connection.StartTransaction;
      lvSQLQuery.ExecSQL;
      lvSQLQuery.Connection.Commit;
      Result := True;
    except
      lvSQLQuery.Connection.Rollback;
      Result := False;
      raise Exception.Create('Erro ao Inserir pedido de venda');
    end;
  finally
    FreeAndNil(lvSQLQuery);
    TConnection.ReleaseConnection;
  end;
  // Imput do cabeçalho do pedido no banco de dados
 { with lvStorPrc do
    begin
  try
    lvStorPrc := TFDStoredProc.Create(nil);
    Connection := TConnection.GetConnection;
    StoredProcName := 'PRC_PEDIDO_CAB';
    Params.CreateParam(ftFixedChar,'TYPEINSERT',ptInput);
    Params.CreateParam(ftInteger,'NUMPED',ptInput);
    Params.CreateParam(ftInteger,'CODFILIAL',ptInput);
    Params.CreateParam(ftInteger,'CODCLIENTE',ptInput);
    Params.CreateParam(ftInteger,'CODPLANO',ptInput);
    Params.CreateParam(ftDate,'DATA',ptInput);
    Params.CreateParam(ftFloat,'VLTOTAL',ptInput);
    Params.CreateParam(ftFixedChar,'STATUS',ptInput);
    Params.CreateParam(ftFMTBcd,'VLTABELA',ptInput);
    Params.CreateParam(ftFMTBcd,'VLDESCONTO',ptInput);
    Params.CreateParam(ftInteger,'CODUSURINC',ptInput);
    Params.ParamByName('TYPEINSERT').AsString := 'H';
    Params.ParamByName('NUMPED').AsInteger := FNumberOrder;
    Params.ParamByName('CODFILIAL').AsInteger := FBranchCode;
    Params.ParamByName('CODCLIENTE').AsInteger := FClientCode;
    Params.ParamByName('CODPLANO').AsInteger := FPayPlanCode;
    Params.ParamByName('DATA').AsDate := FDateOrder;
    Params.ParamByName('VLDESCONTO').AsFloat := FTotalDiscount;
    Params.ParamByName('VLTOTAL').AsFloat := FTotalPrice;
    Params.ParamByName('STATUS').AsString := 'L';
    Params.ParamByName('VLTABELA').AsFloat := FTotalOriginal;
    Params.ParamByName('CODUSURINC').AsInteger := FUserCode;
    try
      Connection.StartTransaction;
      ExecProc;
      Connection.Commit;
      Result := True;
    except
      Connection.Rollback;
      Result := False;
      raise Exception.Create('Erro ao executar Procedure');
    end;
  finally
    FreeAndNil(lvStorPrc);
    TConnection.ReleaseConnection;
  end;
end;
}
end;

function TOrderSalesHeader.SubmitOrderItem: Boolean;
var lvCount: Integer;
    lvSQLScript: TFDScript;
    lvQuery: String;
//  lvStorPrc: TFDStoredProc;
begin
  try
    lvSQLScript := TFDScript.Create(nil);
    lvSQLScript.Connection := TConnection.GetConnection;
    try
      lvSQLScript.Connection.StartTransaction;
      for lvCount := 0 to pred(FTotalItems) do
        begin
          lvQuery := 'insert into vitempedido values ('+NumberOrder+', '+FListProducts[lvCount].Code+
                     ', '+QuotedStr(FListProducts[lvCount].Amount)+', '+QuotedStr(FListProducts[lvCount].Price)+
                     ', '+QuotedStr(FloatToStr(FListProducts[lvCount].FItemTotalPrice - FListProducts[lvCount].FPrice))+
                     ', '+QuotedStr(FListProducts[lvCount].OriginalPrice)+', '+QuotedStr(FListProducts[lvCount].ItemTotalPrice)+
                     ', '+FListProducts[lvCount].Sequence+');';
          lvSQLScript.SQLScripts.Add.SQL.Text := lvQuery;
        end;
      if lvSQLScript.ValidateAll then
        begin
          Result:= lvSQLScript.ExecuteAll;
          lvSQLScript.Connection.Commit;
        end;
    except
      lvSQLScript.Connection.Rollback;
      raise Exception.Create('Erro ao Inserir pedido de venda');
    end;
  finally
    FreeAndNil(lvSQLScript);
    TConnection.ReleaseConnection;
  end;
{
  try
    lvStorPrc := TFDStoredProc.Create(nil);
    lvStorPrc.Connection := TConnection.GetConnection;
    lvStorPrc.StoredProcName := 'PRC_PEDIDO_CAB';
    lvStorPrc.Params.CreateParam(ftFixedChar,'TYPEINSERT',ptInput);
    lvStorPrc.Params.CreateParam(ftInteger,'NUMPED',ptInput);
    lvStorPrc.Params.CreateParam(ftInteger,'ICODPROD',ptInput);
    lvStorPrc.Params.CreateParam(ftFloat,'IQTDE',ptInput);
    lvStorPrc.Params.CreateParam(ftFloat,'IPRECO',ptInput);
    lvStorPrc.Params.CreateParam(ftFloat,'IVLDESC',ptInput);
    lvStorPrc.Params.CreateParam(ftFloat,'IVLTABELA',ptInput);
    lvStorPrc.Params.CreateParam(ftFloat,'IVLTOTALPRECO',ptInput);
    lvStorPrc.Params.CreateParam(ftInteger,'NUMSEQ',ptInput);
    try
      lvStorPrc.Connection.StartTransaction;
      for lvCount := 0 to pred(FTotalItems) do
        begin
          lvStorPrc.Params.ParamByName('TYPEINSERT').AsString := 'I';
          lvStorPrc.Params.ParamByName('NUMPED').AsInteger := FNumberOrder;
          lvStorPrc.Params.ParamByName('ICODPROD').AsInteger := FListProducts[lvCount].FCode;
          lvStorPrc.Params.ParamByName('IQTDE').AsFloat := FListProducts[lvCount].FAmount;
          lvStorPrc.Params.ParamByName('IPRECO').AsFloat := FListProducts[lvCount].FPrice;
          lvStorPrc.Params.ParamByName('IVLDESC').AsFloat := (FListProducts[lvCount].FItemTotalPrice - FListProducts[lvCount].FPrice);
          lvStorPrc.Params.ParamByName('IVLTABELA').AsFloat := FListProducts[lvCount].FOriginalPrice;
          lvStorPrc.Params.ParamByName('IVLTOTALPRECO').AsFloat := FListProducts[lvCount].FItemTotalPrice;
          lvStorPrc.Params.ParamByName('NUMSEQ').AsInteger := FListProducts[lvCount].FSequence;
          try
            lvStorPrc.ExecProc;
            lvStorPrc.Connection.Commit;
          except
            Break;
          end;
        end;
      Result := True;
    except
      lvStorPrc.Connection.Rollback;
      Result := False;
      raise Exception.Create('Erro ao executar Procedure 2º');
    end;
  finally
    FreeAndNil(lvStorPrc);
    TConnection.ReleaseConnection;
  end;
  }
end;

function TOrderSalesHeader.SubmitOrderSale: Boolean;
var lvQueryHeader, lvQueryItems: String;
    lvCount: Integer;
    lvSQLScript: TFDScript;
    lvValid, lvExecute: Boolean;
begin
  lvQueryHeader := 'insert into vpedido values(:NUMPED, :CODFILIAL, :CODCLIENTE, '+
                   ' :CODPLANO, :DATA, :VLTOTAL, :VLDESCONTO, :STATUS, NULL,'+
                   ' :VLTABELA, :CODUSURINC, NULL, NULL)';
  try
    lvSQLScript := TFDScript.Create(nil);
    lvSQLScript.Connection := TConnection.GetConnection;
    lvSQLScript.Params.CreateParam(ftFixedChar,'TYPEINSERT',ptInput);
    lvSQLScript.Params.CreateParam(ftInteger,'NUMPED',ptInput);
    lvSQLScript.Params.CreateParam(ftInteger,'CODFILIAL',ptInput);
    lvSQLScript.Params.CreateParam(ftInteger,'CODCLIENTE',ptInput);
    lvSQLScript.Params.CreateParam(ftInteger,'CODPLANO',ptInput);
    lvSQLScript.Params.CreateParam(ftDate,'DATA',ptInput);
    lvSQLScript.Params.CreateParam(ftFloat,'VLTOTAL',ptInput);
    lvSQLScript.Params.CreateParam(ftFixedChar,'STATUS',ptInput);
    lvSQLScript.Params.CreateParam(ftFMTBcd,'VLTABELA',ptInput);
    lvSQLScript.Params.CreateParam(ftFMTBcd,'VLDESCONTO',ptInput);
    lvSQLScript.Params.CreateParam(ftInteger,'CODUSURINC',ptInput);
    lvSQLScript.Params.ParamByName('TYPEINSERT').AsString := 'H';
    lvSQLScript.Params.ParamByName('NUMPED').AsInteger := FNumberOrder;
    lvSQLScript.Params.ParamByName('CODFILIAL').AsInteger := FBranchCode;
    lvSQLScript.Params.ParamByName('CODCLIENTE').AsInteger := FClientCode;
    lvSQLScript.Params.ParamByName('CODPLANO').AsInteger := FPayPlanCode;
    lvSQLScript.Params.ParamByName('DATA').AsDate := FDateOrder;
    lvSQLScript.Params.ParamByName('VLDESCONTO').AsFloat := FTotalDiscount;
    lvSQLScript.Params.ParamByName('VLTOTAL').AsFloat := FTotalPrice;
    lvSQLScript.Params.ParamByName('STATUS').AsString := 'L';
    lvSQLScript.Params.ParamByName('VLTABELA').AsFloat := FTotalOriginal;
    lvSQLScript.Params.ParamByName('CODUSURINC').AsInteger := FUserCode;
    lvSQLScript.SQLScripts.Add.SQL.Text := lvQueryHeader;
    // Query de itens
     for lvCount := 0 to pred(FTotalItems) do
      begin
        lvQueryItems:= 'insert into vitempedido values ('+IntToStr(FNumberOrder)+
                       ', '+IntToStr((FListProducts[lvCount].FCode))+', REPLACE('+QuotedStr(FloatToStr(FListProducts[lvCount].FAmount))+','+QuotedStr(',')+','+QuotedStr('.')+')'+
                       ', REPLACE('+QuotedStr(FloatToStr(FListProducts[lvCount].FPrice))+','+QuotedStr(',')+','+QuotedStr('.')+')'+', '+QuotedStr(FListProducts[lvCount].FBarCode)+
                       ', REPLACE('+QuotedStr(FloatToStr(FListProducts[lvCount].FOriginalPrice - FListProducts[lvCount].FPrice))+','+QuotedStr(',')+','+QuotedStr('.')+'), REPLACE('+QuotedStr(FloatToStr(FListProducts[lvCount].FOriginalPrice))+','+QuotedStr(',')+','+QuotedStr('.')+')'+
                       ', REPLACE('+QuotedStr(FloatToStr(FListProducts[lvCount].FItemTotalPrice))+','+QuotedStr(',')+','+QuotedStr('.')+')'+', '+IntToStr(FListProducts[lvCount].FSequence)+')';
        lvSQLScript.SQLScripts.Add.SQL.Text:= lvQueryItems;
      end;
    try
      lvSQLScript.Connection.StartTransaction;
      lvValid   := lvSQLScript.ValidateAll;
      lvExecute := lvSQLScript.ExecuteAll;
      lvSQLScript.Connection.Commit;
    except
      lvSQLScript.Connection.Rollback;
      Result := False;
      raise Exception.Create('Erro ao inserir pedido de venda!');
    end;
  finally
    FreeAndNil(lvSQLScript);
    TConnection.ReleaseConnection;
  end;
{
  if (SubmitOrderHeader = True) and (SubmitOrderItem = True) then
    Result := True
  else
    Result := False;
}
end;

procedure TOrderSalesHeader.TotalizerOrderSale(pType: Char; pIndex: Integer);
begin
 if pType = 'A' then
    begin
      FTotalPrice    := FTotalPrice + FListProducts[FListProducts.Count -1].FItemTotalPrice;
      FTotalOriginal := FTotalOriginal + FListProducts[FListProducts.Count -1].FOriginalPrice;
      FTotalDiscount := FTotalDiscount +(FTotalOriginal - FTotalPrice);
    end

  else
    begin
      FTotalPrice    := FTotalPrice - FListProducts[pIndex].FItemTotalPrice;
      FTotalOriginal := FTotalOriginal - FListProducts[pIndex].FOriginalPrice;
      FTotalDiscount := FTotalDiscount +(FTotalOriginal - FTotalPrice);
    end;
end;


(*******************************************************************************
 * Métodos Acessores                                                           *
 *******************************************************************************)
constructor TOrderSalesHeader.Create;
begin
  inherited Create;
  FListProducts := TObjectList<TOrderSalesItem>.Create();
end;

destructor TOrderSalesHeader.Destroy;
begin
  inherited Destroy;
  FreeAndNil(FListProducts);
end;

function TOrderSalesHeader.GetBranchCode: String;
begin
  Result:= IntToStr(FBranchCode);
end;

function TOrderSalesHeader.GetBranchName: String;
begin
  Result:= FBranchName;
end;

function TOrderSalesHeader.GetCancelDate: String;
begin
  Result:= DateToStr(FCancelDate);
end;

function TOrderSalesHeader.GetClientCode: String;
begin
  Result:= IntToStr(FClientCode);
end;

function TOrderSalesHeader.GetClientName: String;
begin
  Result:= FClientName;
end;

function TOrderSalesHeader.GetDateOrder: String;
begin
  Result:= DateToStr(FDateOrder);
end;

function TOrderSalesHeader.GetNumberOrder: String;
begin
  Result:= IntToStr(FNumberOrder);
end;

function TOrderSalesHeader.GetPayPlanCode: String;
begin
  Result:= IntToStr(FPayPlanCode);
end;

function TOrderSalesHeader.GetPayPlanName: String;
begin
  Result:= FPayPlanName;
end;

function TOrderSalesHeader.GetStatusOrder: String;
begin
  Result:= FStatusOrder;
end;

function TOrderSalesHeader.GetTotalDiscount: String;
begin
  Result:= FormatCurr('R$ ###,##0.00',FloatToCurr(FTotalDiscount));
end;

function TOrderSalesHeader.GetTotalOriginal: String;
begin
  Result:= FormatCurr('R$ ###,##0.00',FloatToCurr(FTotalOriginal));
end;

function TOrderSalesHeader.GetTotalPrice: String;
begin
  Result:= FormatCurr('R$ ###,##0.00',FloatToCurr(FTotalPrice));
end;

function TOrderSalesHeader.GetUserCode: String;
begin
  Result:= IntToStr(FUserCode);
end;

function TOrderSalesHeader.GetUserName: String;
begin
  Result:= FUserName;
end;

procedure TOrderSalesHeader.SetBranchCode(const Value: String);
begin
  FBranchCode:= StrToInt(Value);
end;

procedure TOrderSalesHeader.SetBranchName(const Value: String);
begin
  FBranchName:= Value;
end;

procedure TOrderSalesHeader.SetCancelDate(const Value: String);
begin
  FCancelDate:= StrToDate(Value);
end;

procedure TOrderSalesHeader.SetClientCode(const Value: String);
begin
  FClientCode:= StrToInt(Value);
end;

procedure TOrderSalesHeader.SetClientName(const Value: String);
begin
  FClientName:= Value;
end;

procedure TOrderSalesHeader.SetDateOrder(const Value: String);
begin
  FDateOrder:= StrToDate(Value);
end;

procedure TOrderSalesHeader.SetNumberOrder(const Value: String);
begin
  FNumberOrder:= StrToInt(Value);
end;

procedure TOrderSalesHeader.SetPayPlanCode(const Value: String);
begin
  FPayPlanCode:= StrToInt(Value);
end;

procedure TOrderSalesHeader.SetPayPlanName(const Value: String);
begin
  FPayPlanName:= Value;
end;

procedure TOrderSalesHeader.SetStatusOrder(const Value: String);
begin
  FStatusOrder:= Value;
end;

procedure TOrderSalesHeader.SetTotalDiscount(const Value: String);
begin
  FTotalDiscount:= StrToFloat(Copy(Value,4,Length(Value)));
end;

procedure TOrderSalesHeader.SetTotalOriginal(const Value: String);
begin
  FTotalOriginal:= StrToFloat(Copy(Value,4,Length(Value)));
end;

procedure TOrderSalesHeader.SetTotalPrice(const Value: String);
begin
  FTotalPrice:= StrToFloat(Copy(Value,4,Length(Value)));
end;

procedure TOrderSalesHeader.SetUserCode(const Value: String);
begin
  FUserCode:= StrToInt(Value);
end;

procedure TOrderSalesHeader.SetUserName(const Value: String);
begin
  FUserName:= Value;
end;

{------------------------------------------------------------------------------}
{-------------------------------- TOrderSalesItem -----------------------------}
{------------------------------------------------------------------------------}

(*******************************************************************************
 * Metodos Funcionais                                                          *
 *******************************************************************************)
procedure TOrderSalesItem.RetriveData(pValue: String);
var lvSQLQuery: TFDQuery;
    lvQuery: String;
begin
  lvQuery:= 'SELECT VPRODUTO.CODPRODUTO, VPRODUTO.DESCRICAO, VPRODUTO.QTUNITCX,'+
            '       VPRODUTO.CODBARRAS, VPRECO.PVENDA                          '+
            '  FROM VPRODUTO, VPRECO, VFORNECEDOR                              '+ 
            ' WHERE VPRODUTO.CODPRODUTO = VPRECO.CODPRODUTO                    '+
            '   AND VPRODUTO.CODPRODUTO = '+pValue;
  try
    lvSQLQuery := TFDQuery.Create(nil);
    lvSQLQuery.Connection := TConnection.GetConnection;
    try
      lvSQLQuery.Open(lvQuery);
      if lvSQLQuery.RowsAffected >= 1 then
        begin
          FCode           := lvSQLQuery.Fields[0].AsInteger;
          FDescription    := lvSQLQuery.Fields[1].AsString;
          FAmount         := lvSQLQuery.Fields[2].AsFloat;
          FBarCode        := lvSQLQuery.Fields[3].AsString;
          FPrice          := lvSQLQuery.Fields[4].AsFloat;
          FOriginalPrice  := lvSQLQuery.Fields[4].AsFloat;
          FItemTotalPrice := lvSQLQuery.Fields[4].AsFloat;
          FDiscount       := 0;
        end;
    except
      raise Exception.Create('Erro ao executar consulta no banco de dados');
    end;
  finally
    FreeAndNil(lvSQLQuery);
    TConnection.ReleaseConnection;
  end;
end;

procedure TOrderSalesItem.SubmitDiscount;
begin
  FDiscount := RoundTo((((FPrice*100)/ FOriginalPrice)-100),-2);
  CalcTotalPrice;
end;

procedure TOrderSalesItem.SubmitOriginalPrice;
begin
  FPrice := FOriginalPrice;
  FDiscount := 0;
end;

procedure TOrderSalesItem.SubmitPrice;
begin
  FPrice := RoundTo(FOriginalPrice-(((FOriginalPrice * FDiscount)/100)),-2);
  CalcTotalPrice;
end;

procedure TOrderSalesItem.CalcTotalPrice;
begin
  FItemTotalPrice := (FPrice * FAmount);
end;

(*******************************************************************************
 * Métodos Acessores                                                           *
 *******************************************************************************)
function TOrderSalesItem.GetAmount: String;
begin
  Result := FloatToStr(FAmount);
end;

function TOrderSalesItem.GetBarCode: String;
begin
  Result := FBarCode;
end;

function TOrderSalesItem.GetCode: String;
begin
  Result := IntToStr(FCode);
end;

function TOrderSalesItem.GetDescription: String;
begin
  Result := FDescription;
end;

function TOrderSalesItem.GetDiscount: String;
begin
  Result := FormatCurr('##0.00',FloatToCurr(FDiscount));
end;

function TOrderSalesItem.GetItemTotalPrice: String;
begin
  Result := FormatCurr('R$ ###,##0.00',FloatToCurr(FItemTotalPrice));
end;

function TOrderSalesItem.GetOriginalPrice: String;
begin
  Result := FormatCurr('R$ ###,##0.00',FloatToCurr(FOriginalPrice));
end;

function TOrderSalesItem.GetPrice: String;
begin
  Result := FormatCurr('R$ ###,##0.00',FloatToCurr(FPrice));
end;

function TOrderSalesItem.GetSequence: String;
begin
  Result := IntToStr(FSequence);
end;

procedure TOrderSalesItem.SetAmount(const Value: String);
begin
  FAmount := StrToFloat(Value);
end;

procedure TOrderSalesItem.SetDiscount(const Value: String);
begin
  FDiscount := StrToFloat(Value);
end;

procedure TOrderSalesItem.SetItemTotalPrice(const Value: String);
begin
  FItemTotalPrice := StrToFloat(Copy(Value,4,Length(Value)));
end;

procedure TOrderSalesItem.SetPrice(const Value: String);
begin
  FPrice := StrToFloat(Copy(Value,4,Length(Value)));
end;

end.
