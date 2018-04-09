(*******************************************************************************
 * Unit : uModel.Sales                                                         *
 * Autor : Vinícius Diniz da Costa                                             *
 * Data : 05/02/2018                                                           *
 * Função : Efetua todos os controles do formulário de vendas                  *
 *******************************************************************************)
unit uModel.Sales;

interface

uses
  System.SysUtils, FireDAC.Comp.Client, uConnection, uMessageUtils, math,
  System.Generics.Collections, Data.DB;

type
  TSalesItems = class
    private
      FCode: Integer;
      FDescription: String;
      FAmount: Double;
      FPrice: Double;
      FOriginalPrice: Double;
      FDiscount: Double;
      FTotalPrice: Double;
      FBarCode: String;
      FSequence: Integer;
    protected
      function GetAmount: String;
      function GetBarCode: String;
      function GetCode: String;
      function GetDescription: String;
      function GetDiscount: String;
      function GetOriginalPrice: String;
      function GetPrice: String;
      function GetTotalPrice: String;
      function GetSequence: String;
      procedure SetSequence(const Value: String);
      procedure SetAmount(const Value: String);
      procedure SetBarCode(const Value: String);
      procedure SetCode(const Value: String);
      procedure SetDescription(const Value: String);
      procedure SetDiscount(const Value: String);
      procedure SetOriginalPrice(const Value: String);
      procedure SetPrice(const Value: String);
      procedure SetTotalPrice(const Value: String);
    public
      property Code: String read GetCode write SetCode;
      property Description: String read GetDescription write SetDescription;
      property Amount: String read GetAmount write SetAmount;
      property Price: String read GetPrice write SetPrice;
      property OriginalPrice: String read GetOriginalPrice write SetOriginalPrice;
      property Discount: String read GetDiscount write SetDiscount;
      property TotalPrice: String read GetTotalPrice write SetTotalPrice;
      property BarCode: String read GetBarCode write SetBarCode;
      property Sequence: String read GetSequence write SetSequence;
      constructor Create;
      function DataRetrive(AValue: String): Boolean;
      procedure CalcTotalPrice;
      procedure SubmitDiscount;
      procedure SubmitPrice;
      procedure SubmitOriginalPrice;
  end;

  TSalesHeader = class
    private
      FIDSale: Integer;
      FIDClient: Integer;
      FIDBranch: Integer;
      FDescription: String;
      FDocument: String;
      FDate: TDate;
      FTotalValue: Double;
      FTotalDiscount: Double;
      FStatus: String;
      FCancelDate: TDate;
      FTotalOriginal: Double;
      FPlanPayment: Integer;
      FTotalItems: Integer;
      FItemsListProd: TObjectList<TSalesItems>;
    function GetTotalItems: String;
    protected
      function GetCancelDate: String;
      function GetDate: String;
      function GetIDBranch: String;
      function GetIDClient: String;
      function GetIDSale: String;
      function GetStatus: String;
      function GetTotalDiscount: String;
      function GetTotalValue: String;
      function GetTotalOriginal: String;
      function GetDescription: String;
      function GetDocument: String;
      function GetPlanPayment: String;
      procedure SetPlanPayment(const Value: String);
      procedure SetCancelDate(const Value: String);
      procedure SetDate(const Value: String);
      procedure SetIDBranch(const Value: String);
      procedure SetIDClient(const Value: String);
      procedure SetIDSale(const Value: String);
      procedure SetStatus(const Value: String);
      procedure SetTotalDiscount(const Value: String);
      procedure SetTotalValue(const Value: String);
      procedure SetTotalOriginal(const Value: String);
    public
      property IDSale: String read GetIDSale write SetIDSale;
      property IDClient: String read GetIDClient write SetIDClient;
      property IDBranch: String read GetIDBranch write SetIDBranch;
      property Date: String read GetDate write SetDate;
      property TotalValue: String read GetTotalValue write SetTotalValue;
      property TotalDiscount: String read GetTotalDiscount write SetTotalDiscount;
      property Status: String read GetStatus write SetStatus;
      property CancelDate: String read GetCancelDate write SetCancelDate;
      property TotalOriginal: String read GetTotalOriginal write SetTotalOriginal;
      property Description: String read GetDescription;
      property Document: String read GetDocument;
      property TotalItems: String read GetTotalItems;
      property PlanPayment: String read GetPlanPayment write SetPlanPayment;
      constructor Create(ACode: String);
      destructor Destroy;
      function RetriveSaleCode: Integer;
      procedure AddItemProd(AObj: TSalesItems);
      procedure TotalizerSales(AType: Char; AInder: Integer);
      procedure RemoveItemProd(AIndex: Integer);
      function VerifyItemInc(ACode: String): Boolean;
      function SubmitSale: Boolean;
      function SubmitSaleItems: Boolean;
      function SubmitAll: Boolean;
  end;

