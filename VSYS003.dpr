program VSYS003;

uses
  Vcl.Forms,
  uFrmMain in 'View\uFrmMain.pas' {FrmMain},
  uFrmRegisterModel in 'View\uFrmRegisterModel.pas' {FrmModelRegister},
  uMessageUtils in 'Model\uMessageUtils.pas',
  uValidateNumber in 'Model\uValidateNumber.pas',
  uDMConnection in 'DataModule\uDMConnection.pas' {DMConnection: TDataModule},
  uFrmRegisterClient in 'View\uFrmRegisterClient.pas' {FrmRegisterClient},
  uFrmSelectModel in 'View\uFrmSelectModel.pas' {FrmSelectModel},
  uFrmSelectCity in 'View\uFrmSelectCity.pas' {FrmCitySelect},
  uConnection in 'Model\uConnection.pas',
  uSQLUtils in 'Model\uSQLUtils.pas',
  uFrmSelectActiv in 'View\uFrmSelectActiv.pas' {FrmSelectActiv},
  uFrmRegisterUser in 'View\uFrmRegisterUser.pas' {FrmRegisterUser},
  uFrmAlterPassword in 'View\uFrmAlterPassword.pas' {FrmAlterPassword},
  uFrmRegisterProfile in 'View\uFrmRegisterProfile.pas' {FrmRegisterProfile},
  uFrmRegisterActiv in 'View\uFrmRegisterActiv.pas' {FrmRegisterActiv},
  uFrmRegisterPayPlan in 'View\uFrmRegisterPayPlan.pas' {FrmRegisterPayPlan},
  uFrmRegisterProduct in 'View\uFrmRegisterProduct.pas' {FrmRegisterProduct},
  uFrmRegisterDepartment in 'View\uFrmRegisterDepartment.pas' {FrmRegisterDepartment},
  uFrmRegisterSection in 'View\uFrmRegisterSection.pas' {FrmRegisterSection},
  uFrmRegisterProvider in 'View\uFrmRegisterProvider.pas' {FrmRegisterProvider},
  uFrmRegisterBranch in 'View\uFrmRegisterBranch.pas' {FrmRegisterBranch},
  uFrmRegisterCity in 'View\uFrmRegisterCity.pas' {FrmRegisterCity},
  uFrmRegisterState in 'View\uFrmRegisterState.pas' {FrmRegisterState},
  uModel.User in 'Model\uModel.User.pas',
  uFrmMainLogin in 'View\uFrmMainLogin.pas' {FrmMainLogin},
  uFrmStock in 'View\uFrmStock.pas' {FrmStock},
  uControllerSales in 'Controller\uControllerSales.pas',
  uModelSales in 'Model\uModelSales.pas',
  uFrmSelectionClient in 'View\uFrmSelectionClient.pas' {FrmSelectionClient},
  uFrmOrderSale in 'View\uFrmOrderSale.pas' {FrmOrderSale},
  uDAOSales in 'DAO\uDAOSales.pas',
  uFrmSelectPayPlan in 'View\uFrmSelectPayPlan.pas' {FrmSelectPayPlan},
  uFrmSelectBranch in 'View\uFrmSelectBranch.pas' {FrmSelectBranch},
  uModelProduct in 'Model\uModelProduct.pas',
  uModelProvider in 'Model\uModelProvider.pas',
  uModelDepartment in 'Model\uModelDepartment.pas',
  uFrmSelectProvider in 'View\uFrmSelectProvider.pas' {FrmSelectProvider},
  uFrmSelectDepartment in 'View\uFrmSelectDepartment.pas' {FrmSelectDepartment},
  uFrmConsultSales in 'View\uFrmConsultSales.pas' {FrmConsultSales},
  uFrmPrice in 'View\uFrmPrice.pas' {FrmPrice},
  uFrmAlterPrice in 'View\uFrmAlterPrice.pas' {FrmAlterPrice},
  uFrmAbout in 'View\uFrmAbout.pas' {AboutBox},
  uFrmAlterPass in 'View\uFrmAlterPass.pas' {FrmAlterPass},
  uFrmTest in 'View\uFrmTest.pas' {Form1},
  uFrmSalesSummary in 'View\uFrmSalesSummary.pas' {FrmSalesSummary};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'VSYS003';
  Application.CreateForm(TDMConnection, DMConnection);
  Application.CreateForm(TFrmMain, FrmMain);
  Application.CreateForm(TFrmSalesSummary, FrmSalesSummary);
  ReportMemoryLeaksOnShutdown := True;
  Application.Run;
end.
