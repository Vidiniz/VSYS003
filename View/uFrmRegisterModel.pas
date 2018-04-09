(*******************************************************************************
 * Form : FrmRegisterModel                                                     *
 * Autor : Vin�cius Diniz da Costa                                             *
 * Data : 19/01/2017                                                           *
 * Fun��o : Cadastro base dos outros forms de cadastro                         *
 *******************************************************************************)

unit uFrmRegisterModel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ComCtrls, Vcl.ExtCtrls, Data.DB, uMessageUtils, uValidateNumber,
  FireDAC.Comp.Client, Vcl.Mask, Vcl.DBCtrls, uDMConnection, Vcl.ImgList;

type
  TFrmModelRegister = class(TForm)
    PnlButtomTop: TPanel;
    PgCtrlMain: TPageControl;
    TbShtSearch: TTabSheet;
    TbShtRegister: TTabSheet;
    PnlRegisterBottom: TPanel;
    DBGrdControl: TDBGrid;
    PnlSearchTop: TPanel;
    EdtSearch: TEdit;
    BtnSearch: TButton;
    BtBtnNew: TBitBtn;
    BtBtnEdit: TBitBtn;
    BtBtnConsult: TBitBtn;
    BtBtnPrint: TBitBtn;
    BtBtnClose: TBitBtn;
    PnlRegisterLeft: TPanel;
    PnlRegisterRight: TPanel;
    PnlRegisterClient: TPanel;
    TrVwTopics: TTreeView;
    SclBxData: TScrollBox;
    LblDescription: TLabel;
    EdtNameField: TEdit;
    LblNameField: TLabel;
    MmDescription: TMemo;
    DtSrcControl: TDataSource;
    BtBtnCancel: TBitBtn;
    BtBtnSave: TBitBtn;
    PnlAdditionalData: TPanel;
    PnlMainData: TPanel;
    PnlOtherData: TPanel;
    PnlOtherInformation: TPanel;
    procedure FormShow(Sender: TObject);
    procedure BtBtnNewClick(Sender: TObject); virtual;
    procedure BtBtnEditClick(Sender: TObject);
    procedure BtBtnConsultClick(Sender: TObject);
    procedure BtBtnPrintClick(Sender: TObject);
    procedure BtBtnCloseClick(Sender: TObject);
    procedure DtSrcControlStateChange(Sender: TObject);
    procedure BtnSearchClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtBtnCancelClick(Sender: TObject);
    procedure BtBtnSaveClick(Sender: TObject); virtual;
    procedure ReciveFocus(Sender: TObject);
  private
    { Private declarations }
  public
    procedure StateDataSource;                   // 1 - StateDataSource
    procedure FilterDataSource(AValue: String);  // 2 - FilterDataSource
    procedure DefaultForm;                       // 3 - DefaultForm
    procedure NewRegister; virtual;              // 4 - NewRegister
    procedure EditRegister;                      // 5 - EditRegister
    procedure ConsultRegister;                   // 6 - ConsultRegister
    procedure BlockFields(AValue: Boolean);      // 7 - BlockFields
    procedure AlterColor;                        // 8 - AlterColor
    procedure SaveRegister;                      // 9 - SaveRegister
  end;

var
  FrmModelRegister: TFrmModelRegister;

implementation

{$R *.dfm}

(*******************************************************************************
 * 1 - StateDataSource                                                         *
 * Data Cria��o : 19/01/2018                                                   *
 * Data da altera��o : 19/01/2018                                              *
 * Autor : Vin�cius Diniz da Costa                                             *
 * Assunto : Altera comportamento da rotina de acordo com o estado do          *
 * datasource                                                                  *
 *******************************************************************************)