implementation

uses
  Vcl.Dialogs;

(*******************************************************************************
 * TSalesHeader                                                                *
 *******************************************************************************)

procedure TSalesHeader.TotalizerSales(AType: Char; AInder: Integer);
begin
  if AType = 'A' then
    begin
      FTotalValue    := FTotalValue + FItemsListProd[FItemsListProd.Count -1].FTotalPrice;
      FTotalOriginal := FTotalOriginal + FItemsListProd[FItemsListProd.Count -1].FOriginalPrice;
      FTotalDiscount := FTotalDiscount +(FTotalOriginal - FTotalValue);
    end

  else
    begin
      FTotalValue    := FTotalValue - FItemsListProd[AInder].FTotalPrice;
      FTotalOriginal := FTotalOriginal - FItemsListProd[AInder].FOriginalPrice;
      FTotalDiscount := FTotalDiscount +(FTotalOriginal - FTotalValue);
    end;
end;

function TSalesHeader.VerifyItemInc(ACode: String): Boolean;
var lvCount: Integer;
begin
  if FItemsListProd.Count > 0 then
    begin
      for lvCount := 0 to FItemsListProd.Count -1 do
        begin
          if (FItemsListProd[lvCount].FCode = StrToInt(ACode)) then
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

procedure TSalesHeader.AddItemProd(AObj: TSalesItems);
var lvSeq : Integer;
begin
  FItemsListProd.Add(AObj);
  lvSeq := FItemsListProd.Count -1;
  FItemsListProd[lvSeq].Sequence       := IntToStr(lvSeq);
  FItemsListProd[lvSeq].FCode          := AObj.FCode;
  FItemsListProd[lvSeq].FDescription   := AObj.FDescription;
  FItemsListProd[lvSeq].FAmount        := AObj.FAmount;
  FItemsListProd[lvSeq].FPrice         := AObj.FPrice;
  FItemsListProd[lvSeq].FOriginalPrice := AObj.FOriginalPrice;
  FItemsListProd[lvSeq].FTotalPrice    := AObj.FTotalPrice;
  FTotalItems := FItemsListProd.Count;
end;

procedure TSalesHeader.RemoveItemProd(AIndex: Integer);
begin
  if AIndex >= 0 then
   FItemsListProd.Delete(AIndex);
end;

constructor TSalesHeader.Create(ACode: String);
var lvSQLQuery: TFDQuery;
    lvQuery: String;
begin
  FItemsListProd := TObjectList<TSalesItems>.Create;
  FIDSale := RetriveSaleCode;
  lvQuery := 'SELECT CODCLIENTE, NOME, CGC FROM VCLIENTE WHERE CODCLIENTE = '+ACode;
  try
    lvSQLQuery := TFDQuery.Create(nil);
    lvSQLQuery.Connection := TConnection.GetConnection;
    lvSQLQuery.Open(lvQuery);
    if lvSQLQuery.RowsAffected = 1 then
      begin
        FIDClient    := lvSQLQuery.FieldByName('CODCLIENTE').AsInteger;
        FDescription := lvSQLQuery.FieldByName('NOME').AsString;
        FDocument    := lvSQLQuery.FieldByName('CGC').AsString;
      end;
  finally
    FreeAndNil(lvSQLQuery);
    TConnection.ReleaseConnection;
  end;
end;

destructor TSalesHeader.Destroy;
begin
  FreeAndNil(FItemsListProd);
  inherited;
end;

function TSalesHeader.RetriveSaleCode: Integer;
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
    lvSQLQuery.Open(lvQuery);
      if lvSQLQuery.RowsAffected = 1 then
        begin
          Result := lvSQLQuery.FieldByName('NUMPED').AsInteger;
        end;
      lvSQLQuery.Close;
      lvSQLQuery.SQL.Clear;
      lvSQLQuery.SQL.Text := lvUpdate;
      lvSQLQuery.ExecSQL;
      lvSQLQuery.Connection.StartTransaction;
      lvSQLQuery.Connection.Commit;
    except
      lvSQLQuery.Connection.Rollback;
      raise Exception.Create(MsgDatabaseError);
    end;
  finally
    FreeAndNil(lvSQLQuery);
    TConnection.ReleaseConnection;
  end;
end;

function TSalesHeader.GetCancelDate: String;
begin
  Result := DateToStr(FCancelDate);
end;

function TSalesHeader.GetDate: String;
begin
  Result := DateToStr(FDate);
end;

function TSalesHeader.GetDescription: String;
begin
  Result := FDescription;
end;

function TSalesHeader.GetDocument: String;
begin
  Result := FDocument;
end;

function TSalesHeader.GetIDBranch: String;
begin
  Result := IntToStr(FIDBranch);
