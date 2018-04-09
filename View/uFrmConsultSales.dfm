object FrmConsultSales: TFrmConsultSales
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Pedido de Venda'
  ClientHeight = 328
  ClientWidth = 576
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
    Top = 8
    Width = 47
    Height = 13
    Caption = 'N'#186' Pedido'
  end
  object Label2: TLabel
    Left = 111
    Top = 8
    Width = 20
    Height = 13
    Caption = 'Filial'
  end
  object Label3: TLabel
    Left = 111
    Top = 48
    Width = 33
    Height = 13
    Caption = 'Cliente'
  end
  object Label4: TLabel
    Left = 343
    Top = 8
    Width = 98
    Height = 13
    Caption = 'Plano de Pagamento'
  end
  object Label5: TLabel
    Left = 8
    Top = 48
    Width = 23
    Height = 13
    Caption = 'Data'
  end
  object Label6: TLabel
    Left = 343
    Top = 48
    Width = 39
    Height = 13
    Caption = 'Vl. Total'
  end
  object Label7: TLabel
    Left = 471
    Top = 48
    Width = 45
    Height = 13
    Caption = 'Desconto'
  end
  object DBGrid1: TDBGrid
    AlignWithMargins = True
    Left = 6
    Top = 94
    Width = 564
    Height = 228
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    Align = alBottom
    DataSource = DtSrcItems
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
        FieldName = 'NUMSEQ'
        Title.Caption = 'Seq.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODPRODUTO'
        Title.Caption = 'C'#243'd. Prod.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRICAO'
        Title.Caption = 'Descri'#231#227'o'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QTDE'
        Title.Caption = 'Qtde.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRECO'
        Title.Caption = 'Pre'#231'o'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODBARRAS'
        Title.Caption = 'Cod. Barras'
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VLDESC'
        Title.Caption = 'Vl. Desc'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOTALPRECO'
        Title.Caption = 'Pre'#231'o Total'
        Width = 111
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMPEDIDO'
        Visible = False
      end>
  end
  object DBEdit1: TDBEdit
    Left = 8
    Top = 24
    Width = 97
    Height = 21
    Color = cl3DLight
    DataField = 'NUMPEDIDO'
    DataSource = DtSrcHeader
    ReadOnly = True
    TabOrder = 1
  end
  object DBEdit2: TDBEdit
    Left = 111
    Top = 24
    Width = 42
    Height = 21
    Color = cl3DLight
    DataField = 'CODFILIAL'
    DataSource = DtSrcHeader
    ReadOnly = True
    TabOrder = 2
  end
  object DBEdit3: TDBEdit
    Left = 159
    Top = 24
    Width = 178
    Height = 21
    Color = cl3DLight
    DataField = 'FILIAL'
    DataSource = DtSrcHeader
    ReadOnly = True
    TabOrder = 3
  end
  object DBEdit4: TDBEdit
    Left = 111
    Top = 64
    Width = 42
    Height = 21
    Color = cl3DLight
    DataField = 'CODCLIENTE'
    DataSource = DtSrcHeader
    ReadOnly = True
    TabOrder = 4
  end
  object DBEdit5: TDBEdit
    Left = 159
    Top = 64
    Width = 178
    Height = 21
    Color = cl3DLight
    DataField = 'NOME'
    DataSource = DtSrcHeader
    ReadOnly = True
    TabOrder = 5
  end
  object DBEdit6: TDBEdit
    Left = 343
    Top = 24
    Width = 42
    Height = 21
    Color = cl3DLight
    DataField = 'CODPLANO'
    DataSource = DtSrcHeader
    ReadOnly = True
    TabOrder = 6
  end
  object DBEdit7: TDBEdit
    Left = 391
    Top = 24
    Width = 178
    Height = 21
    Color = cl3DLight
    DataField = 'DESCRICAO'
    DataSource = DtSrcHeader
    ReadOnly = True
    TabOrder = 7
  end
  object DBEdit8: TDBEdit
    Left = 8
    Top = 64
    Width = 97
    Height = 21
    Color = cl3DLight
    DataField = 'DATA'
    DataSource = DtSrcHeader
    ReadOnly = True
    TabOrder = 8
  end
  object DBEdit9: TDBEdit
    Left = 343
    Top = 64
    Width = 122
    Height = 21
    Color = cl3DLight
    DataField = 'VLTOTAL'
    DataSource = DtSrcHeader
    ReadOnly = True
    TabOrder = 9
  end
  object DBEdit10: TDBEdit
    Left = 471
    Top = 64
    Width = 97
    Height = 21
    Color = cl3DLight
    DataField = 'VLDESCONTO'
    DataSource = DtSrcHeader
    ReadOnly = True
    TabOrder = 10
  end
  object DtSrcHeader: TDataSource
    DataSet = DMConnection.QuerySalesHeaderCons
    Left = 496
    Top = 120
  end
  object DtSrcItems: TDataSource
    DataSet = DMConnection.QuerySalesItemsCons
    Left = 496
    Top = 184
  end
end
