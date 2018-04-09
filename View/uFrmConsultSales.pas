unit uFrmConsultSales;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TFrmConsultSales = class(TForm)
    DBGrid1: TDBGrid;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Label3: TLabel;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    Label4: TLabel;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    Label5: TLabel;
    DBEdit8: TDBEdit;
    Label6: TLabel;
    DBEdit9: TDBEdit;
    Label7: TLabel;
    DBEdit10: TDBEdit;
    DtSrcHeader: TDataSource;
    DtSrcItems: TDataSource;
  private
    { Private declarations }
  public
    constructor Create(AOwner: TComponent; AValue: String);
  end;

var
  FrmConsultSales: TFrmConsultSales;

implementation

{$R *.dfm}

uses uDMConnection, FireDAC.Comp.Client;

{ TFrmConsultSales }

constructor TFrmConsultSales.Create(AOwner: TComponent; AValue: String);
begin
  inherited Create(AOwner);
  if AValue <> EmptyStr then
    begin
      TFDQuery(DtSrcHeader.DataSet).Params.ParamByName('NUMPEDIDO').AsString := AValue;
      DtSrcHeader.DataSet.Refresh;
    end;
end;

end.
