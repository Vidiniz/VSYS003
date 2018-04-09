(*******************************************************************************
 * Form : uFrmOrderSale                                                        *
 * Autor : Vinícius Diniz da Costa                                             *
 * Data : 19/02/2018                                                           *
 * Função : Formulário de pedidos de venda                                     *
 *******************************************************************************)

unit uFrmOrderSale;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.ImgList, uDMConnection, FireDAC.Comp.Client, math, Data.DB,
  uMessageUtils, System.Generics.Collections, uModelSales, Vcl.Buttons, uControllerSales,
  System.UITypes, frxClass, frxDBSet;

type

  TFrmOrderSale = class(TForm)
    PnlTitle: TPanel;
    PgCtrlMain: TPageControl;
    TbShtSearch: TTabSheet;
    TbShtRegister: TTabSheet;
    PnlSearchClient: TPanel;
    BtnSelectClient: TButton;
    PnlTitleOrder: TPanel;
    LblClientSelect: TLabel;
    LblSearchClientCode: TLabel;
    EdtSearchClientCode: TEdit;
    LblSearchClientName: TLabel;
    EdtSearchClientName: TEdit;
    LblSearchDocument: TLabel;
    EdtSearchDocument: TEdit;
    LblSearchNickName: TLabel;
    EdtSearchNickName: TEdit;
    LblSearchTypeClient: TLabel;
    EdtSearchTypeClient: TEdit;
    StsBrAdm: TStatusBar;
    ImgLstOrderSale: TImageList;
    LstVwOrder: TListView;
    PnlSearchBottom: TPanel;
    PnlSearchToolPanel: TPanel;
    BtnSearchNewOrder: TButton;
    BtnSearchEditOrder: TButton;
    BtnSearchCancelOrder: TButton;
    BtnSearchConsultOrder: TButton;
    BtnSearchPrintOrder: TButton;
    PnlRegisterHeader: TPanel;
    LblRegisterHeader: TLabel;
    LblRegHeaderOrderNumber: TLabel;
    EdtRegHeaderOrderNumber: TEdit;
    LblRegHeaderClient: TLabel;
    EdtRegHeaderClientCode: TEdit;
    EdtRegHeaderClientName: TEdit;
    LblRegHeaderDate: TLabel;
    DtTmPckRegHeaderDate: TDateTimePicker;
    PnlRegSearchProd: TPanel;
    LblSearchProdCode: TLabel;
    EdtSearchProdCode: TEdit;
    LblSearchProdDesc: TLabel;
    EdtSearchProdDesc: TEdit;
    LblSearchProdBarCode: TLabel;
    EdtSearchProdBarCode: TEdit;
    BtnSearchProd: TButton;
    LstVwProducts: TListView;
    PnlRegIncludProd: TPanel;
    LblIncProdCode: TLabel;
    EdtIncProdCode: TEdit;
    LblIncProdDescription: TLabel;
    EdtIncProdDescription: TEdit;
    LblIncProdAmount: TLabel;
    EdtIncProdAmount: TEdit;
    RdGrpRegIncTypePrice: TRadioGroup;
    LblIncProdPrice: TLabel;
    LblIncProdDiscount: TLabel;
    EdtIncProdDiscount: TEdit;
    LblIncProdTotalPrice: TLabel;
    EdtIncProdTotalPrice: TEdit;
    BtnIncCancel: TButton;
    BtnIncAdd: TButton;
    PnlRegTotalizer: TPanel;
    PnlRegItemsTitle: TPanel;
    LstVwItems: TListView;
    PnlResultTotalizer: TPanel;
    PnlTotalizerDesc: TPanel;
    LblSubTotalDesc: TLabel;
    LblDiscountDesc: TLabel;
    LblTotalPriceDesc: TLabel;
    PnlTitleTotalizer: TPanel;
    LblSeparatorDesc: TLabel;
    LblTotalPriceValue: TLabel;
    LblSeparatorValue: TLabel;
    LblDiscountValue: TLabel;
    LblSubTotalValue: TLabel;
    PnlToolBarBottom: TPanel;
    BtnSaveRegister: TButton;
    BtnCancelRegister: TButton;
    PnlPayPlan: TPanel;
    LblRegHeaderPayPlan: TLabel;
    SpdPayPlan: TSpeedButton;
    EdtNamePayPlan: TEdit;
    EdtCodePayPlan: TEdit;
    PnlBranch: TPanel;
    Label1: TLabel;
    SpdBranch: TSpeedButton;
    EdtNameBranch: TEdit;
    EdtCodeBranch: TEdit;
    Label2: TLabel;
    EdtProviderCode: TEdit;
    SpdProviderBtn: TSpeedButton;
    EdtProviderName: TEdit;
    Label3: TLabel;
    EdtDepartmentCode: TEdit;
    SpdDepartmentBtn: TSpeedButton;
    EdtDepartmentName: TEdit;
    EdtIncProdPrice: TEdit;
    FrxRepOrderSales: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    frxDBDataset2: TfrxDBDataset;
    procedure BtnSelectClientClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EdtSearchClientCodeChange(Sender: TObject);
    procedure BtnSearchNewOrderClick(Sender: TObject);
    procedure BtnSearchEditOrderClick(Sender: TObject);
    procedure BtnSearchCancelOrderClick(Sender: TObject);
    procedure BtnSearchPrintOrderClick(Sender: TObject);
    procedure SpdPayPlanClick(Sender: TObject);
    procedure SpdBranchClick(Sender: TObject);
    procedure BtnSearchProdClick(Sender: TObject);
    procedure SpdProviderBtnClick(Sender: TObject);
    procedure SpdDepartmentBtnClick(Sender: TObject);
    procedure ReciveFocusEdt(Sender: TObject);
    procedure LosesfocusEdt(Sender: TObject);
    procedure RdGrpRegIncTypePriceClick(Sender: TObject);
    procedure LstVwProductsDblClick(Sender: TObject);
    procedure ValidKeyPress(Sender: TObject; var Key: Char);
    procedure BtnIncCancelClick(Sender: TObject);
    procedure BtnIncAddClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LstVwItemsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure LstVwItemsDblClick(Sender: TObject);
    procedure BtnCancelRegisterClick(Sender: TObject);
    procedure BtnSaveRegisterClick(Sender: TObject);
    procedure BtnSearchConsultOrderClick(Sender: TObject);
  private
    FUserCoder: String;
    FUserName: String;
    FSalesController: TSalesController;
    FOper: Integer;
    procedure ReturnToDefault;
    function GetUserCode: String;
    function GetUserName: String;
  public
    property UserCode: String read GetUserCode;
    property UserName: String read GetUserName;
    constructor Create(AOwner: TComponent; AUserCode, AUserName: String);
    destructor Destroy;
    procedure ListOrderSales(AValue: String);
    procedure AlterColorFiled;
    procedure BlockFields(AParentName, AException: String ;AStatus: Boolean);
    procedure VerifyHeaderFilled;
    procedure AlterTypePrice;
    procedure CleanFields(AParentName: String);
  end;

  var
  FrmOrderSale: TFrmOrderSale;

