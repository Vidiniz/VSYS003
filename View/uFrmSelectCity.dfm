inherited FrmCitySelect: TFrmCitySelect
  Caption = 'Cidades'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlTitle: TPanel
    Caption = 'Cidades'
  end
  inherited PnlBottom: TPanel
    inherited BtnSelect: TButton
      OnClick = BtnSelectClick
    end
  end
  inherited DtSrcControl: TDataSource
    DataSet = DMConnection.QueryCitySelect
    Top = 160
  end
end
