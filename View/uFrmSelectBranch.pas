unit uFrmSelectBranch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmSelectModel, Data.DB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls;

type
  TFrmSelectBranch = class(TFrmSelectModel)
    procedure BtnSelectClick(Sender: TObject);
    procedure DBGrdSelectDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    FCodeBranch: String;
    FNameBranch: String;
  end;

var
  FrmSelectBranch: TFrmSelectBranch;

implementation

{$R *.dfm}

uses uDMConnection;

procedure TFrmSelectBranch.BtnSelectClick(Sender: TObject);
begin
  inherited;
  if (DtSrcControl.DataSet.RecNo > 0) then
    begin
      FCodeBranch := DtSrcControl.DataSet.Fields[0].AsString;
      FNameBranch := DtSrcControl.DataSet.Fields[1].AsString;
      Close;
    end;
end;

procedure TFrmSelectBranch.DBGrdSelectDblClick(Sender: TObject);
begin
  inherited;
  if (DtSrcControl.DataSet.RecNo > 0) then
    begin
      FCodeBranch := DtSrcControl.DataSet.Fields[0].AsString;
      FNameBranch := DtSrcControl.DataSet.Fields[1].AsString;
      Close;
    end;
end;

end.