procedure TFrmModelRegister.StateDataSource;
begin
  case DtSrcControl.DataSet.State of
    dsInactive:  begin
                   BtBtnNew.Enabled     := True;
                   BtBtnEdit.Enabled    := True;
                   BtBtnConsult.Enabled := True;
                   BtBtnPrint.Enabled   := True;
                   BtBtnSave.Enabled    := False;
                   BtBtnSave.Enabled    := False;
                   SclBxData.VertScrollBar.Position := 0;
                 end;

    dsEdit:      begin
                   BtBtnNew.Enabled     := False;
                   BtBtnEdit.Enabled    := False;
                   BtBtnConsult.Enabled := False;
                   BtBtnPrint.Enabled   := False;
                   BtBtnSave.Enabled    := True;
                   BtBtnSave.Enabled    := True;
                   SclBxData.VertScrollBar.Position := 0;
                  end;

    dsInsert:    begin
                   BtBtnNew.Enabled     := False;
                   BtBtnEdit.Enabled    := False;
                   BtBtnConsult.Enabled := False;
                   BtBtnPrint.Enabled   := False;
                   BtBtnSave.Enabled    := True;
                   BtBtnSave.Enabled    := True;
                   SclBxData.VertScrollBar.Position := 0;
                  end;

    dsBrowse:    begin
                   BtBtnNew.Enabled     := True;
                   BtBtnEdit.Enabled    := True;
                   BtBtnConsult.Enabled := True;
                   BtBtnPrint.Enabled   := True;
                   BtBtnSave.Enabled    := False;
                   BtBtnSave.Enabled    := False;
                   SclBxData.VertScrollBar.Position := 0;
                  end;
  end;
end;

(*******************************************************************************
 * 2 - FilterDataSource                                                        *
 * Data Cria��o : 19/01/2018                                                   *
 * Data da altera��o : 19/01/2018                                              *
 * Autor : Vin�cius Diniz da Costa                                             *
 * Assunto : Filtra as informa��es no DataSource                               *
 *******************************************************************************)
procedure TFrmModelRegister.FilterDataSource(AValue: String);
begin
  if AValue = EmptyStr then
    begin
      DtSrcControl.DataSet.Filtered := False;
    end

  else if ValidateNumber(AValue) then
    begin
      if DtSrcControl.DataSet.Filtered then
        begin
          DtSrcControl.DataSet.Filtered := False;
          DtSrcControl.DataSet.Filter :=
            DtSrcControl.DataSet.Fields.Fields[0].FieldName + ' = ' + AValue;
          DtSrcControl.DataSet.Filtered := True;
        end
      else
        begin
          DtSrcControl.DataSet.Filter :=
            DtSrcControl.DataSet.Fields.Fields[0].FieldName + ' = ' + AValue;
          DtSrcControl.DataSet.Filtered := True;
        end;
    end

  else
    begin
      if DtSrcControl.DataSet.Filtered then
        begin
          DtSrcControl.DataSet.Filtered := False;
          DtSrcControl.DataSet.Filter :=
            DtSrcControl.DataSet.Fields.Fields[1].FieldName + ' like ' + QuotedStr('%'+AValue+'%');
          DtSrcControl.DataSet.Filtered := True;
        end
      else
        begin
          DtSrcControl.DataSet.Filter :=
            DtSrcControl.DataSet.Fields.Fields[1].FieldName + ' like ' + QuotedStr('%'+AValue+'%');
          DtSrcControl.DataSet.Filtered := True;
        end;
    end;
end;

(*******************************************************************************
 * 3 - DefaultForm                                                             *
 * Data Cria��o : 19/01/2018                                                   *
 * Data da altera��o : 19/01/2018                                              *
 * Autor : Vin�cius Diniz da Costa                                             *
 * Assunto : Exibe o form com as fun��es padr�es                               *
 *******************************************************************************)
procedure TFrmModelRegister.DefaultForm;
begin
  PgCtrlMain.ActivePageIndex := 0;
  SclBxData.VertScrollBar.Position := 0;
end;

(*******************************************************************************
 * 4 - NewRegister                                                             *
 * Data Cria��o : 19/01/2018                                                   *
 * Data da altera��o : 19/01/2018                                              *
 * Autor : Vin�cius Diniz da Costa                                             *
 * Assunto : Abre um novo registro no banco de dados                           *
 *******************************************************************************)
