(*******************************************************************************
 * Form : uFrmSales                                                            *
 * Autor : Vinícius Diniz da Costa                                             *
 * Data : 05/02/2018                                                           *
 * Função : Formulário de pedidos de venda                                     *
 *******************************************************************************)
unit uFrmSales;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Mask, Vcl.DBCtrls, Vcl.StdCtrls,
  Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls,
  FireDAC.Comp.Client, uDMConnection, uModel.Sales, uConnection, uMessageUtils,
  uModel.User, uValidateNumber, Vcl.ImgList;

type
  TFrmSales = class(TForm)
    PnlTitle: TPanel;
    PgCtrlMain: TPageControl;
    TbShtSearch: TTabSheet;
    TbShtRegister: TTabSheet;
    PnlSeach: TPanel;
    DBGrdSearch: TDBGrid;
    EdtSearch: TEdit;
    BtnSearch: TButton;
    DtSrcClient: TDataSource;
    CmbBxTySearch: TComboBox;
    StsBrData: TStatusBar;
    PnlRegiterTop: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    PnlTitleItens: TPanel;
    PnlSearchItens: TPanel;
    EdtSearchCode: TEdit;
    EdtDescription: TEdit;
    EdtFactoryCode: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    EdtBarCode: TEdit;
    DBGrdProd: TDBGrid;
    DtSrcProduct: TDataSource;
    PnlSalesDetail: TPanel;
    PnlSearchRight: TPanel;
    PnlSearchLeft: TPanel;
    Panel3: TPanel;
    DBGrdSales: TDBGrid;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    PnlTolBar: TPanel;
    BtnNewSale: TButton;
    DtSrcSales: TDataSource;
    PnlItens: TPanel;
    LstVwProducts: TListView;
    PnlHeaderSales: TPanel;
    PnlRegisterBottom: TPanel;
    PnlTitleHeader: TPanel;
    BtnSave: TButton;
    BtnSearchProd: TButton;
    PnlProductReg: TPanel;
    BtnCancel: TButton;
    Label10: TLabel;
    Label11: TLabel;
    EdtRegDescription: TEdit;
    Label12: TLabel;
    EdtRegAmount: TEdit;
    RdGrpTypeDesc: TRadioGroup;
    Label13: TLabel;
    EdtRegPriceUnit: TEdit;
    Label14: TLabel;
    EdtRegDiscount: TEdit;
    Label15: TLabel;
    EdtRegTotalPrice: TEdit;
    BtnRegInc: TButton;
    EdtNumberSale: TEdit;
    EdtRegCode: TEdit;
    Label16: TLabel;
    DtSrcBranch: TDataSource;
    DtTmPckDate: TDateTimePicker;
    Label17: TLabel;
    EdtClientCode: TEdit;
    EdtClientName: TEdit;
    EdtClientDoc: TEdit;
    BlnHntMessage: TBalloonHint;
    BtnRegCancel: TButton;
    ImgLstSales: TImageList;
    PnlHeaderRight: TPanel;
    PnlHeaderClient: TPanel;
    Label9: TLabel;
    LblTotalSale: TLabel;
    Label19: TLabel;
    LblTotalOriginal: TLabel;
    Label21: TLabel;
    LblTotalDiscount: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    PnlHeaderPlan: TPanel;
    DtSrcPlanPay: TDataSource;
    Label18: TLabel;
    DBLkpCmbBxBranch: TDBLookupComboBox;
    DBLkpCmbBxPayPlan: TDBLookupComboBox;
    procedure FormCreate(Sender: TObject);
    procedure BtnSearchClick(Sender: TObject);
    procedure BtnSearchProdClick(Sender: TObject);
    procedure OnEnterEdit(Sender: TObject);
    procedure OnExitEdit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnNewSaleClick(Sender: TObject);
    procedure DBGrdProdDblClick(Sender: TObject);
    procedure EdtRegPriceUnitKeyPress(Sender: TObject; var Key: Char);
    procedure BtnRegIncClick(Sender: TObject);
    procedure BtnRegCancelClick(Sender: TObject);
    procedure EdtRegDiscountKeyPress(Sender: TObject; var Key: Char);
    procedure RdGrpTypeDescClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure LstVwProductsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure DBLkpCmbBxBranchClick(Sender: TObject);
    procedure DBLkpCmbBxPayPlanClick(Sender: TObject);
    procedure DtTmPckDateClick(Sender: TObject);
  private
    SalesHeader: TSalesHeader;
    SalesItems : TSalesItems;
  public
    procedure TypeSearchClient;                        // 1 - TypeSearchClient
    procedure FilterClient(AValue: String);            // 2 - FilterClient
    procedure FilterProduct;                           // 3 - FilterProduct
    procedure AlterColor;                              // 4 - AlterColor
    procedure NewOrder;                                // 5 - NewOrder
    procedure ClearFields;                             // 6 - ClearFields
    procedure NewProduct(AValue: String);              // 7 - NewProduct
    procedure BlockAndClearFields(AStatus: Boolean);   // 8 - BlockAndClearFields
    procedure AtribDataField(AMod: Integer);           // 9 - AtribDataField
    procedure RetribDataField(AMod: Integer);          // 10 - RetribDataField
    procedure RefreshObject(AMod: Integer);            // 11 - RefreshObject
    procedure TypePrice;                               // 12 - TypePrice
    procedure AddItemListView;                         // 13 - AddItemListView
    procedure RefreshTotalizer;                        // 14 - RefreshTotalizer
  end;

