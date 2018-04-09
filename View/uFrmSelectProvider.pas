unit uFrmSelectProvider;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmSelectModel, Data.DB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls;

type
  TFrmSelectProvider = class(TFrmSelectModel)
    procedure BtnSelectClick(Sender: TObject);
    procedure DBGrdSelectDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    FCodeProvider: String;
    FNameProvider: String;
  end;

var
  FrmSelectProvider: TFrmSelectProvider;

implementation

{$R *.dfm}

uses uDMConnection;

procedure TFrmSelectProvider.BtnSelectClick(Sender: TObject);
begin
  inherited;
  if DtSrcControl.DataSet.RecNo >= 0 then
    begin
      FCodeProvider := DtSrcControl.DataSet.Fields[0].AsString;
      FNameProvider := DtSrcControl.DataSet.Fields[1].AsString;
      Close;
    end;
end;

procedure TFrmSelectProvider.DBGrdSelectDblClick(Sender: TObject);
begin
  inherited;
  if DtSrcControl.DataSet.RecNo >= 0 then
  begin
    FCodeProvider := DtSrcControl.DataSet.Fields[0].AsString;
    FNameProvider := DtSrcControl.DataSet.Fields[1].AsString;
    Close;
  end;
end;

end.
