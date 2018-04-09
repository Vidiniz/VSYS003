(*******************************************************************************
 * Form : uFrmOrderSale                                                        *
 * Autor : Vinícius Diniz da Costa                                             *
 * Data : 19/02/2018                                                           *
 * Função : Formulário de pedidos de venda                                     *
 *******************************************************************************)

unit uFrmOrderSale;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ImgList, uDMConnection, uFrmSelectionClient, FireDAC.Comp.Client, math,
  Data.DB, uConnection, uMessageUtils, uModel.OrderSales;

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
    CmbBxRegHeaderBranch: TComboBox;
    LblRegHeaderBranch: TLabel;
    LblRegHeaderDate: TLabel;
    DtTmPckRegHeaderDate: TDateTimePicker;
    LblRegHeaderPayPlan: TLabel;
    CmbBxRegHeaderPayPlan: TComboBox;
    PnlRegSearchProd: TPanel;
    LblSearchProdCode: TLabel;
    EdtSearchProdCode: TEdit;
    LblSearchProdDesc: TLabel;
    EdtSearchProdDesc: TEdit;
    LblSearchProdBarCode: TLabel;
    EdtSearchProdBarCode: TEdit;
    LblSearchProdProvider: TLabel;
    CmbBxSearchProdProvider: TComboBox;
    LblSearchProdDepart: TLabel;
    CmbBxSearchProdDepart: TComboBox;
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
    EdtIncProdPrice: TEdit;
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
    procedure BtnSelectClientClick(Sender: TObject);
    procedure EdtSearchClientCodeChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnSearchNewOrderClick(Sender: TObject);
    procedure RdGrpRegIncTypePriceClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnCancelRegisterClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DtTmPckRegHeaderDateClick(Sender: TObject);
    procedure DtTmPckRegHeaderDateExit(Sender: TObject);
    procedure BtnSearchProdClick(Sender: TObject);
    procedure TEditOnEnter(Sender: TObject);
    procedure TEditOnExit(Sender: TObject);
    procedure LstVwProductsDblClick(Sender: TObject);
    procedure ValidKeyPres(Sender: TObject; var Key: Char);
    procedure BtnIncAddClick(Sender: TObject);
    procedure BtnIncCancelClick(Sender: TObject);
    procedure CheckComboBoxHeader(Sender: TObject);
    procedure LstVwItemsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnSaveRegisterClick(Sender: TObject);
  private
    FUserCoder: String;
    FUserName: String;
    FClientCode: String;
    FClientName: String;
    FOrderSaleHeader: TOrderSalesHeader;
    FOrderSalesItem: TOrderSalesItem;
  public
{------------------------------------------------------------------------------}
{------------------------ 0 - Métodos Page Crtl Search ------------------------}
{------------------------------------------------------------------------------}
    procedure FindClient;                               // 1 - FindClient
    procedure ReturnOrderSales(pValue: String);         // 2 - ReturnOrderSales

{------------------------------------------------------------------------------}
{------------------------ 1 - Métodos Page Crtl Register ----------------------}
{------------------------------------------------------------------------------}
    procedure NewOrderSale;                            // 1 - NewOrderSale
    procedure CancelOrderSale;                         // 2 - CancelOrderSale
    procedure SearchProducts;                          // 3 - SearchProducts
    procedure SelectProduct;                           // 4 - SelectProduct
    procedure RegisterProduct;                         // 5 - RegisterProduct
    procedure BlockControlsFields(pParentName: TComponent; Status: Boolean);// 6 - BlockControlsFields
    procedure CleanControlsFields(pParentName: TComponent);// 7 - CleanControlsFields
    procedure AtribFields(pSender: TObject);           // 8 - AtribFields
    procedure RefreshTotalizers;                       // 9 - RefreshTotalizers
    procedure SaveRegister;                            // 10 - SaveRegister

{------------------------------------------------------------------------------}
{------------------------  Métodos Universais ---------------------------------}
{------------------------------------------------------------------------------}
    constructor Create(pOwner: TComponent; pUserCode, pUserName: String);// 1 - Create
    function SQLOpen(pSQLQuery: String): TFDQuery;      // 2 - SQLOpen
    procedure PrintUserStatusBar;                       // 3 - PrintUserStatusBar
    procedure SetTypePrice;                             // 4 - SetTypePrice
    procedure CleanFields;                              // 5 - CleanFields
    procedure SetFormsComboBox(pFieldA, pFieldB, pTableName: String; pCmbBxName: TComboBox); // 6 - SetBranchComboBox
    procedure DefaultForm;                              // 7 - DefaultForm
    procedure ValidOrderDate;                           // 8 - ValidOrderDate
    procedure AlterColor;                               // 9 - AlterColor
    function VerifyHeaderFilled: Boolean;               // 10 - VerifyHeaderFilled
  end;