var
  FrmSales: TFrmSales;

implementation

{$R *.dfm}

{ TFrmSales }

(*******************************************************************************
 * 1 - TypeSearchClient                                                        *
 * Data Criação : 05/02/2018                                                   *
 * Data da alteração : 05/02/2018                                              *
 * Autor : Vinícius Diniz da Costa                                             *
 * Assunto : Alimenta o campo combobox os campos que podem ser filtrados       *
 *******************************************************************************)
procedure TFrmSales.TypeSearchClient;
var lvCount: Integer;
begin
  for lvCount := 0 to pred(DtSrcClient.DataSet.FieldCount) do
    begin
      if DBGrdSearch.Columns.Items[lvCount].Visible then
        CmbBxTySearch.Items.Add(DtSrcClient.DataSet.Fields.Fields[lvCount].DisplayName);
    end;
end;

(*******************************************************************************
 * 2 - FilterClient                                                            *
 * Data Criação : 05/02/2018                                                   *
 * Data da alteração : 05/02/2018                                              *
 * Autor : Vinícius Diniz da Costa                                             *
 * Assunto : Filtra o DataSet de acordo com as informações inseridas no campos *
 * de pesquisa                                                                 *
 *******************************************************************************)
procedure TFrmSales.FilterClient(AValue: String);
var lvCount: Integer;
begin
  if (CmbBxTySearch.Text = EmptyStr) or (AValue = EmptyStr) then
    begin
      DtSrcClient.DataSet.Filtered := False;
    end

  else if DtSrcClient.DataSet.Filtered then
    begin
       DtSrcClient.DataSet.Filtered := False;
       if DtSrcClient.DataSet.Fields.Fields[CmbBxTySearch.ItemIndex].DataType = ftInteger then
         DtSrcClient.DataSet.Filter := DtSrcClient.DataSet.Fields.Fields[CmbBxTySearch.ItemIndex].FieldName + ' = ' + AValue;
       if DtSrcClient.DataSet.Fields.Fields[CmbBxTySearch.ItemIndex].DataType = ftString then
         DtSrcClient.DataSet.Filter := DtSrcClient.DataSet.Fields.Fields[CmbBxTySearch.ItemIndex].FieldName + ' like ' + QuotedStr('%'+AValue+'%');
       DtSrcClient.DataSet.Filtered := True;
    end

  else
    begin
       if DtSrcClient.DataSet.Fields.Fields[CmbBxTySearch.ItemIndex].DataType = ftInteger then
         DtSrcClient.DataSet.Filter := DtSrcClient.DataSet.Fields.Fields[CmbBxTySearch.ItemIndex].FieldName + ' = ' + AValue;
       if DtSrcClient.DataSet.Fields.Fields[CmbBxTySearch.ItemIndex].DataType = ftString then
         DtSrcClient.DataSet.Filter := DtSrcClient.DataSet.Fields.Fields[CmbBxTySearch.ItemIndex].FieldName + ' like ' + QuotedStr('%'+AValue+'%');
       DtSrcClient.DataSet.Filtered := True;
    end;
end;

