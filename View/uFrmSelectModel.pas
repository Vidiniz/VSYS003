unit uFrmSelectModel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, uValidateNumber;

type
  TFrmSelectModel = class(TForm)
    PnlTitle: TPanel;
    DBGrdSelect: TDBGrid;
    PnlSearch: TPanel;
    PnlBottom: TPanel;
    BtnSelect: TButton;
    EdtSearch: TEdit;
    BtnSearch: TButton;
    DtSrcControl: TDataSource;
    procedure BtnSearchClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
 end;

var
  FrmSelectModel: TFrmSelectModel;

implementation

{$R *.dfm}

procedure TFrmSelectModel.BtnSearchClick(Sender: TObject);
var Value : String;
begin
  Value := EdtSearch.Text;
  if EdtSearch.Text = EmptyStr then
    DtSrcControl.DataSet.Filtered := False

  else if ValidateNumber(Value) then
    begin
      if DtSrcControl.DataSet.Filtered then
        begin
          DtSrcControl.DataSet.Filtered := False;
          DtSrcControl.DataSet.Filter :=
            DtSrcControl.DataSet.Fields.Fields[0].AsString + ' = ' + EdtSearch.Text;
          DtSrcControl.DataSet.Filtered := True;
        end
      else
        begin
          DtSrcControl.DataSet.Filter :=
            DtSrcControl.DataSet.Fields.Fields[0].AsString + ' = ' + EdtSearch.Text;
          DtSrcControl.DataSet.Filtered := True;
        end;
    end

  else
    begin
      if DtSrcControl.DataSet.Filtered then
        begin
          DtSrcControl.DataSet.Filtered := False;
          DtSrcControl.DataSet.Filter :=
            DtSrcControl.DataSet.Fields.Fields[1].AsString + ' like ' + QuotedStr('%'+EdtSearch.Text+'%');
          DtSrcControl.DataSet.Filtered := True;
        end
      else
        begin
          DtSrcControl.DataSet.Filter :=
            DtSrcControl.DataSet.Fields.Fields[1].AsString + ' like ' + QuotedStr('%'+EdtSearch.Text+'%');
          DtSrcControl.DataSet.Filtered := True;
        end;
    end;
end;

procedure TFrmSelectModel.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  DtSrcControl.DataSet.Active := False;
end;

procedure TFrmSelectModel.FormCreate(Sender: TObject);
begin
//  FOwner := Owner.GetNamePath;
end;

end.
