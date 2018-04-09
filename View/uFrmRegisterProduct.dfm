inherited FrmRegisterProduct: TFrmRegisterProduct
  Caption = 'Cadastro de Produtos'
  ExplicitTop = -120
  PixelsPerInch = 96
  TextHeight = 13
  inherited PgCtrlMain: TPageControl
    ActivePage = TbShtRegister
    inherited TbShtSearch: TTabSheet
      inherited DBGrdControl: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'CODPRODUTO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODFORNECEDOR'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'CODDEPARTAMENTO'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Width = 286
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODFABRICA'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTUNITCX'
            Width = 98
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODBARRAS'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODBARRASCX'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ALTURA'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'LARGURA'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'COMPRIMENTO'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'REGDATA'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'ALTDATA'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'PESOLIQ'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'PESOBRUTO'
            Visible = False
          end>
      end
    end
    inherited TbShtRegister: TTabSheet
      inherited PnlRegisterLeft: TPanel
        inherited TrVwTopics: TTreeView
          Items.NodeData = {
            03040000003E0000000000000000000000FFFFFFFFFFFFFFFF00000000000000
            000000000001104400610064006F00730020005000720069006E006300690070
            006100690073003E0000000000000000000000FFFFFFFFFFFFFFFF0000000000
            0000000000000001104400610064006F0073002000410064006900630069006F
            006E00610069007300360000000000000000000000FFFFFFFFFFFFFFFF000000
            000000000000000000010C4F007500740072006F00730020004400610064006F
            0073004C0000000000000000000000FFFFFFFFFFFFFFFF000000000000000000
            000000011749006E0066006F0072006D006100E700F50065007300200064006F
            00200052006500670069007300740072006F00}
        end
      end
      inherited PnlRegisterClient: TPanel
        inherited SclBxData: TScrollBox
          VertScrollBar.Position = 251
          object Label1: TLabel [0]
            AlignWithMargins = True
            Left = 3
            Top = -218
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
            Top = -65
            Width = 354
            Height = 13
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Fornecedor'
            ExplicitTop = 186
            ExplicitWidth = 55
          end
          object Label3: TLabel [2]
            AlignWithMargins = True
            Left = 3
            Top = -24
            Width = 354
            Height = 13
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Departamento'
            ExplicitTop = 227
            ExplicitWidth = 69
          end
          object Label4: TLabel [3]
            AlignWithMargins = True
            Left = 3
            Top = -177
            Width = 354
            Height = 13
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Descri'#231#227'o'
            FocusControl = DBEdit4
            ExplicitTop = 74
            ExplicitWidth = 46
          end
          object Label5: TLabel [4]
            AlignWithMargins = True
            Left = 3
            Top = -136
            Width = 354
            Height = 13
            Margins.Bottom = 0
            Align = alTop
            Caption = 'C'#243'd. F'#225'brica'
            FocusControl = DBEdit5
            ExplicitTop = 115
            ExplicitWidth = 61
          end
          object Label6: TLabel [5]
            AlignWithMargins = True
            Left = 3
            Top = 47
            Width = 354
            Height = 13
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Qtde. por Caixa'
            FocusControl = DBEdit6
            ExplicitTop = 298
            ExplicitWidth = 77
          end
          object Label7: TLabel [6]
            AlignWithMargins = True
            Left = 3
            Top = 88
            Width = 354
            Height = 13
            Margins.Bottom = 0
            Align = alTop
            Caption = 'C'#243'd. Barras'
            FocusControl = DBEdit7
            ExplicitTop = 339
            ExplicitWidth = 57
          end
          object Label8: TLabel [7]
            AlignWithMargins = True
            Left = 3
            Top = 129
            Width = 354
            Height = 13
            Margins.Bottom = 0
            Align = alTop
            Caption = 'C'#243'd. Barras Caixa'
            FocusControl = DBEdit8
            ExplicitTop = 380
            ExplicitWidth = 87
          end
          object Label9: TLabel [8]
            AlignWithMargins = True
            Left = 3
            Top = 170
            Width = 354
            Height = 13
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Altura (cm)'
            FocusControl = DBEdit9
            ExplicitTop = 421
            ExplicitWidth = 53
          end
          object Label10: TLabel [9]
            AlignWithMargins = True
            Left = 3
            Top = 211
            Width = 354
            Height = 13
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Largura (cm)'
            FocusControl = DBEdit10
            ExplicitTop = 462
            ExplicitWidth = 61
          end
          object Label11: TLabel [10]
            AlignWithMargins = True
            Left = 3
            Top = 252
            Width = 354
            Height = 13
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Comprimento (cm)'
            FocusControl = DBEdit11
            ExplicitTop = 503
            ExplicitWidth = 87
          end
          object Label12: TLabel [11]
            AlignWithMargins = True
            Left = 3
            Top = 405
            Width = 354
            Height = 13
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Data do Cadastros'
            FocusControl = DBEdit12
            ExplicitTop = 656
            ExplicitWidth = 90
          end
          object Label13: TLabel [12]
            AlignWithMargins = True
            Left = 3
            Top = 446
            Width = 354
            Height = 13
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Data da Altera'#231#227'o'
            FocusControl = DBEdit13
            ExplicitTop = 697
            ExplicitWidth = 87
          end
          object Label14: TLabel [13]
            AlignWithMargins = True
            Left = 3
            Top = 293
            Width = 354
            Height = 13
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Peso L'#237'quido (kg)'
            FocusControl = DBEdit14
            ExplicitTop = 544
            ExplicitWidth = 81
          end
          object Label15: TLabel [14]
            AlignWithMargins = True
            Left = 3
            Top = 334
            Width = 354
            Height = 13
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Peso Bruto (kg)'
            FocusControl = DBEdit15
            ExplicitTop = 585
            ExplicitWidth = 74
          end
          inherited PnlAdditionalData: TPanel
            Top = -98
            Width = 360
            ExplicitTop = -98
            ExplicitWidth = 360
          end
          inherited PnlMainData: TPanel
            Top = -251
            Width = 360
            ExplicitTop = -251
            ExplicitWidth = 360
          end
          inherited PnlOtherData: TPanel
            Top = 14
            Width = 360
            ExplicitTop = 14
            ExplicitWidth = 360
          end
          inherited PnlOtherInformation: TPanel
            Top = 372
            Width = 360
            Caption = 'Informa'#231#245'es do Registro'
            ExplicitTop = 372
            ExplicitWidth = 360
          end
          object DBEdit1: TDBEdit
            Tag = 1
            AlignWithMargins = True
            Left = 3
            Top = -202
            Width = 354
            Height = 19
            Align = alTop
            Color = cl3DLight
            DataField = 'CODPRODUTO'
            DataSource = DtSrcControl
            ReadOnly = True
            TabOrder = 4
          end
          object DBEdit4: TDBEdit
            AlignWithMargins = True
            Left = 3
            Top = -161
            Width = 354
            Height = 19
            Align = alTop
            CharCase = ecUpperCase
            DataField = 'DESCRICAO'
            DataSource = DtSrcControl
            TabOrder = 5
          end
          object DBEdit5: TDBEdit
            AlignWithMargins = True
            Left = 3
            Top = -120
            Width = 354
            Height = 19
            Align = alTop
            CharCase = ecUpperCase
            DataField = 'CODFABRICA'
            DataSource = DtSrcControl
            TabOrder = 6
          end
          object DBEdit6: TDBEdit
            AlignWithMargins = True
            Left = 3
            Top = 63
            Width = 354
            Height = 19
            Align = alTop
            DataField = 'QTUNITCX'
            DataSource = DtSrcControl
            TabOrder = 7
          end
          object DBEdit7: TDBEdit
            AlignWithMargins = True
            Left = 3
            Top = 104
            Width = 354
            Height = 19
            Align = alTop
            DataField = 'CODBARRAS'
            DataSource = DtSrcControl
            TabOrder = 8
          end
          object DBEdit8: TDBEdit
            AlignWithMargins = True
            Left = 3
            Top = 145
            Width = 354
            Height = 19
            Align = alTop
            DataField = 'CODBARRASCX'
            DataSource = DtSrcControl
            TabOrder = 9
          end
          object DBEdit9: TDBEdit
            AlignWithMargins = True
            Left = 3
            Top = 186
            Width = 354
            Height = 19
            Align = alTop
            DataField = 'ALTURA'
            DataSource = DtSrcControl
            TabOrder = 10
          end
          object DBEdit10: TDBEdit
            AlignWithMargins = True
            Left = 3
            Top = 227
            Width = 354
            Height = 19
            Align = alTop
            DataField = 'LARGURA'
            DataSource = DtSrcControl
            TabOrder = 11
          end
          object DBEdit11: TDBEdit
            AlignWithMargins = True
            Left = 3
            Top = 268
            Width = 354
            Height = 19
            Align = alTop
            DataField = 'COMPRIMENTO'
            DataSource = DtSrcControl
            TabOrder = 12
          end
          object DBEdit12: TDBEdit
            Tag = 1
            AlignWithMargins = True
            Left = 3
            Top = 421
            Width = 354
            Height = 19
            Align = alTop
            Color = cl3DLight
            DataField = 'REGDATA'
            DataSource = DtSrcControl
            ReadOnly = True
            TabOrder = 13
          end
          object DBEdit13: TDBEdit
            Tag = 1
            AlignWithMargins = True
            Left = 3
            Top = 462
            Width = 354
            Height = 19
            Align = alTop
            Color = cl3DLight
            DataField = 'ALTDATA'
            DataSource = DtSrcControl
            ReadOnly = True
            TabOrder = 14
          end
          object DBEdit14: TDBEdit
            AlignWithMargins = True
            Left = 3
            Top = 309
            Width = 354
            Height = 19
            Align = alTop
            DataField = 'PESOLIQ'
            DataSource = DtSrcControl
            TabOrder = 15
          end
          object DBEdit15: TDBEdit
            AlignWithMargins = True
            Left = 3
            Top = 350
            Width = 354
            Height = 19
            Align = alTop
            DataField = 'PESOBRUTO'
            DataSource = DtSrcControl
            TabOrder = 16
          end
          object DBLookupComboBox1: TDBLookupComboBox
            AlignWithMargins = True
            Left = 3
            Top = -8
            Width = 354
            Height = 19
            Align = alTop
            DataField = 'CODDEPARTAMENTO'
            DataSource = DtSrcControl
            KeyField = 'CODDEPARTAMENTO'
            ListField = 'DESCRICAO'
            ListSource = DtSrcLookupDepartment
            TabOrder = 17
          end
          object DBLookupComboBox2: TDBLookupComboBox
            AlignWithMargins = True
            Left = 3
            Top = -49
            Width = 354
            Height = 19
            Align = alTop
            DataField = 'CODFORNECEDOR'
            DataSource = DtSrcControl
            KeyField = 'CODFORNECEDOR'
            ListField = 'NOME'
            ListSource = DtSrcLookupProvider
            TabOrder = 18
          end
        end
      end
    end
  end
  inherited DtSrcControl: TDataSource
    DataSet = DMConnection.QueryProduct
  end
  object DtSrcLookupDepartment: TDataSource
    DataSet = DMConnection.QueryDepartment
    Left = 488
    Top = 8
  end
  object DtSrcLookupProvider: TDataSource
    DataSet = DMConnection.QueryProvider
    Left = 600
    Top = 8
  end
end