(*******************************************************************************
 * 3 - FilterProduct                                                           *
 * Data Criação : 05/02/2018                                                   *
 * Data da alteração : 05/02/2018                                              *
 * Autor : Vinícius Diniz da Costa                                             *
 * Assunto : Filtra o DataSet de acordo com as informações inseridas no campos *
 * de pesquisa                                                                 *
 *******************************************************************************)
procedure TFrmSales.FilterProduct;
var Query: TStringList;
begin
  Query := TStringList.Create;
  Query.Add('SELECT VPRODUTO.CODPRODUTO, VPRODUTO.DESCRICAO, VPRODUTO.CODFORNECEDOR,  ');
  Query.Add('       VFORNECEDOR.NOME, VPRODUTO.CODFABRICA, VPRODUTO.QTUNITCX,         ');
  Query.Add('       VPRODUTO.CODBARRAS, VPRECO.PVENDA, VESTOQUE.QTDE                  ');
  Query.Add('  FROM VPRODUTO, VPRECO, VESTOQUE, VFORNECEDOR                           ');
  Query.Add(' WHERE VPRODUTO.CODPRODUTO = VPRECO.CODPRODUTO                           ');
  Query.Add('   AND VPRODUTO.CODPRODUTO = VESTOQUE.CODPRODUTO                         ');
  Query.Add('   AND VPRODUTO.CODFORNECEDOR = VFORNECEDOR.CODFORNECEDOR                ');
  if EdtSearchCode.Text <> EmptyStr then
  Query.Add('   AND VPRODUTO.CODPRODUTO = '+EdtSearchCode.Text                         );
  if EdtDescription.Text <> EmptyStr then
  Query.Add('   AND VPRODUTO.DESCRICAO LIKE '+QuotedStr('%'+EdtDescription.Text+'%')   );
  if EdtFactoryCode.Text <> EmptyStr then
  Query.Add('   AND VPRODUTO.CODFABRICA LIKE'+QuotedStr('%'+EdtFactoryCode.Text+'%')   );
  if EdtBarCode.Text <> EmptyStr then
  Query.Add('   AND VPRODUTO.CODBARRAS LIKE'+QuotedStr('%'+EdtBarCode.Text+'%')        );
  if DBLkpCmbBxBranch.Text <> EmptyStr then
  Query.Add('   AND VESTOQUE.CODFILIAL = '+VarToStr(DBLkpCmbBxBranch.KeyValue)         )
  else
  Query.Add('   AND VESTOQUE.CODFILIAL = 1'                                            );

  TFDQuery(DtSrcProduct.DataSet).SQL.Clear;
  TFDQuery(DtSrcProduct.DataSet).SQL := Query;
  DtSrcProduct.DataSet.Close;
  DtSrcProduct.DataSet.Open;
  FreeAndNil(Query);
end;

(*******************************************************************************
 * 4 - AlterColor                                                              *
 * Data Criação : 06/02/2018                                                   *
 * Data da alteração : 06/02/2018                                              *
 * Autor : Vinícius Diniz da Costa                                             *
 * Assunto : Altera a cor do campo assim que ele recebe ou perde focu          *
 *******************************************************************************)
procedure TFrmSales.AlterColor;
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
 * 5 - NewOrder                                                                *
 * Data Criação : 06/02/2018                                                   *
 * Data da alteração : 06/02/2018                                              *
 * Autor : Vinícius Diniz da Costa                                             *
 * Assunto : Inicializa um novo pedido                                         *
 *******************************************************************************)
procedure TFrmSales.NewOrder;
var lvClientCode: String;
begin
  lvClientCode := DtSrcClient.DataSet.Fields.Fields[0].AsString;
  SalesHeader := TSalesHeader.Create(lvClientCode);
  EdtNumberSale.Text := SalesHeader.IDSale;
  EdtClientCode.Text := SalesHeader.IDClient;
  EdtClientName.Text := SalesHeader.Description;
  EdtClientDoc.Text  := SalesHeader.Document;
  PgCtrlMain.ActivePageIndex := 1;
end;

(*******************************************************************************
 * 6 - ClearFields                                                             *
 * Data Criação : 06/02/2018                                                   *
 * Data da alteração : 06/02/2018                                              *
 * Autor : Vinícius Diniz da Costa                                             *
 * Assunto : Limpa todo os campos da formulário                                *
 *******************************************************************************)
