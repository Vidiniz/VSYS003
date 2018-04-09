inherited FrmSelectDepartment: TFrmSelectDepartment
  Caption = 'Departamentos'
  ExplicitTop = -44
  ExplicitWidth = 407
  ExplicitHeight = 513
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlTitle: TPanel
    Caption = 'Departamentos'
  end
  inherited DBGrdSelect: TDBGrid
    OnDblClick = DBGrdSelectDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'CODDEPARTAMENTO'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRICAO'
        Title.Caption = 'Departamento'
        Width = 295
        Visible = True
      end>
  end
  inherited PnlBottom: TPanel
    inherited BtnSelect: TButton
      OnClick = BtnSelectClick
    end
  end
  inherited DtSrcControl: TDataSource
    DataSet = DMConnection.QuerySelectDepartment
  end
end
