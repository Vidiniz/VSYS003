(*******************************************************************************
 * Form : uModel.User                                                          *
 * Autor : Vin�cius Diniz da Costa                                             *
 * Data : 27/01/2017                                                           *
 * Fun��o : Classe Respons�vel por retornar um instancia do usu�rio conectado  *
 *******************************************************************************)
unit uModel.User;

interface

uses uConnection, FireDAC.Comp.Client, System.SysUtils, uMessageUtils,
  Vcl.ActnMan, Vcl.Dialogs;

type
  TUser = Class
    private
      FLogin : String;
      FPassword : String;
      FUserCode: String;
      FProfileName: String;
      FProfileCode: String;
      FUserName: String;
    protected
      function GetProfileCode: String;
      function GetProfileName: String;
      function GetUserCode: String;
      function GetUserName: String;
    public
      function ValidateLogin(AUserName, AUserPassword: String): Boolean;
      function GetDataUser: Boolean;
      function GetPermission(var AActionManager: TActionManager): TActionManager;
      destructor Destroy;
    published
      property UserCode: String read GetUserCode;
      property UserName: String read GetUserName;
      property ProfileCode: String read GetProfileCode;
      property ProfileName: String read GetProfileName;
  End;

implementation

{ TUser }

(*******************************************************************************
 * 1 - GetDataUser                                                             *
 * Data Cria��o : 27/01/2018                                                   *
 * Data da altera��o : 27/01/2018                                              *
 * Autor : Vin�cius Diniz da Costa                                             *
 * Assunto : Retorna os dados do usu�rio conectado                             *
 *******************************************************************************)
function TUser.GetDataUser: Boolean;
var SQLQuery: TFDQuery;
    Query : String;
begin
  Query := 'SELECT VUSUARIO.CODUSUARIO, VUSUARIO.NOME,          '+
           '       VPERFIL.CODPERFIL, VPERFIL.PERFIL            '+
           '  FROM VUSUARIO, VPERFIL                            '+
           ' WHERE VUSUARIO.CODPERFIL = VPERFIL.CODPERFIL       '+
           '   AND VUSUARIO.CODUSUARIO = '+FUserCode             ;
   try
    SQLQuery := TFDQuery.Create(nil);
    SQLQuery.Connection := TConnection.GetConnection;
    try
      SQLQuery.Open(Query);
      FUserName    := SQLQuery.Fields.Fields[1].AsString;
      FProfileCode := SQLQuery.Fields.Fields[2].AsString;
      FProfileName := SQLQuery.Fields.Fields[3].AsString;
      Result := True;
    except
      Result := False;
    end;
  finally
    FreeAndNil(SQLQuery);
    TConnection.ReleaseConnection;
  end;
end;

(*******************************************************************************
 * 2 - ValidateLogin                                                           *
 * Data Cria��o : 27/01/2018                                                   *
 * Data da altera��o : 27/01/2018                                              *
 * Autor : Vin�cius Diniz da Costa                                             *
 * Assunto : Valida se o login e senha do usu�rio est�o corretos               *
 *******************************************************************************)
function TUser.ValidateLogin(AUserName, AUserPassword: String): Boolean;
var SQLQuery: TFDQuery;
    Query : String;
begin
  Query := 'SELECT CODUSUARIO                               '+
           '  FROM VUSUARIO                                 '+
           ' WHERE LOGIN = '+QuotedStr(AUserName)            +
           '   AND SENHA = '+QuotedStr(AUserPassword)        ;
  if (AUserName <> EmptyStr) or (AUserPassword <> EmptyStr) then
    begin
      try
        SQLQuery := TFDQuery.Create(nil);
        SQLQuery.Connection := TConnection.GetConnection;
        try
          SQLQuery.Open(Query);
          if SQLQuery.RowsAffected = 1 then
            begin
              FLogin    := AUserName;
              FPassword := AUserPassword;
              FUserCode := SQLQuery.Fields.Fields[0].AsString;
              Result    := True;
            end
          else
            Result := False;
        except
          raise Exception.Create(MsgDatabaseError);{ TODO 1 -oVin�cius Diniz -cCorre��es : Melhorar tratamento de exce��o }
        end;
      finally
        FreeAndNil(SQLQuery);
        TConnection.ReleaseConnection;
      end;
    end
  else
    Result := False;