var
  FrmOrderSale: TFrmOrderSale;

implementation

{$R *.dfm}

uses uValidateNumber;
{------------------------------------------------------------------------------}
{------------------------ 0 - Métodos Page Crtl Search ------------------------}
{------------------------------------------------------------------------------}

(*******************************************************************************
 * 1 - FindClient                                                              *
 * Data - 19/02/2018                                                           *
 * Assunto - Metodo Cria o formulário a atriubui os valores selecionados aos   *
 * campos do formulário atual.                                                 *
 *******************************************************************************)
procedure TFrmOrderSale.FindClient;
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
      FClientCode              := FrmSelectionClient.Code;
      FClientName              := FrmSelectionClient.Name;
    end;
  FreeAndNil(FrmSelectionClient);
end;

(*******************************************************************************
 * 2 - ReturnOrderSales                                                        *
 * Data - 19/02/2018                                                           *
 * Assunto - Método retorna todos os pedidos do cliente selecionado.           *
 *******************************************************************************)
procedure TFrmOrderSale.ReturnOrderSales(pValue: String);
var lvQuery: String;
    lvCount: Integer;
    lvItems: TListItem;
    lvSQLQuery: TFDQuery;
begin
  lvQuery := 'SELECT VPEDIDO.numpedido, VPEDIDO.codfilial ||'+QuotedStr(' - ')+
             '       ||vfilial.filial AS FILIAL, VPEDIDO.codplano ||'+QuotedStr(' - ')+
             '       ||vplpagamento.descricao AS PLPAG, VPEDIDO.data, VPEDIDO.vltotal,'+
             '       VPEDIDO.vldesconto, VPEDIDO.vtabela                       '+
             '  FROM VPEDIDO, VFILIAL, VPLPAGAMENTO                            '+
             ' WHERE VPEDIDO.codfilial = VFILIAL.CODFILIAL                     '+
             '   AND VPEDIDO.codplano  = vplpagamento.codplano                 '+
             '   AND VPEDIDO.codcliente = '+pValue;
  try
    lvSQLQuery := TFDQuery.Create(nil);
    lvSQLQuery.Connection := TConnection.GetConnection;
    lvSQLQuery.SQL.Text := lvQuery;
    try
      lvSQLQuery.Close;
      lvSQLQuery.Open();
      if lvSQLQuery.RowsAffected >= 1 then
        begin
          for lvCount := 0 to pred(lvSQLQuery.RowsAffected) do
            begin
              lvItems := LstVwOrder.Items.Add;
              lvItems.Caption := lvSQLQuery.Fields[0].AsString;
              lvItems.SubItems.Add(lvSQLQuery.Fields[1].AsString);
              lvItems.SubItems.Add(lvSQLQuery.Fields[2].AsString);
              lvItems.SubItems.Add(lvSQLQuery.Fields[3].AsString);
              lvItems.SubItems.Add(FormatCurr('R$ ###,##0.00',lvSQLQuery.Fields[4].AsCurrency));
              lvItems.SubItems.Add(FormatCurr('R$ ###,##0.00',lvSQLQuery.Fields[5].AsCurrency));
              lvItems.SubItems.Add(FormatCurr('R$ ###,##0.00',lvSQLQuery.Fields[6].AsCurrency));
              lvSQLQuery.Next;
            end;
        end;
    except
      raise Exception.Create('Errro ao executar consulta no banco de dados!');
    end;
  finally
    FreeAndNil(lvSQLQuery);
    TConnection.ReleaseConnection;
  end;
end;

{------------------------------------------------------------------------------}
{------------------------ 1 - Métodos Page Crtl Register ----------------------}
{------------------------------------------------------------------------------}

(*******************************************************************************
 * 1 - NewOrderSale                                                            *
 * Data - 20/02/2018                                                           *
 * Assunto - Método executado ao inicar novo pedido de venda                   *
 *******************************************************************************)
procedure TFrmOrderSale.NewOrderSale;
begin
  if MessageDlg(MsgNewRegister,mtConfirmation,mbYesNo,0) = mrYes then
    begin
      if EdtSearchClientCode.Text <> EmptyStr then
        begin
          PgCtrlMain.ActivePageIndex := 1;
          FOrderSaleHeader := TOrderSalesHeader.Create;
          // Seta um novo número de pedido no objeto
          FOrderSaleHeader.NewNumberOrder;
          EdtRegHeaderOrderNumber.Text := FOrderSaleHeader.NumberOrder;
          EdtRegHeaderClientCode.Text  := FClientCode;   // Comum a outros metodos
          EdtRegHeaderClientName.Text  := FClientName;   // Comum a outros metodos
        end
      else
        MessageDlg(MsgErrorNewOrder,mtWarning,[mbOk],0);
    end;
end;

(*******************************************************************************
 * 2 - CancelOrderSale                                                         *
 * Data - 20/02/2018                                                           *
 * Assunto - Método executado ao clicar no botão cancelar                      *
 *******************************************************************************)
