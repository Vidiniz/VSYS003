inherited FrmSelectBranch: TFrmSelectBranch
  Caption = 'Filiais'
  ExplicitTop = -44
  ExplicitWidth = 407
  ExplicitHeight = 513
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlTitle: TPanel
    Caption = 'Filiais'
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
    DataSet = DMConnection.QueryBranch
  end
end
