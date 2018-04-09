unit uFrmSelectCity;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmSelectModel, Data.DB,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, uFrmRegisterClient,
  uDMConnection;

type
  TFrmCitySelect = class(TFrmSelectModel)
    procedure BtnSelectClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCitySelect: TFrmCitySelect;

implementation

{$R *.dfm}

procedure TFrmCitySelect.BtnSelectClick(Sender: TObject);
begin
  inherited;
  if DtSrcControl.DataSet.RecNo >= 0 then
  begin
    FrmRegisterClient.DBEdtCodeCity.Text := DtSrcControl.DataSet.Fields.Fields[0].AsString;
    FrmRegisterClient.EdtCityCodeName.Text := DtSrcControl.DataSet.Fields.Fields[1].AsString;
    Close;
  end;
end;

end.
