unit uFrmPrice;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  Data.DB, uDMConnection;

type
  TFrmPrice = class(TForm)
    EdtCode: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    EdtDescription: TEdit;
    BtnSearch: TButton;
    DBGrdControl: TDBGrid;
    DtSrcControl: TDataSource;
    procedure BtnSearchClick(Sender: TObject);
    procedure DBGrdControlDblClick(Sender: TObject);
  private
    procedure SearchQuery;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrice: TFrmPrice;

implementation

uses
  FireDAC.Comp.Client, uFrmAlterPrice;

{$R *.dfm}

procedure TFrmPrice.BtnSearchClick(Sender: TObject);
begin
  SearchQuery;
end;

procedure TFrmPrice.DBGrdControlDblClick(Sender: TObject);
var lvCode, lvName, lvPrice: String;
begin
  if DtSrcControl.DataSet.RecNo > -1 then
    begin
      lvCode  := DtSrcControl.DataSet.FieldByName('CODPRODUTO').AsString;
      lvName  := DtSrcControl.DataSet.FieldByName('DESCRICAO').AsString;
      lvPrice := DtSrcControl.DataSet.FieldByName('PVENDA').AsString;
      FrmAlterPrice := TFrmAlterPrice.Create(Self, lvCode, lvName, lvPrice);
      FrmAlterPrice.ShowModal;
      SearchQuery;
      FreeAndNil(FrmAlterPrice);
    end;
end;

procedure TFrmPrice.SearchQuery;
var
  lvQuery: TStringList;
begin
  try
    lvQuery := TStringList.Create;
    lvQuery.Add('SELECT VPRODUTO.CODPRODUTO, VPRODUTO.DESCRICAO, VPRODUTO.CODFABRICA,');
    lvQuery.Add('VPRODUTO.CODBARRAS, VESTOQUE.CUSTO, VPRECO.PVENDA');
    lvQuery.Add('FROM VPRODUTO, VESTOQUE, VPRECO');
    lvQuery.Add('WHERE VPRODUTO.CODPRODUTO = VESTOQUE.CODPRODUTO');
    lvQuery.Add('AND VPRODUTO.CODPRODUTO = VPRECO.CODPRODUTO');
    if EdtCode.Text <> EmptyStr then
      lvQuery.Add('AND VPRODUTO.CODPRODUTO = ' + EdtCode.Text);
    if EdtDescription.Text <> EmptyStr then
      lvQuery.Add('AND VPRODUTO.DESCRICAO LIKE ' + QuotedStr('%' + EdtDescription.Text + '%'));
    TFDQuery(DtSrcControl.DataSet).SQL.Clear;
    TFDQuery(DtSrcControl.DataSet).SQL.AddStrings(lvQuery);
    try
      DtSrcControl.DataSet.Close;
      DtSrcControl.DataSet.Open;
    except
      raise Exception.Create('Erro ao executar consulta no banco de dados!');
    end;
  finally
    FreeAndNil(lvQuery);
  end;
end;

end.
