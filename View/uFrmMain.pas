(*******************************************************************************
 * Form : uFrmMain                                                             *
 * Autor : Vinícius Diniz da Costa                                             *
 * Data : 30/01/2018                                                           *
 * Função : Formulário principal do sistema                                    *
 *******************************************************************************)
unit uFrmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmRegisterClient, Vcl.StdCtrls,
  uFrmRegisterUser, Vcl.Buttons, uFrmRegisterModel, System.Actions,
  Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, Vcl.ToolWin,
  Vcl.ActnCtrls, Vcl.ActnMenus, uFrmRegisterActiv, uFrmRegisterPayPlan,
  uFrmRegisterProduct, uFrmRegisterDepartment, uFrmRegisterSection,
  uFrmRegisterProvider, uFrmRegisterBranch, uFrmRegisterCity, uFrmRegisterState,
  uFrmMainLogin, Vcl.ComCtrls, uModel.User, uMessageUtils, uFrmRegisterProfile,
  FireDAC.Comp.Client, uConnection, Vcl.ImgList, uFrmStock, uFrmOrderSale, uFrmPrice,
  uFrmAbout, uFrmAlterPass;

type
  TFrmMain = class(TForm)
    ActMngMainMenu: TActionManager;
    ActRegisterClient: TAction;
    ActRegisterProduct: TAction;
    ActRegisterUser: TAction;
    ActRegisterProfile: TAction;
    ActRegisterActiv: TAction;
    ActRegisterBranch: TAction;
    ActRegisterProvider: TAction;
    ActRegisterCity: TAction;
    ActRegisterState: TAction;
    ActRegiterPayPlan: TAction;
    ActRegisterSection: TAction;
    ActRegisterDepartment: TAction;
    ActResultStock: TAction;
    ActResultMoviment: TAction;
    ActResultPrice: TAction;
    ActMovimentSales: TAction;
    ActSecurityLogin: TAction;
    ActResultSales: TAction;
    ReinActMMBar: TActionMainMenuBar;
    ActHelperHelp: TAction;
    ActHelperAbout: TAction;
    ActSystemClose: TAction;
    ActSystemLogoff: TAction;
    ActTlBrMainMenu: TActionToolBar;
    StsBrUserProfile: TStatusBar;
    ImgLstActManager: TImageList;
    procedure ActRegisterClientExecute(Sender: TObject);
    procedure ActRegisterUserExecute(Sender: TObject);
    procedure ActRegisterProfileExecute(Sender: TObject);
    procedure ActRegisterActivExecute(Sender: TObject);
    procedure ActRegiterPayPlanExecute(Sender: TObject);
    procedure ActRegisterProductExecute(Sender: TObject);
    procedure ActRegisterDepartmentExecute(Sender: TObject);
    procedure ActRegisterSectionExecute(Sender: TObject);
    procedure ActRegisterProviderExecute(Sender: TObject);
    procedure ActRegisterBranchExecute(Sender: TObject);
    procedure ActRegisterCityExecute(Sender: TObject);
    procedure ActRegisterStateExecute(Sender: TObject);
    procedure ActSystemCloseExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActSystemLogoffExecute(Sender: TObject);
    procedure ActMovimentSalesExecute(Sender: TObject);
    procedure ActResultStockExecute(Sender: TObject);
    procedure ActResultPriceExecute(Sender: TObject);
    procedure ActHelperAboutExecute(Sender: TObject);
    procedure ActSecurityLoginExecute(Sender: TObject);
    procedure ActSecurityProfileExecute(Sender: TObject);
    procedure ActSecurityLogoffExecute(Sender: TObject);
  private
    { Private declarations }
  public
    FUser : TUser;
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

(*******************************************************************************
 * Métodos de formulário                                                       *
 *******************************************************************************)

// Método executado pela action ActRegisterActiv
procedure TFrmMain.ActHelperAboutExecute(Sender: TObject);
begin
  AboutBox := TAboutBox.Create(Self);
  AboutBox.ShowModal;
  FreeAndNil(AboutBox);
end;

procedure TFrmMain.ActMovimentSalesExecute(Sender: TObject);
begin
  //FrmSales := TFrmSales.Create(Self);
  //FrmSales.ShowModal;
  //FreeAndNil(FrmSales);
  FrmOrderSale := TFrmOrderSale.Create(Self,FUser.UserCode,FUser.UserName);
  FrmOrderSale.ShowModal;
  FreeAndNil(FrmOrderSale);
end;

procedure TFrmMain.ActRegisterActivExecute(Sender: TObject);
begin
  FrmRegisterActiv := TFrmRegisterActiv.Create(Self);
  FrmRegisterActiv.ShowModal;
  FreeAndNil(FrmRegisterActiv);
end;

// Método executado pela action ActRegisterBranch
procedure TFrmMain.ActRegisterBranchExecute(Sender: TObject);
begin
  FrmRegisterBranch := TFrmRegisterBranch.Create(Self);
  FrmRegisterBranch.ShowModal;
  FreeAndNil(FrmRegisterBranch);
end;

// Método executado pela action ActRegisterCity
procedure TFrmMain.ActRegisterCityExecute(Sender: TObject);
begin
  FrmRegisterCity := TFrmRegisterCity.Create(Self);
  FrmRegisterCity.ShowModal;
  FreeAndNil(FrmRegisterCity);
end;

// Método executado pela action ActRegisterClient
procedure TFrmMain.ActRegisterClientExecute(Sender: TObject);
begin
  FrmRegisterClient := TFrmRegisterClient.Create(self);
  FrmRegisterClient.ShowModal;
  FreeAndNil(FrmRegisterClient);
end;

