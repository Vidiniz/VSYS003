inherited FrmRegisterDepartment: TFrmRegisterDepartment
  Caption = 'Cadastro de Departamentos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PgCtrlMain: TPageControl
    ActivePage = TbShtRegister
    inherited TbShtSearch: TTabSheet
      inherited DBGrdControl: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'CODDEPARTAMENTO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Width = 648
            Visible = True
          end>
      end
    end
    inherited TbShtRegister: TTabSheet
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
            Caption = 'Departamento'
            FocusControl = DBEdit2
            ExplicitWidth = 69
          end
          inherited PnlAdditionalData: TPanel
            Top = 112
            Visible = False
            ExplicitTop = 112
          end
          inherited PnlOtherData: TPanel
            Top = 142
            Visible = False
            ExplicitTop = 142
          end
          inherited PnlOtherInformation: TPanel
            Top = 172
            Visible = False
            ExplicitTop = 172
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
            DataField = 'CODDEPARTAMENTO'
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
        end
      end
    end
  end
  inherited DtSrcControl: TDataSource
    DataSet = DMConnection.QueryDepartment
  end
end