procedure TFrmOrderSale.CancelOrderSale;
begin
  if MessageDlg(MsgCancelRegister,mtInformation,mbYesNo,0) = mrYes then
    begin
      FreeAndNil(FOrderSaleHeader);
      FreeAndNil(FOrderSalesItem);
      PgCtrlMain.ActivePageIndex := 0;
      CleanFields;
    end;
end;

(*******************************************************************************
 * 3 - SearchProducts                                                          *
 * Data - 20/02/2018                                                           *
 * Assunto - Método retorna uma lista de produtos para seleção                 *
 *******************************************************************************)
procedure TFrmOrderSale.SearchProducts;
var lvSQLQuery: TFDQuery;
    lvQuery: TStringList;
    lvCount: Integer;
    lvItems: TListItem;
begin
  try
    lvQuery:= TStringList.Create;
    lvQuery.Add('SELECT FIRST 100 VPRODUTO.CODPRODUTO, VPRODUTO.DESCRICAO,      ');
    lvQuery.Add('       VPRODUTO.CODFORNECEDOR ||'+QuotedStr(' - ')+'||         ');
    lvQuery.Add('       VFORNECEDOR.NOME AS FORNECEDOR,                         ');
    lvQuery.Add('       VPRODUTO.CODDEPARTAMENTO ||'+QuotedStr(' - ')+'||       ');
    lvQuery.Add('       VDEPARTAMENTO.DESCRICAO AS DEPARTAMENTO,                ');
    lvQuery.Add('       VPRODUTO.CODFABRICA, VPRODUTO.QTUNITCX,                 ');
    lvQuery.Add('       VPRODUTO.CODBARRAS,VPRECO.PVENDA, VESTOQUE.QTDE         ');
    lvQuery.Add('  FROM VPRODUTO, VPRECO, VESTOQUE, VFORNECEDOR, VDEPARTAMENTO  ');
    lvQuery.Add(' WHERE VPRODUTO.CODPRODUTO = VPRECO.CODPRODUTO                 ');
    lvQuery.Add('   AND VPRODUTO.CODPRODUTO = VESTOQUE.CODPRODUTO               ');
    lvQuery.Add('   AND VPRODUTO.CODFORNECEDOR = VFORNECEDOR.CODFORNECEDOR      ');
    lvQuery.Add('   AND VPRODUTO.CODDEPARTAMENTO = VDEPARTAMENTO.CODDEPARTAMENTO');
    if EdtSearchProdCode.Text <> EmptyStr then
    lvQuery.Add('   AND VPRODUTO.CODPRODUTO = '+ EdtSearchProdCode.Text          );
    if EdtSearchProdDesc.Text <> EmptyStr then
    lvQuery.Add('   AND VPRODUTO.DESCRICAO LIKE '+ QuotedStr('%'+EdtSearchProdDesc.Text+'%'));
    if EdtSearchProdBarCode.Text <> EmptyStr then
    lvQuery.Add('   AND VPRODUTO.CODBARRAS LIKE '+ QuotedStr('%'+EdtSearchProdBarCode.Text+'%'));
    if CmbBxSearchProdProvider.Text <> EmptyStr then
    lvQuery.Add('   AND VPRODUTO.CODFORNECEDOR = '+ Copy(CmbBxSearchProdProvider.Text,1,2));
    if CmbBxSearchProdDepart.Text <> EmptyStr then
    lvQuery.Add('   AND VPRODUTO.CODDEPARTAMENTO = '+ Copy(CmbBxSearchProdDepart.Text,1,2));

    lvSQLQuery := TFDQuery.Create(nil);
    lvSQLQuery.Connection := TConnection.GetConnection;
    try
      lvSQLQuery.SQL.AddStrings(lvQuery);
      lvSQLQuery.Close;
      lvSQLQuery.Open();
      if (LvSQLQuery.RowsAffected >= 1) then
        begin
          for lvCount := 0 to pred(lvSQLQuery.RowsAffected) do
            begin
              lvItems := LstVwProducts.Items.Add;
              lvItems.Caption := lvSQLQuery.Fields[0].AsString;
              lvItems.SubItems.Add(lvSQLQuery.Fields[1].AsString);
              lvItems.SubItems.Add(lvSQLQuery.Fields[4].AsString);
              lvItems.SubItems.Add(lvSQLQuery.Fields[6].AsString);
              lvItems.SubItems.Add(FormatCurr('R$ ###,##0.00',lvSQLQuery.Fields[7].AsCurrency));
              lvItems.SubItems.Add(lvSQLQuery.Fields[8].AsString);
              lvItems.SubItems.Add(lvSQLQuery.Fields[2].AsString);
              lvItems.SubItems.Add(lvSQLQuery.Fields[3].AsString);
              lvSQLQuery.Next;
            end;
        end;
    except
      raise Exception.Create('Erro ao executar consulta no banco de dados !');
    end;
  finally
    FreeAndNil(lvQuery);
    FreeAndNil(lvSQLQuery);
    TConnection.ReleaseConnection;
  end;
