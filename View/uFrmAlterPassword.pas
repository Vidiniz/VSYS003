unit uFrmAlterPassword;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  uMessageUtils;

type
  TFrmAlterPassword = class(TForm)
    LblEdtNewPassword: TLabeledEdit;
    LblEdtConfirmPassword: TLabeledEdit;
    BtnCofirm: TButton;
    BtnCancel: TButton;
    procedure BtnCofirmClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FCurrentPass : String;
    FNewPass: String;
    constructor Create(AOwner: TComponent; AValue: String);
  end;

var
  FrmAlterPassword: TFrmAlterPassword;

implementation

{$R *.dfm}

uses uFrmRegisterUser;

procedure TFrmAlterPassword.BtnCancelClick(Sender: TObject);
begin
  close;
end;

procedure TFrmAlterPassword.BtnCofirmClick(Sender: TObject);
begin
  if (LblEdtNewPassword.Text = EmptyStr)
    or (LblEdtConfirmPassword.Text = EmptyStr) then
    MessageDlg(MsgAlterPassword,mtWarning,[mbOk],0)

  else if (LblEdtNewPassword.Text <> LblEdtConfirmPassword.Text) then
    MessageDlg(MsgAlterPassword,mtWarning,[mbOk],0)

  else if (Length(LblEdtNewPassword.Text) <= 5)
    and (Length(LblEdtConfirmPassword.Text) <= 5) then
    MessageDlg(MsgMinChar,mtWarning,[mbOk],0)

  else
    begin
      FNewPass := LblEdtConfirmPassword.Text;
      FrmRegisterUser.DBEdtPassword.Text := FNewPass;
      MessageDlg(MsgConfirmPassword,mtInformation,[mbOk],0);
      close;
    end
end;

constructor TFrmAlterPassword.Create(AOwner: TComponent; AValue: String);
begin
  inherited Create(AOwner);
  FCurrentPass := AValue;
end;

end.
