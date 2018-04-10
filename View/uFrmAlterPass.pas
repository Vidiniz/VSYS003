unit uFrmAlterPass;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TFrmAlterPass = class(TForm)
    EdtOldPass: TEdit;
    EdtNewPass: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    BtnAlter: TBitBtn;
    BtnCancel: TBitBtn;
    Label3: TLabel;
    EdtRepatPass: TEdit;
    procedure BtnAlterClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
  private
    FUserCode: String;
    function CurrentPassword: String;
    function AlterPassword(ANewPassword: String): Boolean;
  public
    constructor Create(AOwner: TComponent; AUserCode: String);
  end;

var
  FrmAlterPass: TFrmAlterPass;

implementation

uses
  FireDAC.Comp.Client, uConnection;

{$R *.dfm}

{ TFrmAlterPass }

function TFrmAlterPass.CurrentPassword: String;
var lvSQLQuery: TFDQuery;
    lvQuery: String;
begin
  lvQuery := 'SELECT SENHA FROM VUSUARIO WHERE CODUSUARIO = '+FUserCode;
  try
    lvSQLQuery := TFDQuery.Create(nil);
    lvSQLQuery.Connection := TConnection.GetConnection;
    try
      lvSQLQuery.Open(lvQuery);
      if (lvSQLQuery.RowsAffected > 0) then
        Result := lvSQLQuery.Fields[0].AsString;
    except
      raise Exception.Create('Erro ao retornar dados do usario');
    end;
  finally
    FreeAndNil(lvSQLQuery);
    TConnection.ReleaseConnection;
  end;
end;

function TFrmAlterPass.AlterPassword(ANewPassword: String): Boolean;
var lvSQLQuery: TFDQuery;
    lvQuery: String;
begin
   lvQuery := 'UPDATE VUSUARIO SET SENHA = '+QuotedStr(ANewPassword)+' WHERE CODUSUARIO = '+FUserCode;
  try
    lvSQLQuery := TFDQuery.Create(nil);
    lvSQLQuery.Connection := TConnection.GetConnection;
    try
      lvSQLQuery.Connection.StartTransaction;
      lvSQLQuery.SQL.Text := lvQuery;
      lvSQLQuery.ExecSQL;
      lvSQLQuery.Connection.Commit;
      Result:= True;
    except
      lvSQLQuery.Connection.Rollback;
      Result := False;
      raise Exception.Create('Erro ao alterar senha do usuário');
    end;
  finally
     FreeAndNil(lvSQLQuery);
     TConnection.ReleaseConnection;
  end;
end;

procedure TFrmAlterPass.BtnAlterClick(Sender: TObject);
begin
  if (EdtOldPass.Text = EmptyStr) then
    MessageDlg('Preencha o campo Senha Atual corretamente', mtWarning,[mbOk],0)
  else if (EdtNewPass.Text = EmptyStr) then
    MessageDlg('Preencha o campo Nova Senha corretamente', mtWarning,[mbOk],0)
  else if (EdtRepatPass.Text = EmptyStr) then
    MessageDlg('Preencha o campo Confirmar Senha corretamente', mtWarning,[mbOk],0)
  else if (EdtNewPass.Text <> EdtRepatPass.Text) then
    MessageDlg('O campo Nova Senha e Confirmar Senha não são iguais', mtWarning,[mbOk],0)
  else if (EdtOldPass.Text <> CurrentPassword) then
    MessageDlg('A Senha do sistema não confore com a Senha Atual', mtWarning,[mbOk],0)
  else if (EdtOldPass.Text = CurrentPassword) and (EdtNewPass.Text = EdtRepatPass.Text) then
    begin
      if (AlterPassword(EdtRepatPass.Text)) then
        begin
          MessageDlg('Senha alterada com sucesso!', mtInformation,[mbOk],0);
          close;
        end;
    end;
end;

procedure TFrmAlterPass.BtnCancelClick(Sender: TObject);
begin
  Close;
end;

constructor TFrmAlterPass.Create(AOwner: TComponent; AUserCode: String);
begin
  inherited Create(AOwner);
  FUserCode := AUserCode;
end;

end.
