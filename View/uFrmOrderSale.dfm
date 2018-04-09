object FrmOrderSale: TFrmOrderSale
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Pedido de Venda'
  ClientHeight = 544
  ClientWidth = 790
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PnlTitle: TPanel
    Left = 0
    Top = 0
    Width = 790
    Height = 35
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Pedido de Venda'
    Color = clGradientActiveCaption
    Font.Charset = ANSI_CHARSET
    Font.Color = clGray
    Font.Height = -19
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
  end
  object PgCtrlMain: TPageControl
    Left = 0
    Top = 35
    Width = 790
    Height = 490
    ActivePage = TbShtSearch
    Align = alClient
    TabOrder = 1
    object TbShtSearch: TTabSheet
      Caption = 'TbShtSearch'
      TabVisible = False
      object PnlSearchClient: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 776
        Height = 62
        Align = alTop
        BevelOuter = bvNone
        Caption = 'PnlSearchClient'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ShowCaption = False
        TabOrder = 0
        object LblClientSelect: TLabel
          Left = 0
          Top = 0
          Width = 776
          Height = 16
          Align = alTop
          Alignment = taCenter
          Caption = 'Cliente Selecionado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 125
        end
        object LblSearchClientCode: TLabel
          Left = 0
          Top = 22
          Width = 33
          Height = 13
          Caption = 'C'#243'digo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object LblSearchClientName: TLabel
          Left = 66
          Top = 22
          Width = 97
          Height = 13
          Caption = 'Nome / Raz'#227'o Social'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object LblSearchDocument: TLabel
          Left = 458
          Top = 22
          Width = 54
          Height = 13
          Caption = 'CPF / CNPJ'
        end
        object LblSearchNickName: TLabel
          Left = 262
          Top = 22
          Width = 71
          Height = 13
          Caption = 'Nome Fantasia'
        end
        object LblSearchTypeClient: TLabel
          Left = 582
          Top = 22
          Width = 20
          Height = 13
          Caption = 'Tipo'
        end
        object BtnSelectClient: TButton
          Left = 675
          Top = 16
          Width = 101
          Height = 46
          Align = alRight
          Caption = 'Selecionar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ImageIndex = 4
          ImageMargins.Left = 5
          Images = ImgLstOrderSale
          ParentFont = False
          TabOrder = 0
          OnClick = BtnSelectClientClick
        end
        object EdtSearchClientCode: TEdit
          Tag = 1
          Left = 0
          Top = 38
          Width = 60
          Height = 21
          Color = cl3DLight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          OnChange = EdtSearchClientCodeChange
          OnEnter = ReciveFocusEdt
          OnExit = LosesfocusEdt
        end
        object EdtSearchClientName: TEdit
          Tag = 1
          Left = 66
          Top = 38
          Width = 190
          Height = 21
          Color = cl3DLight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
          OnEnter = ReciveFocusEdt
          OnExit = LosesfocusEdt
        end
        object EdtSearchDocument: TEdit
          Tag = 1
          Left = 458
          Top = 38
          Width = 118
          Height = 21
          Color = cl3DLight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
          OnEnter = ReciveFocusEdt
          OnExit = LosesfocusEdt
        end
        object EdtSearchNickName: TEdit
          Tag = 1
          Left = 262
          Top = 38
          Width = 190
          Height = 21
          Color = cl3DLight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
          OnEnter = ReciveFocusEdt
          OnExit = LosesfocusEdt
        end
        object EdtSearchTypeClient: TEdit
          Tag = 1
          Left = 582
          Top = 38
          Width = 72
          Height = 21
          Color = cl3DLight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
          OnEnter = ReciveFocusEdt
          OnExit = LosesfocusEdt
        end
      end
      object PnlTitleOrder: TPanel
        Left = 0
        Top = 68
        Width = 782
        Height = 25
        Align = alTop
        BevelOuter = bvNone
        Caption = 'Pedidos'
        Color = clGradientActiveCaption
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 1
      end
      object LstVwOrder: TListView
        AlignWithMargins = True
        Left = 3
        Top = 96
        Width = 580
        Height = 335
        Align = alClient
        BevelOuter = bvNone
        Columns = <
          item
            Caption = 'N'#186' Pedido'
            Width = 80
          end
          item
            Caption = 'Filial'
            Width = 80
          end
          item
            Caption = 'Pl. Pgto.'
            Width = 80
          end
          item
            Caption = 'Data'
            Width = 80
          end
          item
            Caption = 'Vl. Total'
            Width = 80
          end
          item
            Caption = 'Vl. Desc.'
            Width = 80
          end
          item
            Caption = 'Vl. Tabela'
            Width = 80
          end>
        ReadOnly = True
        RowSelect = True
        TabOrder = 2
        ViewStyle = vsReport
      end
      object PnlSearchBottom: TPanel
        Left = 0
        Top = 434
        Width = 782
        Height = 46
        Align = alBottom
        BevelOuter = bvNone
        Caption = 'PnlSearchBottom'
        ShowCaption = False
        TabOrder = 3
      end
      object PnlSearchToolPanel: TPanel
        Left = 586
        Top = 93
        Width = 196
        Height = 341
        Align = alRight
        BevelOuter = bvNone
        Caption = 'Panel1'
        ShowCaption = False
        TabOrder = 4
        object BtnSearchNewOrder: TButton
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 190
          Height = 35
          Align = alTop
          Caption = 'Novo'
          ImageIndex = 5
          ImageMargins.Left = 15
          Images = ImgLstOrderSale
          TabOrder = 0
          OnClick = BtnSearchNewOrderClick
        end
        object BtnSearchEditOrder: TButton
          AlignWithMargins = True
          Left = 3
          Top = 44
          Width = 190
          Height = 35
          Align = alTop
          Caption = 'Alterar'
          ImageIndex = 7
          ImageMargins.Left = 15
          Images = ImgLstOrderSale
          TabOrder = 1
          OnClick = BtnSearchEditOrderClick
        end
        object BtnSearchCancelOrder: TButton
          AlignWithMargins = True
          Left = 3
          Top = 85
          Width = 190
          Height = 35
          Align = alTop
          Caption = 'Cancelar'
          ImageIndex = 6
          ImageMargins.Left = 15
          Images = ImgLstOrderSale
          TabOrder = 2
          OnClick = BtnSearchCancelOrderClick
        end
        object BtnSearchConsultOrder: TButton
          AlignWithMargins = True
          Left = 3
          Top = 126
          Width = 190
          Height = 35
          Align = alTop
          Caption = 'Consultar'
          ImageIndex = 8
          ImageMargins.Left = 15
          Images = ImgLstOrderSale
          TabOrder = 3
          OnClick = BtnSearchConsultOrderClick
        end
        object BtnSearchPrintOrder: TButton
          AlignWithMargins = True
          Left = 3
          Top = 167
          Width = 190
          Height = 35
          Align = alTop
          Caption = 'Imprimir'
          ImageIndex = 9
          ImageMargins.Left = 15
          Images = ImgLstOrderSale
          TabOrder = 4
          OnClick = BtnSearchPrintOrderClick
        end
      end
    end
    object TbShtRegister: TTabSheet
      Caption = 'TbShtRegister'
      ImageIndex = 1
      TabVisible = False
      object PnlRegisterHeader: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 776
        Height = 65
        Align = alTop
        BevelOuter = bvNone
        Caption = 'PnlRegisterHeader'
        ShowCaption = False
        TabOrder = 0
        DesignSize = (
          776
          65)
        object LblRegisterHeader: TLabel
          Left = 0
          Top = 0
          Width = 776
          Height = 16
          Align = alTop
          Alignment = taCenter
          Caption = 'Dados do Pedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 107
        end
        object LblRegHeaderOrderNumber: TLabel
          Left = 0
          Top = 22
          Width = 47
          Height = 13
          Caption = 'N'#186' Pedido'
        end
        object LblRegHeaderClient: TLabel
          Left = 79
          Top = 22
          Width = 33
          Height = 13
          Caption = 'Cliente'
        end
        object LblRegHeaderDate: TLabel
          Left = 679
          Top = 22
          Width = 23
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Data'
          ExplicitLeft = 665
        end
        object EdtRegHeaderOrderNumber: TEdit
          Tag = 1
          Left = 0
          Top = 37
          Width = 73
          Height = 21
          Color = cl3DLight
          ReadOnly = True
          TabOrder = 0
          OnEnter = ReciveFocusEdt
          OnExit = LosesfocusEdt
        end
        object EdtRegHeaderClientCode: TEdit
          Tag = 1
          Left = 79
          Top = 37
          Width = 58
          Height = 21
          Color = cl3DLight
          ReadOnly = True
          TabOrder = 1
          OnEnter = ReciveFocusEdt
          OnExit = LosesfocusEdt
        end
        object EdtRegHeaderClientName: TEdit
          Tag = 1
          Left = 143
          Top = 37
          Width = 225
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Color = cl3DLight
          ReadOnly = True
          TabOrder = 2
          OnEnter = ReciveFocusEdt
          OnExit = LosesfocusEdt
        end
        object DtTmPckRegHeaderDate: TDateTimePicker
          Left = 680
          Top = 37
          Width = 93
          Height = 22
          Anchors = [akTop, akRight]
          Date = 43181.000000000000000000
          Time = 43181.000000000000000000
          Checked = False
          TabOrder = 3
        end
        object PnlPayPlan: TPanel
          Left = 372
          Top = 22
          Width = 180
          Height = 39
          BevelOuter = bvNone
          Caption = 'PnlPayPlan'
          Color = clWindow
          ParentBackground = False
          ShowCaption = False
          TabOrder = 4
          object LblRegHeaderPayPlan: TLabel
            Left = 0
            Top = 0
            Width = 180
            Height = 13
            Align = alTop
            Caption = 'Plano de Pagamento'
            ExplicitWidth = 98
          end
          object SpdPayPlan: TSpeedButton
            AlignWithMargins = True
            Left = 23
            Top = 15
            Width = 20
            Height = 21
            Margins.Left = 0
            Margins.Top = 2
            Margins.Right = 0
            Align = alLeft
            Caption = '...'
            OnClick = SpdPayPlanClick
            ExplicitLeft = 21
            ExplicitTop = 14
            ExplicitHeight = 23
          end
          object EdtNamePayPlan: TEdit
            Tag = 1
            AlignWithMargins = True
            Left = 43
            Top = 15
            Width = 137
            Height = 21
            Margins.Left = 0
            Margins.Top = 2
            Margins.Right = 0
            Align = alClient
            Color = cl3DLight
            ReadOnly = True
            TabOrder = 0
            OnEnter = ReciveFocusEdt
            OnExit = LosesfocusEdt
          end
          object EdtCodePayPlan: TEdit
            Tag = 1
            AlignWithMargins = True
            Left = 0
            Top = 15
            Width = 23
            Height = 21
            Margins.Left = 0
            Margins.Top = 2
            Margins.Right = 0
            Align = alLeft
            Color = cl3DLight
            ReadOnly = True
            TabOrder = 1
            OnEnter = ReciveFocusEdt
            OnExit = LosesfocusEdt
          end
        end
        object PnlBranch: TPanel
          Left = 558
          Top = 22
          Width = 116
          Height = 39
          BevelOuter = bvNone
          Caption = 'PnlPayPlan'
          Color = clWindow
          ParentBackground = False
          ShowCaption = False
          TabOrder = 5
          object Label1: TLabel
            Left = 0
            Top = 0
            Width = 116
            Height = 13
            Align = alTop
            Caption = 'Filial'
            ExplicitWidth = 20
          end
          object SpdBranch: TSpeedButton
            AlignWithMargins = True
            Left = 23
            Top = 15
            Width = 20
            Height = 21
            Margins.Left = 0
            Margins.Top = 2
            Margins.Right = 0
            Align = alLeft
            Caption = '...'
            OnClick = SpdBranchClick
            ExplicitLeft = 21
            ExplicitTop = 14
            ExplicitHeight = 23
          end
          object EdtNameBranch: TEdit
            Tag = 1
            AlignWithMargins = True
            Left = 43
            Top = 15
            Width = 73
            Height = 21
            Margins.Left = 0
            Margins.Top = 2
            Margins.Right = 0
            Align = alClient
            Color = cl3DLight
            ReadOnly = True
            TabOrder = 0
            OnEnter = ReciveFocusEdt
            OnExit = LosesfocusEdt
          end
          object EdtCodeBranch: TEdit
            Tag = 1
            AlignWithMargins = True
            Left = 0
            Top = 15
            Width = 23
            Height = 21
            Margins.Left = 0
            Margins.Top = 2
            Margins.Right = 0
            Align = alLeft
            Color = cl3DLight
            ReadOnly = True
            TabOrder = 1
            OnEnter = ReciveFocusEdt
            OnExit = LosesfocusEdt
          end
        end
      end
      object PnlRegSearchProd: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 74
        Width = 776
        Height = 42
        Align = alTop
        BevelOuter = bvNone
        Caption = 'PnlRegSearchProd'
        ShowCaption = False
        TabOrder = 1
        object LblSearchProdCode: TLabel
          Left = 0
          Top = 0
          Width = 33
          Height = 13
          Caption = 'C'#243'digo'
        end
        object LblSearchProdDesc: TLabel
          Left = 79
          Top = 0
          Width = 46
          Height = 13
          Caption = 'Descri'#231#227'o'
        end
        object LblSearchProdBarCode: TLabel
          Left = 264
          Top = 0
          Width = 57
          Height = 13
          Caption = 'C'#243'd. Barras'
        end
        object Label2: TLabel
          Left = 384
          Top = 0
          Width = 55
          Height = 13
          Caption = 'Fornecedor'
        end
        object SpdProviderBtn: TSpeedButton
          AlignWithMargins = True
          Left = 407
          Top = 15
          Width = 20
          Height = 21
          Margins.Left = 0
          Margins.Top = 2
          Margins.Right = 0
          Caption = '...'
          OnClick = SpdProviderBtnClick
        end
        object Label3: TLabel
          Left = 552
          Top = 0
          Width = 69
          Height = 13
          Caption = 'Departamento'
        end
        object SpdDepartmentBtn: TSpeedButton
          AlignWithMargins = True
          Left = 575
          Top = 15
          Width = 20
          Height = 21
          Margins.Left = 0
          Margins.Top = 2
          Margins.Right = 0
          Caption = '...'
          OnClick = SpdDepartmentBtnClick
        end
        object EdtSearchProdCode: TEdit
          Left = 0
          Top = 15
          Width = 73
          Height = 21
          NumbersOnly = True
          TabOrder = 0
          OnEnter = ReciveFocusEdt
          OnExit = LosesfocusEdt
        end
        object EdtSearchProdDesc: TEdit
          Left = 79
          Top = 15
          Width = 179
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 1
          OnEnter = ReciveFocusEdt
          OnExit = LosesfocusEdt
        end
        object EdtSearchProdBarCode: TEdit
          Left = 264
          Top = 15
          Width = 115
          Height = 21
          NumbersOnly = True
          TabOrder = 2
          OnEnter = ReciveFocusEdt
          OnExit = LosesfocusEdt
        end
        object BtnSearchProd: TButton
          AlignWithMargins = True
          Left = 715
          Top = 3
          Width = 58
          Height = 36
          Align = alRight
          Caption = 'Pesquisar'
          TabOrder = 3
          OnClick = BtnSearchProdClick
        end
        object EdtProviderCode: TEdit
          Tag = 1
          AlignWithMargins = True
          Left = 384
          Top = 15
          Width = 23
          Height = 21
          Margins.Left = 0
          Margins.Top = 2
          Margins.Right = 0
          Color = cl3DLight
          ReadOnly = True
          TabOrder = 4
          OnEnter = ReciveFocusEdt
          OnExit = LosesfocusEdt
        end
        object EdtProviderName: TEdit
          Tag = 1
          AlignWithMargins = True
          Left = 427
          Top = 15
          Width = 119
          Height = 21
          Margins.Left = 0
          Margins.Top = 2
          Margins.Right = 0
          Color = cl3DLight
          ReadOnly = True
          TabOrder = 5
          OnEnter = ReciveFocusEdt
          OnExit = LosesfocusEdt
        end
        object EdtDepartmentCode: TEdit
          Tag = 1
          AlignWithMargins = True
          Left = 552
          Top = 15
          Width = 23
          Height = 21
          Margins.Left = 0
          Margins.Top = 2
          Margins.Right = 0
          Color = cl3DLight
          ReadOnly = True
          TabOrder = 6
          OnEnter = ReciveFocusEdt
          OnExit = LosesfocusEdt
        end
        object EdtDepartmentName: TEdit
          Tag = 1
          AlignWithMargins = True
          Left = 595
          Top = 15
          Width = 117
          Height = 21
          Margins.Left = 0
          Margins.Top = 2
          Margins.Right = 0
          Color = cl3DLight
          ReadOnly = True
          TabOrder = 7
          OnEnter = ReciveFocusEdt
          OnExit = LosesfocusEdt
        end
      end
      object LstVwProducts: TListView
        AlignWithMargins = True
        Left = 3
        Top = 122
        Width = 776
        Height = 111
        Align = alTop
        Columns = <
          item
            Caption = 'C'#243'digo'
            Width = 60
          end
          item
            Caption = 'Descri'#231#227'o'
            Width = 200
          end
          item
            Caption = 'C'#243'd. F'#225'b.'
            Width = 60
          end
          item
            Caption = 'C'#243'd. Barras'
            Width = 100
          end
          item
            Caption = 'Pre'#231'o'
            Width = 80
          end
          item
            Caption = 'Estoque'
            Width = 80
          end
          item
            Caption = 'Fornecedor'
            Width = 200
          end
          item
            Caption = 'Departamento'
            Width = 200
          end>
        ReadOnly = True
        RowSelect = True
        TabOrder = 2
        ViewStyle = vsReport
        OnDblClick = LstVwProductsDblClick
      end
      object PnlRegIncludProd: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 264
        Width = 776
        Height = 40
        Align = alTop
        BevelOuter = bvNone
        Caption = 'PnlRegIncludProd'
        ShowCaption = False
        TabOrder = 3
        object LblIncProdCode: TLabel
          Left = 2
          Top = 0
          Width = 33
          Height = 13
          Caption = 'C'#243'digo'
        end
        object LblIncProdDescription: TLabel
          Left = 81
          Top = 0
          Width = 46
          Height = 13
          Caption = 'Descri'#231#227'o'
        end
        object LblIncProdAmount: TLabel
          Left = 279
          Top = 0
          Width = 28
          Height = 13
          Caption = 'Qtde.'
        end
        object LblIncProdPrice: TLabel
          Left = 451
          Top = 0
          Width = 27
          Height = 13
          Caption = 'Pre'#231'o'
        end
        object LblIncProdDiscount: TLabel
          Left = 530
          Top = 0
          Width = 27
          Height = 13
          Caption = 'Desc.'
        end
        object LblIncProdTotalPrice: TLabel
          Left = 603
          Top = 0
          Width = 54
          Height = 13
          Caption = 'Pre'#231'o Total'
        end
        object EdtIncProdCode: TEdit
          Tag = 1
          Left = 0
          Top = 16
          Width = 73
          Height = 21
          Color = cl3DLight
          Enabled = False
          ReadOnly = True
          TabOrder = 0
          OnEnter = ReciveFocusEdt
          OnExit = LosesfocusEdt
        end
        object EdtIncProdDescription: TEdit
          Tag = 1
          Left = 79
          Top = 16
          Width = 194
          Height = 21
          Color = cl3DLight
          Enabled = False
          ReadOnly = True
          TabOrder = 1
          OnEnter = ReciveFocusEdt
          OnExit = LosesfocusEdt
        end
        object EdtIncProdAmount: TEdit
          Left = 279
          Top = 16
          Width = 57
          Height = 21
          Enabled = False
          NumbersOnly = True
          TabOrder = 2
          OnEnter = ReciveFocusEdt
          OnExit = LosesfocusEdt
        end
        object RdGrpRegIncTypePrice: TRadioGroup
          Left = 342
          Top = 0
          Width = 103
          Height = 41
          Caption = 'Tipo Pre'#231'o'
          Columns = 2
          Enabled = False
          ItemIndex = 0
          Items.Strings = (
            'Pre'#231'o'
            'Desc.')
          TabOrder = 3
          OnClick = RdGrpRegIncTypePriceClick
        end
        object EdtIncProdDiscount: TEdit
          Tag = 1
          Left = 530
          Top = 16
          Width = 67
          Height = 21
          Color = cl3DLight
          Enabled = False
          TabOrder = 4
          OnEnter = ReciveFocusEdt
          OnExit = LosesfocusEdt
          OnKeyPress = ValidKeyPress
        end
        object EdtIncProdTotalPrice: TEdit
          Tag = 1
          Left = 603
          Top = 16
          Width = 89
          Height = 21
          Color = cl3DLight
          Enabled = False
          ReadOnly = True
          TabOrder = 5
          OnEnter = ReciveFocusEdt
          OnExit = LosesfocusEdt
        end
        object BtnIncCancel: TButton
          AlignWithMargins = True
          Left = 739
          Top = 3
          Width = 34
          Height = 34
          Align = alRight
          ImageAlignment = iaCenter
          ImageIndex = 2
          Images = ImgLstOrderSale
          TabOrder = 6
          OnClick = BtnIncCancelClick
        end
        object BtnIncAdd: TButton
          AlignWithMargins = True
          Left = 699
          Top = 3
          Width = 34
          Height = 34
          Align = alRight
          ImageAlignment = iaCenter
          ImageIndex = 1
          Images = ImgLstOrderSale
          TabOrder = 7
          OnClick = BtnIncAddClick
        end
        object EdtIncProdPrice: TEdit
          Left = 451
          Top = 16
          Width = 73
          Height = 21
          Enabled = False
          TabOrder = 8
          OnEnter = ReciveFocusEdt
          OnExit = LosesfocusEdt
          OnKeyPress = ValidKeyPress
        end
      end
      object PnlRegTotalizer: TPanel
        AlignWithMargins = True
        Left = 594
        Top = 310
        Width = 185
        Height = 129
        Align = alRight
        BevelOuter = bvNone
        Caption = 'PnlRegTotalizer'
        ShowCaption = False
        TabOrder = 4
        object PnlResultTotalizer: TPanel
          Left = 96
          Top = 25
          Width = 89
          Height = 104
          Align = alRight
          BevelOuter = bvNone
          Caption = 'PnlResultTotalizer'
          ShowCaption = False
          TabOrder = 0
          object LblTotalPriceValue: TLabel
            Tag = 1
            AlignWithMargins = True
            Left = 2
            Top = 2
            Width = 87
            Height = 16
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 0
            Margins.Bottom = 1
            Align = alTop
            Caption = 'R$'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitWidth = 17
          end
          object LblSeparatorValue: TLabel
            Left = 0
            Top = 19
            Width = 89
            Height = 13
            Align = alTop
            Caption = '---------------------------'
            ExplicitWidth = 108
          end
          object LblDiscountValue: TLabel
            Tag = 1
            AlignWithMargins = True
            Left = 3
            Top = 35
            Width = 83
            Height = 16
            Align = alTop
            Caption = 'R$'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitWidth = 17
          end
          object LblSubTotalValue: TLabel
            Tag = 1
            AlignWithMargins = True
            Left = 3
            Top = 57
            Width = 83
            Height = 16
            Align = alTop
            Caption = 'R$'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitWidth = 17
          end
        end
        object PnlTotalizerDesc: TPanel
          Left = 0
          Top = 25
          Width = 96
          Height = 104
          Align = alClient
          BevelOuter = bvNone
          Caption = 'PnlTotalizerDesc'
          ShowCaption = False
          TabOrder = 1
          object LblSubTotalDesc: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 57
            Width = 90
            Height = 16
            Align = alTop
            Caption = 'Sub Total'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitWidth = 60
          end
          object LblDiscountDesc: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 35
            Width = 90
            Height = 16
            Align = alTop
            Caption = 'Desconto'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitWidth = 61
          end
          object LblTotalPriceDesc: TLabel
            Left = 0
            Top = 0
            Width = 96
            Height = 19
            Align = alTop
            Caption = 'Total Geral'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitWidth = 92
          end
          object LblSeparatorDesc: TLabel
            Left = 0
            Top = 19
            Width = 96
            Height = 13
            Align = alTop
            Caption = '---------------------------'
            ExplicitWidth = 108
          end
        end
        object PnlTitleTotalizer: TPanel
          Left = 0
          Top = 0
          Width = 185
          Height = 25
          Align = alTop
          BevelOuter = bvNone
          Caption = 'Total do Pedido'
          Color = clGradientActiveCaption
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentBackground = False
          ParentFont = False
          TabOrder = 2
        end
      end
      object PnlRegItemsTitle: TPanel
        Left = 0
        Top = 236
        Width = 782
        Height = 25
        Align = alTop
        BevelOuter = bvNone
        Caption = 'Items do Pedido'
        Color = clGradientActiveCaption
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 5
      end
      object LstVwItems: TListView
        AlignWithMargins = True
        Left = 3
        Top = 310
        Width = 585
        Height = 129
        Align = alClient
        Columns = <
          item
            Caption = 'N'#186' Seq.'
            Width = 60
          end
          item
            Caption = 'C'#243'digo'
            Width = 60
          end
          item
            Caption = 'Descri'#231#227'o'
            Width = 220
          end
          item
            Caption = 'Qtde.'
            Width = 80
          end
          item
            Caption = 'P. Unit.'
            Width = 80
          end
          item
            Caption = 'P. Total'
            Width = 80
          end>
        ReadOnly = True
        RowSelect = True
        TabOrder = 6
        ViewStyle = vsReport
        OnDblClick = LstVwItemsDblClick
        OnKeyDown = LstVwItemsKeyDown
      end
      object PnlToolBarBottom: TPanel
        Left = 0
        Top = 442
        Width = 782
        Height = 38
        Align = alBottom
        Caption = 'PnlToolBarBottom'
        ShowCaption = False
        TabOrder = 7
        object BtnSaveRegister: TButton
          AlignWithMargins = True
          Left = 688
          Top = 4
          Width = 90
          Height = 30
          Align = alRight
          Caption = 'Salvar'
          ImageIndex = 0
          ImageMargins.Left = 5
          Images = ImgLstOrderSale
          TabOrder = 0
          OnClick = BtnSaveRegisterClick
        end
        object BtnCancelRegister: TButton
          AlignWithMargins = True
          Left = 592
          Top = 4
          Width = 90
          Height = 30
          Align = alRight
          Caption = 'Cancelar'
          ImageIndex = 3
          ImageMargins.Left = 5
          Images = ImgLstOrderSale
          TabOrder = 1
          OnClick = BtnCancelRegisterClick
        end
      end
    end
  end
  object StsBrAdm: TStatusBar
    Left = 0
    Top = 525
    Width = 790
    Height = 19
    Panels = <
      item
        Width = 180
      end
      item
        Width = 50
      end>
  end
  object ImgLstOrderSale: TImageList
    Left = 616
    Bitmap = {
      494C01010A003800540010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      000000000000000000000000000000000000000000008C3F27008C3F27000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00729F8E00105B
      3F00105B3F00729F8E00FFFFFF00FFFFFF000000000000000000000000009C9C
      9C00575757005757570057575700575757005757570057575700575757005757
      57009C9C9C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B4513200DE813A00C47132008C3F
      270000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00196548003494
      6C0034946C0019654800FFFFFF00FFFFFF000000000000000000000000006565
      6500000000000000000000000000000000000000000000000000000000000000
      0000656565000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C78E6A00ECCBAD00DE813A00C471
      32008C3F270000000000FFFFFF00FFFFFF007FAC9A00257253002572530048A1
      7E0048A17E0025725300257253007FAC9A000000000000000000000000007676
      7600F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8
      F800767676000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C78E6A00ECCBAD00DE81
      3A00C47132008C3F270000000000FFFFFF00317F5E005FB092005FB092005FB0
      92005FB092005FB092005FB09200317F5E00969696004C4C4C004C4C4C006E6E
      6E00B8B8B800EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00B8B8
      B8006E6E6E004C4C4C004C4C4C00969696000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000000000C78E6A00ECCB
      AD00DE813A00C47132008C3F2700B5A6A2003D8C6900C3E3D900C3E3D90075BF
      A60075BFA600C3E3D900C3E3D9003D8C690052525200A8A8A800A9A8A9005353
      5300737273008D8D8D008E8C8D008D8D8E008D8C8D008C8D8E008E8E8E007474
      740056555500ACACAC00AAAAAB00525252000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF0000000000C78E
      6A00ECCBAD00CE7C3D00836147007F7F7F007FAE9800499974004999740089CC
      B80089CCB800499974004999740094C3AD0059595900A9A9A900ACACAC004C4B
      4D004B4C4C004B4B4B004B4A4B004B4C4B004C4C4D004D4D4E004E4E4E005152
      510052535300B0AFAF00AFAFAF00595959000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF000000
      0000C78E6A00978A7D00B0B0B000FAFAFA00F8F8F800F4F4F40052A37D00D2ED
      E600D2EDE60052A37D009F9F9F00FFFFFF0062626200AFAFAF00B4B4B400B4B4
      B400B5B5B500B4B4B400B4B4B400B3B3B300B4B4B400B5B5B500B5B5B500B8B8
      B800BABABA00BABBBB00B8B7B700626262000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00B3A5A10097979700F8F8F800EEEEEE00EDEDED00EDEDED0096C6AF0059AA
      830059AA83009ACAB3008F8F8F00CACACA006C6C6C00BCBCBC00C4C4C400C6C6
      C600C6C6C600C5C5C500C4C5C500C5C5C500C5C5C500C5C5C500C6C7C700C8C8
      C800CACACA00CACBCB00C6C6C6006C6C6C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF008E8E8E00D6D6D600EDEDED00E6E6E600E6E6E600E6E6E600E6E6E600E6E6
      E600E6E6E600EEEEEE00D4D4D4009090900077777700D6D6D600E4E4E400E5E5
      E500E5E5E500E5E5E500E6E6E600E6E6E600E6E6E600E6E6E600E6E6E600E6E6
      E600E5E5E500E4E4E400D9D9D900777777000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0076767600F1F1F100E0E0E000DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00E1E1E100EFEFEF007A7A7A0094949400EEEEEE00F8F8F700F9F9
      F900F8F8F800F9F9F900F9F9F900F9F9F900F8F8F800F9F9F900F9F9F900F8F8
      F800F8F8F800F8F8F800EFEEEF00939393000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF007E7E7E00F1F1F100DCDCDC00D7D7D700D7D7D700D7D7D700D7D7D700D7D7
      D700D7D7D700DDDDDD00EDEDED0083838300C7C7C700C8C8C800EFEFEF006E6E
      6E00606060005757570057575700575757005757570057575700575757006060
      60006E6E6E00EFEFEF00CBCBCB00C2C2C2000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00A0A0A000DBDBDB00E3E3E300D0D0D000CFCFCF00CFCFCF00CFCFCF00CFCF
      CF00D0D0D000E6E6E600DBDBDB00A0A0A000F4F4F400A3A3A300EAEAEA004040
      4000656565000000000000000000000000000000000000000000000000006565
      650040404000EAEAEA00A6A6A600ECECEC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00D6D6D600B2B2B200F2F2F200D4D4D400CCCCCC00CACACA00CACACA00CDCD
      CD00D7D7D700F3F3F300ABABAB00D6D6D60000000000C5C5C5009C9C9C003B3B
      3B00777777000000000000000000000000000000000000000000000000007777
      77003B3B3B009B9B9B00C4C4C400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00BEBEBE00CECECE00F4F4F400E6E6E600D9D9D900D9D9D900E7E7
      E700F4F4F400CACACA00BEBEBE00FFFFFF000000000000000000000000003B3B
      3B00888888000000000000000000000000000000000000000000000000008888
      88003B3B3B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00EEEEEE00C2C2C200BBBBBB00DFDFDF00F1F1F100F1F1F100DEDE
      DE00B7B7B700C2C2C200F2F2F200FFFFFF000000000000000000000000000000
      0000979797000000000000000000000000000000000000000000000000009797
      9700000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00DCDCDC00B8B8B800A4A4A400A5A5A500B9B9
      B900E0E0E000FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000C8C8C800A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100C8C8
      C800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D0DFD9000F5B3F0012624400AAC5BB000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B5CDC5004581
      6C00176247004B857000BBD1C900000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004F64D2001936
      C4001732C3004D62D100DBE0F600000000000000000000000000000000000000
      0000FCFDFE00265F9C004F80BB006D96C600ACC3DF00E8EFF600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CDDE
      D7001763460029855F00449C77003D7F65000000000000000000000000000000
      00000000000000000000000000000000000000000000B5CEC5001E6A4E001E6A
      4E0089B7A3001E6A4E001E6A4E00BDD3CB000000000000000000000000000000
      000000000000000000000000000000000000E7EAF9002241CA001737C8001333
      C7001233C6001333C7001C3BC900DFE2F7000000000000000000000000000000
      0000000000005383BC00C0E1F600A6D4F00083B8DF003A79B700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CEDED800216D
      4F00368F6B0052A5830098C5B200256F520036755E000E593D000E593D000E59
      3D000E593D000E593D000E593D000E593D00DDE8E40045866E00267256002672
      56000000000026725600267256004C8B740036755E000E593D000E593D000E59
      3D000E593D000E593D000E593D000E593D001A4AA4001D42CF001B41CF007A90
      E300F5F7FE00617CDD001940CD004D67D90036755E000E593D000E593D000E59
      3D000E593D0023647B00D5E6F500D7E9FA00CBE3F9009FD9F400468BC300E8EF
      F6000E593D000E593D0036755E00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000002B785900459A
      790063B092009EC9B800357E6100C6DAD200146043000000000000000000FDFE
      FE00FBFEFD00FAFDFC00F7FCFA00F4FBF900FDFDFD002F7C5F0089B7A3000000
      0000000000000000000089B7A300347F6300146043000000000000000000FDFE
      FE00FBFEFD00FAFDFC00F7FCFA00F4FBF9002C55D700234DD600819BE8001A43
      D2007B97E600F0F3FC001F4BD5001F49D400146043000000000000000000FDFE
      FE00FBFEFD00D4E1ED007FA7D200F9FCFE00BCE3F90038BDE800519ACC00498D
      C500E8EFF600E1F4EF001460430000000000000000000000000000000000CECE
      CE0086868600606060006060600086868600CECECE009898980056A6880074BA
      A000A3CDBD003D876800CADED600000000001B684A00FCFDFD00FCFEFE00F9FD
      FC00F6FBFA00F1FAF700EDF8F500E8F6F200FCFEFD004F947900378667003786
      67000000000037866700378667005A9B82001B684A00FCFDFD00FCFEFE00F9FD
      FC00F6FBFA00F1FAF700EDF8F500E8F6F2003764E0002C5BDD00F7FAFE0084A0
      ED001E4FDB007E9BEB002857DC002656DD001B684A00FCFDFD00FCFEFE00F9FD
      FC00F6FBFA00F1FAF7006390C200C8E4F50044D0F40000C3F20025B8E6005198
      CB004D91C600E8EFF6001B684A000000000000000000EDEDED009C9C9C007F7F
      7F00C9C9C900ECECEC00ECECEC00C9C9C9007F7F7F006C6C6C007D7D7D00AAD2
      C20045906F00D0E3DB00000000000000000024715200FAFCFB00F9FDFC00F6FB
      FA00F1FAF700EDF8F500E8F6F200E3F4EF00EDF8F500BBD7CC003F8E6F003F8E
      6F0089B7A3003F8E6F003F8E6F00C2DBD10024715200FAFCFB00F9FDFC00F6FB
      FA00F1FAF700EDF8F500E8F6F200E3F4EF006893E9002F64E500789BEE00F5F8
      FD0085A3EE003166E5003266E500668DEB0024715200FAFCFB00F9FDFC00F6FB
      FA00F1FAF700EDF8F500E8EFF600608FC400C2EAF80028CBF30000C3F20025B8
      E6005198CB005193C800E8EFF60000000000000000009F9F9F00AEAEAE00FAFA
      FA00F8F8F800F4F4F400F4F4F400F8F8F800FAFAFA00A9A9A9006D6D6D009898
      9800000000000000000000000000000000002C7A5A00F8FCFA00F6FBFA00F1FA
      F700EDF8F500E8F6F200E3F4EF00DDF2EC00D8F0E900ECF8F500BEDACF0064A7
      8D004696760069AA9000C4DED300000000002C7A5A00F8FCFA00F6FBFA00F1FA
      F700EDF8F500E8F6F200E3F4EF00DDF2EC00C7E3E9004479EB00346DEA00346C
      EA00356DEB003970EB003A72E400E6EDFC002C7A5A00F8FCFA00F6FBFA00F1FA
      F700EDF8F500E8F6F200E3F4EF00E8EFF6006594C500C2EBF80028CBF30000C3
      F20025B8E6005198CB005696CA0000000000C8C8C80093939300F8F8F800EEEE
      EE00EDEDED00EDEDED00EDEDED00EDEDED00EFEFEF00F6F6F60088888800C8C8
      C8000000000000000000000000000000000036846200F7FBFA00F1FAF700EDF8
      F500E8F6F200E3F4EF00DDF2EC00D8F0E900D2EEE600CDECE400DFF3EE00F5FB
      FA0000000000F7FCFB0086B5A1000000000036846200F7FBFA00F1FAF700EDF8
      F500E8F6F200E3F4EF00DDF2EC00D8F0E900D2EEE600C4E5E50071A2EA004C85
      EE004B83ED0082A8F50036836D000000000036846200F7FBFA00F1FAF700EDF8
      F500E8F6F200E3F4EF00DDF2EC00D8F0E900E8EFF6006B97C700C2EBF80028CB
      F30000C3F20027B8E6005299CC006C9DCB008E8E8E00D6D6D600EEEEEE00E6E6
      E600E6E6E600E6E6E600E6E6E600E6E6E600E6E6E600F0F0F000D6D6D6008E8E
      8E00000000000000000000000000000000003E8D6A00F4FAF800EDF8F500E8F6
      F200E3F4EF00DDF2EC00D8F0E900D2EEE600CDECE400C8EAE100C3E8DE00BEE6
      DB00BBE5D900D3EEE7003E8D6A00000000003E8D6A00F4FAF800EDF8F500E8F6
      F200E3F4EF00DDF2EC00D8F0E900D2EEE600CDECE400C8EAE100C3E8DE00BEE6
      DB00BBE5D900D3EEE7003E8D6A00000000003E8D6A00F4FAF800EDF8F500E8F6
      F200E3F4EF00DDF2EC00D8F0E900D2EEE600CDECE400E8EFF600709BCA00C2EB
      F80028CBF30000C3F2003FBBE6005693C70076767600F1F1F100E0E0E000DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00E1E1E100EFEFEF007A7A
      7A000000000000000000000000000000000047967200F1F9F700E9F6F200E3F4
      EF00DDF2EC00D8F0E900D2EEE600CDECE400C8EAE100C3E8DE00BEE6DB00BAE5
      D900B7E3D700D1EEE600479672000000000047967200F1F9F700E9F6F200E3F4
      EF00DDF2EC00D8F0E900D2EEE600CDECE400C8EAE100C3E8DE00BEE6DB00BAE5
      D900B7E3D700D1EEE600479672000000000047967200F1F9F700E9F6F200E3F4
      EF00DDF2EC00D8F0E900D2EEE600CDECE400C8EAE100C3E8DE00E8EFF600759E
      CC00C2EBF80042D0F3005E9FCE00B9CCE4007E7E7E00F1F1F100DCDCDC00D7D7
      D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700DDDDDD00EDEDED008383
      8300000000000000000000000000000000004E9E7900EEF9F500E4F4EF00DDF2
      EC00D8F0E900D2EEE600CDECE400C8EAE100C3E8DE00BFE6DB00BBE5D900B7E3
      D700B4E2D500D0EDE5004E9E7900000000004E9E7900EEF9F500E4F4EF00DDF2
      EC00D8F0E900D2EEE600CDECE400C8EAE100C3E8DE00BFE6DB00BBE5D900B7E3
      D700B4E2D500D0EDE5004E9E7900000000004E9E7900EEF9F500E4F4EF00DDF2
      EC00D8F0E900D2EEE600CDECE400C8EAE100C3E8DE00BFE6DB00BBE5D900E8EF
      F60079A1CE007CA4CE0059989B0000000000A0A0A000DBDBDB00E4E4E400D0D0
      D000CFCFCF00CFCFCF00CFCFCF00CFCFCF00D1D1D100E8E8E800DCDCDC00A0A0
      A0000000000000000000000000000000000054A57F00EEF8F500EBF7F400E8F6
      F200E4F5F000E1F4EF00DEF2ED00DBF1EB00D8F0E900D6EFE800D3EEE700D1EE
      E600D0EDE500D0EDE50054A57F000000000054A57F00EEF8F500EBF7F400E8F6
      F200E4F5F000E1F4EF00DEF2ED00DBF1EB00D8F0E900D6EFE800D3EEE700D1EE
      E600D0EDE500D0EDE50054A57F000000000054A57F00EEF8F500EBF7F400E8F6
      F200E4F5F000E1F4EF00DEF2ED00DBF1EB00D8F0E900D6EFE800D3EEE700D1EE
      E600C8E6E200C5E3E20054A57F0000000000D6D6D600B1B1B100F3F3F300D6D6
      D600CCCCCC00CACACA00CACACA00CCCCCC00D8D8D800F3F3F300A6A6A600D6D6
      D6000000000000000000000000000000000055A57F0059AA830059AA830059AA
      830059AA830059AA830059AA830059AA830059AA830059AA830059AA830059AA
      830059AA830059AA830054A47E000000000055A57F0059AA830059AA830059AA
      830059AA830059AA830059AA830059AA830059AA830059AA830059AA830059AA
      830059AA830059AA830054A47E000000000055A57F0059AA830059AA830059AA
      830059AA830059AA830059AA830059AA830059AA830059AA830059AA830059AA
      830059AA830059AA830054A47E000000000000000000BEBEBE00CCCCCC00F4F4
      F400E6E6E600D9D9D900D9D9D900E6E6E600F4F4F400C7C7C700BEBEBE000000
      00000000000000000000000000000000000054A27E0099C9B2009ACAB3009ACA
      B3009ACAB3009ACAB3009ACAB3009ACAB3009ACAB3009ACAB3009ACAB3009ACA
      B3009ACAB3009ACAB30051A17C000000000054A27E0099C9B2009ACAB3009ACA
      B3009ACAB3009ACAB3009ACAB3009ACAB3009ACAB3009ACAB3009ACAB3009ACA
      B3009ACAB3009ACAB30051A17C000000000054A27E0099C9B2009ACAB3009ACA
      B3009ACAB3009ACAB3009ACAB3009ACAB3009ACAB3009ACAB3009ACAB3009ACA
      B3009ACAB3009ACAB30051A17C000000000000000000EFEFEF00C2C2C200B8B8
      B800DFDFDF00F1F1F100F1F1F100DFDFDF00B8B8B800C2C2C200F4F4F4000000
      0000000000000000000000000000000000005BA9840098C9B10099C9B20099C9
      B20099C9B20099C9B20099C9B20099C9B20099C9B20099C9B20099C9B20099C9
      B20099C9B20099C9B20059A78200000000005BA9840098C9B10099C9B20099C9
      B20099C9B20099C9B20099C9B20099C9B20099C9B20099C9B20099C9B20099C9
      B20099C9B20099C9B20059A78200000000005BA9840098C9B10099C9B20099C9
      B20099C9B20099C9B20099C9B20099C9B20099C9B20099C9B20099C9B20099C9
      B20099C9B20099C9B20059A7820000000000000000000000000000000000DFDF
      DF00B8B8B800A4A4A400A4A4A400B8B8B800DFDFDF0000000000000000000000
      000000000000000000000000000000000000A3D0BA005EAD87005CAB85005CAB
      85005CAB85005CAB85005CAB85005CAB85005CAB85005CAB85005CAB85005CAB
      85005CAB85005CAB8500A0CEB80000000000A3D0BA005EAD87005CAB85005CAB
      85005CAB85005CAB85005CAB85005CAB85005CAB85005CAB85005CAB85005CAB
      85005CAB85005CAB8500A0CEB80000000000A3D0BA005EAD87005CAB85005CAB
      85005CAB85005CAB85005CAB85005CAB85005CAB85005CAB85005CAB85005CAB
      85005CAB85005CAB8500A0CEB800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000709C8C000C573C000C573C000C573C000C573C00709C8C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E3E3F2008181C40033339F0011118F0011118F0030309D007B7BC100DDDD
      EF00000000000000000000000000000000000000000000000000000000000000
      0000E3E3F200000000000000000000000000000000000000000000000000DDDD
      EF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D1DFDA00FCFDFD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000105B3F002C8E64002C8E64002C8E64002C8E6400105B3F000000
      0000000000000000000000000000000000000000000000000000000000007E7F
      C300121596001120AA001128B900112CC000112CC0001129BA001120AB001216
      97007B7CC2000000000000000000000000000000000000000000000000007979
      C000111495007979C000000000000000000000000000000000007676BE001115
      96007676BE000000000000000000000000000000000000000000000000000000
      00000000000079A39300136243000E593D00C3D6CF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001460430032926A0032926A0032926A0032926A00146043000000
      00000000000000000000000000000000000000000000000000007274BF00111D
      A4001430C1001431C3001431C3001431C3001431C3001431C3001431C3001430
      C100121EA6007274BF00000000000000000000000000000000007676C000121C
      A200112CBF00121CA2007676C00000000000000000007676C000121DA200112D
      BF00111DA4007374BE0000000000000000000000000000000000000000000000
      00007CA596001A6A4B002C8D6500247E5900135E4200C7D9D200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001965480039977100399771003997710039977100196548000000
      000000000000000000000000000000000000000000007E7FC6001420A7001736
      C6001736C6001736C6001736C6001736C6001736C6001736C6001736C6001736
      C6001736C6001421A9007879C40000000000000000007879C300131EA6001432
      C2001432C3001432C200121EA5007576C1007576C100121EA5001432C2001432
      C3001432C300121FA6007576C1000000000000000000000000000000000082AB
      9B002171510035936C0036956D0036956D002B84600019654800C9DBD4000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001F6B4D00429D7800429D7800429D7800429D78001F6B4D000000
      000000000000000000000000000000000000E6E6F400171CA0001A3AC8001A3C
      CA005F77DA00000000005F77DA001A3CCA001A3CCA005F77DA00000000005F77
      DA001A3CCA001A3BC900161C9F00D8D8EE00E0E0F2002024A1006176D7001A39
      C7001837C7001837C7001837C600131FA7001420A9001837C6001837C7001837
      C7001B39C8006579D9001F22A000E3E3F300000000000000000085AF9F002777
      58003E9A7500409C7700409C7700409C7700409C7700348B68001F6C4E00CADC
      D500000000000000000000000000000000007FAC9A0025725300257253002572
      530025725300257253004BA380004BA380004BA380004BA38000257253002572
      53002572530025725300257253007FAC9A008385CC002235B8001E43CE001E43
      CE00000000000000000000000000627CDD00627CDD0000000000000000000000
      00001E43CE001E43CE002136BB007577C60000000000787AC6003C44B400657C
      DB001E40CB001C3ECB001C3ECB001C3DCA001C3DCA001C3ECB001C3ECB001F40
      CC00677CDB003A41B3007577C50000000000000000008AB3A200307F5F004AA2
      7F004CA4810058AA89008FC6B0005BAC8C004CA481004CA481003F9371002774
      5400CCDED7000000000000000000000000002B78580055A9890055A9890055A9
      890055A9890055A9890055A9890055A9890055A9890055A9890055A9890055A9
      890055A9890055A9890055A989002B7858003C40B2002242C9002249D2002249
      D2004448B7000000000000000000000000000000000000000000000000004448
      B7002249D2002249D2002243CC003135AD0000000000000000007577C7003D45
      B800667FDD002246CF002045CF002045CF002045CF002045CF002347D0006981
      DD003942B600777AC80000000000000000009CC1B1003A88680056AA8A0058AC
      8C0075BAA000A1CDBC005C9C810099C8B60066B3960058AC8C0058AC8C00499B
      7A002E7C5B00CEE0D8000000000000000000317F5E005FB092005FB092005FB0
      92005FB092005FB092005FB092005FB092005FB092005FB092005FB092005FB0
      92005FB092005FB092005FB09200317F5E001A1FA7002950D4002751D6002751
      D6002751D6004448B700000000000000000000000000000000004448B7002751
      D6002751D6002751D6002952D500151AA5000000000000000000000000007578
      C900313EB900264DD300244DD400244DD400244DD400244DD400254DD3002E3B
      B700777ACA00000000000000000000000000388565009DCCBB006DB89E0097CC
      B90093C3B0003F896A00A0C5B500438D6E00A1CEBD0072BAA10065B4980065B4
      980054A3850036846300CFE2DA00000000003786640068B79B0068B79B0068B7
      9B0068B79B0068B79B0068B79B0068B79B0068B79B0068B79B0068B79B0068B7
      9B0068B79B0068B79B0068B79B0037866400141AA8003E66DD002B58DB002B58
      DB002B58DB006B8AE600000000000000000000000000000000006B8AE6002B58
      DB002B58DB002B58DB003B64DD00141AA8000000000000000000000000007478
      CB00182BB7002953D8002954D9002954D9002954D9002954D9002953D8001829
      B6007478CB00000000000000000000000000A3C8B800579C7F00B4D9CC0076B1
      990078AE9700C8DED50000000000AACDBE0049937300A7D1C2007DC2AB0071BC
      A30071BCA3005EAB8F003D8C6A00D1E4DC003D8C6900C2E3D800C2E3D800C2E3
      D800C2E3D800C2E3D80072BDA40072BDA40072BDA40072BDA400C2E3D800C2E3
      D800C2E3D800C2E3D800C2E3D8003D8C69003B41BA005270DC002F5EDF002F5E
      DF006E8FE9000000000000000000000000000000000000000000000000006E8F
      E9002F5EDF002F5EDF005473DD00363CB80000000000000000007478CD001A2E
      BB002D5BDC002D5CDD002D5CDD002F5EDD002F5DDD002D5CDD002D5CDD002D5B
      DC00192DB9007478CD00000000000000000000000000A3CAB80047957200A3CA
      B800FBFCFC00000000000000000000000000AED0C000509B7900ADD6C70088C9
      B4007DC4AD007DC4AD0077B9A0004694700090BFAA0043936F0043936F004393
      6F0043936F0043936F007BC3AC007BC3AC007BC3AC007BC3AC0043936F004393
      6F0043936F0043936F0043936F0090BFAA008286D5005264D0003A6AE4003365
      E3000000000000000000000000004448B7004448B70000000000000000000000
      00003365E3003869E4005062D0008286D500000000007378CF001A31BF003162
      E1003163E2003163E2003365E2007495EA007193EA003364E2003163E2003163
      E2003162E1001A2FBE007378CF00000000000000000000000000FBFDFC000000
      00000000000000000000000000000000000000000000B0D3C30056A17F00B2DA
      CC0092D0BE009ED5C500A3D0BF004D9C78000000000000000000000000000000
      0000000000004999740084C9B30084C9B30084C9B30084C9B300499974000000
      000000000000000000000000000000000000E5E6F7001721B5007495EB00386C
      E7004448B700000000004448B700366BE700366BE7004448B700000000004448
      B700366BE7007396EC001C27B700E5E6F700DDDEF400212CB9006F94EC00356A
      E600356AE600376CE6007699ED003B4AC5004050C8007397ED00376BE600356A
      E600356AE6007397ED001E29B700E3E4F6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B3D6C6005CA8
      8500B7DDCF00A4D3C00053A37D00CEE4DA000000000000000000000000000000
      0000000000004E9E79008BCEBA008BCEBA008BCEBA008BCEBA004E9E79000000
      000000000000000000000000000000000000000000008286D8003948C7007FA2
      F1003F74EB00151AA5003970EA003970EA003970EA003970EA00151AA5003E73
      EA007CA0F1003E4DCA007C81D60000000000000000007379D3004858CE007299
      F0003B71EA00799DF0003C4BC800767BD4007379D3004353CB00769AF0003B71
      EA00779CF1004353CB007379D300000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B7D9
      C9005EAB870056A78100D3E8DE00000000000000000000000000000000000000
      00000000000052A37D0091D2C00091D2C00091D2C00091D2C00052A37D000000
      00000000000000000000000000000000000000000000000000007379D4003545
      C7008FACF100709AF2005B8BF000477DEE00477DEE005A8AF0006E98F2008FAD
      F2003C4DCA007077D300000000000000000000000000000000007076D3004A5B
      D1008DACF3003C4CCA00767BD50000000000000000007379D4004354CD008DAC
      F3004354CD007076D30000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F3F9F600FDFEFE0000000000000000000000000000000000000000000000
      00000000000056A78000D2EDE600D2EDE600D2EDE600D2EDE60056A780000000
      0000000000000000000000000000000000000000000000000000000000007E84
      D9001623BC005165D5007088E3008EA9EF008FABF000728AE3005569D7001825
      BC007B81D8000000000000000000000000000000000000000000FCFCFE00767C
      D600212EC000767CD60000000000000000000000000000000000767CD600212E
      C000767CD6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009DCDB60059AA830059AA830059AA830059AA83009DCDB6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000EEEFFA008D92DE005961CF002932C1002630C000565ECE00878CDC00EBEC
      F900000000000000000000000000000000000000000000000000000000000000
      0000DDDEF500000000000000000000000000000000000000000000000000DDDE
      F50000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF009000E007000000000800EFF700000000
      0400E00700000000820000000000000040000000000000002000000000000000
      1000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000007E000000000000087E1000000000000E7E700000000
      0000F7EF000000000000F00F00000000FFF0FFC1FFC1F03FFFE0FF80FF00F83F
      FFC0000800000001FFC0601C60006001E0010008000000018003000000000001
      800F000100000001000F000900010000000F000100010000000F000100010000
      000F000100010001000F000100010001000F000100010001801F000100010001
      801F000100010001E07F000100010001FFFFF81FF00FF7EFFCFFF81FE007E3C7
      F87FF81FC003C183F03FF81F80018001E01FF81F04200000C00F00000E708001
      8007000007E0C0030003000003C0E0070001000003C0E0070200000007E0C003
      870000000E708001DF80F81F04200000FFC0F81F80018001FFE1F81FC003C183
      FFF3F81FE007C3C7FFFFF81FF00FF7EF00000000000000000000000000000000
      000000000000}
  end
  object FrxRepOrderSales: TfrxReport
    Version = '4.13.2'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43187.617056574100000000
    ReportOptions.LastChange = 43188.576917638890000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 616
    Top = 416
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end
      item
        DataSet = frxDBDataset2
        DataSetName = 'frxDBDataset2'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object ReportSales: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle: TfrxReportTitle
        Height = 56.692950000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          Top = 3.779530000000000000
          Width = 1046.929810000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -24
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Relat'#243'rio Vendas')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line1: TfrxLineView
          Align = baWidth
          Top = 28.795300000000000000
          Width = 1046.929810000000000000
          ShowHint = False
          Diagonal = True
        end
        object SysMemo1: TfrxSysMemoView
          Left = 941.102970000000000000
          Top = 33.795300000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[DATE]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 18.897650000000000000
        Top = 393.071120000000000000
        Width = 1046.929810000000000000
        object SysMemo2: TfrxSysMemoView
          Left = 895.748610000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[PAGE#] of [TOTALPAGES#]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        Height = 113.385900000000000000
        Top = 136.063080000000000000
        Width = 1046.929810000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 1
        object Shape1: TfrxShapeView
          Width = 1046.929810000000000000
          Height = 98.267780000000000000
          ShowHint = False
        end
        object frxDBDataset1NUMPEDIDO: TfrxMemoView
          Left = 98.267780000000000000
          Top = 3.779530000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'NUMPEDIDO'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset1."NUMPEDIDO"]')
          ParentFont = False
        end
        object frxDBDataset1CODCLIENTE: TfrxMemoView
          Left = 7.559060000000000000
          Top = 74.590600000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'CODCLIENTE'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset1."CODCLIENTE"]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 7.559060000000000000
          Top = 3.779530000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            'N'#186' Pedido:')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 7.779530000000000000
          Top = 24.897650000000000000
          Width = 200.315090000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Filial')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 7.559060000000000000
          Top = 59.692950000000000000
          Width = 200.315090000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Cliente')
          ParentFont = False
        end
        object frxDBDataset1DATA: TfrxMemoView
          Left = 691.653990000000000000
          Top = 37.795300000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'DATA'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset1."DATA"]')
          ParentFont = False
        end
        object frxDBDataset1CODPLANO: TfrxMemoView
          Left = 382.071120000000000000
          Top = 38.015770000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'CODPLANO'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset1."CODPLANO"]')
          ParentFont = False
        end
        object frxDBDataset1DESCRICAO: TfrxMemoView
          Left = 438.764070000000000000
          Top = 37.795300000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'DESCRICAO'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset1."DESCRICAO"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 382.071120000000000000
          Top = 22.677180000000000000
          Width = 151.181200000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Plano de Pagamento')
          ParentFont = False
        end
        object frxDBDataset1VLTOTAL: TfrxMemoView
          Left = 382.071120000000000000
          Top = 72.590600000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'VLTOTAL'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset1."VLTOTAL"]')
          ParentFont = False
        end
        object frxDBDataset1VLDESCONTO: TfrxMemoView
          Left = 532.913730000000000000
          Top = 72.590600000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'VLDESCONTO'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset1."VLDESCONTO"]')
          ParentFont = False
        end
        object frxDBDataset1CODFILIAL: TfrxMemoView
          Left = 7.559060000000000000
          Top = 40.795300000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'CODFILIAL'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset1."CODFILIAL"]')
          ParentFont = False
        end
        object frxDBDataset1FILIAL: TfrxMemoView
          Left = 49.133890000000000000
          Top = 40.795300000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'FILIAL'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset1."FILIAL"]')
          ParentFont = False
        end
        object frxDBDataset1NOME1: TfrxMemoView
          Left = 52.913420000000000000
          Top = 74.811070000000000000
          Width = 321.260050000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'NOME'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset1."NOME"]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 382.071120000000000000
          Top = 56.692950000000000000
          Width = 151.181200000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Valor Total')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 534.693260000000000000
          Top = 56.692950000000000000
          Width = 151.181200000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Desconto')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 691.653990000000000000
          Top = 22.677180000000000000
          Width = 151.181200000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Data do Pedido')
          ParentFont = False
        end
      end
      object DetailData1: TfrxDetailData
        Height = 18.897650000000000000
        Top = 313.700990000000000000
        Width = 1046.929810000000000000
        DataSet = frxDBDataset2
        DataSetName = 'frxDBDataset2'
        RowCount = 0
        object frxDBDataset2NUMSEQ: TfrxMemoView
          Left = 3.779530000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'NUMSEQ'
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset2."NUMSEQ"]')
          ParentFont = False
        end
        object frxDBDataset2CODPRODUTO: TfrxMemoView
          Left = 41.574830000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'CODPRODUTO'
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset2."CODPRODUTO"]')
          ParentFont = False
        end
        object frxDBDataset2DESCRICAO: TfrxMemoView
          Left = 90.708720000000000000
          Width = 200.315090000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'DESCRICAO'
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxDBDataset2."DESCRICAO"]')
          ParentFont = False
        end
        object frxDBDataset2QTDE: TfrxMemoView
          Left = 291.023810000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'QTDE'
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxDBDataset2."QTDE"]')
          ParentFont = False
        end
        object frxDBDataset2PRECO: TfrxMemoView
          Left = 340.157700000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'PRECO'
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxDBDataset2."PRECO"]')
          ParentFont = False
        end
        object frxDBDataset2CODBARRAS: TfrxMemoView
          Left = 438.425480000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'CODBARRAS'
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxDBDataset2."CODBARRAS"]')
          ParentFont = False
        end
        object frxDBDataset2TOTALPRECO: TfrxMemoView
          Left = 642.520100000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'TOTALPRECO'
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxDBDataset2."TOTALPRECO"]')
          ParentFont = False
        end
        object frxDBDataset2VLDESC: TfrxMemoView
          Left = 559.370440000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'VLDESC'
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxDBDataset2."VLDESC"]')
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        Height = 18.897650000000000000
        Top = 272.126160000000000000
        Width = 1046.929810000000000000
        object Memo6: TfrxMemoView
          Left = 3.779530000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'S'#233'q.')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 41.574830000000000000
          Width = 249.448980000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Produto')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 291.023810000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Qtde.')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 340.157700000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Pre'#231'o')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 438.425480000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'C'#243'd. Barras')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 559.370440000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Desconto')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 642.520100000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Pre'#231'o Total')
          ParentFont = False
        end
      end
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = DMConnection.QuerySalesHeaderCons
    BCDToCurrency = False
    Left = 616
    Top = 352
  end
  object frxDBDataset2: TfrxDBDataset
    UserName = 'frxDBDataset2'
    CloseDataSource = False
    DataSet = DMConnection.QuerySalesItemsCons
    BCDToCurrency = False
    Left = 696
    Top = 352
  end
end
