inherited FrmRegisterProvider: TFrmRegisterProvider
  Caption = 'Cadastro de Fornecedores'
  ExplicitTop = -4
  PixelsPerInch = 96
  TextHeight = 13
  inherited PgCtrlMain: TPageControl
    ActivePage = TbShtRegister
    inherited TbShtSearch: TTabSheet
      inherited DBGrdControl: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'CODFORNECEDOR'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOMEFANTASIA'
            Width = 275
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CGC'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EMAIL'
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
            FieldName = 'COMPLMENTO'
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
            FieldName = 'CEP'
            Visible = False
          end>
      end
    end
    inherited TbShtRegister: TTabSheet
      inherited PnlRegisterLeft: TPanel
        inherited TrVwTopics: TTreeView
          Items.NodeData = {
            03030000003E0000000000000000000000FFFFFFFFFFFFFFFF00000000000000
            000000000001104400610064006F00730020005000720069006E006300690070
            006100690073003E0000000000000000000000FFFFFFFFFFFFFFFF0000000000
            0000000000000001104400610064006F0073002000410064006900630069006F
            006E00610069007300360000000000000000000000FFFFFFFFFFFFFFFF000000
            000000000000000000010C4F007500740072006F00730020004400610064006F
            007300}
          ExplicitWidth = 149
        end
      end
      inherited PnlRegisterClient: TPanel
        inherited SclBxData: TScrollBox
          VertScrollBar.Position = 166
          object Label1: TLabel [0]
            AlignWithMargins = True
            Left = 3
            Top = -133
            Width = 354
            Height = 13
            Margins.Bottom = 0
            Align = alTop
            Caption = 'C'#243'digo'
            FocusControl = DBEdit1
            ExplicitTop = 33
            ExplicitWidth = 33
          end
          object Label2: TLabel [1]
            AlignWithMargins = True
            Left = 3
            Top = -92
            Width = 354
            Height = 13
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Nome / Raz'#227'o Social'
            FocusControl = DBEdit2
            ExplicitTop = 74
            ExplicitWidth = 97
          end
          object Label3: TLabel [2]
            AlignWithMargins = True
            Left = 3
            Top = -51
            Width = 354
            Height = 13
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Nome Fantasia'
            FocusControl = DBEdit3
            ExplicitTop = 115
            ExplicitWidth = 71
          end
          object Label4: TLabel [3]
            AlignWithMargins = True
            Left = 3
            Top = -10
            Width = 354
            Height = 13
            Margins.Bottom = 0
            Align = alTop
            Caption = 'CPF / CNPJ'
            FocusControl = DBEdit4
            ExplicitTop = 156
            ExplicitWidth = 54
          end
          object Label5: TLabel [4]
            AlignWithMargins = True
            Left = 3
            Top = 61
            Width = 354
            Height = 13
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Email'
            ExplicitTop = 227
            ExplicitWidth = 24
          end
          object Label6: TLabel [5]
            AlignWithMargins = True
            Left = 3
            Top = 132
            Width = 354
            Height = 13
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Lagradouro'
            FocusControl = DBEdit6
            ExplicitTop = 298
            ExplicitWidth = 55
          end
          object Label7: TLabel [6]
            AlignWithMargins = True
            Left = 3
            Top = 173
            Width = 354
            Height = 13
            Margins.Bottom = 0
            Align = alTop
            Caption = 'N'#250'mero'
            FocusControl = DBEdit7
            ExplicitTop = 339
            ExplicitWidth = 37
          end
          object Label8: TLabel [7]
            AlignWithMargins = True
            Left = 3
            Top = 214
            Width = 354
            Height = 13
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Complemento'
            FocusControl = DBEdit8
            ExplicitTop = 380
            ExplicitWidth = 65
          end
          object Label9: TLabel [8]
            AlignWithMargins = True
            Left = 3
            Top = 255
            Width = 354
            Height = 13
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Bairro'
            FocusControl = DBEdit9
            ExplicitTop = 421
            ExplicitWidth = 28
          end
          object Label10: TLabel [9]
            AlignWithMargins = True
            Left = 3
            Top = 296
            Width = 354
            Height = 13
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Cidade'
            FocusControl = DBEdit10
            ExplicitTop = 462
            ExplicitWidth = 33
          end
          object Label11: TLabel [10]
            AlignWithMargins = True
            Left = 3
            Top = 337
            Width = 354
            Height = 13
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Estado'
            FocusControl = DBEdit11
            ExplicitTop = 503
            ExplicitWidth = 33
          end
          object Label12: TLabel [11]
            AlignWithMargins = True
            Left = 3
            Top = 378
            Width = 354
            Height = 13
            Margins.Bottom = 0
            Align = alTop
            Caption = 'CEP'
            FocusControl = DBEdit12
            ExplicitTop = 544
            ExplicitWidth = 19
          end
          inherited PnlAdditionalData: TPanel
            Top = 28
            Width = 360
            ExplicitTop = 28
            ExplicitWidth = 360
          end
          inherited PnlMainData: TPanel
            Top = -166
            Width = 360
            ExplicitTop = -166
            ExplicitWidth = 360
          end
          inherited PnlOtherData: TPanel
            Top = 99
            Width = 360
            ExplicitTop = 99
            ExplicitWidth = 360
          end
          inherited PnlOtherInformation: TPanel
            Top = 416
            Width = 360
            Visible = False
            ExplicitTop = 416
            ExplicitWidth = 360
          end
          object DBEdit1: TDBEdit
            Tag = 1
            AlignWithMargins = True
            Left = 3
            Top = -117
            Width = 354
            Height = 19
            Align = alTop
            Color = cl3DLight
            DataField = 'CODFORNECEDOR'
            DataSource = DtSrcControl
            ReadOnly = True
            TabOrder = 4
          end
          object DBEdit2: TDBEdit
            AlignWithMargins = True
            Left = 3
            Top = -76
            Width = 354
            Height = 19
            Align = alTop
            CharCase = ecUpperCase
            DataField = 'NOME'
            DataSource = DtSrcControl
            TabOrder = 5
          end
          object DBEdit3: TDBEdit
            AlignWithMargins = True
            Left = 3
            Top = -35
            Width = 354
            Height = 19
            Align = alTop
            CharCase = ecUpperCase
            DataField = 'NOMEFANTASIA'
            DataSource = DtSrcControl
            TabOrder = 6
          end
          object DBEdit4: TDBEdit
            AlignWithMargins = True
            Left = 3
            Top = 6
            Width = 354
            Height = 19
            Align = alTop
            DataField = 'CGC'
            DataSource = DtSrcControl
            MaxLength = 18
            TabOrder = 7
          end
          object DBEdit5: TDBEdit
            AlignWithMargins = True
            Left = 3
            Top = 77
            Width = 354
            Height = 19
            Align = alTop
            CharCase = ecLowerCase
            DataField = 'EMAIL'
            DataSource = DtSrcControl
            TabOrder = 8
          end
          object DBEdit6: TDBEdit
            AlignWithMargins = True
            Left = 3
            Top = 148
            Width = 354
            Height = 19
            Align = alTop
            CharCase = ecUpperCase
            DataField = 'ENDERECO'
            DataSource = DtSrcControl
            TabOrder = 9
          end
          object DBEdit7: TDBEdit
            AlignWithMargins = True
            Left = 3
            Top = 189
            Width = 354
            Height = 19
            Align = alTop
            CharCase = ecUpperCase
            DataField = 'NUMERO'
            DataSource = DtSrcControl
            TabOrder = 10
          end
          object DBEdit8: TDBEdit
            AlignWithMargins = True
            Left = 3
            Top = 230
            Width = 354
            Height = 19
            Align = alTop
            CharCase = ecUpperCase
            DataField = 'COMPLMENTO'
            DataSource = DtSrcControl
            TabOrder = 11
          end
          object DBEdit9: TDBEdit
            AlignWithMargins = True
            Left = 3
            Top = 271
            Width = 354
            Height = 19
            Align = alTop
            CharCase = ecUpperCase
            DataField = 'BAIRRO'
            DataSource = DtSrcControl
            TabOrder = 12
          end
          object DBEdit10: TDBEdit
            AlignWithMargins = True
            Left = 3
            Top = 312
            Width = 354
            Height = 19
            Align = alTop
            CharCase = ecUpperCase
            DataField = 'CIDADE'
            DataSource = DtSrcControl
            TabOrder = 13
          end
          object DBEdit11: TDBEdit
            AlignWithMargins = True
            Left = 3
            Top = 353
            Width = 354
            Height = 19
            Align = alTop
            CharCase = ecUpperCase
            DataField = 'UF'
            DataSource = DtSrcControl
            TabOrder = 14
          end
          object DBEdit12: TDBEdit
            AlignWithMargins = True
            Left = 3
            Top = 394
            Width = 354
            Height = 19
            Align = alTop
            DataField = 'CEP'
            DataSource = DtSrcControl
            MaxLength = 9
            TabOrder = 15
          end
        end
      end
    end
  end
  inherited DtSrcControl: TDataSource
    DataSet = DMConnection.QueryProvider
  end
end
