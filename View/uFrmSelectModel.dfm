object FrmSelectModel: TFrmSelectModel
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'FrmSelectModel'
  ClientHeight = 484
  ClientWidth = 401
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PnlTitle: TPanel
    Left = 0
    Top = 0
    Width = 401
    Height = 41
    Align = alTop
    Caption = 'SelectModel'
    Color = clHighlight
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
  end
  object DBGrdSelect: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 76
    Width = 395
    Height = 364
    Align = alClient
    DataSource = DtSrcControl
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object PnlSearch: TPanel
    Left = 0
    Top = 41
    Width = 401
    Height = 32
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object EdtSearch: TEdit
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 314
      Height = 26
      Align = alClient
      TabOrder = 0
      TextHint = 'VALOR PESQUISADO'
      ExplicitHeight = 21
    end
    object BtnSearch: TButton
      AlignWithMargins = True
      Left = 323
      Top = 1
      Width = 75
      Height = 30
      Margins.Top = 1
      Margins.Bottom = 1
      Align = alRight
      Caption = 'Pesquisar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = BtnSearchClick
    end
  end
  object PnlBottom: TPanel
    Left = 0
    Top = 443
    Width = 401
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'Panel2'
    TabOrder = 3
    object BtnSelect: TButton
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 395
      Height = 35
      Align = alClient
      Caption = 'Selecionar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
  end
  object DtSrcControl: TDataSource
    Left = 328
    Top = 104
  end
end