procedure TFrmSales.ClearFields;
var lvCount: Integer;
begin
  for lvCount := 0 to pred(ComponentCount) do
    begin
      if (Components[lvCount] is TEdit) then
        begin
          (Components[lvCount] as TEdit).Clear;
        end;
    end;
end;

(*******************************************************************************
 * 7 - NewProduct                                                              *
 * Data Criação : 07/02/2018                                                   *
 * Data da alteração : 07/02/2018                                              *
 * Autor : Vinícius Diniz da Costa                                             *
 * Assunto : Cria o obejto atribui os dados ao objeto                          *
 *******************************************************************************)
procedure TFrmSales.NewProduct(AValue: String);
begin
  SalesItems := TSalesItems.Create;
  SalesItems.DataRetrive(AValue);
end;

(*******************************************************************************
 * 8 - BlockAndClearFields                                                     *
 * Data Criação : 07/02/2018                                                   *
 * Data da alteração : 07/02/2018                                              *
 * Autor : Vinícius Diniz da Costa                                             *
 * Assunto : Bloqueia e limpa os campos parents do panel associado             *
 *******************************************************************************)
procedure TFrmSales.BlockAndClearFields(AStatus: Boolean);
var lvCount: Integer;
begin
  for lvCount := 0 to pred(ComponentCount) do
    begin
    if not ((Components[lvCount] is TDataSource)
    or (Components[lvCount] is TImageList)
    or (Components[lvCount] is TBalloonHint)) then
      begin
      if (Components[lvCount].GetParentComponent.Name = 'PnlProductReg') then
        begin
        // Limpa os campos set default
          if (Components[lvCount] is TEdit) then
            (Components[lvCount] as TEdit).Clear;
          if (Components[lvCount] is TRadioGroup) then
            (Components[lvCount] as TRadioGroup).ItemIndex := 0;
        // Desativa ou Ativa os campos
          if (Components[lvCount] is TEdit) then
            (Components[lvCount] as TEdit).Enabled := AStatus;
          if (Components[lvCount] is TRadioGroup) then
            (Components[lvCount] as TRadioGroup).Enabled := AStatus;
          if (Components[lvCount] is TRadioGroup) then
            (Components[lvCount] as TRadioGroup).Enabled := AStatus;
          if (Components[lvCount] is TButton) then
            (Components[lvCount] as TButton).Enabled := AStatus;
        end;
      end;
    end;
end;

(*******************************************************************************
 * 9 - AtribDataField                                                          *
 * Data Criação : 08/02/2018                                                   *
 * Data da alteração : 08/02/2018                                              *
 * Autor : Vinícius Diniz da Costa                                             *
 * Assunto : Atribui os campos para os forms para as propertys do objeto       *
 *******************************************************************************)
procedure TFrmSales.AtribDataField(AMod: Integer);
begin
  if AMod = 1 then
    begin
      EdtRegCode.Text        := SalesItems.Code ;
      EdtRegDescription.Text := SalesItems.Description;
      EdtRegAmount.Text      := SalesItems.Amount;
      EdtRegPriceUnit.Text   := SalesItems.Price;
      EdtRegDiscount.Text    := SalesItems.Discount;
      EdtRegTotalPrice.Text  := SalesItems.TotalPrice;
    end;
  if AMod = 2 then
    begin
      EdtRegCode.Text        := SalesItems.Code ;
      EdtRegDescription.Text := SalesItems.Description;
      EdtRegAmount.Text      := SalesItems.Amount;
      EdtRegDiscount.Text    := SalesItems.Discount;
      EdtRegTotalPrice.Text  := SalesItems.TotalPrice;
    end;
  if AMod = 3 then
    begin
      EdtRegCode.Text        := SalesItems.Code ;
      EdtRegDescription.Text := SalesItems.Description;
      EdtRegAmount.Text      := SalesItems.Amount;
      EdtRegPriceUnit.Text   := SalesItems.Price;
      EdtRegTotalPrice.Text  := SalesItems.TotalPrice;
    end;
end;

(*******************************************************************************
 * 10 - RetribDataField                                                        *
 * Data Criação : 08/02/2018                                                   *
 * Data da alteração : 08/02/2018                                              *
 * Autor : Vinícius Diniz da Costa                                             *
 * Assunto : Recupera os campos os form as propertys do objeto                 *
 *******************************************************************************)
