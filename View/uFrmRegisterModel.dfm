object FrmModelRegister: TFrmModelRegister
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'FrmModelRegister'
  ClientHeight = 521
  ClientWidth = 744
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PnlButtomTop: TPanel
    Left = 0
    Top = 0
    Width = 744
    Height = 49
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object BtBtnNew: TBitBtn
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 75
      Height = 43
      Align = alLeft
      Caption = 'Novo'
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        20000000000000040000120B0000120B00000000000000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00B5CDC50045816C00176247004B857000BBD1C900FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B5CE
        C5001E6A4E001E6A4E0089B7A3001E6A4E001E6A4E00BDD3CB0036755E000E59
        3D000E593D000E593D000E593D000E593D000E593D000E593D00DDE8E4004586
        6E002672560026725600FFFFFF0026725600267256004C8B740014604300FFFF
        FF00FFFFFF00FDFEFE00FBFEFD00FAFDFC00F7FCFA00F4FBF900FDFDFD002F7C
        5F0089B7A300FFFFFF00FFFFFF00FFFFFF0089B7A300347F63001B684A00FCFD
        FD00FCFEFE00F9FDFC00F6FBFA00F1FAF700EDF8F500E8F6F200FCFEFD004F94
        79003786670037866700FFFFFF0037866700378667005A9B820024715200FAFC
        FB00F9FDFC00F6FBFA00F1FAF700EDF8F500E8F6F200E3F4EF00EDF8F500BBD7
        CC003F8E6F003F8E6F0089B7A3003F8E6F003F8E6F00C2DBD1002C7A5A00F8FC
        FA00F6FBFA00F1FAF700EDF8F500E8F6F200E3F4EF00DDF2EC00D8F0E900ECF8
        F500BEDACF0064A78D004696760069AA9000C4DED300FFFFFF0036846200F7FB
        FA00F1FAF700EDF8F500E8F6F200E3F4EF00DDF2EC00D8F0E900D2EEE600CDEC
        E400DFF3EE00F5FBFA00FFFFFF00F7FCFB0086B5A100FFFFFF003E8D6A00F4FA
        F800EDF8F500E8F6F200E3F4EF00DDF2EC00D8F0E900D2EEE600CDECE400C8EA
        E100C3E8DE00BEE6DB00BBE5D900D3EEE7003E8D6A00FFFFFF0047967200F1F9
        F700E9F6F200E3F4EF00DDF2EC00D8F0E900D2EEE600CDECE400C8EAE100C3E8
        DE00BEE6DB00BAE5D900B7E3D700D1EEE60047967200FFFFFF004E9E7900EEF9
        F500E4F4EF00DDF2EC00D8F0E900D2EEE600CDECE400C8EAE100C3E8DE00BFE6
        DB00BBE5D900B7E3D700B4E2D500D0EDE5004E9E7900FFFFFF0054A57F00EEF8
        F500EBF7F400E8F6F200E4F5F000E1F4EF00DEF2ED00DBF1EB00D8F0E900D6EF
        E800D3EEE700D1EEE600D0EDE500D0EDE50054A57F00FFFFFF0055A57F0059AA
        830059AA830059AA830059AA830059AA830059AA830059AA830059AA830059AA
        830059AA830059AA830059AA830059AA830054A47E00FFFFFF0054A27E0099C9
        B2009ACAB3009ACAB3009ACAB3009ACAB3009ACAB3009ACAB3009ACAB3009ACA
        B3009ACAB3009ACAB3009ACAB3009ACAB30051A17C00FFFFFF005BA9840098C9
        B10099C9B20099C9B20099C9B20099C9B20099C9B20099C9B20099C9B20099C9
        B20099C9B20099C9B20099C9B20099C9B20059A78200FFFFFF00A3D0BA005EAD
        87005CAB85005CAB85005CAB85005CAB85005CAB85005CAB85005CAB85005CAB
        85005CAB85005CAB85005CAB85005CAB8500A0CEB800FFFFFF00}
      TabOrder = 0
      OnClick = BtBtnNewClick
    end
    object BtBtnEdit: TBitBtn
      AlignWithMargins = True
      Left = 84
      Top = 3
      Width = 75
      Height = 43
      Align = alLeft
      Caption = 'Alterar'
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        20000000000000040000120B0000120B00000000000000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FCFDFE00265F9C004F80BB006D96C600ACC3DF00E8EF
        F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF005383BC00C0E1F600A6D4F00083B8DF003A79
        B700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0036755E000E59
        3D000E593D000E593D000E593D0023647B00D5E6F500D7E9FA00CBE3F9009FD9
        F400468BC300E8EFF6000E593D000E593D0036755E00FFFFFF0014604300FFFF
        FF00FFFFFF00FDFEFE00FBFEFD00D4E1ED007FA7D200F9FCFE00BCE3F90038BD
        E800519ACC00498DC500E8EFF600E1F4EF0014604300FFFFFF001B684A00FCFD
        FD00FCFEFE00F9FDFC00F6FBFA00F1FAF7006390C200C8E4F50044D0F40000C3
        F20025B8E6005198CB004D91C600E8EFF6001B684A00FFFFFF0024715200FAFC
        FB00F9FDFC00F6FBFA00F1FAF700EDF8F500E8EFF600608FC400C2EAF80028CB
        F30000C3F20025B8E6005198CB005193C800E8EFF600FFFFFF002C7A5A00F8FC
        FA00F6FBFA00F1FAF700EDF8F500E8F6F200E3F4EF00E8EFF6006594C500C2EB
        F80028CBF30000C3F20025B8E6005198CB005696CA00FFFFFF0036846200F7FB
        FA00F1FAF700EDF8F500E8F6F200E3F4EF00DDF2EC00D8F0E900E8EFF6006B97
        C700C2EBF80028CBF30000C3F20027B8E6005299CC006C9DCB003E8D6A00F4FA
        F800EDF8F500E8F6F200E3F4EF00DDF2EC00D8F0E900D2EEE600CDECE400E8EF
        F600709BCA00C2EBF80028CBF30000C3F2003FBBE6005693C70047967200F1F9
        F700E9F6F200E3F4EF00DDF2EC00D8F0E900D2EEE600CDECE400C8EAE100C3E8
        DE00E8EFF600759ECC00C2EBF80042D0F3005E9FCE00B9CCE4004E9E7900EEF9
        F500E4F4EF00DDF2EC00D8F0E900D2EEE600CDECE400C8EAE100C3E8DE00BFE6
        DB00BBE5D900E8EFF60079A1CE007CA4CE0059989B00FFFFFF0054A57F00EEF8
        F500EBF7F400E8F6F200E4F5F000E1F4EF00DEF2ED00DBF1EB00D8F0E900D6EF
        E800D3EEE700D1EEE600C8E6E200C5E3E20054A57F00FFFFFF0055A57F0059AA
        830059AA830059AA830059AA830059AA830059AA830059AA830059AA830059AA
        830059AA830059AA830059AA830059AA830054A47E00FFFFFF0054A27E0099C9
        B2009ACAB3009ACAB3009ACAB3009ACAB3009ACAB3009ACAB3009ACAB3009ACA
        B3009ACAB3009ACAB3009ACAB3009ACAB30051A17C00FFFFFF005BA9840098C9
        B10099C9B20099C9B20099C9B20099C9B20099C9B20099C9B20099C9B20099C9
        B20099C9B20099C9B20099C9B20099C9B20059A78200FFFFFF00A3D0BA005EAD
        87005CAB85005CAB85005CAB85005CAB85005CAB85005CAB85005CAB85005CAB
        85005CAB85005CAB85005CAB85005CAB8500A0CEB800FFFFFF00}
      TabOrder = 1
      OnClick = BtBtnEditClick
    end
    object BtBtnConsult: TBitBtn
      AlignWithMargins = True
      Left = 165
      Top = 3
      Width = 75
      Height = 43
      Align = alLeft
      Caption = 'Consultar'
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        20000000000000040000120B0000120B00000000000000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00D0DFD9000F5B3F0012624400AAC5BB00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00CDDED7001763460029855F00449C77003D7F6500FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00CEDED800216D4F00368F6B0052A5830098C5B200256F5200FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF002B785900459A790063B092009EC9B800357E6100C6DAD200FFFFFF00FFFF
        FF00FFFFFF00CECECE0086868600606060006060600086868600CECECE009898
        980056A6880074BAA000A3CDBD003D876800CADED600FFFFFF00FFFFFF00EDED
        ED009C9C9C007F7F7F00C9C9C900ECECEC00ECECEC00C9C9C9007F7F7F006C6C
        6C007D7D7D00AAD2C20045906F00D0E3DB00FFFFFF00FFFFFF00FFFFFF009F9F
        9F00AEAEAE00FAFAFA00F8F8F800F4F4F400F4F4F400F8F8F800FAFAFA00A9A9
        A9006D6D6D0098989800FFFFFF00FFFFFF00FFFFFF00FFFFFF00C8C8C8009393
        9300F8F8F800EEEEEE00EDEDED00EDEDED00EDEDED00EDEDED00EFEFEF00F6F6
        F60088888800C8C8C800FFFFFF00FFFFFF00FFFFFF00FFFFFF008E8E8E00D6D6
        D600EEEEEE00E6E6E600E6E6E600E6E6E600E6E6E600E6E6E600E6E6E600F0F0
        F000D6D6D6008E8E8E00FFFFFF00FFFFFF00FFFFFF00FFFFFF0076767600F1F1
        F100E0E0E000DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00E1E1
        E100EFEFEF007A7A7A00FFFFFF00FFFFFF00FFFFFF00FFFFFF007E7E7E00F1F1
        F100DCDCDC00D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700DDDD
        DD00EDEDED0083838300FFFFFF00FFFFFF00FFFFFF00FFFFFF00A0A0A000DBDB
        DB00E4E4E400D0D0D000CFCFCF00CFCFCF00CFCFCF00CFCFCF00D1D1D100E8E8
        E800DCDCDC00A0A0A000FFFFFF00FFFFFF00FFFFFF00FFFFFF00D6D6D600B1B1
        B100F3F3F300D6D6D600CCCCCC00CACACA00CACACA00CCCCCC00D8D8D800F3F3
        F300A6A6A600D6D6D600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BEBE
        BE00CCCCCC00F4F4F400E6E6E600D9D9D900D9D9D900E6E6E600F4F4F400C7C7
        C700BEBEBE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFEF
        EF00C2C2C200B8B8B800DFDFDF00F1F1F100F1F1F100DFDFDF00B8B8B800C2C2
        C200F4F4F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00DFDFDF00B8B8B800A4A4A400A4A4A400B8B8B800DFDFDF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
      TabOrder = 2
      OnClick = BtBtnConsultClick
    end
    object BtBtnPrint: TBitBtn
      AlignWithMargins = True
      Left = 246
      Top = 3
      Width = 75
      Height = 43
      Align = alLeft
      Caption = 'Imprimir'
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        20000000000000040000120B0000120B00000000000000000000FFFFFF00FFFF
        FF00FFFFFF009C9C9C0057575700575757005757570057575700575757005757
        570057575700575757009C9C9C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF0065656500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF0065656500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF0076767600F8F8F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8
        F800F8F8F800F8F8F80076767600FFFFFF00FFFFFF00FFFFFF00969696004C4C
        4C004C4C4C006E6E6E00B8B8B800EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
        EF00EFEFEF00B8B8B8006E6E6E004C4C4C004C4C4C009696960052525200A8A8
        A800A9A8A90053535300737273008D8D8D008E8C8D008D8D8E008D8C8D008C8D
        8E008E8E8E007474740056555500ACACAC00AAAAAB005252520059595900A9A9
        A900ACACAC004C4B4D004B4C4C004B4B4B004B4A4B004B4C4B004C4C4D004D4D
        4E004E4E4E005152510052535300B0AFAF00AFAFAF005959590062626200AFAF
        AF00B4B4B400B4B4B400B5B5B500B4B4B400B4B4B400B3B3B300B4B4B400B5B5
        B500B5B5B500B8B8B800BABABA00BABBBB00B8B7B700626262006C6C6C00BCBC
        BC00C4C4C400C6C6C600C6C6C600C5C5C500C4C5C500C5C5C500C5C5C500C5C5
        C500C6C7C700C8C8C800CACACA00CACBCB00C6C6C6006C6C6C0077777700D6D6
        D600E4E4E400E5E5E500E5E5E500E5E5E500E6E6E600E6E6E600E6E6E600E6E6
        E600E6E6E600E6E6E600E5E5E500E4E4E400D9D9D9007777770094949400EEEE
        EE00F8F8F700F9F9F900F8F8F800F9F9F900F9F9F900F9F9F900F8F8F800F9F9
        F900F9F9F900F8F8F800F8F8F800F8F8F800EFEEEF0093939300C7C7C700C8C8
        C800EFEFEF006E6E6E0060606000575757005757570057575700575757005757
        570057575700606060006E6E6E00EFEFEF00CBCBCB00C2C2C200F4F4F400A3A3
        A300EAEAEA004040400065656500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF006565650040404000EAEAEA00A6A6A600ECECEC00FFFFFF00C5C5
        C5009C9C9C003B3B3B0077777700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00777777003B3B3B009B9B9B00C4C4C400FFFFFF00FFFFFF00FFFF
        FF00FFFFFF003B3B3B0088888800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00888888003B3B3B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF0097979700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF0097979700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00C8C8C800A1A1A100A1A1A100A1A1A100A1A1A100A1A1
        A100A1A1A100C8C8C800FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
      TabOrder = 3
      OnClick = BtBtnPrintClick
    end
    object BtBtnClose: TBitBtn
      AlignWithMargins = True
      Left = 666
      Top = 3
      Width = 75
      Height = 43
      Align = alRight
      Caption = 'Fechar'
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
        F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
        000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
        338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
        45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
        3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
        F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
        000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
        338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
        4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
        8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
        333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
        0000}
      NumGlyphs = 2
      TabOrder = 4
      OnClick = BtBtnCloseClick
    end
  end
  object PgCtrlMain: TPageControl
    Left = 0
    Top = 49
    Width = 744
    Height = 472
    ActivePage = TbShtSearch
    Align = alClient
    TabOrder = 1
    object TbShtSearch: TTabSheet
      Caption = 'Pesquisa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabVisible = False
      object DBGrdControl: TDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 38
        Width = 730
        Height = 421
        Align = alClient
        DataSource = DtSrcControl
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object PnlSearchTop: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 730
        Height = 29
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object EdtSearch: TEdit
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 643
          Height = 23
          Align = alClient
          CharCase = ecUpperCase
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          ExplicitHeight = 21
        end
        object BtnSearch: TButton
          AlignWithMargins = True
          Left = 652
          Top = 1
          Width = 75
          Height = 27
          Margins.Top = 1
          Margins.Bottom = 1
          Align = alRight
          Caption = 'Pesquisar'
          TabOrder = 1
          OnClick = BtnSearchClick
        end
      end
    end
    object TbShtRegister: TTabSheet
      Caption = 'Registro'
      ImageIndex = 1
      TabVisible = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object PnlRegisterBottom: TPanel
        Left = 0
        Top = 421
        Width = 736
        Height = 41
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 0
        object BtBtnCancel: TBitBtn
          AlignWithMargins = True
          Left = 557
          Top = 3
          Width = 85
          Height = 35
          Align = alRight
          Caption = 'Cancelar'
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            0400000000006801000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            333333333333333333333333000033338833333333333333333F333333333333
            0000333911833333983333333388F333333F3333000033391118333911833333
            38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
            911118111118333338F3338F833338F3000033333911111111833333338F3338
            3333F8330000333333911111183333333338F333333F83330000333333311111
            8333333333338F3333383333000033333339111183333333333338F333833333
            00003333339111118333333333333833338F3333000033333911181118333333
            33338333338F333300003333911183911183333333383338F338F33300003333
            9118333911183333338F33838F338F33000033333913333391113333338FF833
            38F338F300003333333333333919333333388333338FFF830000333333333333
            3333333333333333333888330000333333333333333333333333333333333333
            0000}
          NumGlyphs = 2
          TabOrder = 0
          OnClick = BtBtnCancelClick
        end
        object BtBtnSave: TBitBtn
          AlignWithMargins = True
          Left = 648
          Top = 3
          Width = 85
          Height = 35
          Align = alRight
          Caption = 'Salvar'
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            0400000000006801000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333333333333333330000333333333333333333333333F33333333333
            00003333344333333333333333388F3333333333000033334224333333333333
            338338F3333333330000333422224333333333333833338F3333333300003342
            222224333333333383333338F3333333000034222A22224333333338F338F333
            8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
            33333338F83338F338F33333000033A33333A222433333338333338F338F3333
            0000333333333A222433333333333338F338F33300003333333333A222433333
            333333338F338F33000033333333333A222433333333333338F338F300003333
            33333333A222433333333333338F338F00003333333333333A22433333333333
            3338F38F000033333333333333A223333333333333338F830000333333333333
            333A333333333333333338330000333333333333333333333333333333333333
            0000}
          NumGlyphs = 2
          TabOrder = 1
          OnClick = BtBtnSaveClick
        end
      end
      object PnlRegisterLeft: TPanel
        Left = 0
        Top = 0
        Width = 156
        Height = 421
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 1
        object TrVwTopics: TTreeView
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 150
          Height = 415
          Align = alClient
          Ctl3D = False
          Indent = 19
          ParentCtl3D = False
          TabOrder = 0
          Items.NodeData = {
            03040000003E0000000000000000000000FFFFFFFFFFFFFFFF00000000000000
            000000000001104400610064006F00730020005000720069006E006300690070
            006100690073003E0000000000000000000000FFFFFFFFFFFFFFFF0000000000
            0000000000000001104400610064006F0073002000410064006900630069006F
            006E00610069007300360000000000000000000000FFFFFFFFFFFFFFFF000000
            000000000000000000010C4F007500740072006F00730020004400610064006F
            007300240000000000000000000000FFFFFFFFFFFFFFFF000000000000000000
            00000001032E002E002E00}
        end
      end
      object PnlRegisterRight: TPanel
        Left = 541
        Top = 0
        Width = 195
        Height = 421
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 2
        object LblDescription: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 48
          Width = 189
          Height = 14
          Align = alTop
          Caption = 'Descri'#231#227'o'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 54
        end
        object LblNameField: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 189
          Height = 14
          Align = alTop
          Caption = 'Nome (Banco de Dados)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 130
        end
        object EdtNameField: TEdit
          AlignWithMargins = True
          Left = 3
          Top = 23
          Width = 189
          Height = 19
          Align = alTop
          Color = clScrollBar
          Ctl3D = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 0
        end
        object MmDescription: TMemo
          AlignWithMargins = True
          Left = 3
          Top = 68
          Width = 189
          Height = 350
          Align = alClient
          Color = clScrollBar
          Ctl3D = False
          Lines.Strings = (
            '')
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 1
        end
      end
      object PnlRegisterClient: TPanel
        Left = 156
        Top = 0
        Width = 385
        Height = 421
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 3
        object SclBxData: TScrollBox
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 379
          Height = 415
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 0
          object PnlAdditionalData: TPanel
            Left = 0
            Top = 30
            Width = 377
            Height = 30
            Align = alTop
            Caption = 'Dados Adicionais'
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
          object PnlMainData: TPanel
            Left = 0
            Top = 0
            Width = 377
            Height = 30
            Align = alTop
            Caption = 'Dados Principais'
            Color = clHighlight
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentBackground = False
            ParentFont = False
            TabOrder = 1
          end
          object PnlOtherData: TPanel
            Left = 0
            Top = 60
            Width = 377
            Height = 30
            Align = alTop
            Caption = 'Outros Dados'
            Color = clHighlight
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentBackground = False
            ParentFont = False
            TabOrder = 2
          end
          object PnlOtherInformation: TPanel
            Left = 0
            Top = 90
            Width = 377
            Height = 30
            Align = alTop
            Caption = '...'
            Color = clHighlight
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentBackground = False
            ParentFont = False
            TabOrder = 3
          end
        end
      end
    end
  end
  object DtSrcControl: TDataSource
    OnStateChange = DtSrcControlStateChange
    Left = 392
    Top = 8
  end
end
