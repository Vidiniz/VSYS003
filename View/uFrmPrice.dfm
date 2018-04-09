object FrmPrice: TFrmPrice
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Pre'#231'o'
  ClientHeight = 292
  ClientWidth = 632
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 13
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object Label2: TLabel
    Left = 87
    Top = 13
    Width = 46
    Height = 13
    Caption = 'Descri'#231#227'o'
  end
  object EdtCode: TEdit
    Left = 8
    Top = 32
    Width = 73
    Height = 21
    NumbersOnly = True
    TabOrder = 0
  end
  object EdtDescription: TEdit
    Left = 87
    Top = 32
    Width = 250
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 1
  end
  object BtnSearch: TButton
    Left = 343
    Top = 22
    Width = 97
    Height = 31
    Caption = 'Pesquisar'
    TabOrder = 2
    OnClick = BtnSearchClick
  end
  object DBGrdControl: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 62
    Width = 626
    Height = 227
    Align = alBottom
    DataSource = DtSrcControl
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrdControlDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'CODPRODUTO'
        Title.Caption = 'C'#243'digo'
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRICAO'
        Title.Caption = 'Descri'#231#227'o'
        Width = 204
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODFABRICA'
        Title.Caption = 'C'#243'd. F'#225'brica'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODBARRAS'
        Title.Caption = 'C'#243'd. Barras'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUSTO'
        Title.Caption = 'Custo'
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PVENDA'
        Title.Caption = 'P. Venda'
        Width = 89
        Visible = True
      end>
  end
  object DtSrcControl: TDataSource
    DataSet = DMConnection.QueryConsultPrice
    Left = 568
    Top = 16
  end
end
