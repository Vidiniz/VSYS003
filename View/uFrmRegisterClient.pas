(*******************************************************************************
 * Form : uFrmRegisterClient                                                   *
 * Autor : Vinícius Diniz da Costa                                             *
 * Data : 24/01/2017                                                           *
 * Função : Formulário de cadastro de clientes                                 *
 *******************************************************************************)
unit uFrmRegisterClient;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Mask, Vcl.DBCtrls, uFrmRegisterModel, uDMConnection, uMessageUtils,
  uSQLUtils, uFrmSelectActiv;

type
  TFrmRegisterClient = class(TFrmModelRegister)
    Label1: TLabel;
    DBEdtCode: TDBEdit;
    Label2: TLabel;
    DBEdtName: TDBEdit;
    Label3: TLabel;
    DBEdtNickName: TDBEdit;
    Label4: TLabel;
    DBEdtDocument: TDBEdit;
    Label6: TLabel;
    DBEdtCityDoc: TDBEdit;
    Label7: TLabel;
    DBEdtStateDoc: TDBEdit;
    Label8: TLabel;
    DBEdtEmailSec: TDBEdit;
    Label9: TLabel;
    DBEdtEmail: TDBEdit;
    Label10: TLabel;
    DBEdtStreetName: TDBEdit;
    Label11: TLabel;
    DBEdtStreetNumber: TDBEdit;
    Label12: TLabel;
    DBEdtStreetComp: TDBEdit;
    Label13: TLabel;
    DBEdtDistrict: TDBEdit;
    Label14: TLabel;
    DBEdtCity: TDBEdit;
    Label15: TLabel;
    DBEdtState: TDBEdit;
    Label17: TLabel;
    DBEdtDateRegister: TDBEdit;
    Label18: TLabel;
    DBEdtAlterDate: TDBEdit;
    Label20: TLabel;
    DBEdtPhoneOne: TDBEdit;
    Label21: TLabel;
    DBEdtPhoneTwo: TDBEdit;
    Label22: TLabel;
    DBEdtPhoneTree: TDBEdit;
    DBRdBxTypePerson: TDBRadioGroup;
    Label5: TLabel;
    DBEdtZipCode: TDBEdit;
    PnlActivy: TPanel;
    DBEdtActivyCode: TDBEdit;
    Label16: TLabel;
    SpdBtnActivy: TSpeedButton;
    EdtActivyName: TEdit;
    PnlCityCode: TPanel;
    Label19: TLabel;
    DBEdtCodeCity: TDBEdit;
    SpdBtnCodeCity: TSpeedButton;
    EdtCityCodeName: TEdit;
    DBMmObservation: TDBMemo;
    Label23: TLabel;
    procedure DBRdBxTypePersonClick(Sender: TObject);
    procedure DBEdtCodeCityChange(Sender: TObject);
    procedure DBEdtActivyCodeChange(Sender: TObject);
    procedure SpdBtnActivyClick(Sender: TObject);
    procedure SpdBtnCodeCityClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure AlterTypePerson;
    procedure NewRegister; override;
  end;

var
  FrmRegisterClient: TFrmRegisterClient;

implementation

{$R *.dfm}

uses uFrmSelectCity;

(*******************************************************************************
 * 1 - AlterTypePerson                                                         *
 * Data Criação : 24/01/2018                                                   *
 * Data da alteração : 24/01/2018                                              *
 * Autor : Vinícius Diniz da Costa                                             *
 * Assunto : Altera o comportamentos dos campos de acordo com o tipo de pessoa *
 * selecionado.                                                                *                                                                  *
 *******************************************************************************)
procedure TFrmRegisterClient.AlterTypePerson;
begin
  if DBRdBxTypePerson.ItemIndex = 0 then
    begin
      DBEdtName.Enabled := False;
      DtSrcControl.DataSet.Fields.FieldByName('CGC').EditMask := '###.###.###-##;1;_';
    end
  else
    begin
      DBEdtName.Enabled := True;
      DtSrcControl.DataSet.Fields.FieldByName('CGC').EditMask := '##.###.###/####-##;1;_';
    end
end;

(*******************************************************************************
 * 2 - NewRegister (Override)                                                  *
 * Data Criação : 24/01/2018                                                   *
 * Data da alteração : 24/01/2018                                              *
 * Autor : Vinícius Diniz da Costa                                             *
 * Assunto : Altera o comportamento do novo registro                           *                                                                  *
 *******************************************************************************)
procedure TFrmRegisterClient.NewRegister;
begin
  inherited;
  DBRdBxTypePerson.ItemIndex := 0;
end;

(*******************************************************************************
 * Métodos de formulário                                                       *
 *******************************************************************************)

// Método é executado ao clicar do Radrio Group Box
procedure TFrmRegisterClient.DBRdBxTypePersonClick(Sender: TObject);
begin
  AlterTypePerson;
end;

// Método é executado ao alterar campo Código de Cidade
procedure TFrmRegisterClient.DBEdtCodeCityChange(Sender: TObject);
//var lvSQLReturn : TSQLReturn;
  //  lvReturn: String;
begin
 { lvSQLReturn := TSQLReturn.Create;
  lvReturn := lvSQLReturn.SQLReturnFieldName(DBEdtCodeCity.Text,'CODCIDADE','DESCRICAO','VCIDADE');
  FreeAndNil(lvSQLReturn);
  if lvReturn <> EmptyStr then
    EdtCityCodeName.Text := lvReturn
  else
    begin
      MessageDlg(MsgNoEncounter,mtWarning,[mbOk],0);
      EdtCityCodeName.Text := lvReturn;
    end;}
end;

procedure TFrmRegisterClient.DBEdtActivyCodeChange(Sender: TObject);
//var lvSQLReturn : TSQLReturn;
 //   lvReturn: String;
begin
 // lvSQLReturn := TSQLReturn.Create;
 // lvReturn := lvSQLReturn.SQLReturnFieldName(DBEdtActivyCode.Text,'CODATIVIDAE','ATIVIDADE','VATIVIDADE');
 // FreeAndNil(lvSQLReturn);
 // if lvReturn <> EmptyStr then
 //   EdtActivyName.Text := lvReturn
 // else
 //   begin
 //     MessageDlg(MsgNoEncounter,mtWarning,[mbOk],0);
 //     EdtActivyName.Text := lvReturn;
 //   end;
end;

// Método é executado ao clicar no Speed Buttom de Ramo de ativide
procedure TFrmRegisterClient.SpdBtnActivyClick(Sender: TObject);
begin
  inherited;
  FrmSelectActiv := TFrmSelectActiv.Create(Self);
  FrmSelectActiv.ShowModal;
  FreeAndNil(FrmSelectActiv);
end;

// Método é executado ao clicar no Speed Buttom de Cidades
procedure TFrmRegisterClient.SpdBtnCodeCityClick(Sender: TObject);
begin
  inherited;
  FrmCitySelect := TFrmCitySelect.Create(Self);
  FrmCitySelect.ShowModal;
  FreeAndNil(FrmCitySelect);
end;

end.