end;

(*******************************************************************************
 * 3 - GetPermission                                                           *
 * Data Cria��o : 27/01/2018                                                   *
 * Data da altera��o : 27/01/2018                                              *
 * Autor : Vin�cius Diniz da Costa                                             *
 * Assunto : Retorna as permiss�es do usu�rio                                  *
 *******************************************************************************)
function TUser.GetPermission(var AActionManager: TActionManager): TActionManager;
var SQLQuery: TFDQuery;
    Query: String;
    CountX, CountY: Integer;
begin
    Query := 'SELECT VPERMISSAO.FUNCAO, VPERMISSAO.STATUS      '+
             '  FROM VPERMISSAO, VUSUARIO                      '+
             ' WHERE VPERMISSAO.CODPERFIL = VUSUARIO.CODPERFIL '+
             '   AND VUSUARIO.CODUSUARIO = '+FUserCode;
    try
      SQLQuery := TFDQuery.Create(nil);
      SQLQuery.Connection := TConnection.GetConnection;
      try
        SQLQuery.Open(Query);

        // Primeiro verificamos se o usu�rio teve suas permiss�es carregadas
        if SQLQuery.RowsAffected > 0 then
          begin

            // Primeior loop verifica action a action
            for CountX := 0 to pred(AActionManager.ActionCount) do
              begin

                // Segundo loop compara a action corrente com record do banco
                // e verifica se esta marcado como permitido ou n�o. Se estiver
                // permitido seta como true caso contrario como false
                for CountY := 0 to pred(SQLQuery.RecordCount) do
                  begin
                    if (AActionManager.Actions[CountX].Name =
                      SQLQuery.Fields.Fields[0].AsString) then
                        begin
                          if SQLQuery.Fields.Fields[1].AsString = 'S' then
                            AActionManager.Actions[CountX].Enabled := True
                          else
                            AActionManager.Actions[CountX].Enabled := False;
                        end

                    // Se o record nao for igual a action passa para o proximo
                    // record
                    else
                      SQLQuery.Next;
                  end;
                  // Retorna a action para o form
                  Result := AActionManager;
              end;
          end

        // Caso n�o seja encontrado nenhuma permiss�o para o perfil do usu�rio
        // retorna uma mensagem para o mesmo.
        else
          MessageDlg(MsgDatabaseError,mtError,[mbOk],0);
      except
        raise Exception.Create(MsgDatabaseError);
      end;
    finally
      FreeAndNil(SQLQuery);
      TConnection.ReleaseConnection;
    end;
end;

destructor TUser.Destroy;
begin
  TConnection.ReleaseConnection;
end;

(*******************************************************************************
 * 4 - GetProfileCode                                                          *
 * Data Cria��o : 27/01/2018                                                   *
 * Data da altera��o : 27/01/2018                                              *
 * Autor : Vin�cius Diniz da Costa                                             *
 * Assunto : Retorna o c�digo de perfil do usu�rio                             *
 *******************************************************************************)
function TUser.GetProfileCode: String;
begin
  Result := FProfileCode;
end;

(*******************************************************************************
 * 5 - GetProfileName                                                          *
 * Data Cria��o : 27/01/2018                                                   *
 * Data da altera��o : 27/01/2018                                              *
 * Autor : Vin�cius Diniz da Costa                                             *
 * Assunto : Retorna o nome de perfil do usu�rio                               *
 *******************************************************************************)
function TUser.GetProfileName: String;
begin
  Result := FProfileName;
end;

(*******************************************************************************
 * 6 - GetUserCode                                                             *
 * Data Cria��o : 27/01/2018                                                   *
 * Data da altera��o : 27/01/2018                                              *
 * Autor : Vin�cius Diniz da Costa                                             *
 * Assunto : Retorna o c�dgio do usu�rio                                       *
 *******************************************************************************)
function TUser.GetUserCode: String;
begin
  Result := FUserCode;
end;

(*******************************************************************************
 * 7 - GetUserName                                                             *
 * Data Cria��o : 27/01/2018                                                   *
 * Data da altera��o : 27/01/2018                                              *
 * Autor : Vin�cius Diniz da Costa                                             *
 * Assunto : Retorna o nome do usu�rio                                         *
 *******************************************************************************)
function TUser.GetUserName: String;
begin
  Result := FUserName;
end;

end.