implementation

uses uFrmSelectionClient, uConnection, uFrmSelectPayPlan,
  uFrmSelectBranch, uFrmSelectProvider, uFrmSelectDepartment, uFrmConsultSales;

{$R *.dfm}
// Métodos do objeto
procedure TFrmOrderSale.CleanFields(AParentName: String);
var lvCount: Integer;
begin
  for lvCount := 0 to pred(ComponentCount) do
    begin
      if Components[lvCount].HasParent then
        begin
          if Components[lvCount].GetParentComponent.Name = AParentName then
            begin
              if (Components[lvCount] is TEdit) then
                begin
                  (Components[lvCount] as TEdit).Clear;
                end;
            end;
        end;
    end;
end;

procedure TFrmOrderSale.ReturnToDefault;
begin
  PgCtrlMain.ActivePageIndex := 0;
  CleanFields('PnlRegisterHeader');
  CleanFields('PnlRegSearchProd');
  CleanFields('PnlRegIncludProd');
  LstVwProducts.Clear;
  LstVwItems.Clear;
  LblTotalPriceValue.Caption := 'R$';
  LblDiscountValue.Caption := 'R$';
  LblSubTotalValue.Caption := 'R$';
  BlockFields('PnlRegSearchProd', '', False);
  BlockFields('PnlRegIncludProd', '', False);
  LstVwProducts.Enabled := False;
  LstVwItems.Enabled := False;
  LstVwOrder.Clear;
  FSalesController.BindView(EdtSearchClientCode.Text);
