inherited FrmSelectPayPlan: TFrmSelectPayPlan
  Caption = 'Planos de Pagamento'
  ExplicitWidth = 407
  ExplicitHeight = 513
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlTitle: TPanel
    Caption = 'Planos de Pagamento'
  end
  inherited DBGrdSelect: TDBGrid
    OnDblClick = DBGrdSelectDblClick
  end
  inherited PnlBottom: TPanel
    inherited BtnSelect: TButton
      OnClick = BtnSelectClick
    end
  end
  inherited DtSrcControl: TDataSource
    DataSet = DMConnection.QueryPlan
  end
end