procedure TFrmSales.RetribDataField(AMod: Integer);
begin
  if AMod = 1 then
    begin
      SalesItems.Amount   := EdtRegAmount.Text;
      SalesItems.Price    := EdtRegPriceUnit.Text;
      SalesItems.Discount := EdtRegDiscount.Text;
    end;
end;

(*******************************************************************************
 * 11 - RefreshObject                                                          *
 * Data Criação : 08/02/2018                                                   *
 * Data da alteração : 08/02/2018                                              *
 * Autor : Vinícius Diniz da Costa                                             *
 * Assunto : Executa os metodos para dar o refresh na tela                     *
 *******************************************************************************)
procedure TFrmSales.RefreshObject(AMod: Integer);
begin
  if AMod = 1 then
    begin
      RetribDataField(1);
      SalesItems.CalcTotalPrice;
      AtribDataField(1);
    end;
  if AMod = 2 then
    begin
      RetribDataField(1);
      SalesItems.SubmitDiscount;
      AtribDataField(2);
    end;
  if AMod = 3 then
    begin
      RetribDataField(1);
      SalesItems.SubmitPrice;
      AtribDataField(3);
    end;
end;

(*******************************************************************************
 * 12 - TypePrice                                                              *
 * Data Criação : 08/02/2018                                                   *
 * Data da alteração : 08/02/2018                                              *
 * Autor : Vinícius Diniz da Costa                                             *
 * Assunto : Modifica os campos de acordo com a seleção de radio group         *
 *******************************************************************************)
procedure TFrmSales.TypePrice;
begin
 if RdGrpTypeDesc.ItemIndex = 0 then
    begin
      EdtRegPriceUnit.Enabled := True;
      EdtRegPriceUnit.Color := clWindow;
      EdtRegPriceUnit.Tag := 0;
      EdtRegDiscount.Enabled := False;
      EdtRegDiscount.Color := cl3DLight;
      EdtRegDiscount.Tag := 1;
    end
  else
    begin
      EdtRegPriceUnit.Enabled := False;
      EdtRegPriceUnit.Color := cl3DLight;
      EdtRegPriceUnit.Tag := 1;
      EdtRegDiscount.Enabled := True;
      EdtRegDiscount.Color := clWindow;
      EdtRegDiscount.Tag := 0;
    end;
end;

(*******************************************************************************
 * 13 - AddItemListView                                                        *
 * Data Criação : 08/02/2018                                                   *
 * Data da alteração : 08/02/2018                                              *
 * Autor : Vinícius Diniz da Costa                                             *
 * Assunto : Adiciona os produtos inseridos no listview                        *
 *******************************************************************************)
procedure TFrmSales.AddItemListView;
var Item: TListItem;
    lvSeq: Integer;
begin
  SalesHeader.AddItemProd(SalesItems);
  Item := LstVwProducts.Items.Add;
  lvSeq := LstVwProducts.Items.Count -1;
  Item.Caption := IntToStr(lvSeq);
  Item.SubItems.Add(SalesItems.Code);
  Item.SubItems.Add(SalesItems.Description);
  Item.SubItems.Add(SalesItems.Amount);
  Item.SubItems.Add(SalesItems.Price);
  Item.SubItems.Add(SalesItems.TotalPrice);
  SalesHeader.TotalizerSales('A',lvSeq);
{  SalesHeader.TotalizerSales;
  LblTotalSale.Caption     := SalesHeader.TotalValue;
  LblTotalDiscount.Caption := SalesHeader.TotalDiscount;
  LblTotalOriginal.Caption := SalesHeader.TotalOriginal;}
  RefreshTotalizer;
end;

procedure TFrmSales.RefreshTotalizer;
begin
  LblTotalSale.Caption     := SalesHeader.TotalValue;
  LblTotalDiscount.Caption := SalesHeader.TotalDiscount;
  LblTotalOriginal.Caption := SalesHeader.TotalOriginal;
end;

(*******************************************************************************
 * Métodos de formulário                                                       *
 *******************************************************************************)
procedure TFrmSales.FormCreate(Sender: TObject);
begin
  TypeSearchClient;
end;

