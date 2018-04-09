unit uFrmSelectDepartment;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmSelectModel, Data.DB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls;

type
  TFrmSelectDepartment = class(TFrmSelectModel)
    procedure BtnSelectClick(Sender: TObject);
    procedure DBGrdSelectDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    FCodeDepartment: String;
    FNameDepartment: String;
  end;

var
  FrmSelectDepartment: TFrmSelectDepartment;

implementation

{$R *.dfm}

uses uDMConnection;

procedure TFrmSelectDepartment.BtnSelectClick(Sender: TObject);
begin
  inherited;
  if DtSrcControl.DataSet.RecNo >= 0 then
    begin
      FCodeDepartment := DtSrcControl.DataSet.Fields[0].AsString;
      FNameDepartment := DtSrcControl.DataSet.Fields[1].AsString;
      Close;
    end;
end;

procedure TFrmSelectDepartment.DBGrdSelectDblClick(Sender: TObject);
begin
  inherited;
  if DtSrcControl.DataSet.RecNo >= 0 then
    begin
      FCodeDepartment := DtSrcControl.DataSet.Fields[0].AsString;
      FNameDepartment := DtSrcControl.DataSet.Fields[1].AsString;
      Close;
    end;
end;

end.
