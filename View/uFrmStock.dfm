object FrmStock: TFrmStock
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Estoque de Produtos'
  ClientHeight = 409
  ClientWidth = 773
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
  object DBGridResult: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 128
    Width = 767
    Height = 278
    Align = alBottom
    DataSource = DtSrcControl
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'CODPRODUTO'
        Title.Caption = 'C'#243'd. Prod.'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRICAO'
        Title.Caption = 'Descri'#231#227'o'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODFABRICA'
        Title.Caption = 'C'#243'd. F'#225'brica'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODBARRAS'
        Title.Caption = 'C'#243'd. Barras'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QTDE'
        Title.Caption = 'Qtde.'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUSTO'
        Title.Caption = 'Custo'
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODFORNECEDOR'
        Title.Caption = 'C'#243'd. Fornecedor'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Fornecedor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODDEPARTAMENTO'
        Title.Caption = 'C'#243'd. Dept.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRICAO_1'
        Title.Caption = 'Departamento'
        Visible = True
      end>
  end
  object LblEdtCode: TLabeledEdit
    Left = 8
    Top = 32
    Width = 81
    Height = 21
    EditLabel.Width = 33
    EditLabel.Height = 13
    EditLabel.Caption = 'C'#243'digo'
    TabOrder = 1
  end
  object LblEdtDescription: TLabeledEdit
    Left = 95
    Top = 32
    Width = 298
    Height = 21
    EditLabel.Width = 46
    EditLabel.Height = 13
    EditLabel.Caption = 'Descri'#231#227'o'
    TabOrder = 2
  end
  object LblEdtFactoryCode: TLabeledEdit
    Left = 399
    Top = 32
    Width = 138
    Height = 21
    EditLabel.Width = 61
    EditLabel.Height = 13
    EditLabel.Caption = 'C'#243'd. F'#225'brica'
    TabOrder = 3
  end
  object LblEdtBarCode: TLabeledEdit
    Left = 543
    Top = 32
    Width = 222
    Height = 21
    EditLabel.Width = 57
    EditLabel.Height = 13
    EditLabel.Caption = 'C'#243'd. Barras'
    TabOrder = 4
  end
  object BtnSearch: TButton
    Left = 632
    Top = 69
    Width = 133
    Height = 40
    Caption = 'Pesquisar'
    TabOrder = 5
    OnClick = BtnSearchClick
  end
  object Panel1: TPanel
    Left = 8
    Top = 65
    Width = 297
    Height = 48
    BevelOuter = bvNone
    Caption = 'Panel1'
    ShowCaption = False
    TabOrder = 6
    object Label3: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 291
      Height = 13
      Align = alTop
      Caption = 'Fornecedor'
      ExplicitWidth = 55
    end
    object SpdBtnProvider: TSpeedButton
      AlignWithMargins = True
      Left = 45
      Top = 22
      Width = 23
      Height = 23
      Margins.Left = 1
      Margins.Right = 1
      Align = alLeft
      Caption = '...'
      OnClick = SpdBtnProviderClick
      ExplicitLeft = 47
      ExplicitTop = 8
      ExplicitHeight = 22
    end
    object EdtProviderName: TEdit
      AlignWithMargins = True
      Left = 70
      Top = 22
      Width = 224
      Height = 23
      Margins.Left = 1
      Align = alClient
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 0
      ExplicitHeight = 21
    end
    object EdtProviderCode: TEdit
      AlignWithMargins = True
      Left = 3
      Top = 22
      Width = 40
      Height = 23
      Margins.Right = 1
      Align = alLeft
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 1
      ExplicitHeight = 21
    end
  end
  object Panel2: TPanel
    Left = 311
    Top = 65
    Width = 297
    Height = 48
    BevelOuter = bvNone
    Caption = 'Panel1'
    ShowCaption = False
    TabOrder = 7
    object Label1: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 291
      Height = 13
      Align = alTop
      Caption = 'Departamento'
      ExplicitWidth = 69
    end
    object SpdBtnDepartment: TSpeedButton
      AlignWithMargins = True
      Left = 45
      Top = 22
      Width = 23
      Height = 23
      Margins.Left = 1
      Margins.Right = 1
      Align = alLeft
      Caption = '...'
      OnClick = SpdBtnDepartmentClick
      ExplicitLeft = 47
      ExplicitTop = 8
      ExplicitHeight = 22
    end
    object EdtDepartmentName: TEdit
      AlignWithMargins = True
      Left = 70
      Top = 22
      Width = 224
      Height = 23
      Margins.Left = 1
      Align = alClient
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 0
      ExplicitHeight = 21
    end
    object EdtDepartmentCode: TEdit
      AlignWithMargins = True
      Left = 3
      Top = 22
      Width = 40
      Height = 23
      Margins.Right = 1
      Align = alLeft
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 1
      ExplicitHeight = 21
    end
  end
  object DtSrcControl: TDataSource
    DataSet = DMConnection.QueryOtherConsult
    Left = 704
    Top = 160
  end
end
