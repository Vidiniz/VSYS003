(*******************************************************************************
 * Form : uFrmSelectionClient                                                  *
 * Autor : Vinícius Diniz da Costa                                             *
 * Data : 19/02/2018                                                           *
 * Função : Formulário de seleção de clientes                                  *
 *******************************************************************************)

unit uFrmSelectionClient;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  uDMConnection, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TFrmSelectionClient = class(TForm)
    PnlTitle: TPanel;
    PnlSearch: TPanel;
    EdtSearchValue: TEdit;
    BtnSearch: TButton;
    CmbBxSearchFields: TComboBox;
    DBGrdClients: TDBGrid;
    BtnSelection: TButton;
    DtSrcData: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure BtnSearchClick(Sender: TObject);
    procedure BtnSelectionClick(Sender: TObject);
    procedure DBGrdClientsDblClick(Sender: TObject);
  private
    FCode: Integer;
    FDocument: String;
    FName: String;
    FNickName: String;
    FTypePerson: String;
    function GetCode: String;
    function GetDocument: String;
    function GetName: String;
    function GetNickName: String;
    function GetTypePerson: String;
    function GetNameField (pDisplayName: String): String;
    procedure SearchRegister(pFieldName, pFieldValue: String);
    procedure AttribFieldsNames;
  public
    property Code: String read GetCode;
    property Name: String read GetName;
    property NickName: String read GetNickName;
    property Document: String read GetDocument;
    property TypePerson: String read GetTypePerson;
    function SelectClient: Boolean;
  end;

var
  FrmSelectionClient: TFrmSelectionClient;

implementation

{$R *.dfm}
{ TFrmSelectionClient }

(*******************************************************************************
 * Metodos Acessores                                                           *
 *******************************************************************************)
function TFrmSelectionClient.GetCode: String;
begin
  Result := IntToStr(FCode);
end;

function TFrmSelectionClient.GetDocument: String;
begin
  Result := FDocument;
end;

function TFrmSelectionClient.GetName: String;
begin
  Result := FName;
end;

function TFrmSelectionClient.GetNickName: String;
begin
  Result := FNickName;
end;

function TFrmSelectionClient.GetTypePerson: String;
begin
  Result := FTypePerson;
end;

(*******************************************************************************
 * Metodos Principais                                                          *
 *******************************************************************************)
procedure TFrmSelectionClient.AttribFieldsNames;
var lvCount: Integer;
begin
 // Percorre todos os fields da query pegando o field name de todos
  for lvCount := 0 to pred(DMConnection.QueryClient.FieldCount) do
    begin
      if lvCount < 4 then
        CmbBxSearchFields.Items.Add(DMConnection.QueryClient.Fields[lvCount].DisplayName)
      else
        Break;
    end;
end;

function TFrmSelectionClient.GetNameField(pDisplayName: String): String;
var lvCount: Integer;
begin
  for lvCount := 0 to pred(DMConnection.QueryClient.FieldCount) do
    begin
      if DMConnection.QueryClient.Fields[lvCount].DisplayName = pDisplayName then
        begin
          Result := DMConnection.QueryClient.Fields[lvCount].FieldName;
          Break;
        end;
    end;
end;

procedure TFrmSelectionClient.SearchRegister(pFieldName, pFieldValue: String);
var lvQuery: String;
begin
  DMConnection.QueryOtherConsult.SQL.Clear;
  if EdtSearchValue.Text = EmptyStr then
    begin
      lvQuery := 'SELECT FIRST 50 CODCLIENTE, NOME, NOMEFANTASIA, CGC, TIPO '+
                 'FROM VCLIENTE ORDER BY DTCADASTRO DESC';
      DMConnection.QueryOtherConsult.SQL.Text := lvQuery;
      DMConnection.QueryOtherConsult.Close;
      DMConnection.QueryOtherConsult.Open();
    end

  else if (EdtSearchValue.Text <> EmptyStr) and (CmbBxSearchFields.ItemIndex = 0) then
    begin
      lvQuery := 'SELECT FIRST 50 CODCLIENTE, NOME, NOMEFANTASIA, CGC, TIPO '+
                 'FROM VCLIENTE '+
                 'WHERE '+pFieldName+' = '+ pFieldValue;
      DMConnection.QueryOtherConsult.SQL.Text := lvQuery;
      DMConnection.QueryOtherConsult.Close;
      DMConnection.QueryOtherConsult.Open();
    end

  else if (EdtSearchValue.Text <> EmptyStr) and (CmbBxSearchFields.ItemIndex > 0) then
    begin
      lvQuery := 'SELECT FIRST 50 CODCLIENTE, NOME, NOMEFANTASIA, CGC, TIPO '+
                 'FROM VCLIENTE '+
                 'WHERE '+pFieldName+' LIKE '+ QuotedStr('%'+pFieldValue+'%');
      DMConnection.QueryOtherConsult.SQL.Text := lvQuery;
      DMConnection.QueryOtherConsult.Close;
      DMConnection.QueryOtherConsult.Open();
    end;
end;

function TFrmSelectionClient.SelectClient: Boolean;
begin
  if DtSrcData.DataSet.RecNo > -1 then
    begin
      FCode       := DtSrcData.DataSet.Fields[0].AsInteger;
      FName       := DtSrcData.DataSet.Fields[1].AsString;
      FNickName   := DtSrcData.DataSet.Fields[2].AsString;
      FDocument   := DtSrcData.DataSet.Fields[3].AsString;
      FTypePerson := DtSrcData.DataSet.Fields[4].AsString;
      Result := True;
    end
  else
    Result := False;
end;

(*******************************************************************************
 * Métodos de formulário                                                       *
 *******************************************************************************)

procedure TFrmSelectionClient.BtnSearchClick(Sender: TObject);
begin
  SearchRegister(GetNameField(CmbBxSearchFields.Text),EdtSearchValue.Text);
end;

procedure TFrmSelectionClient.BtnSelectionClick(Sender: TObject);
begin
  if SelectClient then
    Close;
end;

procedure TFrmSelectionClient.DBGrdClientsDblClick(Sender: TObject);
begin
  if SelectClient then
    Close;
end;

procedure TFrmSelectionClient.FormCreate(Sender: TObject);
begin
  AttribFieldsNames;
end;

end.
