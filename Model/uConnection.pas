  (*******************************************************************************
 * Form : uConnection                                                          *
 * Autor : Vinícius Diniz da Costa                                             *
 * Data : 27/01/2017                                                           *
 * Função : Classe Responsável por retornar um instancia do banco de dados     *
 *******************************************************************************)


unit uConnection;

interface

uses
  FireDAC.Comp.Client, System.SysUtils,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.UI, FireDAC.Phys.IBBase, FireDAC.Phys.FB, uDMConnection;

type
  TConnection = class
    private
      class var _INSTANCE : TFDConnection;
    public
      class function GetConnection : TFDConnection;  // 1 - StateDataSource
      class procedure ReleaseConnection;             // 2- ReleaseConnection
  end;

implementation

{ TConnection }

(*******************************************************************************
 * 1 - GetConnection                                                           *
 * Data Criação : 27/01/2018                                                   *
 * Data da alteração : 27/01/2018                                              *
 * Autor : Vinícius Diniz da Costa                                             *
 * Assunto : Singleton Responsável por retornar um instancia do banco de dados *
 *******************************************************************************)
class function TConnection.GetConnection: TFDConnection;
begin
  if not Assigned(_INSTANCE) then
    begin
      _INSTANCE := TFDConnection.Create(nil);
      _INSTANCE.ConnectionDefName := DMConnection.Connection.ConnectionDefName;
      //_INSTANCE.Params.Add(DMConnection.ConManager.DriverDefFileName);

      {_INSTANCE.DriverName := 'FB';
      _INSTANCE.Params.Add('Database=C:\Projetos\VSYS001\Database\DB\DATABASEPROJECT.FDB');
      _INSTANCE.Params.Add('User_Name=sysdba');
      _INSTANCE.Params.Add('Password=masterkey');
      _INSTANCE.Params.Add('Server=localhost');
      _INSTANCE.Params.Add('CharacterSet=ISO8859_1');
      _INSTANCE.Params.Add('DriverID=FB');
      }
      Result := _INSTANCE;
    end
  else
    Result := _INSTANCE;
end;

(*******************************************************************************
 * 2- ReleaseConnection                                                        *
 * Data Criação : 27/01/2018                                                   *
 * Data da alteração : 27/01/2018                                              *
 * Autor : Vinícius Diniz da Costa                                             *
 * Assunto : Responsável por liberar instancia da memória                      *
 *******************************************************************************)
class procedure TConnection.ReleaseConnection;
begin
  if Assigned(_INSTANCE) then
    FreeAndNil(_INSTANCE);
end;

end.
