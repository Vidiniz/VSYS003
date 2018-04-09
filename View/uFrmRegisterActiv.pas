unit uFrmRegisterActiv;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmRegisterModel, Data.DB,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.ExtCtrls,
  uDMConnection, Vcl.Mask, Vcl.DBCtrls;

type
  TFrmRegisterActiv = class(TFrmModelRegister)
    Descrição: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRegisterActiv: TFrmRegisterActiv;

implementation

{$R *.dfm}


end.
