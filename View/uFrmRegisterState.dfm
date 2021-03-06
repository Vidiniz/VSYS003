inherited FrmRegisterState: TFrmRegisterState
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
            FieldName = 'CODUF'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Width = 560
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UF'
            Width = 87
            Visible = True
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
            03010000003E0000000000000000000000FFFFFFFFFFFFFFFF00000000000000
            000000000001104400610064006F00730020005000720069006E006300690070
            00610069007300}
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
            Top = 115
            Width = 371
            Height = 13
            Margins.Bottom = 0
            Align = alTop
            Caption = 'UF'
            FocusControl = DBEdit3
            ExplicitWidth = 13
          end
          inherited PnlAdditionalData: TPanel
            Top = 153
            Visible = False
            ExplicitTop = 153
          end
          inherited PnlOtherData: TPanel
            Top = 183
            Visible = False
            ExplicitTop = 183
          end
          inherited PnlOtherInformation: TPanel
            Top = 213
            Visible = False
            ExplicitTop = 213
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
            DataField = 'CODUF'
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
            Top = 131
            Width = 371
            Height = 19
            Align = alTop
            CharCase = ecUpperCase
            DataField = 'UF'
            DataSource = DtSrcControl
            TabOrder = 6
          end
        end
      end
    end
  end
  inherited DtSrcControl: TDataSource
    DataSet = DMConnection.QueryState
  end
end
