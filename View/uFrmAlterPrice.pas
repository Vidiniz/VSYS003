unit uFrmAlterPrice;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TFrmAlterPrice = class(TForm)
    EdtOldPrice: TEdit;
    EdtNewPrice: TEdit;
    EdtCodeProduct: TEdit;
    EdtNameProduct: TEdit;
    BtnAlter: TBitBtn;
    BtnCancel: TBitBtn;
    procedure BtnAlterClick(Sender: TObject);
    procedure EdtNewPriceKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    FCode: String;
    FName: String;
    FOldPrice: String;
    FNewPrice: String;
  public
    constructor Create(AOwner: TComponent; ACode, AName, APrice: String);
    function UpdateData(ANewPrice: String): Boolean;
  end;

var
  FrmAlterPrice: TFrmAlterPrice;

implementation

uses
  FireDAC.Comp.Client, uConnection, Data.DB;

{$R *.dfm}

procedure TFrmAlterPrice.BtnAlterClick(Sender: TObject);
begin
  if (EdtNewPrice.Text <> FOldPrice) and (EdtNewPrice.Text <> EmptyStr) then
    begin
      if MessageDlg('Deseja confirmar a alteração do preço de venda do produto?',mtConfirmation,mbYesNo,0) = mrYes then
        begin
          if UpdateData(EdtNewPrice.Text) then
            begin
              MessageDlg('Preço alterado com sucesso!',mtConfirmation,[mbOk],0);
              Close;
            end
          else
            MessageDlg('Não foi possivel alterar o preço do produto!',mtError,[mbOk],0);
        end;
    end
  else
    MessageDlg('O preço informado está igual ao preço original!', mtInformation,[mbOk],0);
end;

constructor TFrmAlterPrice.Create(AOwner: TComponent; ACode, AName,
  APrice: String);
begin
  inherited Create(AOwner);
   FCode := ACode;
   FName := AName;
   FOldPrice := APrice;
   FNewPrice := APrice;
end;

procedure TFrmAlterPrice.EdtNewPriceKeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in['0'..'9',#8,',']) then
    begin
      key := #0;
      MessageDlg('Por favor digite apenas caracteres alfanúmericos',mtError,[mbOk],0);
    end;
end;

procedure TFrmAlterPrice.FormShow(Sender: TObject);
begin
  EdtCodeProduct.Text := FName;
  EdtNameProduct.Text := FName;
  EdtOldPrice.Text := FOldPrice;
  EdtNewPrice.Text := FNewPrice;
end;

function TFrmAlterPrice.UpdateData(ANewPrice: String): Boolean;
var lvQuery: String;
    lvSQLQuery: TFDQuery;
begin
  lvQuery:= 'UPDATE VPRECO SET PVENDA = :PVENDA WHERE CODPRODUTO = :CODPROD AND CODFILIAL = 1';

  try
    lvSQLQuery := TFDQuery.Create(nil);
    lvSQLQuery.Connection := TConnection.GetConnection;
    lvSQLQuery.SQL.Text := lvQuery;

    // Criando Parametros
    lvSQLQuery.Params.CreateParam(ftFloat,'PVENDA',ptInput);
    lvSQLQuery.Params.CreateParam(ftInteger,'CODPROD',ptInput);
    lvSQLQuery.Params.ParamByName('PVENDA').AsFloat := StrToFloat(ANewPrice);
    lvSQLQuery.Params.ParamByName('CODPROD').AsInteger := StrToInt(FCode);

    // Executando Query
    try
      lvSQLQuery.Connection.StartTransaction;
      lvSQLQuery.ExecSQL;
      lvSQLQuery.Connection.Commit;
      Result := True;
    except
      lvSQLQuery.Connection.Rollback;
      Result := False;
      raise Exception.Create('Erro ao alterar preço do produto!');
    end;
  finally
    FreeAndNil(lvSQLQuery);
    TConnection.ReleaseConnection;
  end;
end;

end.
