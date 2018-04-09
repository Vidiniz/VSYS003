unit uControllerSales;

interface

uses uModelSales, System.SysUtils, Vcl.ComCtrls, System.Generics.Collections;

type

  TSalesController = class
    private
      FSalesItems: TSalesItems;
      FSalesHeader: TSalesHeader;
      procedure BindIncItemList;
    public
      destructor Destroy; override;
      procedure BindView(AValue: String);
      procedure BindNewOrderModel;
      procedure BindNewOrderView;
      procedure BindEditOrderModel(ANumberOrder: String);
      procedure BindEditOrderView;
      procedure BindPayPlanModel(ACodeValue, ANameValue: String);
      procedure BindBranchModel(ACodeValue, ANameValue: String);
      procedure BindSearchProdModel(ACode, ADescription, ABarcode, AProvider, ADepartment: String);
      procedure BindInsertProduct(AValue: String);
      procedure BindItemModel(AAmount, APrice, ADiscount: String; ATypeReg: Integer);
      procedure BindTotalizerView;
      procedure BindRemoveItem(AValue: String);
      procedure BindRefreshItems;
      procedure BindCancelRegister;
      function BindCancelModel(AClient, ANumber: String): Boolean;
      function BindEditItemList(AIndex, AValue: String): Boolean;
      function BindAddItemList(AValue: String): Boolean;
      function BindSaveRegister(AOper: Integer): Boolean;
  end;

implementation

uses uDAOSales, uModelProduct, uFrmOrderSale;

{ TSalesController }

procedure TSalesController.BindView(AValue: String);
var lvListSales: TObjectList<TSalesHeader>;
    lvItens: TListItem;
    lvCount: Integer;
begin
  try
    lvListSales := TObjectList<TSalesHeader>.Create(True);
    if TDAOSales.VerifyReturnOrder(AValue) then
      begin
        lvListSales := TDAOSales.ReturnOrderList(AValue,lvListSales);
        for lvCount := 0 to pred(lvListSales.Count) do
          begin
            lvItens := FrmOrderSale.LstVwOrder.Items.Add;
            lvItens.Caption := lvListSales[lvCount].OrderNumber;
            lvItens.SubItems.Add(lvListSales[lvCount].BranchNumber + ' - ' +
                                 lvListSales[lvCount].BranchName);
            lvItens.SubItems.Add(lvListSales[lvCount].PlanNumber + ' - ' +
                                 lvListSales[lvCount].PlanName);
            lvItens.SubItems.Add(lvListSales[lvCount].DateOrder);
            lvItens.SubItems.Add(FormatCurr('R$ ###,##0.00', StrToCurr(lvListSales[lvCount].TotalValue)));
            lvItens.SubItems.Add(FormatCurr('###,##0.00'   , StrToCurr(lvListSales[lvCount].Discount)));
            lvItens.SubItems.Add(FormatCurr('R$ ###,##0.00', StrToCurr(lvListSales[lvCount].TotalOriginal)));
          end;
       end;
   finally
     FreeAndNil(lvListSales);
   end;
end;

destructor TSalesController.Destroy;
begin
  if Assigned(FSalesHeader) then
    FreeAndNil(FSalesHeader);
  if Assigned(FSalesItems) then
    FreeAndNil(FSalesItems);
    inherited;
end;

procedure TSalesController.BindNewOrderModel;
begin
  FSalesHeader := TSalesHeader.Create;
  try
    FSalesHeader.OrderNumber  := TDAOSales.ReturnNumberSales;
    FSalesHeader.ClientNumber := FrmOrderSale.EdtSearchClientCode.Text;
    FSalesHeader.ClientName   := FrmOrderSale.EdtSearchClientName.Text;
    FSalesHeader.UserNumber   := FrmOrderSale.UserCode;
  except
    raise Exception.Create('Erro ao executar controller!');
  end;
end;

procedure TSalesController.BindNewOrderView;
begin
  try
    FrmOrderSale.EdtRegHeaderOrderNumber.Text := FSalesHeader.OrderNumber;
    FrmOrderSale.EdtRegHeaderClientCode.Text  := FSalesHeader.ClientNumber;
    FrmOrderSale.EdtRegHeaderClientName.Text  := FSalesHeader.ClientName;
  except
    raise Exception.Create('Erro ao executar controller!');
  end;
end;

procedure TSalesController.BindEditOrderModel(ANumberOrder: String);
begin
  FSalesHeader := TSalesHeader.Create;
  FSalesItems  := TSalesItems.Create;
  FSalesHeader := TDAOSales.ReturnOrderHeader(ANumberOrder,FSalesHeader);
  FSalesHeader.UserNumber := FrmOrderSale.UserCode;
end;

procedure TSalesController.BindEditOrderView;
var lvItems: TListItem;
    lvCount: Integer;
