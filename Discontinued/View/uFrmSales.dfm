object FrmSales: TFrmSales
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'PDV'
  ClientHeight = 572
  ClientWidth = 814
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PnlTitle: TPanel
    Left = 0
    Top = 0
    Width = 814
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Pedido de Venda'
    Color = clHighlight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
  end
  object PgCtrlMain: TPageControl
    Left = 0
    Top = 41
    Width = 814
    Height = 512
    ActivePage = TbShtSearch
    Align = alClient
    TabOrder = 1
    object TbShtSearch: TTabSheet
      Caption = 'Search'
      TabVisible = False
      object PnlSeach: TPanel
        Left = 0
        Top = 0
        Width = 806
        Height = 27
        Align = alTop
        BevelOuter = bvNone
        Caption = 'PnlSeach'
        ShowCaption = False
        TabOrder = 0
        object EdtSearch: TEdit
          AlignWithMargins = True
          Left = 127
          Top = 3
          Width = 580
          Height = 21
          Align = alClient
          TabOrder = 0
          TextHint = 'VALOR DA PESQUISA'
          OnEnter = OnEnterEdit
          OnExit = OnExitEdit
        end
        object BtnSearch: TButton
          AlignWithMargins = True
          Left = 713
          Top = 0
          Width = 90
          Height = 27
          Margins.Top = 0
          Margins.Bottom = 0
          Align = alRight
          Caption = 'Pesquisar'
          TabOrder = 1
          OnClick = BtnSearchClick
        end
        object CmbBxTySearch: TComboBox
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 118
          Height = 22
          Align = alLeft
          Style = csOwnerDrawFixed
          TabOrder = 2
        end
      end
      object DBGrdSearch: TDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 30
        Width = 715
        Height = 251
        Align = alClient
        DataSource = DtSrcClient
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'CODCLIENTE'
            Width = 46
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOMEFANTASIA'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CGC'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'INSCMUN'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'INSCEST'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'EMAILCOB'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'EMAILNFE'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'ENDERECO'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'NUMERO'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'COMPLEMENTO'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'BAIRRO'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'CIDADE'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'UF'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'CODATIVIDAE'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'DTCADASTRO'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'DTULTALT'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'CODCIDADE'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'TEL1'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'TEL2'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'TEL3'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'CEP'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'OBS'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'TIPO'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'CODUSURCAD'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'CODUSURALTER'
            Visible = False
          end>
      end
      object PnlSalesDetail: TPanel
        Left = 0
        Top = 284
        Width = 806
        Height = 218
        Align = alBottom
        Caption = 'PnlSalesDetail'
        ShowCaption = False
        TabOrder = 2
        object PnlSearchRight: TPanel
          Left = 609
          Top = 25
          Width = 196
          Height = 192
          Align = alRight
          BevelOuter = bvNone
          Caption = 'PnlSearchRight'
          ShowCaption = False
          TabOrder = 0
          object Button2: TButton
            AlignWithMargins = True
            Left = 3
            Top = 65
            Width = 190
            Height = 25
            Align = alTop
            Caption = 'Imprimir'
            TabOrder = 0
          end
          object Button3: TButton
            AlignWithMargins = True
            Left = 3
            Top = 34
            Width = 190
            Height = 25
            Align = alTop
            Caption = 'Cancelar'
            TabOrder = 1
          end
          object Button4: TButton
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 190
            Height = 25
            Align = alTop
            Caption = 'Alterar'
            TabOrder = 2
          end
        end
        object PnlSearchLeft: TPanel
          Left = 1
          Top = 25
          Width = 608
          Height = 192
          Align = alClient
          BevelOuter = bvNone
          Caption = 'PnlSearchLeft'
          ShowCaption = False
          TabOrder = 1
          object DBGrdSales: TDBGrid
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 602
            Height = 186
            Align = alClient
            DataSource = DtSrcSales
            Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
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
                FieldName = 'NUMPEDIDO'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CODFILIAL'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FILIAL'
                Width = 99
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CODCLIENTE'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NOME'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CODPLANO'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DESCRICAO'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DATA'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VLTOTAL'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VLDESCONTO'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'STATUS'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DTCANCEL'
                Visible = True
              end>
          end
        end
        object Panel3: TPanel
          Left = 1
          Top = 1
          Width = 804
          Height = 24
          Align = alTop
          BevelOuter = bvNone
          Caption = 'Pedidos'
          Color = clHighlight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentBackground = False
          ParentFont = False
          TabOrder = 2
        end
      end
      object PnlTolBar: TPanel
        Left = 721
        Top = 27
        Width = 85
        Height = 257
        Align = alRight
        BevelOuter = bvNone
        Caption = 'PnlTolBar'
        ShowCaption = False
        TabOrder = 3
        object BtnNewSale: TButton
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 79
          Height = 25
          Align = alTop
          Caption = 'Novo Pedido'
          TabOrder = 0
          OnClick = BtnNewSaleClick
        end
      end
    end
    object TbShtRegister: TTabSheet
      Caption = 'Register'
      ImageIndex = 1
      TabVisible = False
      object PnlRegiterTop: TPanel
        Left = 0
        Top = 0
        Width = 806
        Height = 42
        Align = alTop
        BevelOuter = bvNone
        Caption = 'PnlRegiterTop'
        ShowCaption = False
        TabOrder = 0
        object Label1: TLabel
          Left = 99
          Top = 0
          Width = 33
          Height = 13
          Caption = 'C'#243'digo'
        end
        object Label2: TLabel
          Left = 178
          Top = 0
          Width = 97
          Height = 13
          Caption = 'Nome / Raz'#227'o Social'
        end
        object Label3: TLabel
          Left = 394
          Top = -1
          Width = 54
          Height = 13
          Caption = 'CPF / CNPJ'
        end
        object Label4: TLabel
          Left = 3
          Top = 0
          Width = 47
          Height = 13
          Caption = 'N'#186' Pedido'
        end
        object Label16: TLabel
          Left = 521
          Top = -1
          Width = 20
          Height = 13
          Caption = 'Filial'
        end
        object Label17: TLabel
          Left = 583
          Top = -1
          Width = 23
          Height = 13
          Caption = 'Data'
        end
        object EdtNumberSale: TEdit
          Tag = 1
          Left = 3
          Top = 19
          Width = 90
          Height = 21
          Color = cl3DLight
          ReadOnly = True
          TabOrder = 0
        end
        object DtTmPckDate: TDateTimePicker
          Left = 583
          Top = 19
          Width = 107
          Height = 21
          Date = 43136.756366944440000000
          Time = 43136.756366944440000000
          TabOrder = 1
          OnClick = DtTmPckDateClick
        end
        object EdtClientCode: TEdit
          Tag = 1
          Left = 99
          Top = 19
          Width = 73
          Height = 21
          Color = cl3DLight
          ReadOnly = True
          TabOrder = 2
        end
        object EdtClientName: TEdit
          Tag = 1
          Left = 178
          Top = 19
          Width = 199
          Height = 21
          Color = cl3DLight
          ReadOnly = True
          TabOrder = 3
        end
        object EdtClientDoc: TEdit
          Tag = 1
          Left = 383
          Top = 19
          Width = 132
          Height = 21
          Color = cl3DLight
          ReadOnly = True
          TabOrder = 4
        end
        object DBLkpCmbBxBranch: TDBLookupComboBox
          Left = 521
          Top = 19
          Width = 56
          Height = 21
          KeyField = 'CODFILIAL'
          ListField = 'FILIAL'
          ListSource = DtSrcBranch
          TabOrder = 5
          OnClick = DBLkpCmbBxBranchClick
        end
      end
      object PnlTitleItens: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 45
        Width = 800
        Height = 24
        Align = alTop
        BevelOuter = bvNone
        Caption = 'Produtos'
        Color = clHighlight
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 1
      end
      object PnlSearchItens: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 75
        Width = 800
        Height = 37
        Align = alTop
        BevelOuter = bvNone
        Caption = 'PnlSearchItens'
        ShowCaption = False
        TabOrder = 2
        object Label5: TLabel
          Left = 0
          Top = 0
          Width = 33
          Height = 13
          Caption = 'C'#243'digo'
        end
        object Label6: TLabel
          Left = 71
          Top = 0
          Width = 46
          Height = 13
          Caption = 'Descri'#231#227'o'
        end
        object Label7: TLabel
          Left = 287
          Top = 0
          Width = 61
          Height = 13
          Caption = 'C'#243'd. F'#225'brica'
        end
        object Label8: TLabel
          Left = 391
          Top = 0
          Width = 57
          Height = 13
          Caption = 'C'#243'd. Barras'
        end
        object EdtSearchCode: TEdit
          Left = 0
          Top = 16
          Width = 65
          Height = 21
          CharCase = ecUpperCase
          NumbersOnly = True
          TabOrder = 0
          OnMouseEnter = OnEnterEdit
          OnMouseLeave = OnExitEdit
        end
        object EdtDescription: TEdit
          Left = 71
          Top = 16
          Width = 210
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 1
          OnMouseEnter = OnEnterEdit
          OnMouseLeave = OnExitEdit
        end
        object EdtFactoryCode: TEdit
          Left = 287
          Top = 16
          Width = 98
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 2
          OnMouseEnter = OnEnterEdit
          OnMouseLeave = OnExitEdit
        end
        object EdtBarCode: TEdit
          Left = 391
          Top = 16
          Width = 155
          Height = 21
          CharCase = ecUpperCase
          NumbersOnly = True
          TabOrder = 3
          OnMouseEnter = OnEnterEdit
          OnMouseLeave = OnExitEdit
        end
        object BtnSearchProd: TButton
          Left = 709
          Top = 8
          Width = 87
          Height = 29
          Caption = 'Pesquisar'
          TabOrder = 4
          OnClick = BtnSearchProdClick
        end
      end
      object DBGrdProd: TDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 118
        Width = 800
        Height = 96
        Align = alTop
        DataSource = DtSrcProduct
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgTitleClick, dgTitleHotTrack]
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = DBGrdProdDblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'CODPRODUTO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Width = 64
            Visible = True
          end
          item
            DropDownRows = 3
            Expanded = False
            FieldName = 'PVENDA'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODFORNECEDOR'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODFABRICA'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTUNITCX'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODBARRAS'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTDE'
            Width = 64
            Visible = True
          end>
      end
      object PnlItens: TPanel
        Left = 0
        Top = 258
        Width = 806
        Height = 24
        Align = alTop
        AutoSize = True
        BevelOuter = bvNone
        Caption = 'Pedido'
        Color = clHighlight
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 4
      end
      object LstVwProducts: TListView
        AlignWithMargins = True
        Left = 3
        Top = 285
        Width = 566
        Height = 176
        Align = alClient
        Columns = <
          item
            Caption = 'Seq.'
            MaxWidth = 40
            MinWidth = 40
            Width = 40
          end
          item
            Caption = 'C'#243'digo'
            MaxWidth = 50
            MinWidth = 50
          end
          item
            Caption = 'Descri'#231#227'o'
            MaxWidth = 250
            MinWidth = 250
            Width = 250
          end
          item
            Caption = 'Qtde.'
            MaxWidth = 60
            MinWidth = 60
            Width = 60
          end
          item
            Caption = 'Pr. Unit'
            MaxWidth = 80
            MinWidth = 80
            Width = 80
          end
          item
            Caption = 'Pr. Total'
            MaxWidth = 80
            MinWidth = 80
            Width = 80
          end>
        Ctl3D = False
        ReadOnly = True
        RowSelect = True
        SortType = stText
        TabOrder = 5
        ViewStyle = vsReport
        OnKeyDown = LstVwProductsKeyDown
      end
      object PnlHeaderSales: TPanel
        Left = 572
        Top = 282
        Width = 234
        Height = 182
        Align = alRight
        BevelOuter = bvNone
        Caption = 'PnlHeaderSales'
        ShowCaption = False
        TabOrder = 6
        object PnlTitleHeader: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 228
          Height = 24
          Align = alTop
          BevelOuter = bvNone
          Caption = 'Totais do Pedido'
          Color = clHighlight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
        end
        object PnlHeaderRight: TPanel
          Left = 140
          Top = 30
          Width = 94
          Height = 94
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 1
          object LblTotalSale: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 88
            Height = 19
            Align = alTop
            Caption = 'R$'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ExplicitWidth = 19
          end
          object LblTotalOriginal: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 72
            Width = 88
            Height = 16
            Align = alTop
            Caption = 'R$'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ExplicitWidth = 15
          end
          object LblTotalDiscount: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 50
            Width = 88
            Height = 16
            Align = alTop
            Caption = 'R$'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ExplicitWidth = 15
          end
          object Label24: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 28
            Width = 88
            Height = 16
            Align = alTop
            Caption = '--------------'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitWidth = 84
          end
        end
        object PnlHeaderClient: TPanel
          Left = 0
          Top = 30
          Width = 140
          Height = 94
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 2
          object Label9: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 28
            Width = 134
            Height = 16
            Align = alTop
            Caption = '---------------------'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitWidth = 126
          end
          object Label19: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 134
            Height = 19
            Align = alTop
            Caption = 'Total do Pedido'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitWidth = 129
          end
          object Label21: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 50
            Width = 134
            Height = 16
            Align = alTop
            Caption = 'Total de Desc.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitWidth = 91
          end
          object Label23: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 72
            Width = 134
            Height = 16
            Align = alTop
            Caption = 'SubTotal do Pedido'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitWidth = 123
          end
        end
        object PnlHeaderPlan: TPanel
          Left = 0
          Top = 124
          Width = 234
          Height = 58
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 3
          object Label18: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 228
            Height = 16
            Align = alTop
            Caption = 'Plano de Pagamento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitWidth = 132
          end
          object DBLkpCmbBxPayPlan: TDBLookupComboBox
            AlignWithMargins = True
            Left = 3
            Top = 25
            Width = 228
            Height = 21
            Align = alTop
            KeyField = 'CODPLANO'
            ListField = 'DESCRICAO'
            ListSource = DtSrcPlanPay
            TabOrder = 0
            OnClick = DBLkpCmbBxPayPlanClick
            ExplicitLeft = 17
            ExplicitWidth = 145
          end
        end
      end
      object PnlRegisterBottom: TPanel
        Left = 0
        Top = 464
        Width = 806
        Height = 38
        Align = alBottom
        BevelOuter = bvNone
        Caption = 'PnlRegisterBottom'
        ShowCaption = False
        TabOrder = 7
        object BtnSave: TButton
          AlignWithMargins = True
          Left = 723
          Top = 3
          Width = 80
          Height = 32
          Align = alRight
          Caption = 'Salvar'
          ImageIndex = 2
          ImageMargins.Left = 5
          Images = ImgLstSales
          TabOrder = 0
          OnClick = BtnSaveClick
          ExplicitTop = 4
        end
        object BtnCancel: TButton
          AlignWithMargins = True
          Left = 637
          Top = 3
          Width = 80
          Height = 32
          Align = alRight
          Caption = 'Cancelar'
          ImageIndex = 3
          ImageMargins.Left = 5
          Images = ImgLstSales
          TabOrder = 1
          OnClick = BtnCancelClick
        end
      end
      object PnlProductReg: TPanel
        Left = 0
        Top = 217
        Width = 806
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        Caption = 'PnlProductReg'
        ShowCaption = False
        TabOrder = 8
        object Label10: TLabel
          Left = 4
          Top = 0
          Width = 33
          Height = 13
          Caption = 'C'#243'digo'
        end
        object Label11: TLabel
          Left = 74
          Top = 0
          Width = 46
          Height = 13
          Caption = 'Descri'#231#227'o'
        end
        object Label12: TLabel
          Left = 290
          Top = 0
          Width = 56
          Height = 13
          Caption = 'Quantidade'
        end
        object Label13: TLabel
          Left = 506
          Top = 0
          Width = 53
          Height = 13
          Caption = 'Pre'#231'o Unit.'
        end
        object Label14: TLabel
          Left = 583
          Top = 0
          Width = 59
          Height = 13
          Caption = 'Desconto %'
        end
        object Label15: TLabel
          Left = 660
          Top = 0
          Width = 54
          Height = 13
          Caption = 'Pre'#231'o Total'
        end
        object EdtRegDescription: TEdit
          Tag = 1
          Left = 74
          Top = 14
          Width = 210
          Height = 21
          CharCase = ecUpperCase
          Color = cl3DLight
          ReadOnly = True
          TabOrder = 0
          OnEnter = OnEnterEdit
          OnExit = OnExitEdit
        end
        object EdtRegAmount: TEdit
          Left = 290
          Top = 14
          Width = 71
          Height = 21
          CharCase = ecUpperCase
          NumbersOnly = True
          TabOrder = 1
          OnEnter = OnEnterEdit
          OnExit = OnExitEdit
        end
        object RdGrpTypeDesc: TRadioGroup
          Left = 367
          Top = 0
          Width = 133
          Height = 35
          Caption = 'Tipo Desconto'
          Columns = 2
          Items.Strings = (
            'Pre'#231'o'
            'Desconto')
          TabOrder = 2
          OnClick = RdGrpTypeDescClick
        end
        object EdtRegPriceUnit: TEdit
          Left = 506
          Top = 14
          Width = 71
          Height = 21
          CustomHint = BlnHntMessage
          CharCase = ecUpperCase
          TabOrder = 3
          OnEnter = OnEnterEdit
          OnExit = OnExitEdit
          OnKeyPress = EdtRegPriceUnitKeyPress
        end
        object EdtRegDiscount: TEdit
          Left = 583
          Top = 14
          Width = 71
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 4
          OnEnter = OnEnterEdit
          OnExit = OnExitEdit
          OnKeyPress = EdtRegDiscountKeyPress
        end
        object EdtRegTotalPrice: TEdit
          Tag = 1
          Left = 660
          Top = 14
          Width = 71
          Height = 21
          CharCase = ecUpperCase
          Color = cl3DLight
          ReadOnly = True
          TabOrder = 5
          OnEnter = OnEnterEdit
          OnExit = OnExitEdit
        end
        object BtnRegInc: TButton
          Left = 769
          Top = 7
          Width = 34
          Height = 32
          ImageAlignment = iaCenter
          ImageIndex = 0
          Images = ImgLstSales
          TabOrder = 6
          OnClick = BtnRegIncClick
        end
        object EdtRegCode: TEdit
          Left = 4
          Top = 14
          Width = 64
          Height = 21
          CharCase = ecUpperCase
          NumbersOnly = True
          ReadOnly = True
          TabOrder = 7
          OnEnter = OnEnterEdit
          OnExit = OnExitEdit
        end
        object BtnRegCancel: TButton
          Left = 734
          Top = 7
          Width = 34
          Height = 32
          ImageAlignment = iaCenter
          ImageIndex = 1
          Images = ImgLstSales
          TabOrder = 8
          OnClick = BtnRegCancelClick
        end
      end
    end
  end
  object StsBrData: TStatusBar
    Left = 0
    Top = 553
    Width = 814
    Height = 19
    Panels = <>
  end
  object DtSrcClient: TDataSource
    DataSet = DMConnection.QueryClient
    Left = 512
    Top = 8
  end
  object DtSrcProduct: TDataSource
    DataSet = DMConnection.QueryOtherConsult
    Left = 648
    Top = 8
  end
  object DtSrcSales: TDataSource
    DataSet = DMConnection.QuerySalesHeader
    Left = 576
    Top = 8
  end
  object DtSrcBranch: TDataSource
    DataSet = DMConnection.QueryBranch
    Left = 720
    Top = 8
  end
  object BlnHntMessage: TBalloonHint
    Delay = 200
    HideAfter = 5000
    Left = 446
    Top = 7
  end
  object ImgLstSales: TImageList
    Left = 368
    Top = 8
    Bitmap = {
      494C010104000800280010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000709C8C000C573C000C573C000C573C000C573C00709C8C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E3E3F200000000000000000000000000000000000000000000000000DDDD
      EF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E3E3F2008181C40033339F0011118F0011118F0030309D007B7BC100DDDD
      EF00000000000000000000000000000000000000000000000000000000000000
      000000000000105B3F002C8E64002C8E64002C8E64002C8E6400105B3F000000
      0000000000000000000000000000000000000000000000000000000000007979
      C000111495007979C000000000000000000000000000000000007676BE001115
      96007676BE000000000000000000000000000000000000000000000000000000
      00000000000000000000D1DFDA00FCFDFD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007E7F
      C300121596001120AA001128B900112CC000112CC0001129BA001120AB001216
      97007B7CC2000000000000000000000000000000000000000000000000000000
      0000000000001460430032926A0032926A0032926A0032926A00146043000000
      00000000000000000000000000000000000000000000000000007676C000121C
      A200112CBF00121CA2007676C00000000000000000007676C000121DA200112D
      BF00111DA4007374BE0000000000000000000000000000000000000000000000
      00000000000079A39300136243000E593D00C3D6CF0000000000000000000000
      00000000000000000000000000000000000000000000000000007274BF00111D
      A4001430C1001431C3001431C3001431C3001431C3001431C3001431C3001430
      C100121EA6007274BF0000000000000000000000000000000000000000000000
      0000000000001965480039977100399771003997710039977100196548000000
      000000000000000000000000000000000000000000007879C300131EA6001432
      C2001432C3001432C200121EA5007576C1007576C100121EA5001432C2001432
      C3001432C300121FA6007576C100000000000000000000000000000000000000
      00007CA596001A6A4B002C8D6500247E5900135E4200C7D9D200000000000000
      000000000000000000000000000000000000000000007E7FC6001420A7001736
      C6001736C6001736C6001736C6001736C6001736C6001736C6001736C6001736
      C6001736C6001421A9007879C400000000000000000000000000000000000000
      0000000000001F6B4D00429D7800429D7800429D7800429D78001F6B4D000000
      000000000000000000000000000000000000E0E0F2002024A1006176D7001A39
      C7001837C7001837C7001837C600131FA7001420A9001837C6001837C7001837
      C7001B39C8006579D9001F22A000E3E3F30000000000000000000000000082AB
      9B002171510035936C0036956D0036956D002B84600019654800C9DBD4000000
      000000000000000000000000000000000000E6E6F400171CA0001A3AC8001A3C
      CA005F77DA00000000005F77DA001A3CCA001A3CCA005F77DA00000000005F77
      DA001A3CCA001A3BC900161C9F00D8D8EE007FAC9A0025725300257253002572
      530025725300257253004BA380004BA380004BA380004BA38000257253002572
      53002572530025725300257253007FAC9A0000000000787AC6003C44B400657C
      DB001E40CB001C3ECB001C3ECB001C3DCA001C3DCA001C3ECB001C3ECB001F40
      CC00677CDB003A41B3007577C50000000000000000000000000085AF9F002777
      58003E9A7500409C7700409C7700409C7700409C7700348B68001F6C4E00CADC
      D500000000000000000000000000000000008385CC002235B8001E43CE001E43
      CE00000000000000000000000000627CDD00627CDD0000000000000000000000
      00001E43CE001E43CE002136BB007577C6002B78580055A9890055A9890055A9
      890055A9890055A9890055A9890055A9890055A9890055A9890055A9890055A9
      890055A9890055A9890055A989002B78580000000000000000007577C7003D45
      B800667FDD002246CF002045CF002045CF002045CF002045CF002347D0006981
      DD003942B600777AC8000000000000000000000000008AB3A200307F5F004AA2
      7F004CA4810058AA89008FC6B0005BAC8C004CA481004CA481003F9371002774
      5400CCDED7000000000000000000000000003C40B2002242C9002249D2002249
      D2004448B7000000000000000000000000000000000000000000000000004448
      B7002249D2002249D2002243CC003135AD00317F5E005FB092005FB092005FB0
      92005FB092005FB092005FB092005FB092005FB092005FB092005FB092005FB0
      92005FB092005FB092005FB09200317F5E000000000000000000000000007578
      C900313EB900264DD300244DD400244DD400244DD400244DD400254DD3002E3B
      B700777ACA000000000000000000000000009CC1B1003A88680056AA8A0058AC
      8C0075BAA000A1CDBC005C9C810099C8B60066B3960058AC8C0058AC8C00499B
      7A002E7C5B00CEE0D80000000000000000001A1FA7002950D4002751D6002751
      D6002751D6004448B700000000000000000000000000000000004448B7002751
      D6002751D6002751D6002952D500151AA5003786640068B79B0068B79B0068B7
      9B0068B79B0068B79B0068B79B0068B79B0068B79B0068B79B0068B79B0068B7
      9B0068B79B0068B79B0068B79B00378664000000000000000000000000007478
      CB00182BB7002953D8002954D9002954D9002954D9002954D9002953D8001829
      B6007478CB00000000000000000000000000388565009DCCBB006DB89E0097CC
      B90093C3B0003F896A00A0C5B500438D6E00A1CEBD0072BAA10065B4980065B4
      980054A3850036846300CFE2DA0000000000141AA8003E66DD002B58DB002B58
      DB002B58DB006B8AE600000000000000000000000000000000006B8AE6002B58
      DB002B58DB002B58DB003B64DD00141AA8003D8C6900C2E3D800C2E3D800C2E3
      D800C2E3D800C2E3D80072BDA40072BDA40072BDA40072BDA400C2E3D800C2E3
      D800C2E3D800C2E3D800C2E3D8003D8C690000000000000000007478CD001A2E
      BB002D5BDC002D5CDD002D5CDD002F5EDD002F5DDD002D5CDD002D5CDD002D5B
      DC00192DB9007478CD000000000000000000A3C8B800579C7F00B4D9CC0076B1
      990078AE9700C8DED50000000000AACDBE0049937300A7D1C2007DC2AB0071BC
      A30071BCA3005EAB8F003D8C6A00D1E4DC003B41BA005270DC002F5EDF002F5E
      DF006E8FE9000000000000000000000000000000000000000000000000006E8F
      E9002F5EDF002F5EDF005473DD00363CB80090BFAA0043936F0043936F004393
      6F0043936F0043936F007BC3AC007BC3AC007BC3AC007BC3AC0043936F004393
      6F0043936F0043936F0043936F0090BFAA00000000007378CF001A31BF003162
      E1003163E2003163E2003365E2007495EA007193EA003364E2003163E2003163
      E2003162E1001A2FBE007378CF000000000000000000A3CAB80047957200A3CA
      B800FBFCFC00000000000000000000000000AED0C000509B7900ADD6C70088C9
      B4007DC4AD007DC4AD0077B9A000469470008286D5005264D0003A6AE4003365
      E3000000000000000000000000004448B7004448B70000000000000000000000
      00003365E3003869E4005062D0008286D5000000000000000000000000000000
      0000000000004999740084C9B30084C9B30084C9B30084C9B300499974000000
      000000000000000000000000000000000000DDDEF400212CB9006F94EC00356A
      E600356AE600376CE6007699ED003B4AC5004050C8007397ED00376BE600356A
      E600356AE6007397ED001E29B700E3E4F6000000000000000000FBFDFC000000
      00000000000000000000000000000000000000000000B0D3C30056A17F00B2DA
      CC0092D0BE009ED5C500A3D0BF004D9C7800E5E6F7001721B5007495EB00386C
      E7004448B700000000004448B700366BE700366BE7004448B700000000004448
      B700366BE7007396EC001C27B700E5E6F7000000000000000000000000000000
      0000000000004E9E79008BCEBA008BCEBA008BCEBA008BCEBA004E9E79000000
      000000000000000000000000000000000000000000007379D3004858CE007299
      F0003B71EA00799DF0003C4BC800767BD4007379D3004353CB00769AF0003B71
      EA00779CF1004353CB007379D300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B3D6C6005CA8
      8500B7DDCF00A4D3C00053A37D00CEE4DA00000000008286D8003948C7007FA2
      F1003F74EB00151AA5003970EA003970EA003970EA003970EA00151AA5003E73
      EA007CA0F1003E4DCA007C81D600000000000000000000000000000000000000
      00000000000052A37D0091D2C00091D2C00091D2C00091D2C00052A37D000000
      00000000000000000000000000000000000000000000000000007076D3004A5B
      D1008DACF3003C4CCA00767BD50000000000000000007379D4004354CD008DAC
      F3004354CD007076D30000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B7D9
      C9005EAB870056A78100D3E8DE000000000000000000000000007379D4003545
      C7008FACF100709AF2005B8BF000477DEE00477DEE005A8AF0006E98F2008FAD
      F2003C4DCA007077D30000000000000000000000000000000000000000000000
      00000000000056A78000D2EDE600D2EDE600D2EDE600D2EDE60056A780000000
      0000000000000000000000000000000000000000000000000000FCFCFE00767C
      D600212EC000767CD60000000000000000000000000000000000767CD600212E
      C000767CD6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F3F9F600FDFEFE0000000000000000000000000000000000000000007E84
      D9001623BC005165D5007088E3008EA9EF008FABF000728AE3005569D7001825
      BC007B81D8000000000000000000000000000000000000000000000000000000
      0000000000009DCDB60059AA830059AA830059AA830059AA83009DCDB6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000DDDEF500000000000000000000000000000000000000000000000000DDDE
      F500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000EEEFFA008D92DE005961CF002932C1002630C000565ECE00878CDC00EBEC
      F90000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000F81FF7EFFFFFF00FF81FE3C7FCFFE007
      F81FC183F87FC003F81F8001F03F8001F81F0000E01F042000008001C00F0E70
      0000C003800707E00000E007000303C00000E007000103C00000C003020007E0
      0000800187000E70F81F0000DF800420F81F8001FFC08001F81FC183FFE1C003
      F81FC3C7FFF3E007F81FF7EFFFFFF00F00000000000000000000000000000000
      000000000000}
  end
  object DtSrcPlanPay: TDataSource
    DataSet = DMConnection.QueryPlan
    Left = 280
    Top = 8
  end
end