procedure TFrmSales.FormDestroy(Sender: TObject);
begin
  if Assigned(SalesHeader) then
    FreeAndNil(SalesHeader);
  if Assigned(SalesItems) then
    FreeAndNil(SalesItems);
end;

procedure TFrmSales.FormShow(Sender: TObject);
begin
  PgCtrlMain.ActivePageIndex := 0;
  RdGrpTypeDesc.ItemIndex := 0;
  BlockAndClearFields(False);
  TypePrice;
end;

procedure TFrmSales.LstVwProductsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = $2E then
    begin
      if MessageDlg('Deseja realmente excluir o item selecionado'+#13+
        'da lista de produtos ?',mtConfirmation, mbYesNo,0)= mrYes then
        begin
          if LstVwProducts.ItemIndex >= 0 then
            begin
              SalesHeader.TotalizerSales('R',LstVwProducts.ItemIndex);
              SalesHeader.RemoveItemProd(LstVwProducts.ItemIndex);
              LstVwProducts.DeleteSelected;
              RefreshTotalizer;
            end

          else
            MessageDlg('Selecione um registro antes de tentar excluir !',mtWarning,[mbOk],0);
        end;
    end;
end;

procedure TFrmSales.RdGrpTypeDescClick(Sender: TObject);
begin
  TypePrice;
  //SalesItems.SubmitOriginalPrice;
end;

//------------------------------------------------------------------------------
// Método Executado ao entrar no campo Preço, este metodo remove os caracteres -
// não alfanuméricos                                                           -
//------------------------------------------------------------------------------
procedure TFrmSales.OnEnterEdit(Sender: TObject);
begin
  AlterColor;
  if TEdit(Sender).Name = 'EdtRegPriceUnit' then
   begin
     if Copy(EdtRegPriceUnit.Text,1,2) = 'R$' then
       EdtRegPriceUnit.Text := Copy(EdtRegPriceUnit.Text,4,Length(EdtRegPriceUnit.Text));
   end;
end;

//------------------------------------------------------------------------------
// Método Executado ao sair do campo Preço, este metodo coloca os caracteres   -
// alfanuméricos novamente                                                     -
//------------------------------------------------------------------------------
procedure TFrmSales.OnExitEdit(Sender: TObject);
begin
  AlterColor;
  if TEdit(Sender).Name = 'EdtRegPriceUnit' then
    begin
      if Copy(EdtRegPriceUnit.Text,1,2) <> 'R$' then
      EdtRegPriceUnit.Text := FormatCurr('R$ ###,##0.00',StrToCurr(EdtRegPriceUnit.Text));
      RefreshObject(2);
    end;

  if TEdit(Sender).Name = 'EdtRegAmount' then
    begin
      RefreshObject(1);
    end;

  if TEdit(Sender).Name = 'EdtRegDiscount' then
    begin
      RefreshObject(3);
    end;
end;

procedure TFrmSales.BtnNewSaleClick(Sender: TObject);
begin
  if (DtSrcClient.DataSet.RecNo > 0)
    and (DtSrcClient.DataSet.Fields.Fields[0].AsString <> EmptyStr) then
    begin
      if MessageDlg(MsgNewRegister,mtConfirmation,mbYesNo,0) = mrYes then
        NewOrder;
    end
  else
    MessageDlg(MsgErrorNewOrder,mtError,[mbOk],0);
end;

//------------------------------------------------------------------------------
// Método Executado ao clicar no botão Incluir produto                         -
//------------------------------------------------------------------------------
procedure TFrmSales.BtnRegIncClick(Sender: TObject);
begin
 if SalesHeader.VerifyItemInc(EdtRegCode.Text) then
   begin
     AddItemListView;
     DBGrdProd.Enabled := True;
     BtnSearchProd.Enabled := True;
     BlockAndClearFields(False);
   end
 else
   MessageDlg('Este produto já foi inserido na lista !'+#13+
   'Não é possivel inserir o mesmo produto duas vezes no mesmo pédido',mtWarning,[mbOk],0);
end;



procedure TFrmSales.BtnSearchClick(Sender: TObject);
begin
  FilterClient(EdtSearch.Text);
end;

procedure TFrmSales.BtnSearchProdClick(Sender: TObject);
begin
  FilterProduct;
end;

