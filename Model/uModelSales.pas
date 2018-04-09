unit uModelSales;

interface

uses
  System.SysUtils, System.Generics.Collections, FireDAC.Comp.Client;

type
  TSalesItems = class
    private
      FCode: Integer;
      FDescription: String;
      FBarcode: String;
      FAmount: Double;
      FPrice: Double;
      FDiscount: Double;
      FTotalPrice: Double;
      FOriginalPrice: Double;
      FTotalOriginalPrice: Double;
      FSequence: Integer;
    protected
      function GetAmount: String;
      function GetCode: String;
      function GetDescription: String;
      function GetDiscount: String;
      function GetOriginalPrice: String;
      function GetPrice: String;
      function GetTotalPrice: String;
      function GetBarcode: String;
      function GetSequence: String;
      function GetTotalOriginalPrice: String;
      procedure SetTotalOriginalPrice(const Value: String);
      procedure SetSequence(const Value: String);
      procedure SetBarcode(const Value: String);
      procedure SetAmount(const Value: String);
      procedure SetCode(const Value: String);
      procedure SetDescription(const Value: String);
      procedure SetDiscount(const Value: String);
      procedure SetOriginalPrice(const Value: String);
      procedure SetPrice(const Value: String);
      procedure SetTotalPrice(const Value: String);
    public
      property Code: String read GetCode write SetCode;
      property Description: String read GetDescription write SetDescription;
      property Barcode: String read GetBarcode write SetBarcode;
      property Amount: String read GetAmount write SetAmount;
      property Price: String read GetPrice write SetPrice;
      property Discount: String read GetDiscount write SetDiscount;
      property TotalPrice: String read GetTotalPrice write SetTotalPrice;
      property OrginalPrice: String read GetOriginalPrice write SetOriginalPrice;
      property TotalOriginalPrice: String read GetTotalOriginalPrice write SetTotalOriginalPrice;
      property Sequence: String read GetSequence write SetSequence;
      procedure SubmitTotalOriginal;
      procedure SubmitTotalPrice;
      procedure SubmitDiscount;
      procedure SubmitPrice;
  end;

  TSalesHeader = class
    private
      FOrderNumber: Integer;
      FBranchNumber: Integer;
      FBranchName: String;
      FClientNumber: Integer;
      FClientName: String;
      FPlanNumber: Integer;
      FPlanName: String;
      FDateOrder: TDate;
      FTotalValue: Double;
      FDiscount: Double;
      FStatus: String;
      FCancelDateOrder: TDate;
      FTotalOriginal: Double;
      FUserNumber: Integer;
      FListItens: TObjectList<TSalesItems>;
      FTotalItems: Integer;
    protected
      function GetBranchName: String;
      function GetBranchNumber: String;
      function GetCancelDateOrder: String;
      function GetClientName: String;
      function GetClientNumber: String;
      function GetDateOrder: String;
      function GetDiscount: String;
      function GetOrderNumber: String;
      function GetPlanName: String;
      function GetPlanNumber: String;
      function GetStatus: String;
      function GetTotalOriginal: String;
      function GetTotalValue: String;
      function GetUserNumber: String;
      function GetTotalItems: String;
      procedure SetTotalItems(const Value: String);
      procedure SetBranchName(const Value: String);
      procedure SetBranchNumber(const Value: String);
      procedure SetCancelDateOrder(const Value: String);
      procedure SetClientName(const Value: String);
      procedure SetClientNumber(const Value: String);
      procedure SetDateOrder(const Value: String);
      procedure SetDiscount(const Value: String);
      procedure SetOrderNumber(const Value: String);
      procedure SetPlanName(const Value: String);
      procedure SetPlanNumber(const Value: String);
      procedure SetStatus(const Value: String);
      procedure SetTotalOriginal(const Value: String);
      procedure SetTotalValue(const Value: String);
      procedure SetUserNumber(const Value: String);
    public
      property OrderNumber: String read GetOrderNumber write SetOrderNumber;
      property BranchNumber: String read GetBranchNumber write SetBranchNumber;
      property BranchName: String read GetBranchName write SetBranchName;
      property ClientNumber: String read GetClientNumber write SetClientNumber;
      property ClientName: String read GetClientName write SetClientName;
      property PlanNumber: String read GetPlanNumber write SetPlanNumber;
      property PlanName: String read GetPlanName write SetPlanName;
      property DateOrder: String read GetDateOrder write SetDateOrder;
      property TotalValue: String read GetTotalValue write SetTotalValue;
      property Discount: String read GetDiscount write SetDiscount;
      property Status: String read GetStatus write SetStatus;
      property CancelDateOrder: String read GetCancelDateOrder write SetCancelDateOrder;
      property TotalOriginal: String read GetTotalOriginal write SetTotalOriginal;
      property UserNumber: String read GetUserNumber write SetUserNumber;
      property TotalItems: String read GetTotalItems write SetTotalItems;
      constructor Create;
      destructor Destroy; override;
      procedure AddItemList(AObject: TSalesItems);
      procedure RemoveItemList(AIndex: Integer);
      procedure Totalizers;
      function VerifyItemList(AValue: String): Boolean;
      function RetriveList: TObjectList<TSalesItems>;
    end;