end;

(*******************************************************************************
 * 4 - SelectProduct                                                           *
 * Data - 20/02/2018                                                           *
 * Assunto - Método envia a seleção do produto e bloquei outras seleções       *
 *******************************************************************************)
procedure TFrmOrderSale.SelectProduct;
begin
  try
    if LstVwProducts.RowSelect then
      begin
        LstVwProducts.Enabled := False;
        CleanControlsFields(PnlRegSearchProd);
        BlockControlsFields(PnlRegSearchProd,False);
        FOrderSalesItem := TOrderSalesItem.Create;
        FOrderSalesItem.RetriveData(LstVwProducts.Selected.Caption);
        BlockControlsFields(PnlRegIncludProd,True);
      end;
  except
    raise Exception.Create('Erro ao inserir produto na lista de pedidos');
  end;
end;

(*******************************************************************************
 * 5 - RegisterProduct                                                         *
 * Data - 20/02/2018                                                           *
 * Assunto - Método Registra o produto no listview e no list object            *
 *******************************************************************************)
procedure TFrmOrderSale.RegisterProduct;
var lvItems: TListItem;
    lvSeq: Integer;
begin
  FOrderSaleHeader.AddItemList(FOrderSalesItem);
  lvItems := LstVwItems.Items.Add;
  lvSeq := LstVwItems.Items.Count -1;
  lvItems.Caption := IntToStr(lvSeq);
  lvItems.SubItems.Add(FOrderSalesItem.Code);
  lvItems.SubItems.Add(FOrderSalesItem.Description);
  lvItems.SubItems.Add(FOrderSalesItem.Amount);
  lvItems.SubItems.Add(FOrderSalesItem.Price);
  lvItems.SubItems.Add(FOrderSalesItem.ItemTotalPrice);
  FOrderSaleHeader.TotalizerOrderSale('A',lvSeq);
end;

(*******************************************************************************
 * 6 - BlockControlsFields                                                     *
 * Data - 21/02/2018                                                           *
 * Assunto - Bloqueia campos de controle do formulário                         *
 *******************************************************************************)
procedure TFrmOrderSale.BlockControlsFields(pParentName: TComponent; Status: Boolean);
var lvCount: Integer;
begin
  if Status then
    begin
      for lvCount := 0 to pred(ComponentCount) do
        begin
          if (Components[lvCount].HasParent) then
            begin
              if (Components[lvCount].GetParentComponent.Name = pParentName.Name) then
                begin
                  if (Components[lvCount] is TEdit) then
                    begin
                      if ((Components[lvCount].Name = 'EdtIncProdPrice')
                          or (Components[lvCount].Name = 'EdtIncProdDiscount'))then
                        begin
                          if (RdGrpRegIncTypePrice.ItemIndex = 0) then
                            begin
                              EdtIncProdPrice.Enabled := Status;
                              EdtIncProdDiscount.Enabled := not Status;
                            end
                          else
                            begin
                              EdtIncProdPrice.Enabled := not Status;
                              EdtIncProdDiscount.Enabled := Status;
                            end;
                        end
                      else
                        (Components[lvCount] as TEdit).Enabled := Status;
                    end;

                  if (Components[lvCount] is TComboBox) then
                    (Components[lvCount] as TComboBox).Enabled := Status;

                  if (Components[lvCount] is TRadioGroup) then
                    (Components[lvCount] as TRadioGroup).Enabled := Status;

                  if (Components[lvCount] is TButton) then
                    (Components[lvCount] as TButton).Enabled := Status;
                end;
            end;
        end;
    end

  else
    begin
      for lvCount := 0 to pred(ComponentCount) do
        begin
          if (Components[lvCount].HasParent) then
            begin
              if (Components[lvCount].GetParentComponent.Name = pParentName.Name) then
                begin
                  if (Components[lvCount] is TEdit) then
                    (Components[lvCount] as TEdit).Enabled := Status;

                  if (Components[lvCount] is TComboBox) then
                    (Components[lvCount] as TComboBox).Enabled := Status;

                  if (Components[lvCount] is TRadioGroup) then
                    (Components[lvCount] as TRadioGroup).Enabled := Status;

                  if (Components[lvCount] is TButton) then
                    (Components[lvCount] as TButton).Enabled := Status;
                end;
            end;
        end;
    end;
end;
(*******************************************************************************
 * 7 - CleanControlsFields                                                     *
 * Data - 21/02/2018                                                           *
 * Assunto - Limpa os campos do formulário                                     *
 *******************************************************************************)
