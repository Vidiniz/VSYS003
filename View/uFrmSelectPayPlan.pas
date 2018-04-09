unit uFrmSelectPayPlan;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uDMConnection, uFrmSelectModel, Data.DB,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls;

type
  TFrmSelectPayPlan = class(TFrmSelectModel)
    procedure BtnSelectClick(Sender: TObject);
    procedure DBGrdSelectDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    FCodePlan: String;
    FNamePlan: String;
  end;

var
  FrmSelectPayPlan: TFrmSelectPayPlan;

implementation

{$R *.dfm}

procedure TFrmSelectPayPlan.BtnSelectClick(Sender: TObject);
begin
  inherited;
  if DtSrcControl.DataSet.RecNo >= 0 then
    begin
      FCodePlan:= DtSrcControl.DataSet.Fields[0].AsString;
      FNamePlan:= DtSrcControl.DataSet.Fields[1].AsString;
      Close;
    end;
end;

procedure TFrmSelectPayPlan.DBGrdSelectDblClick(Sender: TObject);
begin
  inherited;
  if DtSrcControl.DataSet.RecNo >= 0 then
    begin
      FCodePlan:= DtSrcControl.DataSet.Fields[0].AsString;
      FNamePlan:= DtSrcControl.DataSet.Fields[1].AsString;
      Close;
    end;
end;

end.
