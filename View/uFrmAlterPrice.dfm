object FrmAlterPrice: TFrmAlterPrice
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Alterar Pre'#231'o de Venda'
  ClientHeight = 75
  ClientWidth = 404
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object EdtOldPrice: TEdit
    Left = 16
    Top = 40
    Width = 97
    Height = 21
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 0
  end
  object EdtNewPrice: TEdit
    Left = 119
    Top = 40
    Width = 106
    Height = 21
    TabOrder = 1
    OnKeyPress = EdtNewPriceKeyPress
  end
  object EdtCodeProduct: TEdit
    Left = 16
    Top = 13
    Width = 65
    Height = 21
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 2
  end
  object EdtNameProduct: TEdit
    Left = 87
    Top = 13
    Width = 300
    Height = 21
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 3
  end
  object BtnAlter: TBitBtn
    Left = 231
    Top = 40
    Width = 75
    Height = 25
    Caption = 'Alterar'
    Default = True
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
    TabOrder = 4
    OnClick = BtnAlterClick
  end
  object BtnCancel: TBitBtn
    Left = 312
    Top = 42
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 5
  end
end