procedure TFrmOrderSale.CleanControlsFields(pParentName: TComponent);
var lvCount: Integer;
begin
  for lvCount := 0 to pred(ComponentCount) do
    begin
      if (Components[lvCount].HasParent) then
        begin
          if (Components[lvCount].GetParentComponent.Name = pParentName.Name) then
            begin
              if (Components[lvCount] is TEdit) then
                (Components[lvCount] as TEdit).Clear;

              if (Components[lvCount] is TComboBox) then
                (Components[lvCount] as TComboBox).Clear;

              if (Components[lvCount] is TRadioGroup) then
                (Components[lvCount] as TRadioGroup).ItemIndex := 0;
            end;
        end;
    end;
end;

(*******************************************************************************
 * 8 - AtribFields                                                             *
 * Data - 21/02/2018                                                           *
 * Assunto - Abtribui campos do formulário ao objeto                           *
 *******************************************************************************)
procedure TFrmOrderSale.AtribFields(pSender: TObject);
begin
  if (pSender is TListView) then
    begin
      EdtIncProdCode.Text        := FOrderSalesItem.Code;
      EdtIncProdDescription.Text := FOrderSalesItem.Description;
      EdtIncProdAmount.Text      := FOrderSalesItem.Amount;
      EdtIncProdPrice.Text       := FOrderSalesItem.Price;
      EdtIncProdDiscount.Text    := FOrderSalesItem.Discount;
      EdtIncProdTotalPrice.Text  := FOrderSalesItem.ItemTotalPrice;
    end

  else if (pSender is TEdit) then
    begin
      if ((pSender as TEdit).Name = 'EdtIncProdAmount') then
        begin
          FOrderSalesItem.Amount := EdtIncProdAmount.Text;
          FOrderSalesItem.Price  := EdtIncProdPrice.Text;
          FOrderSalesItem.CalcTotalPrice;
          EdtIncProdTotalPrice.Text := FOrderSalesItem.ItemTotalPrice;
        end

       else if ((pSender as TEdit).Name = 'EdtIncProdPrice') then
        begin
          FOrderSalesItem.Amount    := EdtIncProdAmount.Text;
          FOrderSalesItem.Price     := EdtIncProdPrice.Text;
          FOrderSalesItem.SubmitDiscount;
          EdtIncProdDiscount.Text   := FOrderSalesItem.Discount;
          EdtIncProdTotalPrice.Text := FOrderSalesItem.ItemTotalPrice;
        end

       else if ((pSender as TEdit).Name = 'EdtIncProdDiscount') then
        begin
          FOrderSalesItem.Amount    := EdtIncProdAmount.Text;
          FOrderSalesItem.Discount  := EdtIncProdDiscount.Text;
          FOrderSalesItem.SubmitPrice;
          EdtIncProdPrice.Text      := FOrderSalesItem.Price;
          EdtIncProdTotalPrice.Text := FOrderSalesItem.ItemTotalPrice;
        end;
    end;
end;

(*******************************************************************************
 * 9 - RefreshTotalizers                                                       *
 * Data - 22/02/2018                                                           *
 * Assunto - Atualiza os totalizadores                                         *
 *******************************************************************************)
procedure TFrmOrderSale.RefreshTotalizers;
begin
  LblTotalPriceValue.Caption := FOrderSaleHeader.TotalPrice;
  LblDiscountValue.Caption   := FOrderSaleHeader.TotalDiscount;
  LblSubTotalValue.Caption   := FOrderSaleHeader.TotalOriginal;
end;

(*******************************************************************************
 * 10 - SaveRegister                                                           *
 * Data - 22/02/2018                                                           *
 * Assunto - Salva os registro no banco de dados                               *
 *******************************************************************************)
procedure TFrmOrderSale.SaveRegister;
begin
  if MessageDlg('Deseja salvar o pedido de venda ?',mtConfirmation, mbYesNo,0) = mrYes then
    begin
      if (CmbBxRegHeaderPayPlan.Text <> EmptyStr)
        and (CmbBxRegHeaderBranch.Text <> EmptyStr)
       (* and (DtTmPckRegHeaderDate.Date <> EmptyParam) *)then
        begin
          if FOrderSaleHeader.SubmitOrderSale then
            begin
              MessageDlg('Pedido salvo com sucesso!'+#13+#13+'Nº Pedido: '+FOrderSaleHeader.NumberOrder,
              mtInformation,[mbOk],0);
              PgCtrlMain.ActivePageIndex := 0;
            end;
        end;
    end;
end;

{------------------------------------------------------------------------------}
{------------------------  Métodos Universais ---------------------------------}
{------------------------------------------------------------------------------}

(*******************************************************************************
 * 1 - Create                                                                  *
 * Data - 19/02/2018                                                           *
 * Assunto - Método construtor do formulário.                                  *
 *******************************************************************************)
