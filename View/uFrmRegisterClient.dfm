inherited FrmRegisterClient: TFrmRegisterClient
  Caption = 'Cadastro de Clientes'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PgCtrlMain: TPageControl
    inherited TbShtSearch: TTabSheet
      inherited DBGrdControl: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'CODCLIENTE'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOMEFANTASIA'
            Title.Caption = 'Nome Fantansia'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CGC'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO'
            Title.Caption = 'Tipo'
            Width = 72
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'INSCMUN'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'INSCEST'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'EMAILCOB'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'EMAILNFE'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'ENDERECO'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'NUMERO'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'COMPLEMENTO'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'BAIRRO'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'CIDADE'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'UF'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'CODATIVIDAE'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'DTCADASTRO'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'DTULTALT'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'CODCIDADE'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'TEL1'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'TEL2'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'TEL3'
            Visible = False
          end>
      end
    end
    inherited TbShtRegister: TTabSheet
      inherited PnlRegisterBottom: TPanel
        inherited BtBtnCancel: TBitBtn
          Left = 571
          ExplicitLeft = 571
        end
        inherited BtBtnSave: TBitBtn
          Left = 662
          Width = 71
          ExplicitLeft = 661
          ExplicitWidth = 71
        end
      end
      inherited PnlRegisterLeft: TPanel
        inherited TrVwTopics: TTreeView
          Items.NodeData = {
            03040000003E0000000000000000000000FFFFFFFFFFFFFFFF00000000000000
            000000000001104400610064006F00730020005000720069006E006300690070
            006100690073003E0000000000000000000000FFFFFFFFFFFFFFFF0000000000
            0000000000000001104400610064006F0073002000410064006900630069006F
            006E00610069007300360000000000000000000000FFFFFFFFFFFFFFFF000000
            000000000000000000010C4F007500740072006F00730020004400610064006F
            0073002E0000000000000000000000FFFFFFFFFFFFFFFF000000000000000000
            000000010845006E006400650072006500E7006F00}
        end
      end
      inherited PnlRegisterClient: TPanel
        inherited SclBxData: TScrollBox
          VertScrollBar.Position = 761
          object Label1: TLabel [0]
            AlignWithMargins = True
            Left = 3
            Top = -728
            Width = 33
            Height = 13
            Margins.Bottom = 0
            Align = alTop
            Caption = 'C'#243'digo'
            FocusControl = DBEdtCode
          end
          object Label2: TLabel [1]
            AlignWithMargins = True
            Left = 3
            Top = -643
            Width = 97
            Height = 13
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Nome / Raz'#227'o Social'
            FocusControl = DBEdtName
          end
          object Label3: TLabel [2]
            AlignWithMargins = True
            Left = 3
            Top = -602
            Width = 71
            Height = 13
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Nome Fantasia'
            FocusControl = DBEdtNickName
          end
          object Label4: TLabel [3]
            AlignWithMargins = True
            Left = 3
            Top = -561
            Width = 54
            Height = 13
            Margins.Bottom = 0
            Align = alTop
            Caption = 'CPF / CNPJ'
            FocusControl = DBEdtDocument
          end
          object Label6: TLabel [4]
            AlignWithMargins = True
            Left = 3
            Top = -479
            Width = 89
            Height = 13
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Inscri'#231#227'o Municipal'
            FocusControl = DBEdtCityDoc
          end
          object Label7: TLabel [5]
            AlignWithMargins = True
            Left = 3
            Top = -520
            Width = 87
            Height = 13
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Inscri'#231#227'o Estadual'
            FocusControl = DBEdtStateDoc
          end
          object Label8: TLabel [6]
            AlignWithMargins = True
            Left = 3
            Top = -326
            Width = 63
            Height = 13
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Observa'#231#245'es'
            FocusControl = DBEdtEmailSec
          end
          object Label9: TLabel [7]
            AlignWithMargins = True
            Left = 3
            Top = -408
            Width = 46
            Height = 13
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Email NFe'
            FocusControl = DBEdtEmail
          end
          object Label10: TLabel [8]
            AlignWithMargins = True
            Left = 3
            Top = 132
            Width = 55
            Height = 13
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Lagradouro'
            FocusControl = DBEdtStreetName
          end
          object Label11: TLabel [9]
            AlignWithMargins = True
            Left = 3
            Top = 173
            Width = 37
            Height = 13
            Margins.Bottom = 0
            Align = alTop
            Caption = 'N'#250'mero'
            FocusControl = DBEdtStreetNumber
          end
          object Label12: TLabel [10]
            AlignWithMargins = True
            Left = 3
            Top = 214
            Width = 65
            Height = 13
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Complemento'
            FocusControl = DBEdtStreetComp
          end
          object Label13: TLabel [11]
            AlignWithMargins = True
            Left = 3
            Top = 296
            Width = 28
            Height = 13
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Bairro'
            FocusControl = DBEdtDistrict
          end
          object Label14: TLabel [12]
            AlignWithMargins = True
            Left = 3
            Top = 337
            Width = 33
            Height = 13
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Cidade'
            FocusControl = DBEdtCity
          end
          object Label15: TLabel [13]
            AlignWithMargins = True
            Left = 3
            Top = 378
            Width = 13
            Height = 13
            Margins.Bottom = 0
            Align = alTop
            Caption = 'UF'
            FocusControl = DBEdtState
          end
          object Label17: TLabel [14]
            AlignWithMargins = True
            Left = 3
            Top = -144
            Width = 85
            Height = 13
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Data do Cadastro'
            FocusControl = DBEdtDateRegister
          end
          object Label18: TLabel [15]
            AlignWithMargins = True
            Left = 3
            Top = -103
            Width = 119
            Height = 13
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Data da '#218'ltima Altera'#231#227'o'
            FocusControl = DBEdtAlterDate
          end
          object Label20: TLabel [16]
            AlignWithMargins = True
            Left = 3
            Top = -62
            Width = 78
            Height = 13
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Telefone Celular'
            FocusControl = DBEdtPhoneOne
          end
          object Label21: TLabel [17]
            AlignWithMargins = True
            Left = 3
            Top = -21
            Width = 86
            Height = 13
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Telefone Comerial'
            FocusControl = DBEdtPhoneTwo
          end
          object Label22: TLabel [18]
            AlignWithMargins = True
            Left = 3
            Top = 20
            Width = 126
            Height = 13
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Telefone Residencial / Fax'
            FocusControl = DBEdtPhoneTree
          end
          object Label5: TLabel [19]
            AlignWithMargins = True
            Left = 3
            Top = 255
            Width = 19
            Height = 13
            Margins.Bottom = 0
            Align = alTop
            Caption = 'CEP'
            FocusControl = DBEdtZipCode
          end
          object Label23: TLabel [20]
            AlignWithMargins = True
            Left = 3
            Top = -367
            Width = 73
            Height = 13
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Email Cobran'#231'a'
            FocusControl = DBEdtEmailSec
          end
          inherited PnlAdditionalData: TPanel
            Top = -441
            Width = 360
            ExplicitTop = -441
            ExplicitWidth = 360
          end
          inherited PnlMainData: TPanel
            Top = -761
            Width = 360
            ExplicitTop = -761
            ExplicitWidth = 360
          end
          inherited PnlOtherData: TPanel
            Top = -218
            Width = 360
            ExplicitTop = -218
            ExplicitWidth = 360
          end
          inherited PnlOtherInformation: TPanel
            Top = 58
            Width = 360
            Caption = 'Endere'#231'o'
            ExplicitTop = 58
            ExplicitWidth = 360
          end
          object DBEdtCode: TDBEdit
            Tag = 1
            AlignWithMargins = True
            Left = 3
            Top = -712
            Width = 354
            Height = 19
            Align = alTop
            Color = clScrollBar
            DataField = 'CODCLIENTE'
            DataSource = DtSrcControl
            ReadOnly = True
            TabOrder = 4
          end
          object DBEdtName: TDBEdit
            AlignWithMargins = True
            Left = 3
            Top = -586
            Width = 354
            Height = 19
            Align = alTop
            CharCase = ecUpperCase
            DataField = 'NOMEFANTASIA'
            DataSource = DtSrcControl
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
          end
          object DBEdtNickName: TDBEdit
            AlignWithMargins = True
            Left = 3
            Top = -627
            Width = 354
            Height = 19
            Align = alTop
            CharCase = ecUpperCase
            DataField = 'NOME'
            DataSource = DtSrcControl
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 6
          end
          object DBEdtDocument: TDBEdit
            AlignWithMargins = True
            Left = 3
            Top = -545
            Width = 354
            Height = 19
            Align = alTop
            DataField = 'CGC'
            DataSource = DtSrcControl
            TabOrder = 7
          end
          object DBEdtCityDoc: TDBEdit
            AlignWithMargins = True
            Left = 3
            Top = -463
            Width = 354
            Height = 19
            Align = alTop
            DataField = 'INSCMUN'
            DataSource = DtSrcControl
            TabOrder = 8
          end
          object DBEdtStateDoc: TDBEdit
            AlignWithMargins = True
            Left = 3
            Top = -504
            Width = 354
            Height = 19
            Align = alTop
            DataField = 'INSCEST'
            DataSource = DtSrcControl
            TabOrder = 9
          end
          object DBEdtEmailSec: TDBEdit
            AlignWithMargins = True
            Left = 3
            Top = -351
            Width = 354
            Height = 19
            Align = alTop
            CharCase = ecLowerCase
            DataField = 'EMAILCOB'
            DataSource = DtSrcControl
            TabOrder = 10
          end
          object DBEdtEmail: TDBEdit
            AlignWithMargins = True
            Left = 3
            Top = -392
            Width = 354
            Height = 19
            Align = alTop
            CharCase = ecLowerCase
            DataField = 'EMAILNFE'
            DataSource = DtSrcControl
            TabOrder = 11
          end
          object DBEdtStreetName: TDBEdit
            AlignWithMargins = True
            Left = 3
            Top = 148
            Width = 354
            Height = 19
            Align = alTop
            CharCase = ecUpperCase
            DataField = 'ENDERECO'
            DataSource = DtSrcControl
            TabOrder = 12
          end
          object DBEdtStreetNumber: TDBEdit
            AlignWithMargins = True
            Left = 3
            Top = 189
            Width = 354
            Height = 19
            Align = alTop
            CharCase = ecUpperCase
            DataField = 'NUMERO'
            DataSource = DtSrcControl
            TabOrder = 13
          end
          object DBEdtStreetComp: TDBEdit
            AlignWithMargins = True
            Left = 3
            Top = 230
            Width = 354
            Height = 19
            Align = alTop
            CharCase = ecUpperCase
            DataField = 'COMPLEMENTO'
            DataSource = DtSrcControl
            TabOrder = 14
          end
          object DBEdtDistrict: TDBEdit
            AlignWithMargins = True
            Left = 3
            Top = 312
            Width = 354
            Height = 19
            Align = alTop
            CharCase = ecUpperCase
            DataField = 'BAIRRO'
            DataSource = DtSrcControl
            TabOrder = 15
          end
          object DBEdtCity: TDBEdit
            AlignWithMargins = True
            Left = 3
            Top = 353
            Width = 354
            Height = 19
            Align = alTop
            CharCase = ecUpperCase
            DataField = 'CIDADE'
            DataSource = DtSrcControl
            TabOrder = 16
          end
          object DBEdtState: TDBEdit
            AlignWithMargins = True
            Left = 3
            Top = 394
            Width = 354
            Height = 19
            Align = alTop
            CharCase = ecUpperCase
            DataField = 'UF'
            DataSource = DtSrcControl
            TabOrder = 17
          end
          object DBEdtDateRegister: TDBEdit
            AlignWithMargins = True
            Left = 3
            Top = -128
            Width = 354
            Height = 19
            Align = alTop
            Color = clScrollBar
            DataField = 'DTCADASTRO'
            DataSource = DtSrcControl
            ReadOnly = True
            TabOrder = 18
          end
          object DBEdtAlterDate: TDBEdit
            AlignWithMargins = True
            Left = 3
            Top = -87
            Width = 354
            Height = 19
            Align = alTop
            Color = clScrollBar
            DataField = 'DTULTALT'
            DataSource = DtSrcControl
            ReadOnly = True
            TabOrder = 19
          end
          object DBEdtPhoneOne: TDBEdit
            AlignWithMargins = True
            Left = 3
            Top = -46
            Width = 354
            Height = 19
            Align = alTop
            DataField = 'TEL1'
            DataSource = DtSrcControl
            MaxLength = 15
            TabOrder = 20
          end
          object DBEdtPhoneTwo: TDBEdit
            AlignWithMargins = True
            Left = 3
            Top = -5
            Width = 354
            Height = 19
            Align = alTop
            DataField = 'TEL2'
            DataSource = DtSrcControl
            MaxLength = 14
            TabOrder = 21
          end
          object DBEdtPhoneTree: TDBEdit
            AlignWithMargins = True
            Left = 3
            Top = 36
            Width = 354
            Height = 19
            Align = alTop
            DataField = 'TEL3'
            DataSource = DtSrcControl
            MaxLength = 14
            TabOrder = 22
          end
          object DBRdBxTypePerson: TDBRadioGroup
            AlignWithMargins = True
            Left = 3
            Top = -687
            Width = 354
            Height = 38
            Align = alTop
            Caption = 'Tipo Pessoa'
            Columns = 2
            DataField = 'TIPO'
            DataSource = DtSrcControl
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Items.Strings = (
              'F'#237'sica'
              'Jur'#237'dica')
            ParentFont = False
            TabOrder = 23
            OnClick = DBRdBxTypePersonClick
          end
          object DBEdtZipCode: TDBEdit
            AlignWithMargins = True
            Left = 3
            Top = 271
            Width = 354
            Height = 19
            Align = alTop
            DataField = 'CEP'
            DataSource = DtSrcControl
            TabOrder = 24
          end
          object PnlActivy: TPanel
            Left = 0
            Top = -188
            Width = 360
            Height = 41
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 25
            object Label16: TLabel
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 90
              Height = 13
              Margins.Bottom = 1
              Align = alTop
              Caption = 'Ramo de Atividade'
              FocusControl = DBEdtActivyCode
            end
            object SpdBtnActivy: TSpeedButton
              AlignWithMargins = True
              Left = 48
              Top = 18
              Width = 23
              Height = 20
              Margins.Left = 0
              Margins.Top = 1
              Margins.Right = 0
              Align = alLeft
              Caption = '...'
              OnClick = SpdBtnActivyClick
              ExplicitLeft = 168
              ExplicitTop = 8
              ExplicitHeight = 22
            end
            object DBEdtActivyCode: TDBEdit
              AlignWithMargins = True
              Left = 3
              Top = 18
              Width = 45
              Height = 20
              Margins.Top = 1
              Margins.Right = 0
              Align = alLeft
              DataField = 'CODATIVIDAE'
              DataSource = DtSrcControl
              MaxLength = 6
              TabOrder = 0
              OnChange = DBEdtActivyCodeChange
              ExplicitHeight = 19
            end
            object EdtActivyName: TEdit
              AlignWithMargins = True
              Left = 71
              Top = 18
              Width = 286
              Height = 20
              Margins.Left = 0
              Margins.Top = 1
              Align = alClient
              Color = clScrollBar
              ReadOnly = True
              TabOrder = 1
              ExplicitHeight = 19
            end
          end
          object PnlCityCode: TPanel
            Left = 0
            Top = 88
            Width = 360
            Height = 41
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 26
            object Label19: TLabel
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 59
              Height = 13
              Margins.Bottom = 1
              Align = alTop
              Caption = 'C'#243'd. Cidade'
              FocusControl = DBEdtCodeCity
            end
            object SpdBtnCodeCity: TSpeedButton
              AlignWithMargins = True
              Left = 48
              Top = 18
              Width = 23
              Height = 20
              Margins.Left = 0
              Margins.Top = 1
              Margins.Right = 0
              Align = alLeft
              Caption = '...'
              OnClick = SpdBtnCodeCityClick
              ExplicitLeft = 168
              ExplicitTop = 8
              ExplicitHeight = 22
            end
            object DBEdtCodeCity: TDBEdit
              AlignWithMargins = True
              Left = 3
              Top = 18
              Width = 45
              Height = 20
              Margins.Top = 1
              Margins.Right = 0
              Align = alLeft
              DataField = 'CODCIDADE'
              DataSource = DtSrcControl
              MaxLength = 6
              TabOrder = 0
              OnChange = DBEdtCodeCityChange
              ExplicitHeight = 19
            end
            object EdtCityCodeName: TEdit
              AlignWithMargins = True
              Left = 71
              Top = 18
              Width = 286
              Height = 20
              Margins.Left = 0
              Margins.Top = 1
              Align = alClient
              Color = clScrollBar
              ReadOnly = True
              TabOrder = 1
              ExplicitHeight = 19
            end
          end
          object DBMmObservation: TDBMemo
            AlignWithMargins = True
            Left = 3
            Top = -310
            Width = 354
            Height = 89
            Align = alTop
            DataField = 'OBS'
            DataSource = DtSrcControl
            MaxLength = 250
            TabOrder = 27
          end
        end
      end
    end
  end
  inherited DtSrcControl: TDataSource
    DataSet = DMConnection.QueryClient
  end
end
