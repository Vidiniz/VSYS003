object DMConnection: TDMConnection
  OldCreateOrder = False
  Height = 395
  Width = 784
  object Connection: TFDConnection
    Params.Strings = (
      'ConnectionDef=FBDatabase')
    TxOptions.AutoStop = False
    TxOptions.DisconnectAction = xdRollback
    Connected = True
    LoginPrompt = False
    Transaction = Transacition
    Left = 104
    Top = 16
  end
  object Transacition: TFDTransaction
    Options.DisconnectAction = xdRollback
    Connection = Connection
    Left = 168
    Top = 16
  end
  object ConManager: TFDManager
    ConnectionDefFileName = 'C:\Projetos\VSYS003\BIN\FDConnectionDef.ini'
    FormatOptions.AssignedValues = [fvMapRules]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <>
    Active = True
    Left = 32
    Top = 16
  end
  object LinkDrivre: TFDPhysFBDriverLink
    Left = 304
    Top = 16
  end
  object Cursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 232
    Top = 16
  end
  object QueryClient: TFDQuery
    Active = True
    CachedUpdates = True
    Connection = Connection
    Transaction = Transacition
    UpdateTransaction = Transacition
    UpdateOptions.AssignedValues = [uvEDelete, uvFetchGeneratorsPoint, uvGeneratorName]
    UpdateOptions.EnableDelete = False
    UpdateOptions.FetchGeneratorsPoint = gpImmediate
    UpdateOptions.GeneratorName = 'GEN_VCLIENTE_ID'
    UpdateOptions.AutoIncFields = 'CODCLIENTE'
    UpdateObject = UpdateClient
    SQL.Strings = (
      'SELECT CODCLIENTE, NOME, NOMEFANTASIA, CGC, TIPO,'
      '       INSCMUN, INSCEST, EMAILCOB, EMAILNFE, ENDERECO,'
      '       NUMERO, COMPLEMENTO, BAIRRO, CIDADE, UF, CEP, '
      '       CODATIVIDAE, DTCADASTRO, DTULTALT, CODCIDADE,'
      '       TEL1, TEL2, TEL3 ,OBS, CODUSURCAD, CODUSURALTER,'
      '       DTCANCEL '
      '  FROM VCLIENTE')
    Left = 32
    Top = 80
    object QueryClientCODCLIENTE: TIntegerField
      Alignment = taLeftJustify
      AutoGenerateValue = arAutoInc
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODCLIENTE'
      Origin = 'CODCLIENTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object QueryClientNOME: TStringField
      DisplayLabel = 'Nome / Raz'#227'o Social'
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 40
    end
    object QueryClientNOMEFANTASIA: TStringField
      DisplayLabel = 'Nome Fantasia'
      FieldName = 'NOMEFANTASIA'
      Origin = 'NOMEFANTASIA'
      Size = 40
    end
    object QueryClientCGC: TStringField
      DisplayLabel = 'CPF / CNPJ'
      FieldName = 'CGC'
      Origin = 'CGC'
    end
    object QueryClientINSCMUN: TStringField
      DisplayLabel = 'Inscri'#231#227'o Municipal'
      FieldName = 'INSCMUN'
      Origin = 'INSCMUN'
    end
    object QueryClientINSCEST: TStringField
      DisplayLabel = 'Inscri'#231#227'o Estadual'
      FieldName = 'INSCEST'
      Origin = 'INSCEST'
    end
    object QueryClientEMAILCOB: TStringField
      DisplayLabel = 'Email Cobran'#231'a'
      FieldName = 'EMAILCOB'
      Origin = 'EMAILCOB'
      Size = 80
    end
    object QueryClientEMAILNFE: TStringField
      DisplayLabel = 'Email NFe'
      FieldName = 'EMAILNFE'
      Origin = 'EMAILNFE'
      Size = 80
    end
    object QueryClientENDERECO: TStringField
      DisplayLabel = 'Lagradouro'
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Size = 60
    end
    object QueryClientNUMERO: TStringField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      Size = 10
    end
    object QueryClientCOMPLEMENTO: TStringField
      DisplayLabel = 'Complemento'
      FieldName = 'COMPLEMENTO'
      Origin = 'COMPLEMENTO'
      Size = 10
    end
    object QueryClientBAIRRO: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
    end
    object QueryClientCIDADE: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Size = 40
    end
    object QueryClientUF: TStringField
      FieldName = 'UF'
      Origin = 'UF'
      FixedChar = True
      Size = 2
    end
    object QueryClientCODATIVIDAE: TIntegerField
      DisplayLabel = 'Ramo de Atividade'
      FieldName = 'CODATIVIDAE'
      Origin = 'CODATIVIDAE'
      Required = True
    end
    object QueryClientDTCADASTRO: TDateField
      DisplayLabel = 'Data do Cadastro'
      FieldName = 'DTCADASTRO'
      Origin = 'DTCADASTRO'
    end
    object QueryClientDTULTALT: TDateField
      DisplayLabel = 'Data da '#218'ltima Altera'#231#227'o'
      FieldName = 'DTULTALT'
      Origin = 'DTULTALT'
    end
    object QueryClientCODCIDADE: TIntegerField
      DisplayLabel = 'C'#243'd. Cidade'
      FieldName = 'CODCIDADE'
      Origin = 'CODCIDADE'
      Required = True
    end
    object QueryClientTEL1: TStringField
      DisplayLabel = 'Telefone Celular'
      FieldName = 'TEL1'
      Origin = 'TEL1'
      EditMask = '(##) #####-####;1;_'
    end
    object QueryClientTEL2: TStringField
      DisplayLabel = 'Telefone Comerial'
      FieldName = 'TEL2'
      Origin = 'TEL2'
      EditMask = '(##) ####-####;1;_'
    end
    object QueryClientTEL3: TStringField
      DisplayLabel = 'Telefone Residencial / Fax'
      FieldName = 'TEL3'
      Origin = 'TEL3'
      EditMask = '(##) ####-####;1;_'
    end
    object QueryClientCEP: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      EditMask = '#####-###;1;_'
      FixedChar = True
      Size = 9
    end
    object QueryClientOBS: TStringField
      FieldName = 'OBS'
      Size = 250
    end
    object QueryClientTIPO: TStringField
      DisplayLabel = 'Tipo Pessoa'
      FieldName = 'TIPO'
      Size = 8
    end
    object QueryClientCODUSURCAD: TIntegerField
      FieldName = 'CODUSURCAD'
    end
    object QueryClientCODUSURALTER: TIntegerField
      FieldName = 'CODUSURALTER'
    end
  end
  object QueryCitySelect: TFDQuery
    Active = True
    Connection = Connection
    SQL.Strings = (
      'SELECT VCIDADE.CODCIDADE,'
      '       VCIDADE.DESCRICAO,'
      '       VUF.DESCRICAO AS UF'
      '  FROM VCIDADE, VUF'
      ' WHERE VCIDADE.CODUF = VUF.CODUF')
    Left = 104
    Top = 304
  end
  object QueryOtherConsult: TFDQuery
    Connection = Connection
    Left = 480
    Top = 304
  end
  object QueryActivSelect: TFDQuery
    Active = True
    Connection = Connection
    SQL.Strings = (
      'SELECT CODATIVIDAE,'
      '       ATIVIDADE'
      'FROM VATIVIDADE')
    Left = 33
    Top = 304
    object QueryActivSelectCODATIVIDAE: TIntegerField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 12
      FieldName = 'CODATIVIDAE'
      Required = True
    end
    object QueryActivSelectATIVIDADE: TStringField
      DisplayLabel = 'Ramo de Atividade'
      DisplayWidth = 62
      FieldName = 'ATIVIDADE'
    end
  end
  object UpdateClient: TFDUpdateSQL
    Connection = Connection
    InsertSQL.Strings = (
      'INSERT INTO VCLIENTE'
      '(CODCLIENTE, NOME, NOMEFANTASIA, CGC, TIPO, '
      '  INSCMUN, INSCEST, EMAILCOB, EMAILNFE, '
      '  OBS, ENDERECO, NUMERO, COMPLEMENTO, '
      '  BAIRRO, CIDADE, UF, CEP, CODATIVIDAE, '
      '  DTCADASTRO, DTULTALT, CODCIDADE, TEL1, '
      '  TEL2, TEL3)'
      
        'VALUES (:NEW_CODCLIENTE, :NEW_NOME, :NEW_NOMEFANTASIA, :NEW_CGC,' +
        ' :NEW_TIPO, '
      '  :NEW_INSCMUN, :NEW_INSCEST, :NEW_EMAILCOB, :NEW_EMAILNFE, '
      '  :NEW_OBS, :NEW_ENDERECO, :NEW_NUMERO, :NEW_COMPLEMENTO, '
      
        '  :NEW_BAIRRO, :NEW_CIDADE, :NEW_UF, :NEW_CEP, :NEW_CODATIVIDAE,' +
        ' '
      '  :NEW_DTCADASTRO, :NEW_DTULTALT, :NEW_CODCIDADE, :NEW_TEL1, '
      '  :NEW_TEL2, :NEW_TEL3)'
      
        'RETURNING CODCLIENTE, NOME, NOMEFANTASIA, CGC, TIPO, INSCMUN, IN' +
        'SCEST, EMAILCOB, EMAILNFE, OBS, ENDERECO, NUMERO, COMPLEMENTO, B' +
        'AIRRO, CIDADE, UF, CEP, CODATIVIDAE, DTCADASTRO, DTULTALT, CODCI' +
        'DADE, TEL1, TEL2, TEL3')
    ModifySQL.Strings = (
      'UPDATE VCLIENTE'
      'SET NOME = :NEW_NOME, NOMEFANTASIA = :NEW_NOMEFANTASIA, '
      '  CGC = :NEW_CGC, TIPO = :NEW_TIPO, INSCMUN = :NEW_INSCMUN, '
      
        '  INSCEST = :NEW_INSCEST, EMAILCOB = :NEW_EMAILCOB, EMAILNFE = :' +
        'NEW_EMAILNFE, '
      
        '  OBS = :NEW_OBS, ENDERECO = :NEW_ENDERECO, NUMERO = :NEW_NUMERO' +
        ', '
      
        '  COMPLEMENTO = :NEW_COMPLEMENTO, BAIRRO = :NEW_BAIRRO, CIDADE =' +
        ' :NEW_CIDADE, '
      '  UF = :NEW_UF, CEP = :NEW_CEP, CODATIVIDAE = :NEW_CODATIVIDAE, '
      '  DTCADASTRO = :NEW_DTCADASTRO, DTULTALT = :NEW_DTULTALT, '
      
        '  CODCIDADE = :NEW_CODCIDADE, TEL1 = :NEW_TEL1, TEL2 = :NEW_TEL2' +
        ', '
      '  TEL3 = :NEW_TEL3'
      'WHERE CODCLIENTE = :OLD_CODCLIENTE'
      
        'RETURNING CODCLIENTE, NOME, NOMEFANTASIA, CGC, TIPO, INSCMUN, IN' +
        'SCEST, EMAILCOB, EMAILNFE, OBS, ENDERECO, NUMERO, COMPLEMENTO, B' +
        'AIRRO, CIDADE, UF, CEP, CODATIVIDAE, DTCADASTRO, DTULTALT, CODCI' +
        'DADE, TEL1, TEL2, TEL3')
    FetchRowSQL.Strings = (
      
        'SELECT CODCLIENTE, NOME, NOMEFANTASIA, CGC, TIPO, INSCMUN, INSCE' +
        'ST, '
      '  EMAILCOB, EMAILNFE, OBS, ENDERECO, NUMERO, COMPLEMENTO, '
      '  BAIRRO, CIDADE, UF, CEP, CODATIVIDAE, DTCADASTRO, DTULTALT, '
      '  CODCIDADE, TEL1, TEL2, TEL3'
      'FROM VCLIENTE'
      'WHERE CODCLIENTE = :CODCLIENTE')
    Left = 32
    Top = 136
  end
  object QueryUser: TFDQuery
    Active = True
    CachedUpdates = True
    Connection = Connection
    Transaction = Transacition
    UpdateTransaction = Transacition
    UpdateOptions.AssignedValues = [uvEDelete, uvFetchGeneratorsPoint, uvGeneratorName]
    UpdateOptions.EnableDelete = False
    UpdateOptions.FetchGeneratorsPoint = gpImmediate
    UpdateOptions.GeneratorName = 'GEN_VUSUARIO_ID'
    UpdateOptions.AutoIncFields = 'CODUSUARIO'
    UpdateObject = UpdateUser
    SQL.Strings = (
      'SELECT CODUSUARIO,'
      '       CODPERFIL,'
      '       NOME,'
      '       EMAIL,'
      '       TELEFONE,'
      '       LOGIN,'
      '       SENHA,'
      '       CODFILIAL'
      '  FROM VUSUARIO')
    Left = 104
    Top = 80
    object QueryUserCODFILIAL: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'Filial'
      DisplayWidth = 15
      FieldName = 'CODFILIAL'
      LookupDataSet = QueryBranch
      LookupKeyFields = 'CODFILIAL'
      LookupResultField = 'FILIAL'
      LookupCache = True
      Required = True
    end
    object QueryUserCODUSUARIO: TIntegerField
      Alignment = taLeftJustify
      AutoGenerateValue = arAutoInc
      DisplayLabel = 'C'#243'd. Usu'#225'rio'
      DisplayWidth = 16
      FieldName = 'CODUSUARIO'
    end
    object QueryUserCODPERFIL: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'Perfil'
      FieldName = 'CODPERFIL'
      LookupDataSet = QueryProfile
      LookupKeyFields = 'CODPERFIL'
      LookupResultField = 'PERFIL'
      LookupCache = True
      Required = True
    end
    object QueryUserNOME: TStringField
      DisplayLabel = 'Usu'#225'rio'
      DisplayWidth = 70
      FieldName = 'NOME'
      Size = 40
    end
    object QueryUserEMAIL: TStringField
      DisplayLabel = 'Email'
      FieldName = 'EMAIL'
      Size = 80
    end
    object QueryUserTELEFONE: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'TELEFONE'
      EditMask = '(##) #####-####;1;_'
    end
    object QueryUserLOGIN: TStringField
      DisplayLabel = 'Login'
      DisplayWidth = 39
      FieldName = 'LOGIN'
      Size = 10
    end
    object QueryUserSENHA: TStringField
      DisplayLabel = 'Senha'
      FieldName = 'SENHA'
      Size = 10
    end
  end
  object UpdateUser: TFDUpdateSQL
    Connection = Connection
    InsertSQL.Strings = (
      'INSERT INTO VUSUARIO'
      '(CODPERFIL, NOME, EMAIL, TELEFONE, LOGIN, '
      '  SENHA, CODFILIAL)'
      
        'VALUES (:NEW_CODPERFIL, :NEW_NOME, :NEW_EMAIL, :NEW_TELEFONE, :N' +
        'EW_LOGIN, '
      '  :NEW_SENHA, :NEW_CODFILIAL)')
    ModifySQL.Strings = (
      'UPDATE VUSUARIO'
      
        'SET CODPERFIL = :NEW_CODPERFIL, NOME = :NEW_NOME, EMAIL = :NEW_E' +
        'MAIL, '
      
        '  TELEFONE = :NEW_TELEFONE, LOGIN = :NEW_LOGIN, SENHA = :NEW_SEN' +
        'HA, '
      '  CODFILIAL = :NEW_CODFILIAL'
      
        'WHERE CODPERFIL = :OLD_CODPERFIL AND NOME = :OLD_NOME AND EMAIL ' +
        '= :OLD_EMAIL AND '
      
        '  TELEFONE = :OLD_TELEFONE AND LOGIN = :OLD_LOGIN AND SENHA = :O' +
        'LD_SENHA AND '
      '  CODFILIAL = :OLD_CODFILIAL')
    FetchRowSQL.Strings = (
      
        'SELECT CODUSUARIO, CODPERFIL, NOME, EMAIL, TELEFONE, LOGIN, SENH' +
        'A, '
      '  CODFILIAL'
      'FROM VUSUARIO'
      
        'WHERE CODPERFIL = :CODPERFIL AND NOME = :NOME AND EMAIL = :EMAIL' +
        ' AND '
      
        '  TELEFONE = :TELEFONE AND LOGIN = :LOGIN AND SENHA = :SENHA AND' +
        ' '
      '  CODFILIAL = :CODFILIAL')
    Left = 104
    Top = 136
  end
  object QueryProfile: TFDQuery
    Active = True
    CachedUpdates = True
    Connection = Connection
    Transaction = Transacition
    UpdateTransaction = Transacition
    UpdateOptions.AssignedValues = [uvFetchGeneratorsPoint, uvGeneratorName]
    UpdateOptions.FetchGeneratorsPoint = gpImmediate
    UpdateOptions.GeneratorName = 'GEN_VPERFIL_ID'
    UpdateOptions.AutoIncFields = 'CODPERFIL'
    UpdateObject = UpdateProfile
    SQL.Strings = (
      'SELECT CODPERFIL,'
      '       PERFIL'
      '  FROM VPERFIL')
    Left = 360
    Top = 192
    object QueryProfileCODPERFIL: TIntegerField
      Alignment = taLeftJustify
      AutoGenerateValue = arAutoInc
      DisplayLabel = 'C'#243'd. Perfil'
      DisplayWidth = 12
      FieldName = 'CODPERFIL'
    end
    object QueryProfilePERFIL: TStringField
      DisplayLabel = 'Perfil'
      DisplayWidth = 129
      FieldName = 'PERFIL'
    end
  end
  object QueryBranch: TFDQuery
    Active = True
    CachedUpdates = True
    Connection = Connection
    Transaction = Transacition
    UpdateTransaction = Transacition
    UpdateObject = UpdateBranch
    SQL.Strings = (
      'SELECT CODFILIAL,'
      '       FILIAL,'
      '       CGC'
      '  FROM VFILIAL')
    Left = 176
    Top = 192
    object QueryBranchCODFILIAL: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 12
      FieldName = 'CODFILIAL'
      Origin = 'CODFILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QueryBranchFILIAL: TStringField
      DisplayLabel = 'Filial'
      DisplayWidth = 104
      FieldName = 'FILIAL'
      Origin = 'FILIAL'
      Size = 40
    end
    object QueryBranchCGC: TStringField
      DisplayLabel = 'CNPJ'
      DisplayWidth = 24
      FieldName = 'CGC'
      Origin = 'CGC'
      EditMask = '##.###.###/####-##;1;_'
    end
  end
  object UpdateProfile: TFDUpdateSQL
    Connection = Connection
    InsertSQL.Strings = (
      'INSERT INTO VPERFIL'
      '(PERFIL)'
      'VALUES (:NEW_PERFIL)')
    ModifySQL.Strings = (
      'UPDATE VPERFIL'
      'SET PERFIL = :NEW_PERFIL'
      'WHERE PERFIL = :OLD_PERFIL')
    DeleteSQL.Strings = (
      'DELETE FROM VPERFIL'
      'WHERE PERFIL = :OLD_PERFIL')
    FetchRowSQL.Strings = (
      'SELECT CODPERFIL, PERFIL'
      'FROM VPERFIL'
      'WHERE PERFIL = :PERFIL')
    Left = 360
    Top = 248
  end
  object QueryActiv: TFDQuery
    Active = True
    CachedUpdates = True
    Connection = Connection
    Transaction = Transacition
    UpdateTransaction = Transacition
    UpdateOptions.AssignedValues = [uvFetchGeneratorsPoint, uvGeneratorName]
    UpdateOptions.FetchGeneratorsPoint = gpImmediate
    UpdateOptions.GeneratorName = 'GEN_VATIVIDADE_ID'
    UpdateOptions.AutoIncFields = 'CODATIVIDAE'
    UpdateObject = UpdateActiv
    SQL.Strings = (
      'SELECT CODATIVIDAE,'
      '       ATIVIDADE'
      '  FROM VATIVIDADE')
    Left = 175
    Top = 80
    object QueryActivCODATIVIDAE: TIntegerField
      Alignment = taLeftJustify
      AutoGenerateValue = arAutoInc
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 12
      FieldName = 'CODATIVIDAE'
    end
    object QueryActivATIVIDADE: TStringField
      DisplayLabel = 'Atividade'
      DisplayWidth = 129
      FieldName = 'ATIVIDADE'
    end
  end
  object UpdateActiv: TFDUpdateSQL
    Connection = Connection
    Left = 175
    Top = 136
  end
  object QueryPlan: TFDQuery
    Active = True
    CachedUpdates = True
    Connection = Connection
    Transaction = Transacition
    UpdateOptions.AssignedValues = [uvFetchGeneratorsPoint, uvGeneratorName]
    UpdateOptions.FetchGeneratorsPoint = gpImmediate
    UpdateOptions.GeneratorName = 'GEN_VPLPAGAMENTO_ID'
    UpdateOptions.AutoIncFields = 'CODPLANO'
    UpdateObject = UpdatePlan
    SQL.Strings = (
      'SELECT CODPLANO,'
      '       DESCRICAO,'
      '       NUMPARC'
      '  FROM VPLPAGAMENTO')
    Left = 236
    Top = 80
    object QueryPlanCODPLANO: TFDAutoIncField
      Alignment = taLeftJustify
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 15
      FieldName = 'CODPLANO'
      ReadOnly = True
      ClientAutoIncrement = False
    end
    object QueryPlanDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 88
      FieldName = 'DESCRICAO'
    end
    object QueryPlanNUMPARC: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'N'#250'm. Parcelas'
      DisplayWidth = 38
      FieldName = 'NUMPARC'
    end
  end
  object UpdatePlan: TFDUpdateSQL
    Connection = Connection
    InsertSQL.Strings = (
      'INSERT INTO VPLPAGAMENTO'
      '(DESCRICAO, NUMPARC)'
      'VALUES (:NEW_DESCRICAO, :NEW_NUMPARC)'
      'RETURNING CODPLANO')
    ModifySQL.Strings = (
      'UPDATE VPLPAGAMENTO'
      'SET DESCRICAO = :NEW_DESCRICAO, NUMPARC = :NEW_NUMPARC'
      'WHERE CODPLANO = :OLD_CODPLANO'
      'RETURNING CODPLANO')
    DeleteSQL.Strings = (
      'DELETE FROM VPLPAGAMENTO'
      'WHERE CODPLANO = :OLD_CODPLANO')
    FetchRowSQL.Strings = (
      'SELECT CODPLANO, DESCRICAO, NUMPARC'
      'FROM VPLPAGAMENTO'
      'WHERE CODPLANO = :CODPLANO')
    Left = 236
    Top = 136
  end
  object QueryProduct: TFDQuery
    Active = True
    CachedUpdates = True
    Connection = Connection
    Transaction = Transacition
    UpdateTransaction = Transacition
    UpdateOptions.AssignedValues = [uvEDelete, uvFetchGeneratorsPoint, uvGeneratorName]
    UpdateOptions.EnableDelete = False
    UpdateOptions.FetchGeneratorsPoint = gpImmediate
    UpdateOptions.GeneratorName = 'GEN_VPRODUTO_ID'
    UpdateOptions.AutoIncFields = 'CODPRODUTO'
    UpdateObject = UpdateProduct
    SQL.Strings = (
      'SELECT CODPRODUTO, CODFORNECEDOR, CODDEPARTAMENTO,'
      '       DESCRICAO, CODFABRICA, QTUNITCX, CODBARRAS,'
      '       CODBARRASCX, ALTURA, LARGURA, COMPRIMENTO,'
      '       REGDATA, ALTDATA, PESOLIQ, PESOBRUTO'
      '  FROM VPRODUTO')
    Left = 300
    Top = 80
    object QueryProductCODPRODUTO: TIntegerField
      Alignment = taLeftJustify
      AutoGenerateValue = arAutoInc
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 12
      FieldName = 'CODPRODUTO'
    end
    object QueryProductCODFORNECEDOR: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'Fornecedor'
      DisplayWidth = 12
      FieldName = 'CODFORNECEDOR'
      Required = True
    end
    object QueryProductCODDEPARTAMENTO: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'Departamento'
      DisplayWidth = 14
      FieldName = 'CODDEPARTAMENTO'
      Required = True
    end
    object QueryProductDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 48
      FieldName = 'DESCRICAO'
      Size = 40
    end
    object QueryProductCODFABRICA: TStringField
      DisplayLabel = 'C'#243'd. F'#225'brica'
      DisplayWidth = 12
      FieldName = 'CODFABRICA'
      Size = 10
    end
    object QueryProductQTUNITCX: TBCDField
      Alignment = taLeftJustify
      DisplayLabel = 'Qtde. por Caixa'
      DisplayWidth = 18
      FieldName = 'QTUNITCX'
      Precision = 18
      Size = 2
    end
    object QueryProductCODBARRAS: TStringField
      DisplayLabel = 'C'#243'd. Barras'
      DisplayWidth = 16
      FieldName = 'CODBARRAS'
      Size = 13
    end
    object QueryProductCODBARRASCX: TStringField
      DisplayLabel = 'C'#243'd. Barras Caixa'
      DisplayWidth = 18
      FieldName = 'CODBARRASCX'
      Size = 14
    end
    object QueryProductALTURA: TBCDField
      Alignment = taLeftJustify
      DisplayLabel = 'Altura (cm)'
      DisplayWidth = 23
      FieldName = 'ALTURA'
      Precision = 18
      Size = 2
    end
    object QueryProductLARGURA: TBCDField
      Alignment = taLeftJustify
      DisplayLabel = 'Largura (cm)'
      DisplayWidth = 23
      FieldName = 'LARGURA'
      Precision = 18
      Size = 2
    end
    object QueryProductCOMPRIMENTO: TBCDField
      Alignment = taLeftJustify
      DisplayLabel = 'Comprimento (cm)'
      DisplayWidth = 23
      FieldName = 'COMPRIMENTO'
      Precision = 18
      Size = 2
    end
    object QueryProductREGDATA: TDateField
      DisplayLabel = 'Data do Cadastros'
      DisplayWidth = 18
      FieldName = 'REGDATA'
    end
    object QueryProductALTDATA: TDateField
      DisplayLabel = 'Data da Altera'#231#227'o'
      DisplayWidth = 18
      FieldName = 'ALTDATA'
    end
    object QueryProductPESOLIQ: TBCDField
      Alignment = taLeftJustify
      DisplayLabel = 'Peso L'#237'quido (kg)'
      DisplayWidth = 23
      FieldName = 'PESOLIQ'
      Precision = 18
      Size = 2
    end
    object QueryProductPESOBRUTO: TBCDField
      Alignment = taLeftJustify
      DisplayLabel = 'Peso Bruto (kg)'
      DisplayWidth = 23
      FieldName = 'PESOBRUTO'
      Precision = 18
      Size = 2
    end
  end
  object UpdateProduct: TFDUpdateSQL
    Connection = Connection
    InsertSQL.Strings = (
      'INSERT INTO VPRODUTO'
      '(CODFORNECEDOR, CODDEPARTAMENTO, DESCRICAO, CODFABRICA, '
      '  QTUNITCX, CODBARRAS, CODBARRASCX, ALTURA, '
      '  LARGURA, COMPRIMENTO, REGDATA, ALTDATA, '
      '  PESOLIQ, PESOBRUTO)'
      
        'VALUES (:NEW_CODFORNECEDOR, :NEW_CODDEPARTAMENTO, :NEW_DESCRICAO' +
        ', :NEW_CODFABRICA, '
      '  :NEW_QTUNITCX, :NEW_CODBARRAS, :NEW_CODBARRASCX, :NEW_ALTURA, '
      '  :NEW_LARGURA, :NEW_COMPRIMENTO, :NEW_REGDATA, :NEW_ALTDATA, '
      '  :NEW_PESOLIQ, :NEW_PESOBRUTO)'
      'RETURNING CODPRODUTO')
    ModifySQL.Strings = (
      'UPDATE VPRODUTO'
      
        'SET CODFORNECEDOR = :NEW_CODFORNECEDOR, CODDEPARTAMENTO = :NEW_C' +
        'ODDEPARTAMENTO, '
      '  DESCRICAO = :NEW_DESCRICAO, CODFABRICA = :NEW_CODFABRICA, '
      
        '  QTUNITCX = :NEW_QTUNITCX, CODBARRAS = :NEW_CODBARRAS, CODBARRA' +
        'SCX = :NEW_CODBARRASCX, '
      
        '  ALTURA = :NEW_ALTURA, LARGURA = :NEW_LARGURA, COMPRIMENTO = :N' +
        'EW_COMPRIMENTO, '
      
        '  REGDATA = :NEW_REGDATA, ALTDATA = :NEW_ALTDATA, PESOLIQ = :NEW' +
        '_PESOLIQ, '
      '  PESOBRUTO = :NEW_PESOBRUTO'
      'WHERE CODPRODUTO = :OLD_CODPRODUTO'
      'RETURNING CODPRODUTO')
    DeleteSQL.Strings = (
      'DELETE FROM VPRODUTO'
      
        'WHERE CODFORNECEDOR = :OLD_CODFORNECEDOR AND CODDEPARTAMENTO = :' +
        'OLD_CODDEPARTAMENTO AND '
      
        '  DESCRICAO = :OLD_DESCRICAO AND CODFABRICA = :OLD_CODFABRICA AN' +
        'D '
      '  QTUNITCX = :OLD_QTUNITCX AND CODBARRAS = :OLD_CODBARRAS AND '
      '  CODBARRASCX = :OLD_CODBARRASCX AND ALTURA = :OLD_ALTURA AND '
      '  LARGURA = :OLD_LARGURA AND COMPRIMENTO = :OLD_COMPRIMENTO AND '
      
        '  REGDATA = :OLD_REGDATA AND ALTDATA = :OLD_ALTDATA AND PESOLIQ ' +
        '= :OLD_PESOLIQ AND '
      '  PESOBRUTO = :OLD_PESOBRUTO')
    FetchRowSQL.Strings = (
      
        'SELECT CODPRODUTO, CODFORNECEDOR, CODDEPARTAMENTO, DESCRICAO, CO' +
        'DFABRICA, '
      
        '  QTUNITCX, CODBARRAS, CODBARRASCX, ALTURA, LARGURA, COMPRIMENTO' +
        ', '
      '  REGDATA, ALTDATA, PESOLIQ, PESOBRUTO'
      'FROM VPRODUTO'
      'WHERE CODPRODUTO = :CODPRODUTO')
    Left = 300
    Top = 136
  end
  object QueryDepartment: TFDQuery
    Active = True
    CachedUpdates = True
    Connection = Connection
    Transaction = Transacition
    UpdateTransaction = Transacition
    UpdateOptions.AssignedValues = [uvFetchGeneratorsPoint, uvGeneratorName]
    UpdateOptions.FetchGeneratorsPoint = gpImmediate
    UpdateOptions.GeneratorName = 'GEN_VDEPARTAMENTO_ID'
    UpdateOptions.AutoIncFields = 'CODDEPARTAMENTO'
    UpdateObject = UpdateDepartment
    SQL.Strings = (
      'SELECT CODDEPARTAMENTO,'
      '       DESCRICAO '
      '  FROM VDEPARTAMENTO')
    Left = 356
    Top = 80
    object QueryDepartmentCODDEPARTAMENTO: TFDAutoIncField
      Alignment = taLeftJustify
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODDEPARTAMENTO'
      Origin = 'CODDEPARTAMENTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      IdentityInsert = True
    end
    object QueryDepartmentDESCRICAO: TStringField
      DisplayLabel = 'Departamento'
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
    end
  end
  object UpdateDepartment: TFDUpdateSQL
    Connection = Connection
    InsertSQL.Strings = (
      'INSERT INTO VDEPARTAMENTO'
      '(DESCRICAO)'
      'VALUES (:NEW_DESCRICAO)'
      'RETURNING CODDEPARTAMENTO')
    ModifySQL.Strings = (
      'UPDATE VDEPARTAMENTO'
      'SET DESCRICAO = :NEW_DESCRICAO'
      'WHERE CODDEPARTAMENTO = :OLD_CODDEPARTAMENTO'
      'RETURNING CODDEPARTAMENTO')
    DeleteSQL.Strings = (
      'DELETE FROM VDEPARTAMENTO'
      'WHERE CODDEPARTAMENTO = :OLD_CODDEPARTAMENTO')
    FetchRowSQL.Strings = (
      'SELECT CODDEPARTAMENTO, DESCRICAO'
      'FROM VDEPARTAMENTO'
      'WHERE CODDEPARTAMENTO = :CODDEPARTAMENTO')
    Left = 356
    Top = 136
  end
  object QueryProvider: TFDQuery
    Active = True
    CachedUpdates = True
    Connection = Connection
    Transaction = Transacition
    UpdateTransaction = Transacition
    UpdateOptions.AssignedValues = [uvFetchGeneratorsPoint, uvGeneratorName]
    UpdateOptions.FetchGeneratorsPoint = gpImmediate
    UpdateOptions.GeneratorName = 'GEN_VFORNECEDOR_ID'
    UpdateOptions.AutoIncFields = 'CODFORNECEDOR'
    UpdateObject = UpdateProvider
    SQL.Strings = (
      'SELECT CODFORNECEDOR, NOME, NOMEFANTASIA, CGC,'
      '       EMAIL, ENDERECO, NUMERO, COMPLMENTO,'
      '       BAIRRO, CIDADE, UF, CEP'
      '  FROM VFORNECEDOR')
    Left = 32
    Top = 192
    object QueryProviderCODFORNECEDOR: TFDAutoIncField
      Alignment = taLeftJustify
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODFORNECEDOR'
      ReadOnly = True
    end
    object QueryProviderNOME: TStringField
      DisplayLabel = 'Nome / Raz'#227'o Social'
      FieldName = 'NOME'
      Size = 40
    end
    object QueryProviderCGC: TStringField
      DisplayLabel = 'CPF / CNPJ'
      FieldName = 'CGC'
      EditMask = '##.###.###/####-##;1;_'
    end
    object QueryProviderEMAIL: TStringField
      DisplayLabel = 'Email'
      FieldName = 'EMAIL'
      Size = 80
    end
    object QueryProviderENDERECO: TStringField
      DisplayLabel = 'Lagradouro'
      FieldName = 'ENDERECO'
      Size = 60
    end
    object QueryProviderNUMERO: TStringField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NUMERO'
      Size = 10
    end
    object QueryProviderCOMPLMENTO: TStringField
      DisplayLabel = 'Complemento'
      FieldName = 'COMPLMENTO'
      Size = 10
    end
    object QueryProviderBAIRRO: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'BAIRRO'
    end
    object QueryProviderCIDADE: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'CIDADE'
      Size = 40
    end
    object QueryProviderNOMEFANTASIA: TStringField
      DisplayLabel = 'Nome Fantasia'
      FieldName = 'NOMEFANTASIA'
      Size = 40
    end
    object QueryProviderUF: TStringField
      DisplayLabel = 'Estado'
      FieldName = 'UF'
      FixedChar = True
      Size = 2
    end
    object QueryProviderCEP: TStringField
      FieldName = 'CEP'
      EditMask = '#####-###;1;_'
      FixedChar = True
      Size = 9
    end
  end
  object UpdateProvider: TFDUpdateSQL
    Connection = Connection
    InsertSQL.Strings = (
      'INSERT INTO VFORNECEDOR'
      '(NOME, NOMEFANTASIA, CGC, EMAIL, ENDERECO, '
      '  NUMERO, COMPLMENTO, BAIRRO, CIDADE, '
      '  UF, CEP)'
      
        'VALUES (:NEW_NOME, :NEW_NOMEFANTASIA, :NEW_CGC, :NEW_EMAIL, :NEW' +
        '_ENDERECO, '
      '  :NEW_NUMERO, :NEW_COMPLMENTO, :NEW_BAIRRO, :NEW_CIDADE, '
      '  :NEW_UF, :NEW_CEP)'
      'RETURNING CODFORNECEDOR')
    ModifySQL.Strings = (
      'UPDATE VFORNECEDOR'
      
        'SET NOME = :NEW_NOME, NOMEFANTASIA = :NEW_NOMEFANTASIA, CGC = :N' +
        'EW_CGC, '
      
        '  EMAIL = :NEW_EMAIL, ENDERECO = :NEW_ENDERECO, NUMERO = :NEW_NU' +
        'MERO, '
      
        '  COMPLMENTO = :NEW_COMPLMENTO, BAIRRO = :NEW_BAIRRO, CIDADE = :' +
        'NEW_CIDADE, '
      '  UF = :NEW_UF, CEP = :NEW_CEP'
      
        'WHERE NOME = :OLD_NOME AND NOMEFANTASIA = :OLD_NOMEFANTASIA AND ' +
        'CGC = :OLD_CGC AND '
      
        '  EMAIL = :OLD_EMAIL AND ENDERECO = :OLD_ENDERECO AND NUMERO = :' +
        'OLD_NUMERO AND '
      '  COMPLMENTO = :OLD_COMPLMENTO AND BAIRRO = :OLD_BAIRRO AND '
      '  CIDADE = :OLD_CIDADE AND UF = :OLD_UF AND CEP = :OLD_CEP'
      'RETURNING CODFORNECEDOR')
    DeleteSQL.Strings = (
      'DELETE FROM VFORNECEDOR'
      
        'WHERE NOME = :OLD_NOME AND NOMEFANTASIA = :OLD_NOMEFANTASIA AND ' +
        'CGC = :OLD_CGC AND '
      
        '  EMAIL = :OLD_EMAIL AND ENDERECO = :OLD_ENDERECO AND NUMERO = :' +
        'OLD_NUMERO AND '
      '  COMPLMENTO = :OLD_COMPLMENTO AND BAIRRO = :OLD_BAIRRO AND '
      '  CIDADE = :OLD_CIDADE AND UF = :OLD_UF AND CEP = :OLD_CEP')
    FetchRowSQL.Strings = (
      
        'SELECT CODFORNECEDOR, NOME, NOMEFANTASIA, CGC, EMAIL, ENDERECO, ' +
        'NUMERO, '
      '  COMPLMENTO, BAIRRO, CIDADE, UF, CEP'
      'FROM VFORNECEDOR'
      
        'WHERE NOME = :NOME AND NOMEFANTASIA = :NOMEFANTASIA AND CGC = :C' +
        'GC AND '
      
        '  EMAIL = :EMAIL AND ENDERECO = :ENDERECO AND NUMERO = :NUMERO A' +
        'ND '
      
        '  COMPLMENTO = :COMPLMENTO AND BAIRRO = :BAIRRO AND CIDADE = :CI' +
        'DADE AND '
      '  UF = :UF AND CEP = :CEP')
    Left = 32
    Top = 248
  end
  object QuerySection: TFDQuery
    Active = True
    CachedUpdates = True
    Connection = Connection
    Transaction = Transacition
    UpdateTransaction = Transacition
    UpdateOptions.AssignedValues = [uvFetchGeneratorsPoint, uvGeneratorName]
    UpdateOptions.FetchGeneratorsPoint = gpImmediate
    UpdateOptions.GeneratorName = 'GEN_VSECAO_ID'
    UpdateOptions.AutoIncFields = 'CODSECAO'
    UpdateObject = UpdateSection
    SQL.Strings = (
      'SELECT CODSECAO, CODDEPARTAMENTO, DESCRICAO '
      '  FROM VSECAO')
    Left = 104
    Top = 192
    object QuerySectionCODSECAO: TIntegerField
      Alignment = taLeftJustify
      AutoGenerateValue = arAutoInc
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODSECAO'
    end
    object QuerySectionCODDEPARTAMENTO: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'C'#243'd. Departamento'
      FieldName = 'CODDEPARTAMENTO'
      Required = True
    end
    object QuerySectionDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
    end
  end
  object UpdateSection: TFDUpdateSQL
    Connection = Connection
    InsertSQL.Strings = (
      'INSERT INTO VSECAO'
      '(CODDEPARTAMENTO, DESCRICAO)'
      'VALUES (:NEW_CODDEPARTAMENTO, :NEW_DESCRICAO)'
      'RETURNING CODSECAO')
    ModifySQL.Strings = (
      'UPDATE VSECAO'
      
        'SET CODDEPARTAMENTO = :NEW_CODDEPARTAMENTO, DESCRICAO = :NEW_DES' +
        'CRICAO'
      
        'WHERE CODDEPARTAMENTO = :OLD_CODDEPARTAMENTO AND DESCRICAO = :OL' +
        'D_DESCRICAO'
      'RETURNING CODSECAO')
    DeleteSQL.Strings = (
      'DELETE FROM VSECAO'
      
        'WHERE CODDEPARTAMENTO = :OLD_CODDEPARTAMENTO AND DESCRICAO = :OL' +
        'D_DESCRICAO')
    FetchRowSQL.Strings = (
      'SELECT CODSECAO, CODDEPARTAMENTO, DESCRICAO'
      'FROM VSECAO'
      
        'WHERE CODDEPARTAMENTO = :CODDEPARTAMENTO AND DESCRICAO = :DESCRI' +
        'CAO')
    Left = 104
    Top = 248
  end
  object UpdateBranch: TFDUpdateSQL
    Connection = Connection
    InsertSQL.Strings = (
      'INSERT INTO VFILIAL'
      '(FILIAL, CGC)'
      'VALUES (:NEW_FILIAL, :NEW_CGC)'
      'RETURNING CODFILIAL')
    ModifySQL.Strings = (
      'UPDATE VFILIAL'
      'SET FILIAL = :NEW_FILIAL, CGC = :NEW_CGC'
      'WHERE CODFILIAL = :OLD_CODFILIAL'
      'RETURNING CODFILIAL')
    DeleteSQL.Strings = (
      'DELETE FROM VFILIAL'
      'WHERE CODFILIAL = :OLD_CODFILIAL')
    FetchRowSQL.Strings = (
      'SELECT CODFILIAL, FILIAL, CGC'
      'FROM VFILIAL'
      'WHERE CODFILIAL = :CODFILIAL')
    Left = 176
    Top = 248
  end
  object QueryCity: TFDQuery
    Active = True
    CachedUpdates = True
    Connection = Connection
    Transaction = Transacition
    UpdateTransaction = Transacition
    UpdateOptions.AssignedValues = [uvFetchGeneratorsPoint, uvGeneratorName]
    UpdateOptions.FetchGeneratorsPoint = gpImmediate
    UpdateOptions.GeneratorName = 'GEN_VCIDADE_ID'
    UpdateOptions.AutoIncFields = 'CODCIDADE'
    UpdateObject = UpdateCity
    SQL.Strings = (
      'SELECT CODCIDADE, DESCRICAO, CODIBGE, CODUF                 '
      '  FROM VCIDADE')
    Left = 244
    Top = 192
    object QueryCityCODCIDADE: TFDAutoIncField
      Alignment = taLeftJustify
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODCIDADE'
      ReadOnly = True
    end
    object QueryCityDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Size = 40
    end
    object QueryCityCODIBGE: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'C'#243'd. IBGE'
      FieldName = 'CODIBGE'
    end
    object QueryCityCODUF: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'C'#243'd. Estado'
      FieldName = 'CODUF'
      Required = True
    end
  end
  object QueryState: TFDQuery
    Active = True
    CachedUpdates = True
    Connection = Connection
    Transaction = Transacition
    UpdateTransaction = Transacition
    UpdateOptions.AssignedValues = [uvFetchGeneratorsPoint, uvGeneratorName]
    UpdateOptions.FetchGeneratorsPoint = gpImmediate
    UpdateOptions.GeneratorName = 'GEN_VUF_ID'
    UpdateOptions.AutoIncFields = 'CODUF'
    UpdateObject = UpdateState
    SQL.Strings = (
      'SELECT CODUF, DESCRICAO, UF '
      '  FROM VUF')
    Left = 304
    Top = 192
    object QueryStateCODUF: TFDAutoIncField
      Alignment = taLeftJustify
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODUF'
      ReadOnly = True
    end
    object QueryStateDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
    end
    object QueryStateUF: TStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 2
    end
  end
  object UpdateCity: TFDUpdateSQL
    Connection = Connection
    InsertSQL.Strings = (
      'INSERT INTO VCIDADE'
      '(DESCRICAO, CODIBGE, CODUF)'
      'VALUES (:NEW_DESCRICAO, :NEW_CODIBGE, :NEW_CODUF)'
      'RETURNING CODCIDADE')
    ModifySQL.Strings = (
      'UPDATE VCIDADE'
      
        'SET DESCRICAO = :NEW_DESCRICAO, CODIBGE = :NEW_CODIBGE, CODUF = ' +
        ':NEW_CODUF'
      'WHERE CODCIDADE = :OLD_CODCIDADE'
      'RETURNING CODCIDADE')
    DeleteSQL.Strings = (
      'DELETE FROM VCIDADE'
      'WHERE CODCIDADE = :OLD_CODCIDADE')
    FetchRowSQL.Strings = (
      'SELECT CODCIDADE, DESCRICAO, CODIBGE, CODUF'
      'FROM VCIDADE'
      'WHERE CODCIDADE = :CODCIDADE')
    Left = 243
    Top = 248
  end
  object UpdateState: TFDUpdateSQL
    Connection = Connection
    InsertSQL.Strings = (
      'INSERT INTO VUF'
      '(DESCRICAO, UF)'
      'VALUES (:NEW_DESCRICAO, :NEW_UF)'
      'RETURNING CODUF')
    ModifySQL.Strings = (
      'UPDATE VUF'
      'SET DESCRICAO = :NEW_DESCRICAO, UF = :NEW_UF'
      'WHERE CODUF = :OLD_CODUF'
      'RETURNING CODUF')
    DeleteSQL.Strings = (
      'DELETE FROM VUF'
      'WHERE CODUF = :OLD_CODUF')
    FetchRowSQL.Strings = (
      'SELECT CODUF, DESCRICAO, UF'
      'FROM VUF'
      'WHERE CODUF = :CODUF')
    Left = 307
    Top = 248
  end
  object DtSrcMDPermission: TDataSource
    DataSet = QueryProfile
    Left = 424
    Top = 192
  end
  object QueryPermission: TFDQuery
    Active = True
    MasterSource = DtSrcMDPermission
    MasterFields = 'CODPERFIL'
    DetailFields = 'CODPERFIL'
    Connection = Connection
    Transaction = Transacition
    UpdateTransaction = Transacition
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.AssignedValues = [uvFetchGeneratorsPoint, uvGeneratorName]
    UpdateOptions.GeneratorName = 'GEN_VPERMISSAO_ID'
    UpdateOptions.AutoIncFields = 'CODPERMISSAO'
    UpdateObject = UpdatePermission
    SQL.Strings = (
      'SELECT CODPERMISSAO, DESCRICAO, FUNCAO, '
      '       STATUS, CODPERFIL'
      '  FROM VPERMISSAO'
      ' WHERE CODPERFIL = :CODPERFIL'
      '       ')
    Left = 480
    Top = 192
    ParamData = <
      item
        Name = 'CODPERFIL'
        DataType = ftInteger
        ParamType = ptInput
        Size = 4
        Value = 1
      end>
    object QueryPermissionCODPERMISSAO: TIntegerField
      AutoGenerateValue = arAutoInc
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODPERMISSAO'
      Origin = 'CODPERMISSAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object QueryPermissionDESCRICAO: TStringField
      DisplayLabel = 'Permiss'#227'o'
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 40
    end
    object QueryPermissionFUNCAO: TStringField
      DisplayLabel = 'Fun'#231#227'o'
      FieldName = 'FUNCAO'
      Origin = 'FUNCAO'
      Size = 40
    end
    object QueryPermissionSTATUS: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Origin = 'STATUS'
      FixedChar = True
      Size = 1
    end
    object QueryPermissionCODPERFIL: TIntegerField
      DisplayLabel = 'C'#243'd. Perfil'
      FieldName = 'CODPERFIL'
      Origin = 'CODPERFIL'
    end
  end
  object UpdatePermission: TFDUpdateSQL
    Connection = Connection
    InsertSQL.Strings = (
      'INSERT INTO VPERMISSAO'
      '(DESCRICAO, FUNCAO, STATUS, CODPERFIL)'
      
        'VALUES (:NEW_DESCRICAO, :NEW_FUNCAO, :NEW_STATUS, :NEW_CODPERFIL' +
        ')')
    ModifySQL.Strings = (
      'UPDATE VPERMISSAO'
      
        'SET DESCRICAO = :NEW_DESCRICAO, FUNCAO = :NEW_FUNCAO, STATUS = :' +
        'NEW_STATUS, '
      '  CODPERFIL = :NEW_CODPERFIL'
      'WHERE CODPERMISSAO = :OLD_CODPERMISSAO')
    DeleteSQL.Strings = (
      'DELETE FROM VPERMISSAO'
      'WHERE CODPERMISSAO = :OLD_CODPERMISSAO')
    FetchRowSQL.Strings = (
      'SELECT CODPERMISSAO, DESCRICAO, FUNCAO, STATUS, CODPERFIL'
      'FROM VPERMISSAO'
      'WHERE CODPERMISSAO = :CODPERMISSAO')
    Left = 480
    Top = 248
  end
  object QuerySalesHeader: TFDQuery
    Active = True
    MasterSource = DtSrcDetailHeaderSales
    MasterFields = 'CODCLIENTE'
    DetailFields = 'CODCLIENTE'
    Connection = Connection
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    SQL.Strings = (
      'SELECT VPEDIDO.NUMPEDIDO, VPEDIDO.CODFILIAL, VFILIAL.FILIAL,'
      '       VPEDIDO.CODCLIENTE, VCLIENTE.NOME, VPEDIDO.CODPLANO, '
      '       VPLPAGAMENTO.DESCRICAO, VPEDIDO.DATA, VPEDIDO.VLTOTAL, '
      '       VPEDIDO.VLDESCONTO, VPEDIDO.STATUS, VPEDIDO.DTCANCEL'
      '  FROM VPEDIDO, VPLPAGAMENTO, VCLIENTE, VFILIAL'
      ' WHERE VPEDIDO.CODCLIENTE = VCLIENTE.CODCLIENTE'
      '   AND VPEDIDO.CODPLANO = VPLPAGAMENTO.CODPLANO'
      '   AND VPEDIDO.CODFILIAL = VFILIAL.CODFILIAL'
      '   AND VPEDIDO.CODCLIENTE = :CODCLIENTE')
    Left = 424
    Top = 80
    ParamData = <
      item
        Name = 'CODCLIENTE'
        DataType = ftInteger
        ParamType = ptInput
        Size = 4
        Value = 2
      end>
    object QuerySalesHeaderNUMPEDIDO: TIntegerField
      DisplayLabel = 'N'#186' Pedido'
      DisplayWidth = 12
      FieldName = 'NUMPEDIDO'
      Origin = 'NUMPEDIDO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QuerySalesHeaderCODFILIAL: TIntegerField
      DisplayLabel = 'C'#243'd. Filial'
      DisplayWidth = 12
      FieldName = 'CODFILIAL'
      Origin = 'CODFILIAL'
      Required = True
    end
    object QuerySalesHeaderFILIAL: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Filial'
      DisplayWidth = 12
      FieldName = 'FILIAL'
      Origin = 'FILIAL'
      ProviderFlags = []
      ReadOnly = True
      Size = 40
    end
    object QuerySalesHeaderCODCLIENTE: TIntegerField
      DisplayLabel = 'C'#243'd. Cliente'
      DisplayWidth = 12
      FieldName = 'CODCLIENTE'
      Origin = 'CODCLIENTE'
      Required = True
    end
    object QuerySalesHeaderNOME: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Nome / Raz'#227'o Social'
      DisplayWidth = 48
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 40
    end
    object QuerySalesHeaderCODPLANO: TIntegerField
      DisplayLabel = 'C'#243'd. Plano'
      DisplayWidth = 12
      FieldName = 'CODPLANO'
      Origin = 'CODPLANO'
      Required = True
    end
    object QuerySalesHeaderDESCRICAO: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Plano de Pgto.'
      DisplayWidth = 24
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
    end
    object QuerySalesHeaderDATA: TDateField
      DisplayLabel = 'Dt. Pedido'
      DisplayWidth = 12
      FieldName = 'DATA'
      Origin = '"DATA"'
    end
    object QuerySalesHeaderVLTOTAL: TBCDField
      DisplayLabel = 'Vl. Total'
      DisplayWidth = 23
      FieldName = 'VLTOTAL'
      Origin = 'VLTOTAL'
      Precision = 18
      Size = 2
    end
    object QuerySalesHeaderVLDESCONTO: TBCDField
      DisplayLabel = 'Vl. Desc.'
      DisplayWidth = 23
      FieldName = 'VLDESCONTO'
      Origin = 'VLDESCONTO'
      Precision = 18
      Size = 2
    end
    object QuerySalesHeaderSTATUS: TStringField
      DisplayLabel = 'Status'
      DisplayWidth = 6
      FieldName = 'STATUS'
      Origin = 'STATUS'
      FixedChar = True
      Size = 1
    end
    object QuerySalesHeaderDTCANCEL: TDateField
      DisplayLabel = 'Dt. Cancelamento'
      DisplayWidth = 17
      FieldName = 'DTCANCEL'
      Origin = 'DTCANCEL'
    end
  end
  object DtSrcDetailHeaderSales: TDataSource
    DataSet = QueryClient
    Left = 424
    Top = 136
  end
  object QuerySelectProvider: TFDQuery
    Active = True
    Connection = Connection
    SQL.Strings = (
      'SELECT CODFORNECEDOR, NOME FROM VFORNECEDOR')
    Left = 208
    Top = 304
  end
  object QuerySelectDepartment: TFDQuery
    Active = True
    Connection = Connection
    SQL.Strings = (
      'SELECT CODDEPARTAMENTO, DESCRICAO'
      'FROM VDEPARTAMENTO')
    Left = 336
    Top = 304
  end
  object QuerySalesHeaderCons: TFDQuery
    Active = True
    Connection = Connection
    Transaction = Transacition
    SQL.Strings = (
      'SELECT VPEDIDO.NUMPEDIDO, VFILIAL.CODFILIAL, VFILIAL.FILIAL,'
      
        '       VCLIENTE.CODCLIENTE, VCLIENTE.NOME, VPLPAGAMENTO.CODPLANO' +
        ','
      '       VPLPAGAMENTO.DESCRICAO, VPEDIDO.DATA, VPEDIDO.VLTOTAL,'
      '       VPEDIDO.VLDESCONTO '
      '  FROM VPEDIDO, VCLIENTE, VFILIAL , VPLPAGAMENTO'
      ' WHERE VPEDIDO.CODCLIENTE = VCLIENTE.CODCLIENTE'
      '   AND VPEDIDO.CODFILIAL = VFILIAL.CODFILIAL'
      '   AND VPEDIDO.CODPLANO = VPLPAGAMENTO.CODPLANO'
      '   AND VPEDIDO.NUMPEDIDO = :NUMPEDIDO')
    Left = 592
    Top = 80
    ParamData = <
      item
        Name = 'NUMPEDIDO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object QuerySalesHeaderConsNUMPEDIDO: TIntegerField
      FieldName = 'NUMPEDIDO'
      Origin = 'NUMPEDIDO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QuerySalesHeaderConsCODFILIAL: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CODFILIAL'
      Origin = 'CODFILIAL'
      ProviderFlags = []
      ReadOnly = True
    end
    object QuerySalesHeaderConsFILIAL: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'FILIAL'
      Origin = 'FILIAL'
      ProviderFlags = []
      ReadOnly = True
      Size = 40
    end
    object QuerySalesHeaderConsCODCLIENTE: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CODCLIENTE'
      Origin = 'CODCLIENTE'
      ProviderFlags = []
      ReadOnly = True
    end
    object QuerySalesHeaderConsNOME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 40
    end
    object QuerySalesHeaderConsCODPLANO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CODPLANO'
      Origin = 'CODPLANO'
      ProviderFlags = []
      ReadOnly = True
    end
    object QuerySalesHeaderConsDESCRICAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
    end
    object QuerySalesHeaderConsDATA: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
    end
    object QuerySalesHeaderConsVLTOTAL: TBCDField
      FieldName = 'VLTOTAL'
      Origin = 'VLTOTAL'
      currency = True
      Precision = 18
      Size = 2
    end
    object QuerySalesHeaderConsVLDESCONTO: TBCDField
      FieldName = 'VLDESCONTO'
      Origin = 'VLDESCONTO'
      currency = True
      Precision = 18
      Size = 2
    end
  end
  object QuerySalesItemsCons: TFDQuery
    Active = True
    MasterSource = DtScrDetailSales
    MasterFields = 'NUMPEDIDO'
    DetailFields = 'NUMPEDIDO'
    Connection = Connection
    Transaction = Transacition
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    SQL.Strings = (
      
        'SELECT VITEMPEDIDO.NUMSEQ, VPRODUTO.CODPRODUTO, VPRODUTO.DESCRIC' +
        'AO, '
      
        '       VITEMPEDIDO.QTDE, VITEMPEDIDO.PRECO, VITEMPEDIDO.CODBARRA' +
        'S, '
      
        '       VITEMPEDIDO.VLDESC, VITEMPEDIDO.TOTALPRECO, VITEMPEDIDO.N' +
        'UMPEDIDO'
      '  FROM VITEMPEDIDO, VPRODUTO'
      ' WHERE VITEMPEDIDO.CODPRODUTO = VPRODUTO.CODPRODUTO'
      '   AND VITEMPEDIDO.NUMPEDIDO = :NUMPEDIDO'
      '')
    Left = 592
    Top = 192
    ParamData = <
      item
        Name = 'NUMPEDIDO'
        DataType = ftInteger
        ParamType = ptInput
        Size = 4
        Value = Null
      end>
    object QuerySalesItemsConsNUMSEQ: TIntegerField
      FieldName = 'NUMSEQ'
      Origin = 'NUMSEQ'
    end
    object QuerySalesItemsConsCODPRODUTO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CODPRODUTO'
      Origin = 'CODPRODUTO'
      ProviderFlags = []
      ReadOnly = True
    end
    object QuerySalesItemsConsDESCRICAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 40
    end
    object QuerySalesItemsConsQTDE: TBCDField
      FieldName = 'QTDE'
      Origin = 'QTDE'
      Precision = 18
      Size = 2
    end
    object QuerySalesItemsConsPRECO: TBCDField
      FieldName = 'PRECO'
      Origin = 'PRECO'
      currency = True
      Precision = 18
      Size = 2
    end
    object QuerySalesItemsConsCODBARRAS: TStringField
      FieldName = 'CODBARRAS'
      Origin = 'CODBARRAS'
      Size = 13
    end
    object QuerySalesItemsConsVLDESC: TBCDField
      FieldName = 'VLDESC'
      Origin = 'VLDESC'
      Precision = 18
      Size = 2
    end
    object QuerySalesItemsConsTOTALPRECO: TBCDField
      FieldName = 'TOTALPRECO'
      Origin = 'TOTALPRECO'
      currency = True
      Precision = 18
      Size = 2
    end
    object QuerySalesItemsConsNUMPEDIDO: TIntegerField
      FieldName = 'NUMPEDIDO'
      Origin = 'NUMPEDIDO'
      Required = True
    end
  end
  object DtScrDetailSales: TDataSource
    DataSet = QuerySalesHeaderCons
    Left = 592
    Top = 136
  end
  object QueryReportSales: TFDQuery
    Active = True
    Connection = Connection
    SQL.Strings = (
      'SELECT VPEDIDO.NUMPEDIDO, VFILIAL.CODFILIAL, VFILIAL.FILIAL,'
      
        '       VCLIENTE.CODCLIENTE, VCLIENTE.NOME, VPLPAGAMENTO.CODPLANO' +
        ','
      '       VPLPAGAMENTO.DESCRICAO, VPEDIDO.DATA, VPEDIDO.VLTOTAL,'
      
        '       VPEDIDO.VLDESCONTO, VITEMPEDIDO.NUMSEQ, VPRODUTO.CODPRODU' +
        'TO, '
      
        '       VPRODUTO.DESCRICAO AS PRODUTO, VITEMPEDIDO.QTDE, VITEMPED' +
        'IDO.PRECO, '
      
        '       VITEMPEDIDO.CODBARRAS, VITEMPEDIDO.VLDESC, VITEMPEDIDO.TO' +
        'TALPRECO'
      
        '  FROM VPEDIDO, VITEMPEDIDO, VCLIENTE, VFILIAL , VPLPAGAMENTO, V' +
        'PRODUTO'
      ' WHERE VPEDIDO.CODCLIENTE = VCLIENTE.CODCLIENTE'
      '   AND VPEDIDO.NUMPEDIDO = VITEMPEDIDO.NUMPEDIDO'
      '   AND VPEDIDO.CODFILIAL = VFILIAL.CODFILIAL'
      '   AND VPEDIDO.CODPLANO = VPLPAGAMENTO.CODPLANO'
      '   AND VITEMPEDIDO.CODPRODUTO = VPRODUTO.CODPRODUTO      '
      '   AND VPEDIDO.NUMPEDIDO = :NUMPEDIDO')
    Left = 592
    Top = 256
    ParamData = <
      item
        Name = 'NUMPEDIDO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object QueryConsultPrice: TFDQuery
    Connection = Connection
    SQL.Strings = (
      '')
    Left = 592
    Top = 312
    object QueryConsultPriceCODPRODUTO: TIntegerField
      FieldName = 'CODPRODUTO'
      Origin = 'CODPRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QueryConsultPriceDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 40
    end
    object QueryConsultPriceCODFABRICA: TStringField
      FieldName = 'CODFABRICA'
      Origin = 'CODFABRICA'
      Size = 10
    end
    object QueryConsultPriceCODBARRAS: TStringField
      FieldName = 'CODBARRAS'
      Origin = 'CODBARRAS'
      Size = 13
    end
    object QueryConsultPriceCUSTO: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'CUSTO'
      Origin = 'CUSTO'
      ProviderFlags = []
      ReadOnly = True
      currency = True
      Precision = 18
      Size = 2
    end
    object QueryConsultPricePVENDA: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PVENDA'
      Origin = 'PVENDA'
      ProviderFlags = []
      ReadOnly = True
      currency = True
      Precision = 18
      Size = 2
    end
  end
  object QuerySumSalesHeader: TFDQuery
    Active = True
    Connection = Connection
    Transaction = Transacition
    SQL.Strings = (
      'SELECT VPEDIDO.NUMPEDIDO, VFILIAL.CODFILIAL, VFILIAL.FILIAL,'
      
        '       VCLIENTE.CODCLIENTE, VCLIENTE.NOME, VPLPAGAMENTO.CODPLANO' +
        ','
      '       VPLPAGAMENTO.DESCRICAO, VPEDIDO.DATA, VPEDIDO.VLTOTAL,'
      '       VPEDIDO.VLDESCONTO '
      '  FROM VPEDIDO, VCLIENTE, VFILIAL , VPLPAGAMENTO'
      ' WHERE VPEDIDO.CODCLIENTE = VCLIENTE.CODCLIENTE'
      '   AND VPEDIDO.CODFILIAL = VFILIAL.CODFILIAL'
      '   AND VPEDIDO.CODPLANO = VPLPAGAMENTO.CODPLANO'
      '   AND VPEDIDO.DATA BETWEEN :DATAINICIO AND :DATAFIM'
      ' ORDER BY VPEDIDO.NUMPEDIDO')
    Left = 712
    Top = 80
    ParamData = <
      item
        Name = 'DATAINICIO'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DATAFIM'
        DataType = ftDate
        ParamType = ptInput
      end>
    object IntegerField1: TIntegerField
      FieldName = 'NUMPEDIDO'
      Origin = 'NUMPEDIDO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IntegerField2: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CODFILIAL'
      Origin = 'CODFILIAL'
      ProviderFlags = []
      ReadOnly = True
    end
    object StringField1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'FILIAL'
      Origin = 'FILIAL'
      ProviderFlags = []
      ReadOnly = True
      Size = 40
    end
    object IntegerField3: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CODCLIENTE'
      Origin = 'CODCLIENTE'
      ProviderFlags = []
      ReadOnly = True
    end
    object StringField2: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 40
    end
    object IntegerField4: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CODPLANO'
      Origin = 'CODPLANO'
      ProviderFlags = []
      ReadOnly = True
    end
    object StringField3: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
    end
    object DateField1: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
    end
    object BCDField1: TBCDField
      FieldName = 'VLTOTAL'
      Origin = 'VLTOTAL'
      currency = True
      Precision = 18
      Size = 2
    end
    object BCDField2: TBCDField
      FieldName = 'VLDESCONTO'
      Origin = 'VLDESCONTO'
      currency = True
      Precision = 18
      Size = 2
    end
  end
  object QuerySumSalesItens: TFDQuery
    Active = True
    MasterSource = DtSrcDetailSumSales
    MasterFields = 'NUMPEDIDO'
    DetailFields = 'NUMPEDIDO'
    Connection = Connection
    Transaction = Transacition
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    SQL.Strings = (
      
        'SELECT VITEMPEDIDO.NUMSEQ, VPRODUTO.CODPRODUTO, VPRODUTO.DESCRIC' +
        'AO, '
      
        '       VITEMPEDIDO.QTDE, VITEMPEDIDO.PRECO, VITEMPEDIDO.CODBARRA' +
        'S, '
      
        '       VITEMPEDIDO.VLDESC, VITEMPEDIDO.TOTALPRECO, VITEMPEDIDO.N' +
        'UMPEDIDO'
      '  FROM VITEMPEDIDO, VPRODUTO'
      ' WHERE VITEMPEDIDO.CODPRODUTO = VPRODUTO.CODPRODUTO'
      '   AND VITEMPEDIDO.NUMPEDIDO = :NUMPEDIDO'
      '')
    Left = 712
    Top = 192
    ParamData = <
      item
        Name = 'NUMPEDIDO'
        DataType = ftInteger
        ParamType = ptInput
        Size = 4
        Value = Null
      end>
    object IntegerField5: TIntegerField
      FieldName = 'NUMSEQ'
      Origin = 'NUMSEQ'
    end
    object IntegerField6: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CODPRODUTO'
      Origin = 'CODPRODUTO'
      ProviderFlags = []
      ReadOnly = True
    end
    object StringField4: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 40
    end
    object BCDField3: TBCDField
      FieldName = 'QTDE'
      Origin = 'QTDE'
      Precision = 18
      Size = 2
    end
    object BCDField4: TBCDField
      FieldName = 'PRECO'
      Origin = 'PRECO'
      currency = True
      Precision = 18
      Size = 2
    end
    object StringField5: TStringField
      FieldName = 'CODBARRAS'
      Origin = 'CODBARRAS'
      Size = 13
    end
    object BCDField5: TBCDField
      FieldName = 'VLDESC'
      Origin = 'VLDESC'
      Precision = 18
      Size = 2
    end
    object BCDField6: TBCDField
      FieldName = 'TOTALPRECO'
      Origin = 'TOTALPRECO'
      currency = True
      Precision = 18
      Size = 2
    end
    object IntegerField7: TIntegerField
      FieldName = 'NUMPEDIDO'
      Origin = 'NUMPEDIDO'
      Required = True
    end
  end
  object DtSrcDetailSumSales: TDataSource
    DataSet = QuerySumSalesHeader
    Left = 712
    Top = 136
  end
end