end;

constructor TFrmOrderSale.Create(AOwner: TComponent; AUserCode, AUserName: String);
begin
  inherited Create(AOwner);
  FUserCoder := AUserCode;
  FUserName  := AUserName;
  FSalesController := TSalesController.Create;
end;

destructor TFrmOrderSale.Destroy;
begin
  if Assigned(FSalesController) then
    FreeAndNil(FSalesController);
  inherited;
end;

procedure TFrmOrderSale.FormShow(Sender: TObject);
begin
  StsBrAdm.Panels[0].Text := 'Código: '+FUserCoder;
  StsBrAdm.Panels[1].Text := 'Usuário: '+FUserName;
  AlterTypePrice;
  PgCtrlMain.ActivePageIndex := 0;
  BlockFields('PnlRegSearchProd','',False);
  BlockFields('PnlRegIncludProd','',False);
  LstVwProducts.Enabled:= False;
  LstVwItems.Enabled:= False;
  RdGrpRegIncTypePrice.ItemIndex := 0;
  DtTmPckRegHeaderDate.Date := now;
end;

function TFrmOrderSale.GetUserCode: String;
begin
  Result := FUserCoder;
end;

function TFrmOrderSale.GetUserName: String;
begin
  Result := FUserName;
end;

procedure TFrmOrderSale.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(FSalesController) then
    FreeAndNil(FSalesController);
end;

procedure TFrmOrderSale.ListOrderSales(AValue: String);
begin
  FSalesController.BindView(AValue);
end;

procedure TFrmOrderSale.AlterColorFiled;
var lvCount: Integer;
begin
  for lvCount := 0 to pred(ComponentCount) do
    begin
      if (Components[lvCount] is TEdit) and (Components[lvCount].Tag = 0) then
        begin
           if (Components[lvCount] as TEdit).Focused then
             (Components[lvCount] as TEdit).Color := clSkyBlue
           else
             (Components[lvCount] as TEdit).Color := clWindow;
        end;
    end;
end;

procedure TFrmOrderSale.BlockFields(AParentName, AException: String; AStatus: Boolean);
var lvCount: Integer;
begin
  for lvCount := 0 to pred(ComponentCount) do
    begin
      if Components[lvCount].HasParent then
        begin
          if (Components[lvCount].GetParentComponent.Name = AParentName)
            and (Components[lvCount].Name <> AException) then
            begin
              if (Components[lvCount] is TEdit) then
                (Components[lvCount] as TEdit).Enabled := AStatus;
              if (Components[lvCount] is TSpeedButton) then
                (Components[lvCount] as TSpeedButton).Enabled := AStatus;
              if (Components[lvCount] is TButton) then
                (Components[lvCount] as TButton).Enabled := AStatus;
              if (Components[lvCount] is TRadioGroup) then
                (Components[lvCount] as TRadioGroup).Enabled := AStatus;
            end;
        end;
    end;
end;

procedure TFrmOrderSale.AlterTypePrice;
begin
  if RdGrpRegIncTypePrice.ItemIndex = 0 then
    begin
      EdtIncProdPrice.Enabled := True;
      EdtIncProdPrice.Color := clWindow;
      EdtIncProdPrice.Tag := 0;
      EdtIncProdDiscount.Enabled := False;
      EdtIncProdDiscount.Color := cl3DLight;
      EdtIncProdDiscount.Tag := 1;
    end
  else
    begin
      EdtIncProdPrice.Enabled := False;
      EdtIncProdPrice.Color := cl3DLight;
      EdtIncProdPrice.Tag := 1;
      EdtIncProdDiscount.Enabled := True;
      EdtIncProdDiscount.Color := clWindow;
      EdtIncProdDiscount.Tag := 0;
    end;