implementation

{ TSalesHeader }

uses uConnection, System.Math;

procedure TSalesHeader.AddItemList(AObject: TSalesItems);
var lvSequence: Integer;
begin
  FListItens.Add(AObject);
  lvSequence := FListItens.Count -1;
  FlistItens[lvSequence].FSequence       := lvSequence;
  FlistItens[lvSequence].FCode           := AObject.FCode;
  FlistItens[lvSequence].FDescription    := AObject.FDescription;
  FlistItens[lvSequence].FAmount         := AObject.FAmount;
  FlistItens[lvSequence].FPrice          := AObject.FPrice;
  FlistItens[lvSequence].FOriginalPrice  := AObject.FOriginalPrice;
  FlistItens[lvSequence].FTotalPrice     := AObject.FTotalPrice;
  FlistItens[lvSequence].FTotalOriginalPrice  := AObject.FTotalOriginalPrice;
  FTotalItems := FListItens.Count;
end;

procedure TSalesHeader.RemoveItemList(AIndex: Integer);
begin
  if AIndex >= 0 then
    FListItens.Delete(AIndex);
  FTotalItems := FListItens.Count;
end;

procedure TSalesHeader.Totalizers;
var lvCount: Integer;
begin
  FTotalValue:= 0;
  FDiscount:= 0;
  FTotalOriginal:= 0;
  for lvCount := 0 to pred(FListItens.Count) do
    begin
      FTotalValue    := FTotalValue + FListItens[lvCount].FTotalPrice;
      FDiscount      := FDiscount + (FListItens[lvCount].FOriginalPrice - FListItens[lvCount].FPrice);
      FTotalOriginal := FTotalOriginal + FListItens[lvCount].FTotalOriginalPrice;
    end;
end;

function TSalesHeader.RetriveList: TObjectList<TSalesItems>;
begin
  if FListItens.Count >0 then
    Result:= FListItens;
end;

constructor TSalesHeader.Create;
begin
  inherited Create;
  FListItens := TObjectList<TSalesItems>.Create(True);
end;

function TSalesHeader.VerifyItemList(AValue: String): Boolean;
var lvCount: Integer;
begin
  if FListItens.Count > 0 then
    begin
      for lvCount := 0 to FListItens.Count -1 do
        begin
          if (FListItens[lvCount].FCode = StrToInt(AValue)) then
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

destructor TSalesHeader.Destroy;
begin
  FreeAndNil(FListItens);
  inherited;
end;

function TSalesHeader.GetBranchName: String;
begin
  Result:= FBranchName;
end;

function TSalesHeader.GetBranchNumber: String;
begin
  Result:= IntToStr(FBranchNumber);
end;

function TSalesHeader.GetCancelDateOrder: String;
begin
  Result:= DateToStr(FCancelDateOrder);
end;

function TSalesHeader.GetClientName: String;
begin
  Result:= FClientName;
end;

function TSalesHeader.GetClientNumber: String;
begin
  Result:= IntToStr(FClientNumber);
end;

function TSalesHeader.GetDateOrder: String;
begin
  Result:= DateToStr(FDateOrder);
end;

function TSalesHeader.GetDiscount: String;
begin
  Result:= FloatToStr(FDiscount);
end;

function TSalesHeader.GetOrderNumber: String;
begin
  Result:= IntToStr(FOrderNumber);
end;

function TSalesHeader.GetPlanName: String;
begin
  Result:= FPlanName;
end;

function TSalesHeader.GetPlanNumber: String;
begin
  Result:= IntToStr(FPlanNumber)
end;

function TSalesHeader.GetStatus: String;
begin
 Result:= FStatus;
end;

function TSalesHeader.GetTotalItems: String;
begin
  Result:= IntToStr(FTotalItems);
end;

function TSalesHeader.GetTotalOriginal: String;
begin
  Result:= FloatToStr(FTotalOriginal);
end;

