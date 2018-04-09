(*******************************************************************************
 * Form : uFrmMainLogin                                                        *
 * Autor : Vin�cius Diniz da Costa                                             *
 * Data : 30/01/2018                                                           *
 * Fun��o : Formul�rio de login  do sistema                                    *
 *******************************************************************************)
unit uFrmMainLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  uModel.User, uMessageUtils;

type
  TFrmMainLogin = class(TForm)
    LblEdtLogin: TLabeledEdit;
    LblEdtPassword: TLabeledEdit;
    BtBtnClose: TBitBtn;
    BtBtnEnter: TBitBtn;
    procedure BtBtnEnterClick(Sender: TObject);
  private
    FUser : TUser;
  public
    constructor Create(AOwner: TComponent; AUser: TUser);
  end;

var
  FrmMainLogin: TFrmMainLogin;

implementation

{$R *.dfm}

(*******************************************************************************
 * M�todos de formul�rio                                                       *
 *******************************************************************************)

// M�todo executado ao clicar no bot�o Entrar
procedure TFrmMainLogin.BtBtnEnterClick(Sender: TObject);
begin
  if FUser.ValidateLogin(LblEdtLogin.Text,LblEdtPassword.Text) then
    begin
      MessageDlg(MsgLoginSucceful,mtInformation,[mbOk],0);
      ModalResult := mrOk;
    end
  else
    MessageDlg(MsgLoginDenied,mtWarning,[mbOk],0);
end;

// M�todo executado ao Criar o form
constructor TFrmMainLogin.Create(AOwner: TComponent; AUser: TUser);
begin
  inherited Create(AOwner);
  FUser := AUser;
end;

end.
