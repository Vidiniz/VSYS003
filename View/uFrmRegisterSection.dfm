inherited FrmRegisterSection: TFrmRegisterSection
  Caption = 'Cadastro de Se'#231#245'es'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PgCtrlMain: TPageControl
    ActivePage = TbShtRegister
    inherited TbShtSearch: TTabSheet
      inherited DBGrdControl: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'CODSECAO'
            Width = 74
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODDEPARTAMENTO'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Width = 638
            Visible = True
          end>
      end
    end
    inherited TbShtRegister: TTabSheet
      inherited PnlRegisterLeft: TPanel
        inherited TrVwTopics: TTreeView
          Items.NodeData = {
            03020000003E0000000000000000000000FFFFFFFFFFFFFFFF00000000000000
            000000000001104400610064006F00730020005000720069006E006300690070
            006100690073003C0000000000000000000000FFFFFFFFFFFFFFFF0000000000
            00000000000000010F4400610064006F007300410064006900630069006F006E
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
            Top = 145
            Width = 371
            Height = 13
            Margins.Bottom = 0
            Align = alTop
            Caption = 'C'#243'd. Departamento'
            ExplicitWidth = 95
          end
          object Label3: TLabel [2]
            AlignWithMargins = True
            Left = 3
            Top = 74
            Width = 371
            Height = 13
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Descri'#231#227'o'
            FocusControl = DBEdit3
            ExplicitWidth = 46
          end
          inherited PnlAdditionalData: TPanel
            Top = 112
            ExplicitTop = 112
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
            DataField = 'CODSECAO'
            DataSource = DtSrcControl
            ReadOnly = True
            TabOrder = 4
          end
          object DBEdit3: TDBEdit
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
          object DBLookupComboBox1: TDBLookupComboBox
            AlignWithMargins = True
            Left = 3
            Top = 161
            Width = 371
            Height = 19
            Align = alTop
            DataField = 'CODDEPARTAMENTO'
            DataSource = DtSrcControl
            KeyField = 'CODDEPARTAMENTO'
            ListField = 'DESCRICAO'
            ListSource = DtSrcLookupDepartment
            TabOrder = 6
          end
        end
      end
    end
  end
  inherited DtSrcControl: TDataSource
    DataSet = DMConnection.QuerySection
  end
  object DtSrcLookupDepartment: TDataSource
    DataSet = DMConnection.QueryDepartment
    Left = 496
    Top = 8
  end
end
