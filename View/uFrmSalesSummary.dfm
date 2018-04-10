object FrmSalesSummary: TFrmSalesSummary
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Resumo de Vendas'
  ClientHeight = 399
  ClientWidth = 588
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 588
    Height = 49
    Align = alTop
    Caption = 'Resumo de Vendas'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object DBGrid1: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 97
    Width = 582
    Height = 120
    Align = alTop
    DataSource = DtSrcHeader
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Panel2: TPanel
    Left = 0
    Top = 49
    Width = 588
    Height = 45
    Align = alTop
    Caption = 'Panel2'
    ShowCaption = False
    TabOrder = 2
    object Label1: TLabel
      Left = 4
      Top = 5
      Width = 53
      Height = 13
      Caption = 'Data Inicial'
    end
    object Label2: TLabel
      Left = 115
      Top = 5
      Width = 48
      Height = 13
      Caption = 'Data Final'
    end
    object DtPckInitial: TDateTimePicker
      Left = 4
      Top = 19
      Width = 105
      Height = 21
      Date = 43200.484067569440000000
      Time = 43200.484067569440000000
      TabOrder = 0
    end
    object DtPckEnd: TDateTimePicker
      Left = 115
      Top = 19
      Width = 105
      Height = 21
      Date = 43200.484067569440000000
      Time = 43200.484067569440000000
      TabOrder = 1
    end
    object BtnFilter: TButton
      Left = 226
      Top = 17
      Width = 75
      Height = 25
      Caption = 'Filtrar'
      TabOrder = 2
      OnClick = BtnFilterClick
    end
    object Button1: TButton
      Left = 304
      Top = 17
      Width = 75
      Height = 25
      Caption = 'Impirmir'
      TabOrder = 3
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 220
    Width = 588
    Height = 31
    Align = alTop
    Caption = 'Items do Pedido'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    ExplicitTop = 210
  end
  object DBGrid2: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 254
    Width = 582
    Height = 142
    Align = alClient
    DataSource = DtSrcDetail
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DtSrcHeader: TDataSource
    DataSet = DMConnection.QuerySumSalesHeader
    Left = 424
    Top = 8
  end
  object DtSrcDetail: TDataSource
    DataSet = DMConnection.QuerySumSalesItens
    Left = 496
    Top = 8
  end
end