end;

function TSalesHeader.GetIDClient: String;
begin
  Result := IntToStr(FIDClient);
end;

function TSalesHeader.GetIDSale: String;
begin
  Result := IntToStr(FIDSale);
end;

function TSalesHeader.GetPlanPayment: String;
begin
  Result := IntToStr(FPlanPayment);
end;

function TSalesHeader.GetStatus: String;
begin
  Result := FStatus;
end;

function TSalesHeader.GetTotalDiscount: String;
begin
  Result := FormatCurr('R$ ###,##0.00',FloatToCurr(FTotalDiscount));
end;

function TSalesHeader.GetTotalItems: String;
begin
  Result := IntToStr(FTotalItems);
end;

function TSalesHeader.GetTotalOriginal: String;
begin
  Result := FormatCurr('R$ ###,##0.00',FloatToCurr(FTotalOriginal));
end;

function TSalesHeader.GetTotalValue: String;
begin
  Result := FormatCurr('R$ ###,##0.00',FloatToCurr(FTotalValue));
end;

procedure TSalesHeader.SetCancelDate(const Value: String);
begin
  FCancelDate := StrToDate(Value);
end;

procedure TSalesHeader.SetDate(const Value: String);
begin
  FDate := StrToDate(Value);
end;

procedure TSalesHeader.SetIDBranch(const Value: String);
begin
  FIDBranch := StrToInt(Value);
end;

procedure TSalesHeader.SetIDClient(const Value: String);
begin
  FIDClient := StrToInt(Value);
end;

procedure TSalesHeader.SetIDSale(const Value: String);
begin
  FIDSale := StrToInt(Value);
end;

procedure TSalesHeader.SetPlanPayment(const Value: String);
begin
  FPlanPayment := StrToInt(Value);
end;

procedure TSalesHeader.SetStatus(const Value: String);
begin
  FStatus := Value;
end;

procedure TSalesHeader.SetTotalDiscount(const Value: String);
begin
  FTotalDiscount := StrToFloat(Value);
end;

procedure TSalesHeader.SetTotalOriginal(const Value: String);
begin
  FTotalOriginal := StrToFloat(Value);
end;

procedure TSalesHeader.SetTotalValue(const Value: String);
begin
  FTotalValue := StrToFloat(Value);
end;

function TSalesHeader.SubmitAll: Boolean;
begin
  if (SubmitSale = True) and (SubmitSaleItems = True) then
    Result := True
  else
    Result := False;
end;

function TSalesHeader.SubmitSale: Boolean;
var lvStorPrc: TFDStoredProc;
begin
  // Imput do cabeçalho do pedido no banco de dados
  with lvStorPrc do
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
    Params.ParamByName('TYPEINSERT').AsString := 'H';
    Params.ParamByName('NUMPED').AsInteger := FIDSale;
    Params.ParamByName('CODFILIAL').AsInteger := FIDBranch;
    Params.ParamByName('CODCLIENTE').AsInteger := FIDClient;
    Params.ParamByName('CODPLANO').AsInteger := FPlanPayment;
    Params.ParamByName('DATA').AsDate := FDate;
    Params.ParamByName('VLDESCONTO').AsFloat := FTotalDiscount;
    Params.ParamByName('VLTOTAL').AsFloat := FTotalValue;
    Params.ParamByName('STATUS').AsString := 'L';
    Params.ParamByName('VLTABELA').AsFloat := FTotalOriginal;
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
end;

function TSalesHeader.SubmitSaleItems: Boolean;
var lvStorPrc: TFDStoredProc;
    lvCount: Integer;
begin
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
    try
      lvStorPrc.Connection.StartTransaction;
      for lvCount := 0 to pred(FTotalItems) do
        begin
          lvStorPrc.Params.ParamByName('TYPEINSERT').AsString := 'I';
          lvStorPrc.Params.ParamByName('NUMPED').AsInteger := FIDSale;
          lvStorPrc.Params.ParamByName('ICODPROD').AsInteger := FItemsListProd[lvCount].FCode;
          lvStorPrc.Params.ParamByName('IQTDE').AsFloat := FItemsListProd[lvCount].FAmount;
          lvStorPrc.Params.ParamByName('IPRECO').AsFloat := FItemsListProd[lvCount].FPrice;
          lvStorPrc.Params.ParamByName('IVLDESC').AsFloat := (FItemsListProd[lvCount].FTotalPrice - FItemsListProd[lvCount].FPrice);
          lvStorPrc.Params.ParamByName('IVLTABELA').AsFloat := FItemsListProd[lvCount].FOriginalPrice;
          lvStorPrc.Params.ParamByName('IVLTOTALPRECO').AsFloat := FItemsListProd[lvCount].FTotalPrice;
          try
            lvStorPrc.ExecProc;
          except
            Break;
          end;
        end;
      lvStorPrc.Connection.Commit;
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
end;