constructor TFrmOrderSale.Create(pOwner: TComponent; pUserCode, pUserName: String);
begin
  inherited Create(pOwner);
  FUserCoder := pUserCode;
  FUserName  := pUserName;
end;

(*******************************************************************************
 * 2 - SQLOpen                                                                 *
 * Data - 19/02/2018                                                           *
 * Assunto - Efetua uma consulta SQL e retorna um DataSet como resultado.      *
 *******************************************************************************)
function TFrmOrderSale.SQLOpen(pSQLQuery: String): TFDQuery;
var lvSQLQuery: TFDQuery;
begin
  try
    lvSQLQuery := TFDQuery.Create(nil);
    lvSQLQuery.Connection := TConnection.GetConnection;
    try
      lvSQLQuery.Open(pSQLQuery);
     // ShowMessage(IntToStr(lvSQLQuery.RowsAffected));
      if lvSQLQuery.RowsAffected >= 1 then
        begin
          Result := lvSQLQuery;
        end;
    except
      raise Exception.Create('Erro ao executar consulta no banco de dados !');
    end;
  finally
    FreeAndNil(lvSQLQuery);
    TConnection.ReleaseConnection;
  end;
end;

(*******************************************************************************
 * 3 - PrintUserStatusBar                                                      *
 * Data - 19/02/2018                                                           *
 * Assunto - Método Imprime o usuário é o códgio no rodapé da rotina           *
 *******************************************************************************)
procedure TFrmOrderSale.PrintUserStatusBar;
begin
  StsBrAdm.Panels[0].Text := 'Código: '+FUserCoder;
  StsBrAdm.Panels[1].Text := 'Usuário: '+FUserName;
end;

(*******************************************************************************
 * 4 - SetTypePrice                                                            *
 * Data - 19/02/2018                                                           *
 * Assunto - Método seta o tipo de preço a ser digitado pelo ususário          *
 *******************************************************************************)
procedure TFrmOrderSale.SetTypePrice;
begin
  if RdGrpRegIncTypePrice.ItemIndex = 0 then
    begin
      EdtIncProdPrice.Enabled := True;
      EdtIncProdPrice.Color := clWindow;
      EdtIncProdDiscount.Enabled:= False;
      EdtIncProdDiscount.Color := cl3DLight;
    end
  else
    begin
      EdtIncProdPrice.Enabled := False;
      EdtIncProdPrice.Color := cl3DLight;
      EdtIncProdDiscount.Enabled:= True;
      EdtIncProdDiscount.Color := clWindow;
    end;
end;

(*******************************************************************************
 * 5 - CleanFields                                                             *
 * Data - 19/02/2018                                                           *
 * Assunto - Método limpa todos os campos do formulário                        *
 *******************************************************************************)
procedure TFrmOrderSale.CleanFields;
var lvCount: Integer;
begin
  for lvCount := 0 to pred(ComponentCount) do
    begin
      if (Components[lvCount] is TEdit) then
        (Components[lvCount] as TEdit).Clear;

      if (Components[lvCount] is TComboBox) then
        (Components[lvCount] as TComboBox).Clear;

      if (Components[lvCount] is TListView) then
        (Components[lvCount] as TListView).Clear;

      if (Components[lvCount] is TDateTimePicker) then
        (Components[lvCount] as TDateTimePicker).Date := now;

      if (Components[lvCount] is TLabel) and (Components[lvCount].Tag = 1) then
        (Components[lvCount] as TLabel).Caption := 'R$';
    end;
end;

(*******************************************************************************
 * 6 - SetFormsComboBox                                                        *
 * Data - 19/02/2018                                                           *
 * Assunto - Recupera todas as filiais cadastradas e preenche o respectivo     *
 * Combo Box                                                                   *
 *******************************************************************************)
procedure TFrmOrderSale.SetFormsComboBox(pFieldA, pFieldB, pTableName: String; pCmbBxName: TComboBox);
var lvSQLQuery: TFDQuery;
    lvQuery: String;
    lvCount: Integer;
begin
  lvQuery := 'SELECT '+pFieldA+' ||'+QuotedStr(' - ')+'|| '+pFieldB+' FROM '+pTableName;
  try
    lvSQLQuery := TFDQuery.Create(nil);
    lvSQLQuery.Connection := TConnection.GetConnection;
    try
      lvSQLQuery.Open(lvQuery);
      if (lvSQLQuery.RowsAffected >= 1) then
        begin
          for lvCount := 0 to pred(lvSQLQuery.RowsAffected) do
            begin
              pCmbBxName.Items.Add(lvSQLQuery.Fields[0].AsString);
              lvSQLQuery.Next;
            end;
        end;
    except
      raise Exception.Create('Erro ao retornar filiais cadastradas!');
    end;
  finally
    FreeAndNil(lvSQLQuery);
    TConnection.ReleaseConnection;
  end;
end;

