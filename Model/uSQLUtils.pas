(*******************************************************************************
 * Form : uSQLUtils                                                            *
 * Autor : Vin�cius Diniz da Costa                                             *
 * Data : 30/01/2018                                                           *
 * Fun��o : Diferentes consultas sql                                           *
 *******************************************************************************)

unit uSQLUtils;

interface

uses
  FireDAC.Comp.Client, uConnection, uMessageUtils, System.SysUtils;

type
  TSQLExecute = class
    private
    public
      function SQLReturn(AQuery:String): TFDMemTable;
  end;

implementation
(*******************************************************************************
 * 1 - SQLReturnFieldName                                                      *
 * Data Cria��o : 24/01/2018                                                   *
 * Data da altera��o : 24/01/2018                                              *
 * Autor : Vin�cius Diniz da Costa                                             *
 * Assunto : Retorna o nome do campo alterado                                  *                                                                  *
 *******************************************************************************)
{ TSQLExecute }

function TSQLExecute.SQLReturn(AQuery: String): TFDMemTable;
var lvSQLQuey: TFDQuery;
    lvMemTable: TFDMemTable;
begin
  try
    lvMemTable := TFDMemTable.Create(nil);
    lvSQLQuey := TFDQuery.Create(nil);
    lvSQLQuey.Connection := TConnection.GetConnection;
    try
      lvSQLQuey.Open(AQuery);
    except

    end;

  finally

  end;
end;

end.
