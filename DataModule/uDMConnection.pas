(*******************************************************************************
 * Form : uDMConnection                                                        *
 * Autor : Vinícius Diniz da Costa                                             *
 * Data : 05/02/2018                                                           *
 * Função : Data Module do sistema                                             *
 *******************************************************************************)
unit uDMConnection;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Comp.UI, FireDAC.Phys.IBBase, FireDAC.Phys.FB, FireDAC.Comp.Client,
  Data.DB, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.ScriptCommands, FireDAC.Comp.Script;

type
  TDMConnection = class(TDataModule)
    Connection: TFDConnection;
    Transacition: TFDTransaction;
    ConManager: TFDManager;
    LinkDrivre: TFDPhysFBDriverLink;
    Cursor: TFDGUIxWaitCursor;
    QueryClient: TFDQuery;
    QueryClientCODCLIENTE: TIntegerField;
    QueryClientNOME: TStringField;
    QueryClientNOMEFANTASIA: TStringField;
    QueryClientCGC: TStringField;
    QueryClientINSCMUN: TStringField;
    QueryClientINSCEST: TStringField;
    QueryClientEMAILCOB: TStringField;
    QueryClientEMAILNFE: TStringField;
    QueryClientENDERECO: TStringField;
    QueryClientNUMERO: TStringField;
    QueryClientCOMPLEMENTO: TStringField;
    QueryClientBAIRRO: TStringField;
    QueryClientCIDADE: TStringField;
    QueryClientUF: TStringField;
    QueryClientCODATIVIDAE: TIntegerField;
    QueryClientDTCADASTRO: TDateField;
    QueryClientDTULTALT: TDateField;
    QueryClientCODCIDADE: TIntegerField;
    QueryClientTEL1: TStringField;
    QueryClientTEL2: TStringField;
    QueryClientTEL3: TStringField;
    QueryClientCEP: TStringField;
    QueryCitySelect: TFDQuery;
    QueryClientOBS: TStringField;
    QueryClientTIPO: TStringField;
    QueryOtherConsult: TFDQuery;
    QueryActivSelect: TFDQuery;
    QueryActivSelectCODATIVIDAE: TIntegerField;
    QueryActivSelectATIVIDADE: TStringField;
    UpdateClient: TFDUpdateSQL;
    QueryUser: TFDQuery;
    UpdateUser: TFDUpdateSQL;
    QueryUserCODUSUARIO: TIntegerField;
    QueryUserCODPERFIL: TIntegerField;
    QueryUserNOME: TStringField;
    QueryUserEMAIL: TStringField;
    QueryUserTELEFONE: TStringField;
    QueryUserLOGIN: TStringField;
    QueryUserSENHA: TStringField;
    QueryUserCODFILIAL: TIntegerField;
    QueryProfile: TFDQuery;
    QueryBranch: TFDQuery;
    QueryProfileCODPERFIL: TIntegerField;
    QueryProfilePERFIL: TStringField;
    UpdateProfile: TFDUpdateSQL;
    QueryActiv: TFDQuery;
    UpdateActiv: TFDUpdateSQL;
    QueryActivCODATIVIDAE: TIntegerField;
    QueryActivATIVIDADE: TStringField;
    QueryPlan: TFDQuery;
    UpdatePlan: TFDUpdateSQL;
    QueryPlanCODPLANO: TFDAutoIncField;
    QueryPlanDESCRICAO: TStringField;
    QueryPlanNUMPARC: TIntegerField;
    QueryClientCODUSURCAD: TIntegerField;
    QueryClientCODUSURALTER: TIntegerField;
    QueryProduct: TFDQuery;
    UpdateProduct: TFDUpdateSQL;
    QueryProductCODPRODUTO: TIntegerField;
    QueryProductCODFORNECEDOR: TIntegerField;
    QueryProductCODDEPARTAMENTO: TIntegerField;
    QueryProductDESCRICAO: TStringField;
    QueryProductCODFABRICA: TStringField;
    QueryProductQTUNITCX: TBCDField;
    QueryProductCODBARRAS: TStringField;
    QueryProductCODBARRASCX: TStringField;
    QueryProductALTURA: TBCDField;
    QueryProductLARGURA: TBCDField;
    QueryProductCOMPRIMENTO: TBCDField;
    QueryProductREGDATA: TDateField;
    QueryProductALTDATA: TDateField;
    QueryProductPESOLIQ: TBCDField;
    QueryProductPESOBRUTO: TBCDField;
    QueryDepartment: TFDQuery;
    UpdateDepartment: TFDUpdateSQL;
    QueryProvider: TFDQuery;
    UpdateProvider: TFDUpdateSQL;
    QueryDepartmentCODDEPARTAMENTO: TFDAutoIncField;
    QueryDepartmentDESCRICAO: TStringField;
    QuerySection: TFDQuery;
    UpdateSection: TFDUpdateSQL;
    QuerySectionCODSECAO: TIntegerField;
    QuerySectionCODDEPARTAMENTO: TIntegerField;
    QueryProviderCODFORNECEDOR: TFDAutoIncField;
    QueryProviderNOME: TStringField;
    QueryProviderNOMEFANTASIA: TStringField;
    QueryProviderCGC: TStringField;
    QueryProviderEMAIL: TStringField;
    QueryProviderENDERECO: TStringField;
    QueryProviderNUMERO: TStringField;
    QueryProviderCOMPLMENTO: TStringField;
    QueryProviderBAIRRO: TStringField;
    QueryProviderCIDADE: TStringField;
    QueryProviderUF: TStringField;
    QueryProviderCEP: TStringField;
    QuerySectionDESCRICAO: TStringField;
    UpdateBranch: TFDUpdateSQL;
    QueryBranchCODFILIAL: TIntegerField;
    QueryBranchFILIAL: TStringField;
    QueryBranchCGC: TStringField;
    QueryCity: TFDQuery;
    QueryState: TFDQuery;
    UpdateCity: TFDUpdateSQL;
    UpdateState: TFDUpdateSQL;
    QueryCityCODCIDADE: TFDAutoIncField;
    QueryCityDESCRICAO: TStringField;
    QueryCityCODIBGE: TIntegerField;
    QueryCityCODUF: TIntegerField;
    QueryStateCODUF: TFDAutoIncField;
    QueryStateDESCRICAO: TStringField;
    QueryStateUF: TStringField;
    DtSrcMDPermission: TDataSource;
    QueryPermission: TFDQuery;
    QueryPermissionCODPERMISSAO: TIntegerField;
    QueryPermissionDESCRICAO: TStringField;
    QueryPermissionFUNCAO: TStringField;
    QueryPermissionSTATUS: TStringField;
    UpdatePermission: TFDUpdateSQL;
    QueryPermissionCODPERFIL: TIntegerField;
    QuerySalesHeader: TFDQuery;
    DtSrcDetailHeaderSales: TDataSource;
    QuerySalesHeaderNUMPEDIDO: TIntegerField;
    QuerySalesHeaderCODFILIAL: TIntegerField;
    QuerySalesHeaderFILIAL: TStringField;
    QuerySalesHeaderCODCLIENTE: TIntegerField;
    QuerySalesHeaderNOME: TStringField;
    QuerySalesHeaderCODPLANO: TIntegerField;
    QuerySalesHeaderDESCRICAO: TStringField;
    QuerySalesHeaderDATA: TDateField;
    QuerySalesHeaderVLTOTAL: TBCDField;
    QuerySalesHeaderVLDESCONTO: TBCDField;
    QuerySalesHeaderSTATUS: TStringField;
    QuerySalesHeaderDTCANCEL: TDateField;
    QuerySelectProvider: TFDQuery;
    QuerySelectDepartment: TFDQuery;
    QuerySalesHeaderCons: TFDQuery;
    QuerySalesItemsCons: TFDQuery;
    DtScrDetailSales: TDataSource;
    QuerySalesHeaderConsNUMPEDIDO: TIntegerField;
    QuerySalesHeaderConsCODFILIAL: TIntegerField;
    QuerySalesHeaderConsFILIAL: TStringField;
    QuerySalesHeaderConsCODCLIENTE: TIntegerField;
    QuerySalesHeaderConsNOME: TStringField;
    QuerySalesHeaderConsCODPLANO: TIntegerField;
    QuerySalesHeaderConsDESCRICAO: TStringField;
    QuerySalesHeaderConsDATA: TDateField;
    QuerySalesHeaderConsVLTOTAL: TBCDField;
    QuerySalesHeaderConsVLDESCONTO: TBCDField;
    QuerySalesItemsConsNUMSEQ: TIntegerField;
    QuerySalesItemsConsCODPRODUTO: TIntegerField;
    QuerySalesItemsConsDESCRICAO: TStringField;
    QuerySalesItemsConsQTDE: TBCDField;
    QuerySalesItemsConsPRECO: TBCDField;
    QuerySalesItemsConsCODBARRAS: TStringField;
    QuerySalesItemsConsVLDESC: TBCDField;
    QuerySalesItemsConsTOTALPRECO: TBCDField;
    QuerySalesItemsConsNUMPEDIDO: TIntegerField;
    QueryReportSales: TFDQuery;
    QueryConsultPrice: TFDQuery;
    QueryConsultPriceCODPRODUTO: TIntegerField;
    QueryConsultPriceDESCRICAO: TStringField;
    QueryConsultPriceCODFABRICA: TStringField;
    QueryConsultPriceCODBARRAS: TStringField;
    QueryConsultPriceCUSTO: TBCDField;
    QueryConsultPricePVENDA: TBCDField;
    QuerySumSalesHeader: TFDQuery;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    StringField1: TStringField;
    IntegerField3: TIntegerField;
    StringField2: TStringField;
    IntegerField4: TIntegerField;
    StringField3: TStringField;
    DateField1: TDateField;
    BCDField1: TBCDField;
    BCDField2: TBCDField;
    QuerySumSalesItens: TFDQuery;
    IntegerField5: TIntegerField;
    IntegerField6: TIntegerField;
    StringField4: TStringField;
    BCDField3: TBCDField;
    BCDField4: TBCDField;
    StringField5: TStringField;
    BCDField5: TBCDField;
    BCDField6: TBCDField;
    IntegerField7: TIntegerField;
    DtSrcDetailSumSales: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMConnection: TDMConnection;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}



end.