function TSalesHeader.GetTotalValue: String;
begin
  Result:= FloatToStr(FTotalValue);
end;

function TSalesHeader.GetUserNumber: String;
begin
  Result:= IntToStr(FUserNumber);
end;

procedure TSalesHeader.SetBranchName(const Value: String);
begin
  FBranchName := Value;
end;

procedure TSalesHeader.SetBranchNumber(const Value: String);
begin
  FBranchNumber := StrToInt(Value);
end;

procedure TSalesHeader.SetCancelDateOrder(const Value: String);
begin
  FCancelDateOrder := StrToDate(Value);
end;

procedure TSalesHeader.SetClientName(const Value: String);
begin
  FClientName := Value;
end;

procedure TSalesHeader.SetClientNumber(const Value: String);
begin
  FClientNumber := StrToInt(Value);
end;

procedure TSalesHeader.SetDateOrder(const Value: String);
begin
  FDateOrder := StrToDate(Value);
end;

procedure TSalesHeader.SetDiscount(const Value: String);
begin
  FDiscount := StrToFloat(Value);
end;

procedure TSalesHeader.SetOrderNumber(const Value: String);
begin
  FOrderNumber := StrToInt(Value);
end;

procedure TSalesHeader.SetPlanName(const Value: String);
begin
  FPlanName := Value;
end;

procedure TSalesHeader.SetPlanNumber(const Value: String);
begin
  FPlanNumber := StrToInt(Value);
end;

procedure TSalesHeader.SetStatus(const Value: String);
begin
  FStatus := Value;
end;

procedure TSalesHeader.SetTotalItems(const Value: String);
begin
  FTotalItems := StrToInt(Value);
end;

procedure TSalesHeader.SetTotalOriginal(const Value: String);
begin
  FTotalOriginal := StrToFloat(Value);
end;

procedure TSalesHeader.SetTotalValue(const Value: String);
begin
  FTotalValue := StrToFloat(Value);
end;

procedure TSalesHeader.SetUserNumber(const Value: String);
begin
  FUserNumber := StrToInt(Value);
end;

{ TSalesItems }

function TSalesItems.GetAmount: String;
begin
  Result:= FloatToStr(FAmount);
end;

function TSalesItems.GetBarcode: String;
begin
  Result:= FBarcode;
end;

function TSalesItems.GetCode: String;
begin
  Result:= IntToStr(FCode);
end;

function TSalesItems.GetDescription: String;
begin
  Result:= FDescription;
end;

function TSalesItems.GetDiscount: String;
begin
  Result:= FloatToStr(FDiscount)
end;

function TSalesItems.GetOriginalPrice: String;
begin
  Result:= FloatToStr(FOriginalPrice);
end;

function TSalesItems.GetPrice: String;
begin
  Result:= FloatToStr(FPrice);
end;

function TSalesItems.GetSequence: String;
begin
  Result:= IntToStr(FSequence);
end;

function TSalesItems.GetTotalOriginalPrice: String;
begin
  Result:= FloatToStr(FTotalOriginalPrice);
end;

function TSalesItems.GetTotalPrice: String;
begin
  Result:= FloatToStr(FTotalPrice);
end;

procedure TSalesItems.SetAmount(const Value: String);
begin
  FAmount := StrToFloat(Value);
end;

procedure TSalesItems.SetBarcode(const Value: String);
begin
  FBarcode := Value;
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
  FPrice := StrToFloat(Value);
end;

procedure TSalesItems.SetSequence(const Value: String);
begin
  FSequence := StrToInt(Value);
end;

procedure TSalesItems.SetTotalOriginalPrice(const Value: String);
begin
  FTotalOriginalPrice := StrToFloat(Value);
end;

procedure TSalesItems.SetTotalPrice(const Value: String);
begin
  FTotalPrice := StrToFloat(Value);
end;

procedure TSalesItems.SubmitDiscount;
begin
  FDiscount := RoundTo((((FPrice*100)/ FOriginalPrice)-100),-2);
  SubmitTotalPrice;
  SubmitTotalOriginal;
end;

procedure TSalesItems.SubmitPrice;
begin
  FPrice := RoundTo(FOriginalPrice-(((FOriginalPrice * FDiscount)/100)),-2);
  SubmitTotalPrice;
  SubmitTotalOriginal;
end;

procedure TSalesItems.SubmitTotalOriginal;
begin
  FTotalOriginalPrice := (FAmount * FOriginalPrice);
end;

procedure TSalesItems.SubmitTotalPrice;
begin
  FTotalPrice := (FAmount * FPrice);
end;



end.