end;

// Métodos do formulário

procedure TFrmOrderSale.LosesfocusEdt(Sender: TObject);
begin
  AlterColorFiled;
  if (Sender is TEdit) then
    begin
      if (Sender as TEdit).Name =  'EdtIncProdAmount' then
        FSalesController.BindItemModel(EdtIncProdAmount.Text,EdtIncProdPrice.Text,EdtIncProdDiscount.Text,0);
      if (Sender as TEdit).Name =  'EdtIncProdPrice' then
        FSalesController.BindItemModel(EdtIncProdAmount.Text,EdtIncProdPrice.Text,EdtIncProdDiscount.Text,1);
      if (Sender as TEdit).Name =  'EdtIncProdDiscount' then
        FSalesController.BindItemModel(EdtIncProdAmount.Text,EdtIncProdPrice.Text,EdtIncProdDiscount.Text,2);
    end;

    if (Sender is TEdit) then
      begin
        if (Sender as TEdit).Name = 'EdtIncProdPrice' then
          begin
            if Copy((Sender as TEdit).Text,1,2) <> 'R$' then
              (Sender as TEdit).Text := FormatCurr('R$ ###,##0.00',StrToCurr((Sender as TEdit).Text));
          end;
      end;
end;

procedure TFrmOrderSale.ReciveFocusEdt(Sender: TObject);
begin
  AlterColorFiled;
  if (Sender is TEdit) then
    begin
      if (Sender as TEdit).Name = 'EdtIncProdPrice' then
        begin
          if Copy((Sender as TEdit).Text,1,2) = 'R$' then
            (Sender as TEdit).Text := Copy((Sender as TEdit).Text,4,Length((Sender as TEdit).Text));
        end;
    end;
end;

procedure TFrmOrderSale.RdGrpRegIncTypePriceClick(Sender: TObject);
begin
  AlterTypePrice;
end;

procedure TFrmOrderSale.BtnSelectClientClick(Sender: TObject);
begin
  FrmSelectionClient := TFrmSelectionClient.Create(Self);
  FrmSelectionClient.ShowModal;
  if FrmSelectionClient.SelectClient then
    begin
      EdtSearchClientCode.Text := FrmSelectionClient.Code;
      EdtSearchClientName.Text := FrmSelectionClient.Name;
      EdtSearchNickName.Text   := FrmSelectionClient.NickName;
      EdtSearchDocument.Text   := FrmSelectionClient.Document;
      EdtSearchTypeClient.Text := FrmSelectionClient.TypePerson;
     end;
end;

procedure TFrmOrderSale.EdtSearchClientCodeChange(Sender: TObject);
begin
  if (Sender is TEdit) then
    if (Sender as TEdit).Text <> EmptyStr then
      begin
        LstVwOrder.Clear;
        FSalesController.BindView((Sender as TEdit).Text);
      end;
end;

procedure TFrmOrderSale.BtnSearchNewOrderClick(Sender: TObject);
begin
  if EdtSearchClientCode.Text <> EmptyStr then
    begin
      if MessageDlg(MsgNewRegister,mtConfirmation,mbYesNo,0)= mrYes then
        begin
          FOper := 1;
          PgCtrlMain.ActivePageIndex := 1;
          FSalesController.BindNewOrderModel;
          FSalesController.BindNewOrderView;
        end;
    end;
end;

procedure TFrmOrderSale.BtnSearchEditOrderClick(Sender: TObject);
begin
  if (EdtSearchClientCode.Text <> EmptyStr) and
     (LstVwOrder.Selected.Caption <> EmptyStr) then
      begin
        if MessageDlg(MsgEditRegister,mtConfirmation,mbYesNo,0)= mrYes then
          begin
            FOper := 2;
            PgCtrlMain.ActivePageIndex := 1;
            FSalesController.BindEditOrderModel(LstVwOrder.Selected.Caption);
            FSalesController.BindEditOrderView;
            LstVwItems.Enabled:= True;
          end;
      end;
end;