begin
  FrmOrderSale.EdtRegHeaderOrderNumber.Text := FSalesHeader.OrderNumber;
  FrmOrderSale.EdtRegHeaderClientCode.Text  := FSalesHeader.ClientNumber;
  FrmOrderSale.EdtRegHeaderClientName.Text  := FSalesHeader.ClientName;
  FrmOrderSale.EdtCodePayPlan.Text          := FSalesHeader.PlanNumber;
  FrmOrderSale.EdtNamePayPlan.Text          := FSalesHeader.PlanName;
  FrmOrderSale.EdtCodeBranch.Text           := FSalesHeader.BranchNumber;
  FrmOrderSale.EdtNameBranch.Text           := FSalesHeader.BranchName;
  BindRefreshItems;
  BindTotalizerView;
end;

function TSalesController.BindAddItemList(AValue: String): Boolean;
begin
  if FSalesHeader.VerifyItemList(AValue) then
    begin
      FSalesHeader.AddItemList(FSalesItems);
      FrmOrderSale.LstVwItems.Clear;
      BindRefreshItems;
      FSalesHeader.Totalizers;
      BindTotalizerView;
      Result:= True;
    end
  else
    Result:= False;
end;

procedure TSalesController.BindIncItemList;
begin
  FrmOrderSale.EdtIncProdCode.Text := FSalesItems.Code;
  FrmOrderSale.EdtIncProdDescription.Text := FSalesItems.Description;
  FrmOrderSale.EdtIncProdAmount.Text := FSalesItems.Amount;
  FrmOrderSale.EdtIncProdPrice.Text := FormatCurr('R$ ###,##0.00', StrToCurr(FSalesItems.Price));
  FrmOrderSale.EdtIncProdDiscount.Text := FormatCurr('0.00', StrToCurr(FSalesItems.Discount));
  FrmOrderSale.EdtIncProdTotalPrice.Text := FormatCurr('R$ ###,##0.00', StrToCurr(FSalesItems.TotalPrice));
end;

procedure TSalesController.BindRefreshItems;
var
  lvCount: Integer;
  lvItems: TListItem;
begin
  FrmOrderSale.LstVwItems.Clear;
  for lvCount := 0 to pred(FSalesHeader.RetriveList.Count) do
  begin
    lvItems := FrmOrderSale.LstVwItems.Items.Add;
    lvItems.Caption := FSalesHeader.RetriveList[lvCount].Sequence;
    lvItems.SubItems.Add(FSalesHeader.RetriveList[lvCount].Code);
    lvItems.SubItems.Add(FSalesHeader.RetriveList[lvCount].Description);
    lvItems.SubItems.Add(FSalesHeader.RetriveList[lvCount].Amount);
    lvItems.SubItems.Add(FormatCurr('R$ ###,##0.00', StrToCurr(FSalesHeader.RetriveList[lvCount].Price)));
    lvItems.SubItems.Add(FormatCurr('R$ ###,##0.00', StrToCurr(FSalesHeader.RetriveList[lvCount].TotalPrice)));
  end;
end;

procedure TSalesController.BindBranchModel(ACodeValue, ANameValue: String);
begin
  try
    FSalesHeader.BranchNumber := ACodeValue;
    FSalesHeader.BranchName   := ANameValue;
    FSalesHeader.DateOrder    := DateToStr(now); { TODO -oVinícius Diniz -cImplementação : Implementar Datetimepicker }
    FSalesHeader.Status       := 'A';
  except
    raise Exception.Create('Erro ao executar controller!');
  end;
end;

function TSalesController.BindCancelModel(AClient, ANumber: String): Boolean;
begin
  if TDAOSales.CancelOrderSale(ANumber) then
    begin
      Result:= True;
      FrmOrderSale.LstVwOrder.Clear;
      BindView(AClient);
    end
  else
    Result:= False;
end;

procedure TSalesController.BindCancelRegister;
begin
 { if Assigned(FSalesHeader) then
    FSalesHeader.Free;
  if Assigned(FSalesItems) then
    FSalesItems.Free;}
end;

procedure TSalesController.BindPayPlanModel(ACodeValue, ANameValue: String);
begin
  try
    FSalesHeader.PlanNumber := ACodeValue;
    FSalesHeader.PlanName   := ANameValue;
    FSalesHeader.DateOrder  := DateToStr(now); { TODO -oVinícius Diniz -cImplementação : Implementar Datetimepicker }
    FSalesHeader.Status     := 'A';
  except
    raise Exception.Create('Erro ao executar controller!');
  end;
end;

function TSalesController.BindEditItemList(AIndex, AValue: String): Boolean;
begin
  try
    FSalesHeader.RemoveItemList(StrToInt(AIndex));
    BindRefreshItems;
    FSalesHeader.Totalizers;
    BindTotalizerView;
    BindInsertProduct(AValue);
    Result := True;
  except
    Result := False;
  end;
