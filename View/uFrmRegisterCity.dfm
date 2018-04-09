inherited FrmRegisterCity: TFrmRegisterCity
  Caption = 'Cadastro de Cidades'
  ExplicitWidth = 750
  ExplicitHeight = 550
  PixelsPerInch = 96
  TextHeight = 13
  inherited PgCtrlMain: TPageControl
    ActivePage = TbShtRegister
    inherited TbShtSearch: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 6
      ExplicitWidth = 736
      ExplicitHeight = 462
      inherited DBGrdControl: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'CODCIDADE'
            Width = 89
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Width = 516
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODIBGE'
            Width = 106
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODUF'
            Visible = False
          end>
      end
    end
    inherited TbShtRegister: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 6
      ExplicitWidth = 736
      ExplicitHeight = 462
      inherited PnlRegisterLeft: TPanel
        inherited TrVwTopics: TTreeView
          Items.NodeData = {
            03020000003E0000000000000000000000FFFFFFFFFFFFFFFF00000000000000
            000000000001104400610064006F00730020005000720069006E006300690070
            006100690073003E0000000000000000000000FFFFFFFFFFFFFFFF0000000000
            0000000000000001104400610064006F0073002000410064006900630069006F
            006E00610069007300}
        end
      end
      inherited PnlRegisterClient: TPanel
        inherited SclBxData: TScrollBox
          object Label1: TLabel [0]
            AlignWithMargins = True
            Left = 3
            Top = 33
            Width = 371
            Height = 13
            Margins.Bottom = 0
            Align = alTop
            Caption = 'C'#243'digo'
            FocusControl = DBEdit1
            ExplicitWidth = 33
          end
          object Label2: TLabel [1]
            AlignWithMargins = True
            Left = 3
            Top = 74
            Width = 371
            Height = 13
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Descri'#231#227'o'
            FocusControl = DBEdit2
            ExplicitWidth = 46
          end
          object Label3: TLabel [2]
            AlignWithMargins = True
            Left = 3
            Top = 145
            Width = 371
            Height = 13
            Margins.Bottom = 0
            Align = alTop
            Caption = 'C'#243'd. IBGE'
            FocusControl = DBEdit3
            ExplicitWidth = 49
          end
          object Label4: TLabel [3]
            AlignWithMargins = True
            Left = 3
            Top = 186
            Width = 371
            Height = 13
            Margins.Bottom = 0
            Align = alTop
            Caption = 'C'#243'd. Estado'
            ExplicitWidth = 59
          end
          inherited PnlAdditionalData: TPanel
            Top = 112
            ExplicitTop = 112
          end
          inherited PnlOtherData: TPanel
            Top = 224
            Visible = False
            ExplicitTop = 224
          end
          inherited PnlOtherInformation: TPanel
            Top = 254
            Visible = False
            ExplicitTop = 254
          end
          object DBEdit1: TDBEdit
            Tag = 1
            AlignWithMargins = True
            Left = 3
            Top = 49
            Width = 371
            Height = 19
            Align = alTop
            Color = cl3DLight
            DataField = 'CODCIDADE'
            DataSource = DtSrcControl
            ReadOnly = True
            TabOrder = 4
          end
          object DBEdit2: TDBEdit
            AlignWithMargins = True
            Left = 3
            Top = 90
            Width = 371
            Height = 19
            Align = alTop
            CharCase = ecUpperCase
            DataField = 'DESCRICAO'
            DataSource = DtSrcControl
            TabOrder = 5
          end
          object DBEdit3: TDBEdit
            AlignWithMargins = True
            Left = 3
            Top = 161
            Width = 371
            Height = 19
            Align = alTop
            DataField = 'CODIBGE'
            DataSource = DtSrcControl
            MaxLength = 10
            TabOrder = 6
          end
          object DBLookupComboBox1: TDBLookupComboBox
            AlignWithMargins = True
            Left = 3
            Top = 202
            Width = 371
            Height = 19
            Align = alTop
            DataField = 'CODUF'
            DataSource = DtSrcControl
            KeyField = 'CODUF'
            ListField = 'DESCRICAO'
            ListSource = DtSrcLookupState
            TabOrder = 7
          end
        end
      end
    end
  end
  inherited DtSrcControl: TDataSource
    DataSet = DMConnection.QueryCity
  end
  object DtSrcLookupState: TDataSource
    DataSet = DMConnection.QueryState
    Left = 496
    Top = 8
  end
end
