unit uFrmSelectActiv;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uDMConnection, uFrmSelectModel, Data.DB,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls;

type
  TFrmSelectActiv = class(TFrmSelectModel)
    procedure BtnSelectClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSelectActiv: TFrmSelectActiv;

implementation

{$R *.dfm}

uses uFrmRegisterClient;

procedure TFrmSelectActiv.BtnSelectClick(Sender: TObject);
begin
  if DtSrcControl.DataSet.RecNo >= 0 then
  begin
    FrmRegisterClient.DBEdtActivyCode.Text := DtSrcControl.DataSet.Fields.Fields[0].AsString;
    FrmRegisterClient.EdtActivyName.Text := DtSrcControl.DataSet.Fields.Fields[1].AsString;
    Close;
  end;
end;

end.


