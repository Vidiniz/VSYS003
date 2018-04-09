(*******************************************************************************
 * Form : uFrmRegisterProfile                                                  *
 * Autor : Vin�cius Diniz da Costa                                             *
 * Data : 30/01/2018                                                           *
 * Fun��o : Formul�rio de registro de perfis                                   *
 *******************************************************************************)
unit uFrmRegisterProfile;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uDMConnection, uFrmRegisterModel,
  Data.DB, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.ActnMan, uMessageUtils, Vcl.Menus;

type
  TFrmRegisterProfile = class(TFrmModelRegister)
    Label1: TLabel;
    DEdtCode: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    DBGrid1: TDBGrid;
    Label3: TLabel;
    DtSrcDetailControl: TDataSource;
    BtnPermissionList: TButton;
    PpMnSelectAll: TPopupMenu;
    SelectAll: TMenuItem;
    ClearSelect: TMenuItem;
    procedure BtnPermissionListClick(Sender: TObject);
    procedure BtBtnNewClick(Sender: TObject);
    procedure BtBtnEditClick(Sender: TObject);
    procedure SelectAllClick(Sender: TObject);
    procedure ClearSelectClick(Sender: TObject);
    procedure BtBtnConsultClick(Sender: TObject);
  private
    FActionList : TActionManager;
  public
    constructor Create(AOwner: TComponent; AActionList: TActionManager);
    procedure AtualizePermissionList;
    procedure ValidadetePermissionList;
  end;

var
  FrmRegisterProfile: TFrmRegisterProfile;

implementation

{$R *.dfm}

{ TFrmRegisterProfile }

(*******************************************************************************
 * 1 - AtualizePermissionList                                                  *
 * Data Cria��o : 31/01/2018                                                   *
 * Data da altera��o : 31/01/2018                                              *
 * Autor : Vin�cius Diniz da Costa                                             *
 * Assunto : Atualiza as permiss�es geradas pelo usu�rio logado                *
 *******************************************************************************)
procedure TFrmRegisterProfile.AtualizePermissionList;
var lvCount: Integer;
begin
 if DtSrcDetailControl.DataSet.RecordCount = 0 then
   begin
     for lvCount := 0 to pred(FActionList.ActionCount) do
        begin
          DtSrcDetailControl.DataSet.Append;
          DtSrcDetailControl.DataSet.FieldByName('DESCRICAO').Value :=
            FActionList.Actions[lvCount].Caption;
          DtSrcDetailControl.DataSet.FieldByName('FUNCAO').Value :=
            FActionList.Actions[lvCount].Name;
          DtSrcDetailControl.DataSet.FieldByName('STATUS').Value := 'N';
          DtSrcDetailControl.DataSet.FieldByName('CODPERFIL').Value := DEdtCode.Text;
          DtSrcDetailControl.DataSet.Post;
        end;
   end

 else
   begin
     for lvCount := 0 to pred(DtSrcDetailControl.DataSet.RecordCount) do
       begin
         DtSrcDetailControl.DataSet.Delete;
       end;

     for lvCount := 0 to pred(FActionList.ActionCount) do
      begin
        DtSrcDetailControl.DataSet.Append;
        DtSrcDetailControl.DataSet.FieldByName('DESCRICAO').Value :=
          FActionList.Actions[lvCount].Caption;
        DtSrcDetailControl.DataSet.FieldByName('FUNCAO').Value :=
          FActionList.Actions[lvCount].Name;
        DtSrcDetailControl.DataSet.FieldByName('STATUS').Value := 'N';
        DtSrcDetailControl.DataSet.FieldByName('CODPERFIL').Value := DEdtCode.Text;
        DtSrcDetailControl.DataSet.Post;
      end;
   end;
end;

(*******************************************************************************
 * 2 - ValidadetePermissionList                                                *
 * Data Cria��o : 31/01/2018                                                   *
 * Data da altera��o : 31/01/2018                                              *
 * Autor : Vin�cius Diniz da Costa                                             *
 * Assunto : Verifica se as permiss�es foram geradas para o usu�rio logado     *
 *******************************************************************************)
procedure TFrmRegisterProfile.ValidadetePermissionList;
begin
  if DtSrcDetailControl.DataSet.RecordCount = FActionList.ActionCount then
    BtnPermissionList.Enabled := False
  else
    BtnPermissionList.Enabled := True;
end;

// M�todo executado BtBtnEdit
procedure TFrmRegisterProfile.BtBtnConsultClick(Sender: TObject);
begin
  inherited;
  ValidadetePermissionList;
end;

procedure TFrmRegisterProfile.BtBtnEditClick(Sender: TObject);
begin
  inherited;
  ValidadetePermissionList;
end;

// M�todo executado BtBtnNew
procedure TFrmRegisterProfile.BtBtnNewClick(Sender: TObject);
begin
  inherited;
  ValidadetePermissionList;
end;

// M�todo executado BtnPermissionList
procedure TFrmRegisterProfile.BtnPermissionListClick(Sender: TObject);
begin
  inherited;
  AtualizePermissionList;
  ValidadetePermissionList;
end;

// M�todo executado Create
constructor TFrmRegisterProfile.Create(AOwner: TComponent;
  AActionList: TActionManager);
begin
  inherited Create(AOwner);
  FActionList := AActionList;
end;

// M�todo executado SelectAll
procedure TFrmRegisterProfile.SelectAllClick(Sender: TObject);
var lvCount: Integer;
begin
  DtSrcDetailControl.DataSet.RecNo := 1;
  for lvCount := 0 to pred(DtSrcDetailControl.DataSet.RecordCount) do
    begin
      DtSrcDetailControl.DataSet.Edit;
      DtSrcDetailControl.DataSet.FieldByName('STATUS').Value := 'S';
      DtSrcDetailControl.DataSet.Post;
      DtSrcDetailControl.DataSet.Next;
    end;
end;

// M�todo executado SelectAll ClearSelect
procedure TFrmRegisterProfile.ClearSelectClick(Sender: TObject);
var lvCount: Integer;
begin
  DtSrcDetailControl.DataSet.RecNo := 1;
  for lvCount := 0 to pred(DtSrcDetailControl.DataSet.RecordCount) do
    begin
      DtSrcDetailControl.DataSet.Edit;
      DtSrcDetailControl.DataSet.FieldByName('STATUS').Value := 'N';
      DtSrcDetailControl.DataSet.Post;
      DtSrcDetailControl.DataSet.Next;
    end;
end;

end.