procedure TFrmOrderSale.BtnSearchCancelOrderClick(Sender: TObject);
begin
  if MessageDlg(MsgCancelRegister,mtWarning,mbYesNo,0)= mrYes then
    begin
      if LstVwOrder.Selected.Selected then
        begin
          if FSalesController.BindCancelModel(EdtSearchClientCode.Text,LstVwOrder.Selected.Caption) then
            begin
              MessageDlg('Registro cancelado',mtWarning,[mbOk],0);
            end;
        end;
    end;
end;

procedure TFrmOrderSale.BtnSearchConsultOrderClick(Sender: TObject);
begin
  if (LstVwOrder.Selected.Selected) and (EdtSearchClientCode.Text <> EmptyStr) then
    begin
      try
        FrmConsultSales := TFrmConsultSales.Create(Self,LstVwOrder.Selected.Caption);
        FrmConsultSales.ShowModal;
      finally
        FreeAndNil(FrmConsultSales);
      end;
    end;
end;

procedure TFrmOrderSale.BtnSearchPrintOrderClick(Sender: TObject);
begin
  if MessageDlg('Deseja imprimir o pedido de venda selecionado?', mtConfirmation,mbYesNo,0)= mrYes then
    begin
      if LstVwOrder.Selected.Selected then
        begin
          TFDQuery(frxDBDataset1.DataSet).Params.ParamByName('NUMPEDIDO').AsString :=
            LstVwOrder.Selected.Caption;
          frxDBDataset1.DataSet.Close;
          frxDBDataset1.DataSet.Open;
          FrxRepOrderSales.ShowReport();
        end;
    end;
end;

procedure TFrmOrderSale.BtnSaveRegisterClick(Sender: TObject);
begin
  if MessageDlg(MsgSaveRegister,mtInformation,mbYesNo,0) = mrYes then
    begin
      if FSalesController.BindSaveRegister(FOper) then
        begin
          MessageDlg(MsgSaveConfirmation,mtConfirmation,[mbOK],0);
          ReturnToDefault;
        end
      else
        MessageDlg('Erro ao salvar pedido de venda',mtError,[mbOK],0);
    end;
end;

procedure TFrmOrderSale.BtnCancelRegisterClick(Sender: TObject);
begin
  if MessageDlg(MsgCancelRegister,mtWarning,mbYesNo,0) = mrYes then
    begin
      ReturnToDefault;
      FSalesController.BindCancelRegister;
    end;
end;

procedure TFrmOrderSale.BtnIncAddClick(Sender: TObject);
begin
  if FSalesController.BindAddItemList(EdtIncProdCode.Text) then
    begin
      CleanFields('PnlRegIncludProd');
      BlockFields('PnlRegSearchProd','',True);
      BlockFields('PnlRegIncludProd','',False);
      LstVwProducts.Enabled:= True;
      LstVwItems.Enabled:= True;
    end
  else
    MessageDlg('Não é permitido inserir o mesmo produto na lista!',mtError,[mbOK],0);
end;

procedure TFrmOrderSale.BtnIncCancelClick(Sender: TObject);
begin
  CleanFields('PnlRegIncludProd');
  BlockFields('PnlRegSearchProd','',True);
  BlockFields('PnlRegIncludProd','',False);
  LstVwProducts.Enabled:= True;
end;

procedure TFrmOrderSale.LstVwProductsDblClick(Sender: TObject);
begin
  FSalesController.BindInsertProduct(LstVwProducts.Selected.Caption);
  BlockFields('PnlRegSearchProd','',False);
  BlockFields('PnlRegIncludProd','EdtIncProdDiscount',True);
  LstVwProducts.Enabled:= False;
end;

procedure TFrmOrderSale.SpdBranchClick(Sender: TObject);
begin
  try
    FrmSelectBranch := TFrmSelectBranch.Create(Self);
    FrmSelectBranch.ShowModal;
    EdtCodeBranch.Text := FrmSelectBranch.FCodeBranch;
    EdtNameBranch.Text := FrmSelectBranch.FNameBranch;
    FSalesController.BindBranchModel(FrmSelectBranch.FCodeBranch,FrmSelectBranch.FNameBranch);
    VerifyHeaderFilled;
  finally
    FreeAndNil(FrmSelectBranch);
  end;