procedure TFrmModelRegister.NewRegister;
begin
  DtSrcControl.DataSet.Append;
end;

(*******************************************************************************
 * 5 - EditRegister                                                            *
 * Data Cria��o : 19/01/2018                                                   *
 * Data da altera��o : 19/01/2018                                              *
 * Autor : Vin�cius Diniz da Costa                                             *
 * Assunto : Edita o registro corrente                                         *
 *******************************************************************************)
procedure TFrmModelRegister.EditRegister;
begin
  DtSrcControl.DataSet.Edit;
end;

(*******************************************************************************
 * 6 - EditRegister                                                            *
 * Data Cria��o : 19/01/2018                                                   *
 * Data da altera��o : 19/01/2018                                              *
 * Autor : Vin�cius Diniz da Costa                                             *
 * Assunto : Edita o registro corrente                                         *
 *******************************************************************************)
procedure TFrmModelRegister.ConsultRegister;
begin
  if PgCtrlMain.ActivePageIndex = 0 then
    begin
      PgCtrlMain.ActivePageIndex := 1;
      BlockFields(False);
      DtSrcControl.DataSet.DisableControls;
      BtBtnCancel.Enabled := False;   // At� descobrir o controle que bloqueia
      BtBtnNew.Enabled := False;
      BtBtnEdit.Enabled := False;
      BtBtnPrint.Enabled := False;
    end

  else
    begin
      PgCtrlMain.ActivePageIndex := 0;
      BlockFields(True);
      DtSrcControl.DataSet.EnableControls;
      BtBtnCancel.Enabled:= True;
      BtBtnNew.Enabled := True;
      BtBtnEdit.Enabled := True;
      BtBtnPrint.Enabled := True;
    end;
end;

(*******************************************************************************
 * 7 - BlockFields                                                             *
 * Data Cria��o : 20/01/2018                                                   *
 * Data da altera��o : 20/01/2018                                              *
 * Autor : Vin�cius Diniz da Costa                                             *
 * Assunto : Bloqueia os campos do formul�rio                                  *
 *******************************************************************************)
procedure TFrmModelRegister.BlockFields(AValue: Boolean);
var Count : Integer;
begin
  for Count := 0 to pred(ComponentCount) do
    begin
      if (Components[Count] is TSpeedButton) then
        TSpeedButton(Components[Count]).Enabled := AValue;
      if (Components[Count] is TDBRadioGroup) then
        TDBRadioGroup(Components[Count]).Enabled := AValue;
      if (Components[Count] is TDBLookupComboBox) then
        TDBLookupComboBox(Components[Count]).Enabled := AValue;
    end;
end;

(*******************************************************************************
 * 8 - AlterColor                                                              *
 * Data Cria��o : 20/01/2018                                                   *
 * Data da altera��o : 20/01/2018                                              *
 * Autor : Vin�cius Diniz da Costa                                             *
 * Assunto : Altera a cor do campo enquando ele estiver com foco               *
 *******************************************************************************)
procedure TFrmModelRegister.AlterColor;
var Count : Integer;
begin
  for Count := 0 to pred(ComponentCount) do
    begin
      if (Components[Count] is TDBEdit) and (Components[Count].Tag = 0) then
        begin
          if TDBEdit(Components[Count]).Focused then
            TDBEdit(Components[Count]).Color := clSkyBlue
          else
            TDBEdit(Components[Count]).Color := clWindow;
        end;
    end;
end;

(*******************************************************************************
 * 9 - SaveRegister                                                            *
 * Data Cria��o : 26/01/2018                                                   *
 * Data da altera��o : 26/01/2018                                              *
 * Autor : Vin�cius Diniz da Costa                                             *
 * Assunto : Salva o registro do formul�rio no banco de dados                  *
 *******************************************************************************)
