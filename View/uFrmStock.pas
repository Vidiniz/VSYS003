unit uFrmStock;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, FireDAC.Comp.Client, uConnection, Vcl.Buttons,
  uDMConnection;

type
  TFrmStock = class(TForm)
    DBGridResult: TDBGrid;
    LblEdtCode: TLabeledEdit;
    LblEdtDescription: TLabeledEdit;
    LblEdtFactoryCode: TLabeledEdit;
    LblEdtBarCode: TLabeledEdit;
    BtnSearch: TButton;
    Panel1: TPanel;
    Label3: TLabel;
    EdtProviderName: TEdit;
    SpdBtnProvider: TSpeedButton;
    EdtProviderCode: TEdit;
    Panel2: TPanel;
    Label1: TLabel;
    SpdBtnDepartment: TSpeedButton;
    EdtDepartmentName: TEdit;
    EdtDepartmentCode: TEdit;
    DtSrcControl: TDataSource;
    procedure BtnSearchClick(Sender: TObject);
    procedure SpdBtnProviderClick(Sender: TObject);
    procedure SpdBtnDepartmentClick(Sender: TObject);
  private
  public
  end;

var
  FrmStock: TFrmStock;

implementation

{$R *.dfm}

uses uFrmSelectDepartment, uFrmSelectProvider;

procedure TFrmStock.BtnSearchClick(Sender: TObject);
var lvQuery: TStringList;
begin
  try
    lvQuery := TStringList.Create;
    lvQuery.Add('SELECT VPRODUTO.CODPRODUTO, VPRODUTO.DESCRICAO, VPRODUTO.CODFABRICA,' );
    lvQuery.Add('       VPRODUTO.CODBARRAS, VESTOQUE.QTDE, VESTOQUE.CUSTO,'            );
    lvQuery.Add('       VFORNECEDOR.CODFORNECEDOR, VFORNECEDOR.NOME,'                  );
    lvQuery.Add('       VDEPARTAMENTO.CODDEPARTAMENTO, VDEPARTAMENTO.DESCRICAO'        );
    lvQuery.Add('  FROM VPRODUTO, VFORNECEDOR, VDEPARTAMENTO, VESTOQUE'                );
    lvQuery.Add(' WHERE VPRODUTO.CODFORNECEDOR = VFORNECEDOR.CODFORNECEDOR'            );
    lvQuery.Add('   AND VPRODUTO.CODDEPARTAMENTO = VDEPARTAMENTO.CODDEPARTAMENTO'      );
    lvQuery.Add('   AND VPRODUTO.CODPRODUTO = VESTOQUE.CODPRODUTO'                     );
    if LblEdtCode.Text <> EmptyStr then
    lvQuery.Add('   AND VPRODUTO.CODPRODUTO = '+LblEdtCode.Text                        );
    if LblEdtDescription.Text <> EmptyStr then
    lvQuery.Add('   AND VPRODUTO.DESCRICAO LIKE '+QuotedStr('%'+LblEdtDescription.Text+'%'));
    if LblEdtFactoryCode.Text <> EmptyStr then
    lvQuery.Add('   AND VPRODUTO.CODFABRICA LIKE '+QuotedStr('%'+LblEdtFactoryCode.Text+'%'));
    if LblEdtBarCode.Text <> EmptyStr then
    lvQuery.Add('   AND VPRODUTO.CODBARRAS = '+LblEdtBarCode.Text                      );
    if EdtProviderCode.Text <> EmptyStr then
    lvQuery.Add('   AND VPRODUTO.CODFORNECEDOR = '+EdtProviderCode.Text                );
    if EdtDepartmentCode.Text <> EmptyStr then
    lvQuery.Add('   AND VPRODUTO.CODDEPARTAMENTO = '+EdtDepartmentCode.Text            );
    TFDQuery(DtSrcControl.DataSet).SQL.Clear;
    TFDQuery(DtSrcControl.DataSet).SQL.AddStrings(lvQuery);
    DtSrcControl.DataSet.Close;
    DtSrcControl.DataSet.Open;
  finally
    FreeAndNil(lvQuery);
  end;
end;

procedure TFrmStock.SpdBtnDepartmentClick(Sender: TObject);
begin
  try
    FrmSelectDepartment := TFrmSelectDepartment.Create(Self);
    FrmSelectDepartment.ShowModal;
    EdtDepartmentCode.Text := FrmSelectDepartment.FCodeDepartment;
    EdtDepartmentName.Text := FrmSelectDepartment.FNameDepartment;
  finally
    FreeAndNil(FrmSelectDepartment);
  end;
end;

procedure TFrmStock.SpdBtnProviderClick(Sender: TObject);
begin
  try
    FrmSelectProvider := TFrmSelectProvider.Create(Self);
    FrmSelectProvider.ShowModal;
    EdtProviderCode.Text := FrmSelectProvider.FCodeProvider;
    EdtProviderName.Text := FrmSelectProvider.FNameProvider;
  finally
    FreeAndNil(FrmSelectProvider);
  end;
end;

end.