(*******************************************************************************
 * TSalesItems                                                                 *
 *******************************************************************************)
constructor TSalesItems.Create;
begin
  FAmount := 1;
  FDiscount := 0;
end;

function TSalesItems.DataRetrive(AValue: String): Boolean;
var SQLQuery: TFDQuery;
    Query: String;
begin
  Query := 'SELECT VPRODUTO.CODPRODUTO, VPRODUTO.DESCRICAO, VPRODUTO.CODBARRAS,'+
           '       VPRECO.PVENDA                                               '+
           '  FROM VPRODUTO, VPRECO                                            '+
           ' WHERE VPRODUTO.CODPRODUTO = VPRECO.CODPRODUTO                     '+
           '   AND VPRODUTO.CODPRODUTO = '+AValue;
  try
    SQLQuery := TFDQuery.Create(nil);
    SQLQuery.Connection := TConnection.GetConnection;
    try
      SQLQuery.Open(Query);
      if SQLQuery.RowsAffected = 1 then
        begin
          FCode          := SQLQuery.FieldByName('CODPRODUTO').AsInteger;
          FDescription   := SQLQuery.FieldByName('DESCRICAO').AsString;
          FBarCode       := SQLQuery.FieldByName('CODBARRAS').AsString;
          FPrice         := SQLQuery.FieldByName('PVENDA').AsFloat;
          FOriginalPrice := SQLQuery.FieldByName('PVENDA').AsFloat;
          FTotalPrice    := SQLQuery.FieldByName('PVENDA').AsFloat;
          Result := True;
        end
      else
        Result := False;
    except
      raise Exception.Create(MsgDatabaseError);
    end;
  finally
    FreeAndNil(SQLQuery);
    TConnection.ReleaseConnection;
  end;
end;

procedure TSalesItems.CalcTotalPrice;
begin
  FTotalPrice := (FAmount * FPrice);
end;

procedure TSalesItems.SubmitDiscount;
begin
  FDiscount := RoundTo((((FPrice*100)/ FOriginalPrice)-100),-2);
  CalcTotalPrice;
end;

procedure TSalesItems.SubmitOriginalPrice;
begin
  FPrice := FOriginalPrice;
  FDiscount := 0;
end;

procedure TSalesItems.SubmitPrice;
begin
  FPrice := RoundTo(FOriginalPrice-(((FOriginalPrice * FDiscount)/100)),-2);
  CalcTotalPrice;
end;

//------------------------------------------------------------------------------
// Métodos Acessores GET e SET                                                 -
//------------------------------------------------------------------------------
function TSalesItems.GetAmount: String;
begin
  Result := FloatToStr(FAmount);
end;

function TSalesItems.GetBarCode: String;
begin
  Result := FBarCode;
end;

function TSalesItems.GetCode: String;
begin
  Result := IntToStr(FCode);
end;

function TSalesItems.GetDescription: String;
begin
  Result := FDescription;
end;

function TSalesItems.GetDiscount: String;
begin
  Result := FloatToStr(FDiscount);
end;

function TSalesItems.GetOriginalPrice: String;
begin
  Result := FormatCurr('R$ ###,##0.00',FloatToCurr(FOriginalPrice));
end;

function TSalesItems.GetPrice: String;
begin
  Result := FormatCurr('R$ ###,##0.00',FloatToCurr(FPrice));
end;

function TSalesItems.GetSequence: String;
begin
  Result := IntToStr(FSequence);
end;

function TSalesItems.GetTotalPrice: String;
begin
  Result := FormatCurr('R$ ###,##0.00',FloatToCurr(FTotalPrice));
end;

procedure TSalesItems.SetAmount(const Value: String);
begin
  FAmount := StrToFloat(Value);
end;

procedure TSalesItems.SetBarCode(const Value: String);
begin
  FBarCode := Value;
end;

procedure TSalesItems.SetCode(const Value: String);
begin
   FCode := StrToInt(Value);
end;

procedure TSalesItems.SetDescription(const Value: String);
begin
  FDescription := Value;
end;

procedure TSalesItems.SetDiscount(const Value: String);
begin
  FDiscount := StrToFloat(Value);
end;

procedure TSalesItems.SetOriginalPrice(const Value: String);
begin
  FOriginalPrice := StrToFloat(Value);
end;

procedure TSalesItems.SetPrice(const Value: String);
begin
  FPrice := StrToFloat(Copy(Value,4,Length(Value)));
end;

procedure TSalesItems.SetSequence(const Value: String);
begin
  FSequence := StrToInt(Value);
end;

procedure TSalesItems.SetTotalPrice(const Value: String);
begin
  FTotalPrice := StrToFloat(Value);
end;


end.