end;

procedure TSalesController.BindInsertProduct(AValue: String);
begin
  FSalesItems := TSalesItems.Create;
  FSalesItems := TDAOSales.RetunrItemSale(AValue,FSalesItems);
  BindIncItemList;
end;

procedure TSalesController.BindItemModel(AAmount, APrice, ADiscount: String; ATypeReg: Integer);
begin
  case ATypeReg of
  0:  begin
        FSalesItems.Amount := AAmount;
        FSalesItems.SubmitTotalPrice;
        FSalesItems.SubmitTotalOriginal;
        FrmOrderSale.EdtIncProdTotalPrice.Text := FormatCurr('R$ ###,##0.00', StrToCurr(FSalesItems.TotalPrice));
      end;

  1 : begin
        FSalesItems.Price := APrice;
        FSalesItems.SubmitDiscount;
        FrmOrderSale.EdtIncProdDiscount.Text   := FSalesItems.Discount;
        FrmOrderSale.EdtIncProdTotalPrice.Text := FormatCurr('R$ ###,##0.00', StrToCurr(FSalesItems.TotalPrice));
      end;

  2:  begin
        FSalesItems.Discount := ADiscount;
        FSalesItems.SubmitPrice;
        FrmOrderSale.EdtIncProdPrice.Text      := FormatCurr('R$ ###,##0.00', StrToCurr(FSalesItems.Price));
        FrmOrderSale.EdtIncProdTotalPrice.Text := FormatCurr('R$ ###,##0.00', StrToCurr(FSalesItems.TotalPrice));
      end;
  end;
end;

function TSalesController.BindSaveRegister(AOper: Integer): Boolean;
begin
  case AOper of
    1:  begin
          if FSalesHeader.RetriveList.Count > 0 then
            Result:= TDAOSales.SubmitOrderSale(FSalesHeader)
          else
            Result:= False;
        end;

    2:  begin
          if FSalesHeader.RetriveList.Count > 0 then
            Result:= TDAOSales.SubmitOrderEditSale(FSalesHeader)
          else
            Result:= False;
        end;
  end;
 { try
    if Assigned(FSalesHeader) then
      FSalesHeader.Free;
    if Assigned(FSalesItems) then
      FSalesItems.Free;
  finally
    raise Exception.Create('Erro ao liberar objeto da memoria!');
  end; }
end;

procedure TSalesController.BindSearchProdModel(ACode, ADescription, ABarcode,
  AProvider, ADepartment: String);
var lvListSales: TObjectList<TProduct>;
    lvItens: TListItem;
    lvCount: Integer;
begin
  try
    lvListSales := TObjectList<TProduct>.Create(True);
    lvListSales := TDAOSales.ReturnProductList(ACode, ADescription, ABarcode, AProvider, ADepartment, lvListSales);
    if lvListSales.Count > 0 then
      begin
        for lvCount := 0 to pred(lvListSales.Count) do
          begin
            lvItens := FrmOrderSale.LstVwProducts.Items.Add;
            lvItens.Caption := lvListSales[lvCount].Number;
            lvItens.SubItems.Add(lvListSales[lvCount].Description);
            lvItens.SubItems.Add(lvListSales[lvCount].FactoryCode);
            lvItens.SubItems.Add(lvListSales[lvCount].Barcode);
            lvItens.SubItems.Add(FormatCurr('R$ ###,##0.00', StrToCurr(lvListSales[lvCount].Price)));
            lvItens.SubItems.Add(lvListSales[lvCount].Stock);
            lvItens.SubItems.Add(lvListSales[lvCount].Provider.Number + '  '+
                                 lvListSales[lvCount].Provider.Name);
            lvItens.SubItems.Add(lvListSales[lvCount].Department.Number + '  '+
                                 lvListSales[lvCount].Department.Name);
          end;
      end;
  finally
    FreeAndNil(lvListSales);
  end;
end;

procedure TSalesController.BindTotalizerView;
begin
  FrmOrderSale.LblTotalPriceValue.Caption := FormatCurr('R$ ###,##0.00',StrToCurr(FSalesHeader.TotalValue));
  FrmOrderSale.LblDiscountValue.Caption   := FormatCurr('R$ ###,##0.00',StrToCurr(FSalesHeader.Discount));
  FrmOrderSale.LblSubTotalValue.Caption   := FormatCurr('R$ ###,##0.00',StrToCurr(FSalesHeader.TotalOriginal));
end;

procedure TSalesController.BindRemoveItem(AValue: String);
begin
  if AValue <> EmptyStr then
    begin
      FSalesHeader.RemoveItemList(StrToInt(AValue));
      BindRefreshItems;
      FSalesHeader.Totalizers;
      BindTotalizerView;
    end;
end;

end.
