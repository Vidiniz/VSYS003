inherited FrmSelectProvider: TFrmSelectProvider
  Caption = 'Fornecedores'
  ExplicitTop = -44
  ExplicitWidth = 407
  ExplicitHeight = 513
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlTitle: TPanel
    Caption = 'Fornecedores'
  end
  inherited DBGrdSelect: TDBGrid
    OnDblClick = DBGrdSelectDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'CODFORNECEDOR'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Fornecedor'
        Visible = True
      end>
  end
  inherited PnlBottom: TPanel
    inherited BtnSelect: TButton
      OnClick = BtnSelectClick
    end
  end
  inherited DtSrcControl: TDataSource
    DataSet = DMConnection.QuerySelectProvider
  end
end