end;

procedure TFrmOrderSale.SpdPayPlanClick(Sender: TObject);
begin
  try
    FrmSelectPayPlan := TFrmSelectPayPlan.Create(Self);
    FrmSelectPayPlan.ShowModal;
    EdtCodePayPlan.Text := FrmSelectPayPlan.FCodePlan;
    EdtNamePayPlan.Text := FrmSelectPayPlan.FNamePlan;
    FSalesController.BindPayPlanModel(FrmSelectPayPlan.FCodePlan,FrmSelectPayPlan.FNamePlan);
    VerifyHeaderFilled;
  finally
    FreeAndNil(FrmSelectPayPlan);
  end;
end;

procedure TFrmOrderSale.SpdProviderBtnClick(Sender: TObject);
begin
  try
    FrmSelectProvider := TFrmSelectProvider.Create(Self);
    FrmSelectProvider.ShowModal;
    EdtProviderCode.Text := FrmSelectProvider.FCodeProvider;
    EdtProviderName.Text := FrmSelectProvider.FNameProvider
  finally
    FreeAndNil(FrmSelectProvider);
  end;
end;

procedure TFrmOrderSale.ValidKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in['0'..'9',#8,',']) then
    begin
      key := #0;
      MessageDlg('Por favor digite apenas caracteres alfanúmericos',mtError,[mbOk],0);
    end;
end;

procedure TFrmOrderSale.VerifyHeaderFilled;
begin
  if (EdtCodePayPlan.Text <> EmptyStr)
  and (EdtCodeBranch.Text <> EmptyStr) then
    begin
      BlockFields('PnlRegSearchProd','',True);
      LstVwProducts.Enabled:= True;
      RdGrpRegIncTypePrice.ItemIndex := 0;
    end;
end;

procedure TFrmOrderSale.SpdDepartmentBtnClick(Sender: TObject);
begin
  try
    FrmSelectDepartment := TFrmSelectDepartment.Create(Self);
    FrmSelectDepartment.ShowModal;
    EdtDepartmentCode.Text := FrmSelectDepartment.FCodeDepartment;
    EdtDepartmentName.Text := FrmSelectDepartment.FNameDepartment;
  finally
    FreeAndNil(FrmSelectDepartment);
  end;
end;

procedure TFrmOrderSale.BtnSearchProdClick(Sender: TObject);
begin
  LstVwProducts.Clear;
  FSalesController.BindSearchProdModel(EdtSearchProdCode.Text,EdtSearchProdDesc.Text,
    EdtSearchProdBarCode.Text, EdtProviderCode.Text, EdtDepartmentCode.Text);
end;

procedure TFrmOrderSale.LstVwItemsDblClick(Sender: TObject);
begin
  if MessageDlg('Deseja alterar o produto'+#13+
  LstVwItems.Selected.SubItems[0]+ ' - ' +
  LstVwItems.Selected.SubItems[1]+ ' ?',mtConfirmation, mbYesNo,0)= mrYes then
    begin
      if LstVwItems.Items.Count > 0 then
        begin
          if FSalesController.BindEditItemList(LstVwItems.Selected.Caption,LstVwItems.Selected.SubItems[0]) then
            begin
              BlockFields('PnlRegSearchProd','',False);
              BlockFields('PnlRegIncludProd','EdtIncProdDiscount',True);
              LstVwProducts.Enabled := False;
              LstVwItems.Enabled := False;
            end;
        end;
    end;
end;

procedure TFrmOrderSale.LstVwItemsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = $2E then
    begin
      if MessageDlg('Deseja realmente excluir o item selecionado'+#13+
        'da lista de produtos ?',mtConfirmation, mbYesNo,0)= mrYes then
        begin
          FSalesController.BindRemoveItem(LstVwItems.Selected.Caption);
          if LstVwItems.Items.Count = 0 then
            begin
              LstVwItems.Enabled := False;
            end;
        end;
    end;
end;

end.




