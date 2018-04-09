object FrmAlterPassword: TFrmAlterPassword
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Alterar Senha'
  ClientHeight = 143
  ClientWidth = 308
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object LblEdtNewPassword: TLabeledEdit
    Left = 24
    Top = 37
    Width = 161
    Height = 21
    CharCase = ecUpperCase
    EditLabel.Width = 58
    EditLabel.Height = 13
    EditLabel.Caption = 'Nova Senha'
    MaxLength = 10
    PasswordChar = '*'
    TabOrder = 0
  end
  object LblEdtConfirmPassword: TLabeledEdit
    Left = 24
    Top = 93
    Width = 161
    Height = 21
    CharCase = ecUpperCase
    EditLabel.Width = 73
    EditLabel.Height = 13
    EditLabel.Caption = 'Repita a Senha'
    MaxLength = 10
    PasswordChar = '*'
    TabOrder = 1
  end
  object BtnCofirm: TButton
    AlignWithMargins = True
    Left = 209
    Top = 13
    Width = 75
    Height = 82
    Caption = 'Confirmar'
    TabOrder = 2
    OnClick = BtnCofirmClick
  end
  object BtnCancel: TButton
    Left = 209
    Top = 101
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 3
    OnClick = BtnCancelClick
  end
end
