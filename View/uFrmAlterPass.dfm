object FrmAlterPass: TFrmAlterPass
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Alterar Senha'
  ClientHeight = 103
  ClientWidth = 281
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
    Left = 16
    Top = 8
    Width = 72
    Height = 13
    Caption = 'Senha Anterior'
  end
  object Label2: TLabel
    Left = 16
    Top = 51
    Width = 58
    Height = 13
    Caption = 'Senha Atual'
  end
  object Edit1: TEdit
    Left = 16
    Top = 24
    Width = 169
    Height = 21
    NumbersOnly = True
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 16
    Top = 64
    Width = 169
    Height = 21
    NumbersOnly = True
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 191
    Top = 22
    Width = 75
    Height = 25
    Caption = 'Alterar'
    TabOrder = 2
  end
  object BitBtn2: TBitBtn
    Left = 191
    Top = 62
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 3
  end
end
