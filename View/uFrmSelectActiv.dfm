inherited FrmSelectActiv: TFrmSelectActiv
  Caption = 'Ramo de Atividade'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlTitle: TPanel
    Caption = 'Ramo de Atividade'
  end
  inherited PnlBottom: TPanel
    inherited BtnSelect: TButton
      OnClick = BtnSelectClick
    end
  end
  inherited DtSrcControl: TDataSource
    DataSet = DMConnection.QueryActivSelect
  end
end
