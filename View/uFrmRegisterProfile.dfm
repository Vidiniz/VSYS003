inherited FrmRegisterProfile: TFrmRegisterProfile
  Caption = 'Cadastro de Perfis'
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
            FieldName = 'CODPERFIL'
            Width = 63
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PERFIL'
            Width = 648
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
            ExplicitWidth = 46
          end
          object Label3: TLabel [2]
            AlignWithMargins = True
            Left = 3
            Top = 145
            Width = 371
            Height = 13
            Align = alTop
            Caption = 'Permiss'#245'es de Acesso'
            ExplicitWidth = 105
          end
          inherited PnlAdditionalData: TPanel
            Top = 112
            Visible = False
            ExplicitTop = 112
          end
          inherited PnlOtherData: TPanel
            Top = 411
            Visible = False
            ExplicitTop = 142
          end
          inherited PnlOtherInformation: TPanel
            Top = 441
            Visible = False
            ExplicitTop = 172
          end
          object DEdtCode: TDBEdit
            Tag = 1
            AlignWithMargins = True
            Left = 3
            Top = 49
            Width = 371
            Height = 19
            Align = alTop
            Color = cl3DLight
            DataField = 'CODPERFIL'
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
            DataField = 'PERFIL'
            DataSource = DtSrcControl
            TabOrder = 5
          end
          object DBGrid1: TDBGrid
            AlignWithMargins = True
            Left = 3
            Top = 164
            Width = 371
            Height = 213
            Align = alTop
            DataSource = DtSrcDetailControl
            Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            PopupMenu = PpMnSelectAll
            TabOrder = 6
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'CODPERMISSAO'
                Width = -1
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'DESCRICAO'
                ReadOnly = True
                Width = 286
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FUNCAO'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'STATUS'
                PickList.Strings = (
                  'S'
                  'N')
                Width = 77
                Visible = True
              end>
          end
          object BtnPermissionList: TButton
            AlignWithMargins = True
            Left = 3
            Top = 383
            Width = 371
            Height = 25
            Align = alTop
            Caption = 'Carregar Permiss'#245'es'
            TabOrder = 7
            OnClick = BtnPermissionListClick
            ExplicitLeft = 136
            ExplicitTop = 208
            ExplicitWidth = 75
          end
        end
      end
    end
  end
  inherited DtSrcControl: TDataSource
    DataSet = DMConnection.QueryProfile
  end
  object DtSrcDetailControl: TDataSource
    DataSet = DMConnection.QueryPermission
    Left = 480
    Top = 8
  end
  object PpMnSelectAll: TPopupMenu
    Left = 560
    Top = 8
    object SelectAll: TMenuItem
      Caption = 'Selecionar Todos'
      OnClick = SelectAllClick
    end
    object ClearSelect: TMenuItem
      Caption = 'Apagar Sele'#231#227'o'
      OnClick = ClearSelectClick
    end
  end
end
