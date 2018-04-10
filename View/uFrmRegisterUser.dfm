inherited FrmRegisterUser: TFrmRegisterUser
  Caption = 'Cadastro de Usu'#225'rios'
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
            FieldName = 'CODFILIAL'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODUSUARIO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODPERFIL'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Width = 385
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EMAIL'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'TELEFONE'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'LOGIN'
            Width = 132
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SENHA'
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
            03040000003E0000000000000000000000FFFFFFFFFFFFFFFF00000000000000
            000000000001104400610064006F00730020005000720069006E006300690070
            006100690073003E0000000000000000000000FFFFFFFFFFFFFFFF0000000000
            0000000000000001104400610064006F0073002000410064006900630069006F
            006E00610069007300360000000000000000000000FFFFFFFFFFFFFFFF000000
            000000000000000000010C4F007500740072006F00730020004400610064006F
            007300320000000000000000000000FFFFFFFFFFFFFFFF000000000000000000
            000000010A45007300730065006E0063006900610069007300}
        end
      end
      inherited PnlRegisterClient: TPanel
        inherited SclBxData: TScrollBox
          VertScrollBar.Position = 71
          object Label1: TLabel [0]
            AlignWithMargins = True
            Left = 3
            Top = 115
            Width = 354
            Height = 13
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Telefone'
            ExplicitWidth = 42
          end
          object Label2: TLabel [1]
            AlignWithMargins = True
            Left = 3
            Top = 74
            Width = 354
            Height = 13
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Email'
            ExplicitWidth = 24
          end
          object Label3: TLabel [2]
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 354
            Height = 13
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Usu'#225'rio'
            ExplicitWidth = 36
          end
          object Label4: TLabel [3]
            AlignWithMargins = True
            Left = 3
            Top = -38
            Width = 354
            Height = 13
            Margins.Bottom = 0
            Align = alTop
            Caption = 'C'#243'digo'
            ExplicitWidth = 33
          end
          object LblLogin: TLabel [4]
            AlignWithMargins = True
            Left = 3
            Top = 186
            Width = 354
            Height = 13
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Login'
            ExplicitWidth = 25
          end
          object Label5: TLabel [5]
            AlignWithMargins = True
            Left = 3
            Top = 227
            Width = 354
            Height = 13
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Senha'
            ExplicitWidth = 30
          end
          object Label6: TLabel [6]
            AlignWithMargins = True
            Left = 3
            Top = 378
            Width = 354
            Height = 13
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Filial'
            ExplicitWidth = 20
          end
          object Label7: TLabel [7]
            AlignWithMargins = True
            Left = 3
            Top = 337
            Width = 354
            Height = 13
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Perfil'
            ExplicitWidth = 24
          end
          inherited PnlAdditionalData: TPanel
            Top = 41
            Width = 360
            ExplicitTop = 41
            ExplicitWidth = 360
          end
          inherited PnlMainData: TPanel
            Top = -71
            Width = 360
            ExplicitTop = -71
            ExplicitWidth = 360
          end
          inherited PnlOtherData: TPanel
            Top = 153
            Width = 360
            ExplicitTop = 153
            ExplicitWidth = 360
          end
          inherited PnlOtherInformation: TPanel
            Top = 304
            Width = 360
            Caption = 'Essenciais'
            ExplicitTop = 304
            ExplicitWidth = 360
          end
          object DBEdit2: TDBEdit
            AlignWithMargins = True
            Left = 3
            Top = 131
            Width = 354
            Height = 19
            Align = alTop
            DataField = 'TELEFONE'
            DataSource = DtSrcControl
            MaxLength = 15
            TabOrder = 4
          end
          object DBEdit3: TDBEdit
            AlignWithMargins = True
            Left = 3
            Top = 19
            Width = 354
            Height = 19
            Align = alTop
            CharCase = ecUpperCase
            DataField = 'NOME'
            DataSource = DtSrcControl
            TabOrder = 5
          end
          object DBEdit4: TDBEdit
            Tag = 1
            AlignWithMargins = True
            Left = 3
            Top = -22
            Width = 354
            Height = 19
            Align = alTop
            Color = cl3DLight
            DataField = 'CODUSUARIO'
            DataSource = DtSrcControl
            ReadOnly = True
            TabOrder = 6
          end
          object DBEdit1: TDBEdit
            AlignWithMargins = True
            Left = 3
            Top = 90
            Width = 354
            Height = 19
            Align = alTop
            CharCase = ecLowerCase
            DataField = 'EMAIL'
            DataSource = DtSrcControl
            TabOrder = 7
          end
          object DBEdtPassword: TDBEdit
            Tag = 1
            AlignWithMargins = True
            Left = 3
            Top = 282
            Width = 354
            Height = 19
            Align = alTop
            Color = cl3DLight
            DataField = 'SENHA'
            DataSource = DtSrcControl
            Enabled = False
            PasswordChar = '*'
            TabOrder = 8
          end
          object Button1: TButton
            AlignWithMargins = True
            Left = 3
            Top = 243
            Width = 354
            Height = 33
            Align = alTop
            Caption = 'Alterar Senha'
            TabOrder = 9
            OnClick = Button1Click
          end
          object DBEdit6: TDBEdit
            AlignWithMargins = True
            Left = 3
            Top = 202
            Width = 354
            Height = 19
            Align = alTop
            CharCase = ecUpperCase
            DataField = 'LOGIN'
            DataSource = DtSrcControl
            TabOrder = 10
          end
          object DBLookupComboBox1: TDBLookupComboBox
            AlignWithMargins = True
            Left = 3
            Top = 394
            Width = 354
            Height = 19
            Align = alTop
            DataField = 'CODFILIAL'
            DataSource = DtSrcControl
            KeyField = 'CODFILIAL'
            ListField = 'FILIAL'
            ListSource = DtSrcLookupBranch
            TabOrder = 11
          end
          object DBLookupComboBox2: TDBLookupComboBox
            AlignWithMargins = True
            Left = 3
            Top = 353
            Width = 354
            Height = 19
            Align = alTop
            DataField = 'CODPERFIL'
            DataSource = DtSrcControl
            KeyField = 'CODPERFIL'
            ListField = 'PERFIL'
            ListSource = DtSrcLookupProfile
            TabOrder = 12
          end
        end
      end
    end
  end
  inherited DtSrcControl: TDataSource
    DataSet = DMConnection.QueryUser
  end
  object DtSrcLookupProfile: TDataSource
    DataSet = DMConnection.QueryProfile
    Left = 488
    Top = 8
  end
  object DtSrcLookupBranch: TDataSource
    DataSet = DMConnection.QueryBranch
    Left = 592
    Top = 8
  end
end
