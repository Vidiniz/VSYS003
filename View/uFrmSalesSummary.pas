unit uFrmSalesSummary;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, uDMConnection;

type
  TFrmSalesSummary = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    DtPckInitial: TDateTimePicker;
    DtPckEnd: TDateTimePicker;
    BtnFilter: TButton;
    Panel3: TPanel;
    DBGrid2: TDBGrid;
    DtSrcHeader: TDataSource;
    DtSrcDetail: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    procedure BtnFilterClick(Sender: TObject);
  private
    { Private declarations }
  public
    constructor Create(AOwner: TComponent);
  end;

var
  FrmSalesSummary: TFrmSalesSummary;

implementation

uses
  FireDAC.Comp.Client;

{$R *.dfm}

procedure TFrmSalesSummary.BtnFilterClick(Sender: TObject);
begin
  TFDQuery(DtSrcHeader.DataSet).Params[0].AsDate := DtPckInitial.Date;
  TFDQuery(DtSrcHeader.DataSet).Params[1].AsDate := DtPckEnd.Date;
  DtSrcHeader.DataSet.Close;
  DtSrcHeader.DataSet.Open;
end;

constructor TFrmSalesSummary.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  DtPckInitial.Date := Now;
  DtPckEnd.Date := Now;
end;

end.