//------------------------------------------------------------------------------
// Método Executado ao dar dois clicks em cima do DBGrid de produtos           -
//------------------------------------------------------------------------------
procedure TFrmSales.DBGrdProdDblClick(Sender: TObject);
var lvProdCode: String;
begin
  if DtSrcProduct.DataSet.Fields.Fields[0].AsString <> EmptyStr then
    begin
      DBGrdProd.Enabled := False;
      BtnSearchProd.Enabled := False;
      BlockAndClearFields(True);
      lvProdCode := DtSrcProduct.DataSet.Fields.Fields[0].AsString;
      NewProduct(lvProdCode);
      AtribDataField(1);
    end;
end;

procedure TFrmSales.DBLkpCmbBxBranchClick(Sender: TObject);
begin
  SalesHeader.IDBranch := VarToStr(DBLkpCmbBxBranch.KeyValue);
end;

procedure TFrmSales.DBLkpCmbBxPayPlanClick(Sender: TObject);
begin
  if DBLkpCmbBxPayPlan.Text <> EmptyStr then
    begin
      SalesHeader.PlanPayment := VarToStr(DBLkpCmbBxPayPlan.KeyValue);
    end;
end;

procedure TFrmSales.DtTmPckDateClick(Sender: TObject);
begin
  SalesHeader.Date := DateToStr(DtTmPckDate.Date);
end;

//------------------------------------------------------------------------------
// Método Executado ao clicar no botão de cancelamento de inclusão de item     -
//------------------------------------------------------------------------------
procedure TFrmSales.BtnRegCancelClick(Sender: TObject);
begin
  DBGrdProd.Enabled := True;
  BtnSearchProd.Enabled := True;
  BlockAndClearFields(False);
end;

//------------------------------------------------------------------------------
// Método Executado ao tentar incluir um caracter não alfanumérico no campo    -
// de desconto                                                                 -
//------------------------------------------------------------------------------
procedure TFrmSales.EdtRegDiscountKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in['0'..'9',#8,',']) then
    begin
      key := #0;
      MessageDlg('Por favor digite apenas caracteres alfanúmericos',mtError,[mbOk],0);
    end;
end;

//------------------------------------------------------------------------------
// Método Executado ao tentar incluir um caracter não alfanumérico no campo    -
// de preço                                                                    -
//------------------------------------------------------------------------------
procedure TFrmSales.EdtRegPriceUnitKeyPress(Sender: TObject; var Key: Char);
var Rec: TRect;
begin
  if not (key in['0'..'9',#8,',']) then
    begin
      key := #0;
      MessageDlg('Por favor digite apenas caracteres alfanúmericos',mtError,[mbOk],0);
     // Rec := TEdit(Sender).BoundsRect;
     // Rec.TopLeft := ClientToParent(Rec.TopLeft);    { TODO 4 -cCorreções -oVinícius Diniz : Corrigir a posição do ballonhint aqui }
     // Rec.BottomRight := ClientToScreen(Rec.BottomRight);
     // TEdit(Sender).CustomHint.Title := 'Caracter não permitido !';
     // TEdit(Sender).CustomHint.Description := 'Por favor digite apenas caracteres alfanúmericos';
     // TEdit(Sender).CustomHint.ShowHint(Rec);
    end;
end;

//------------------------------------------------------------------------------
// Método Executado ao clicar no botão cancelar pedido                         -
//------------------------------------------------------------------------------
procedure TFrmSales.BtnCancelClick(Sender: TObject);
begin
  if MessageDlg('Deseja cancelar o pedido de venda ?',mtWarning, mbYesNo,0) = mrYes then
    begin
      PgCtrlMain.ActivePageIndex := 0;
    end;
end;

//------------------------------------------------------------------------------
// Método Executado ao clicar no botão salvar pedido                           -
//------------------------------------------------------------------------------
procedure TFrmSales.BtnSaveClick(Sender: TObject);
begin
  if MessageDlg('Deseja salvar o pedido de venda ?',mtConfirmation, mbYesNo,0) = mrYes then
    begin
      if DBLkpCmbBxBranch.Text <> EmptyStr then
        begin
          if SalesHeader.SubmitAll then
            begin
              MessageDlg('Pedido salvo com sucesso!'+#13+#13+'Nº Pedido: '+SalesHeader.IDSale,
              mtInformation,[mbOk],0);
              PgCtrlMain.ActivePageIndex := 0;
            end;
        end;
    end;
end;

end.