// Método executado pela action ActRegisterDepartment
procedure TFrmMain.ActRegisterDepartmentExecute(Sender: TObject);
begin
  FrmRegisterDepartment := TFrmRegisterDepartment.Create(self);
  FrmRegisterDepartment.ShowModal;
  FreeAndNil(FrmRegisterDepartment);
end;

// Método executado pela action ActRegisterProduct
procedure TFrmMain.ActRegisterProductExecute(Sender: TObject);
begin
  FrmRegisterProduct := TFrmRegisterProduct.Create(Self);
  FrmRegisterProduct.ShowModal;
  FreeAndNil(FrmRegisterProduct);
end;

// Método executado pela action ActRegisterProfile
procedure TFrmMain.ActRegisterProfileExecute(Sender: TObject);
begin
  FrmRegisterProfile := TFrmRegisterProfile.Create(self,ActMngMainMenu);
  FrmRegisterProfile.ShowModal;
  FreeAndNil(FrmRegisterProfile);
end;

// Método executado pela action ActRegisterProvider
procedure TFrmMain.ActRegisterProviderExecute(Sender: TObject);
begin
  FrmRegisterProvider := TFrmRegisterProvider.Create(Self);
  FrmRegisterProvider.ShowModal;
  FreeAndNil(FrmRegisterProvider);
end;

// Método executado pela action ActRegisterSection
procedure TFrmMain.ActRegisterSectionExecute(Sender: TObject);
begin
  FrmRegisterSection := TFrmRegisterSection.Create(Self);
  FrmRegisterSection.ShowModal;
  FreeAndNil(FrmRegisterSection);
end;

// Método executado pela action ActRegisterState
procedure TFrmMain.ActRegisterStateExecute(Sender: TObject);
begin
  FrmRegisterState := TFrmRegisterState.Create(Self);
  FrmRegisterState.ShowModal;
  FreeAndNil(FrmRegisterState);
end;

// Método executado pela action ActRegisterUser
procedure TFrmMain.ActRegisterUserExecute(Sender: TObject);
begin
  FrmRegisterUser := TFrmRegisterUser.Create(self);
  FrmRegisterUser.ShowModal;
  FreeAndNil(FrmRegisterUser);
end;

// Método executado pela action ActRegiterPayPlan
procedure TFrmMain.ActRegiterPayPlanExecute(Sender: TObject);
begin
  FrmRegisterPayPlan := TFrmRegisterPayPlan.Create(Self);
  FrmRegisterPayPlan.ShowModal;
  FreeAndNil(FrmRegisterPayPlan);
end;

procedure TFrmMain.ActResultPriceExecute(Sender: TObject);
begin
  FrmPrice := TFrmPrice.Create(self);
  FrmPrice.ShowModal;
  FreeAndNil(FrmPrice);
end;

procedure TFrmMain.ActResultStockExecute(Sender: TObject);
begin
  FrmStock := TFrmStock.Create(Self);
  FrmStock.ShowModal;
  FreeAndNil(FrmStock);
end;

procedure TFrmMain.ActSecurityLoginExecute(Sender: TObject);
begin
  FrmAlterPass := TFrmAlterPass.Create(Self,FUser.UserCode);
  FrmAlterPass.ShowModal;
  FreeAndNil(FrmAlterPass);
end;

procedure TFrmMain.ActSecurityLogoffExecute(Sender: TObject);
begin
  //
end;

procedure TFrmMain.ActSecurityProfileExecute(Sender: TObject);
begin
 //
end;

// Método executado pela action ActSystemClose
procedure TFrmMain.ActSystemCloseExecute(Sender: TObject);
begin
  FreeAndNil(FUser);
  Application.Terminate;
end;

// Método executado pela action ActSystemLogoff
procedure TFrmMain.ActSystemLogoffExecute(Sender: TObject);
begin
  FUser := TUser.Create;
  FrmMainLogin := TFrmMainLogin.Create(Self, FUser);
  FrmMainLogin.ShowModal;
  if FrmMainLogin.ModalResult = mrOk then
    begin
      if FUser.GetDataUser then
        begin
          StsBrUserProfile.Panels.Items[0].Text :=
            'Usuário : '+FUser.UserCode+' - '+FUser.UserName;
          StsBrUserProfile.Panels.Items[1].Text :=
            'Perfil : '+FUser.ProfileName;
          ActMngMainMenu :=  FUser.GetPermission(ActMngMainMenu);
        end

      else
        begin
          MessageDlg(MsgLoginCorrupted,mtError,[mbOk],0);
          Application.Terminate;
        end;
    end

  else
    begin
      FreeAndNil(FUser);
      Application.Terminate;
    end;
  FreeAndNil(FrmMainLogin);
end;

// Método executado ao fechar o formulário
procedure TFrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(FUser);
end;

//// Método executado ao abrir o formulário
procedure TFrmMain.FormCreate(Sender: TObject);
begin
  FUser := TUser.Create;
  FrmMainLogin := TFrmMainLogin.Create(Self, FUser);
  FrmMainLogin.ShowModal;
  if FrmMainLogin.ModalResult = mrOk then
    begin
      if FUser.GetDataUser then
        begin
          StsBrUserProfile.Panels.Items[0].Text :=
            'Usuário : '+FUser.UserCode+' - '+FUser.UserName;
          StsBrUserProfile.Panels.Items[1].Text :=
            'Perfil : '+FUser.ProfileName;
          ActMngMainMenu :=  FUser.GetPermission(ActMngMainMenu);
        end

      else
        begin
          MessageDlg(MsgLoginCorrupted,mtError,[mbOk],0);
          Application.Terminate;
        end;
    end

  else
    begin
      FreeAndNil(FUser);
      Application.Terminate;
    end;
  FreeAndNil(FrmMainLogin);
end;

end.