(*******************************************************************************
 * 7 - DefaultForm                                                             *
 * Data - 20/02/2018                                                           *
 * Assunto - Excuta ações Default do formulário                                *
 *******************************************************************************)
procedure TFrmOrderSale.DefaultForm;
begin
  PgCtrlMain.ActivePageIndex:= 0;
  DtTmPckRegHeaderDate.Date:= now;
  SetTypePrice;
  BlockControlsFields(PnlRegIncludProd,False);
  BlockControlsFields(PnlRegSearchProd,False);
  LstVwProducts.Enabled := False;
end;

(*******************************************************************************
 * 8 - ValidOrderDate                                                          *
 * Data - 20/02/2018                                                           *
 * Assunto - Valida o DateTimePicker para não aceitar data anterior a atual    *
 *******************************************************************************)
procedure TFrmOrderSale.ValidOrderDate;
begin
 if DtTmPckRegHeaderDate.Date < now then
   begin
     DtTmPckRegHeaderDate.Date := now;
     MessageDlg(MsgErrorDate,mtWarning,[mbOK],0);
   end;
end;

(*******************************************************************************
 * 9 - AlterColor                                                              *
 * Data - 20/02/2018                                                           *
 * Assunto - Altera a cor do campo assim que ele recebe ou perde foco          *
 *******************************************************************************)
procedure TFrmOrderSale.AlterColor;
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


(*******************************************************************************
 * 10 - VerifyHeaderFilled                                                     *
 * Data - 22/02/2018                                                           *
 * Assunto - Verifica se todo header foi preenchido corretamente               *
 *******************************************************************************)
function TFrmOrderSale.VerifyHeaderFilled: Boolean;
var lvCount: Integer;
    lvCond: Boolean;
begin
  for lvCount := 0 to pred(ComponentCount) do
    begin
      if (Components[lvCount].HasParent) then
        begin
          if (Components[lvCount].GetParentComponent.Name = 'PnlRegisterHeader') then
            begin
              if (Components[lvCount] is TEdit) then
                begin
                  if ((Components[lvCount] as TEdit).Text = EmptyStr) then
                    begin
                      lvCond := False;
                      Break;
                    end
                  else
                    lvCond := True;
                end

              else if (Components[lvCount] is TComboBox) then
                begin
                  if ((Components[lvCount] as TComboBox).Text = EmptyStr) then
                    begin
                      lvCond := False;
                      Break;
                    end
                  else
                    lvCond := True;
                end;
            end;
        end;
    end;
  Result := lvCond;
end;


(*******************************************************************************
 * Métodos de Formulário                                                       *
 *******************************************************************************)
// Método executado ao criar o formulário
procedure TFrmOrderSale.FormCreate(Sender: TObject);
begin
  SetFormsComboBox('CODFILIAL','FILIAL','VFILIAL',CmbBxRegHeaderBranch);
  SetFormsComboBox('CODPLANO','DESCRICAO','VPLPAGAMENTO',CmbBxRegHeaderPayPlan);
  SetFormsComboBox('CODFORNECEDOR','NOME','VFORNECEDOR',CmbBxSearchProdProvider);
  SetFormsComboBox('CODDEPARTAMENTO','DESCRICAO','VDEPARTAMENTO',CmbBxSearchProdDepart);
end;

// Método executado ao exibir formulário
procedure TFrmOrderSale.FormShow(Sender: TObject);
begin
  PrintUserStatusBar;
  DefaultForm;
end;

// Método executado ao clicar no botão Select Cliente
procedure TFrmOrderSale.BtnSelectClientClick(Sender: TObject);
begin
  FindClient;
end;

// Método executado ao clicar no botão Alterar Cliente
procedure TFrmOrderSale.EdtSearchClientCodeChange(Sender: TObject);
begin
  if EdtSearchClientCode.Text <> EmptyStr then
    begin
      LstVwOrder.Clear;
      ReturnOrderSales(EdtSearchClientCode.Text);
    end;
end;

// Método executado ao iniciar novo pedido
procedure TFrmOrderSale.BtnSearchNewOrderClick(Sender: TObject);
begin
  NewOrderSale;
end;

procedure TFrmOrderSale.BtnSearchProdClick(Sender: TObject);
begin
  LstVwProducts.Clear;
  SearchProducts;
end;

// Método executado ao clicar no Radio Group Box do tipo de preço
procedure TFrmOrderSale.RdGrpRegIncTypePriceClick(Sender: TObject);
begin
  SetTypePrice;
end;

// Método executado ao fechar o formulário
procedure TFrmOrderSale.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(FOrderSaleHeader);
  FreeAndNil(FOrderSalesItem);
end;

// Método executado ao clicar no botão cancelar;
procedure TFrmOrderSale.BtnCancelRegisterClick(Sender: TObject);
begin
  CancelOrderSale;
end;

