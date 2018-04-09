object FrmSelectionClient: TFrmSelectionClient
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Selecione Cliente'
  ClientHeight = 511
  ClientWidth = 704
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PnlTitle: TPanel
    Left = 0
    Top = 0
    Width = 704
    Height = 25
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Clientes Ativos'
    Color = clGradientActiveCaption
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    ExplicitWidth = 417
  end
  object PnlSearch: TPanel
    Left = 0
    Top = 25
    Width = 704
    Height = 25
    Align = alTop
    BevelOuter = bvNone
    Caption = 'PnlSearch'
    ShowCaption = False
    TabOrder = 1
    ExplicitWidth = 587
    object EdtSearchValue: TEdit
      AlignWithMargins = True
      Left = 111
      Top = 3
      Width = 509
      Height = 21
      Margins.Bottom = 1
      Align = alClient
      CharCase = ecUpperCase
      TabOrder = 0
    end
    object BtnSearch: TButton
      AlignWithMargins = True
      Left = 626
      Top = 1
      Width = 75
      Height = 24
      Margins.Top = 1
      Margins.Bottom = 0
      Align = alRight
      Caption = 'Pesquisar'
      TabOrder = 1
      OnClick = BtnSearchClick
      ExplicitLeft = 504
    end
    object CmbBxSearchFields: TComboBox
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 102
      Height = 22
      Align = alLeft
      Style = csOwnerDrawFixed
      TabOrder = 2
    end
  end
  object DBGrdClients: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 53
    Width = 698
    Height = 410
    Align = alClient
    DataSource = DtSrcData
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrdClientsDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'CODCLIENTE'
        Title.Caption = 'C'#243'dig'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Nome/Raz'#227'o Social'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMEFANTASIA'
        Title.Caption = 'Nome Fantasia'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CGC'
        Title.Caption = 'CPF/CNPJ'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO'
        Title.Caption = 'Tipo Pessoa'
        Width = 70
        Visible = True
      end>
  end
  object BtnSelection: TButton
    AlignWithMargins = True
    Left = 3
    Top = 469
    Width = 698
    Height = 39
    Align = alBottom
    Caption = 'Selecionar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = BtnSelectionClick
    ExplicitLeft = 0
    ExplicitTop = 472
    ExplicitWidth = 417
  end
  object DtSrcData: TDataSource
    DataSet = DMConnection.QueryOtherConsult
    Left = 456
  end
end
