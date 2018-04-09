unit uFrmRegisterUser;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmRegisterModel, Data.DB,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Mask, Vcl.DBCtrls, uDMConnection, uMessageUtils, uFrmAlterPassword;

type
  TFrmRegisterUser = class(TFrmModelRegister)
    Label1: TLabel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    DBEdit1: TDBEdit;
    LblLogin: TLabel;
    DBEdtPassword: TDBEdit;
    Label5: TLabel;
    Button1: TButton;
    DBEdit6: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DtSrcLookupProfile: TDataSource;
    DtSrcLookupBranch: TDataSource;
    DBLookupComboBox2: TDBLookupComboBox;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRegisterUser: TFrmRegisterUser;

implementation

{$R *.dfm}

procedure TFrmRegisterUser.Button1Click(Sender: TObject);
begin
  FrmAlterPassword := TFrmAlterPassword.Create(Self,DBEdtPassword.Text);
  FrmAlterPassword.ShowModal;
  FreeAndNil(FrmAlterPassword);
end;

end.