procedure TFrmModelRegister.SaveRegister;
var lvErros: Integer;
begin
  if MessageDlg(MsgSaveRegister, mtConfirmation, mbYesNo, 0)= mrYes then
    begin
      DtSrcControl.DataSet.Post;
      DMConnection.Connection.StartTransaction;
      lvErros := TFDQuery(DtSrcControl.DataSet).ApplyUpdates;
      if lvErros = 0 then
        begin
          TFDQuery(DtSrcControl.DataSet).CommitUpdates;
          DMConnection.Connection.Commit;
          MessageDlg(MsgSaveConfirmation,mtInformation,[mbOk],0);
        end
      else
        DMConnection.Connection.Rollback;
    end;
end;

(*******************************************************************************
 * M�todos de formul�rio                                                       *
 *******************************************************************************)

// M�todo executado ao criar form
procedure TFrmModelRegister.FormCreate(Sender: TObject);
var Count : Integer;
begin
  for Count := 0 to pred(ComponentCount) do
    begin
      if (Components[Count] is TDBEdit) then
        begin
          TDBEdit(Components[Count]).OnEnter := ReciveFocus;
          TDBEdit(Components[Count]).OnExit  := ReciveFocus;
        end;
    end;
end;

// M�todo Exibido ao visualizar o form
procedure TFrmModelRegister.FormShow(Sender: TObject);
begin
  DefaultForm;
end;

// M�todo executado ao clicar no bot�o Novo
procedure TFrmModelRegister.BtBtnNewClick(Sender: TObject);
begin
  if MessageDlg(MsgNewRegister, mtConfirmation, mbYesNo, 0)= mrYes then
    begin
      PgCtrlMain.ActivePageIndex := 1;
      NewRegister;
    end;
end;

// M�todo executado ao clicar no bot�o Editar
procedure TFrmModelRegister.BtBtnEditClick(Sender: TObject);
begin
  if MessageDlg(MsgEditRegister, mtConfirmation, mbYesNo, 0)= mrYes then
    begin
      PgCtrlMain.ActivePageIndex := 1;
      DtSrcControl.DataSet.Edit;
    end;
end;

// M�todo executado ao clicar no bot�o Consultar
procedure TFrmModelRegister.BtBtnConsultClick(Sender: TObject);
begin
  ConsultRegister;
end;

// M�todo executado ao clicar no bot�o Imprimir
procedure TFrmModelRegister.BtBtnPrintClick(Sender: TObject);
begin
  { TODO 2 -oVin�cius Diniz -cImplementa��o : Implementar c�digo para impress�o de relat�rios em cadastros. }
end;

// M�todo executado ao clicar no bot�o Fechar
procedure TFrmModelRegister.BtBtnCloseClick(Sender: TObject);
begin
  if MessageDlg(MsgCloseRegister,mtWarning,mbYesNo,0) = mrYes then
    Close;
end;

// M�todo executado ao clicar no bot�o Pesquisar
procedure TFrmModelRegister.BtnSearchClick(Sender: TObject);
begin
  FilterDataSource(EdtSearch.Text);
end;

// M�todo executado ao clicar no bot�o cancelar
procedure TFrmModelRegister.BtBtnCancelClick(Sender: TObject);
begin
  if MessageDlg(MsgCancelRegister, mtWarning, mbYesNo, 0)= mrYes then
    begin
      DtSrcControl.DataSet.Cancel;
      PgCtrlMain.ActivePageIndex := 0;
    end;
end;

// M�todo executado ao clicar no bot�o salvar
procedure TFrmModelRegister.BtBtnSaveClick(Sender: TObject);
begin
  SaveRegister;
  PgCtrlMain.ActivePageIndex := 0;
end;

// M�todo � executado quando o estado do Dataset � alterado
procedure TFrmModelRegister.DtSrcControlStateChange(Sender: TObject);
begin
  StateDataSource;
end;

// M�todo �xecutado ao entrar ou sair de campo
procedure TFrmModelRegister.ReciveFocus(Sender: TObject);
begin
  AlterColor;
end;

end.