// Método executado ao Clicar no botão DateTimePicker
procedure TFrmOrderSale.DtTmPckRegHeaderDateClick(Sender: TObject);
begin
  ValidOrderDate;
end;

// Método executado ao sair de um DateTimePicker
procedure TFrmOrderSale.DtTmPckRegHeaderDateExit(Sender: TObject);
begin
  ValidOrderDate;
end;

// Método excutado assim que o TEdit recebe foco
procedure TFrmOrderSale.TEditOnEnter(Sender: TObject);
begin
  AlterColor;
  if TEdit(Sender).Name = 'EdtIncProdPrice' then
   begin
     if Copy(EdtIncProdPrice.Text,1,2) = 'R$' then
       EdtIncProdPrice.Text := Copy(EdtIncProdPrice.Text,4,Length(EdtIncProdPrice.Text));
   end;
end;

// Método excutado assim que o TEdit perde foco
procedure TFrmOrderSale.TEditOnExit(Sender: TObject);
begin
  AlterColor;
  if TEdit(Sender).Name = 'EdtIncProdPrice' then
    begin
      if Copy(EdtIncProdPrice.Text,1,2) <> 'R$' then
      EdtIncProdPrice.Text := FormatCurr('R$ ###,##0.00',StrToCurr(EdtIncProdPrice.Text));
    end;
   AtribFields(Sender);
end;

// Método excutado ao precionar tecla
procedure TFrmOrderSale.ValidKeyPres(Sender: TObject; var Key: Char);
begin
  if not (key in['0'..'9',#8,',']) then
    begin
      key := #0;
      MessageDlg('Por favor digite apenas caracteres alfanúmericos',mtError,[mbOk],0);
    end;
end;

// Método executa ao clicar duas veses sobre o list view
procedure TFrmOrderSale.LstVwProductsDblClick(Sender: TObject);
begin
  SelectProduct;
  AtribFields(Sender);
end;

procedure TFrmOrderSale.BtnIncAddClick(Sender: TObject);
begin
  if FOrderSaleHeader.VerifyItemList(EdtIncProdCode.Text) then
    begin
      RegisterProduct;
      CleanControlsFields(PnlRegIncludProd);
      BlockControlsFields(PnlRegIncludProd,False);
      BlockControlsFields(PnlRegSearchProd,True);
      LstVwProducts.Enabled:= True;
      LstVwProducts.SetFocus;
      RefreshTotalizers;
    end
  else
    MessageDlg('Este produto já foi inserido na lista !'+#13+
   'Não é possivel inserir o mesmo produto duas vezes no mesmo pédido',mtWarning,[mbOk],0);
end;

procedure TFrmOrderSale.BtnIncCancelClick(Sender: TObject);
begin
  CleanControlsFields(PnlRegIncludProd);
  BlockControlsFields(PnlRegIncludProd,False);
  BlockControlsFields(PnlRegSearchProd,True);
  LstVwProducts.Enabled:= True;
  LstVwProducts.SetFocus;
end;

procedure TFrmOrderSale.CheckComboBoxHeader(Sender: TObject);
begin
  if VerifyHeaderFilled then
    begin
      FOrderSaleHeader.ClientCode  := FClientCode;
      FOrderSaleHeader.ClientName  := FClientName;
      FOrderSaleHeader.UserCode    := FUserCoder;
      FOrderSaleHeader.UserName    := FUserName;
      FOrderSaleHeader.PayPlanCode := ReturnNumber(CmbBxRegHeaderPayPlan.Text);
      FOrderSaleHeader.PayPlanName := Copy(CmbBxRegHeaderPayPlan.Text,4,Length(CmbBxRegHeaderPayPlan.Text));
      FOrderSaleHeader.BranchCode  := ReturnNumber(CmbBxRegHeaderBranch.Text);
      FOrderSaleHeader.BranchName  := Copy(CmbBxRegHeaderBranch.Text,4,Length(CmbBxRegHeaderPayPlan.Text));
      FOrderSaleHeader.DateOrder   := DateToStr(DtTmPckRegHeaderDate.Date);
      BlockControlsFields(PnlRegSearchProd,True);
      LstVwProducts.Enabled:= True;
    end

  else
    begin
      BlockControlsFields(PnlRegIncludProd,False);
      BlockControlsFields(PnlRegSearchProd,False);
      LstVwProducts.Enabled:= False;
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
          FOrderSaleHeader.TotalizerOrderSale('R',LstVwItems.ItemIndex);
          FOrderSaleHeader.RemoveItemList(LstVwItems.ItemIndex);
          LstVwItems.DeleteSelected;
          RefreshTotalizers;
        end
      else
        MessageDlg('Selecione um registro antes de tentar excluir !',mtWarning,[mbOk],0);
    end;
end;

procedure TFrmOrderSale.BtnSaveRegisterClick(Sender: TObject);
begin
  SaveRegister;
end;


end.
