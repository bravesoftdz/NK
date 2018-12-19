unit UDMTalao;

interface

uses
  SysUtils, Classes, FMTBcd, DB, DBClient, Provider, SqlExpr;

type
  TDMTalao = class(TDataModule)
    Talao: TSQLDataSet;
    pTalao: TDataSetProvider;
    tTalao: TClientDataSet;
    dsTalao: TDataSource;
    dsTalaoMestre: TDataSource;
    sdsExec: TSQLDataSet;
    TalaoTALAO: TIntegerField;
    TalaoCODPRODUTO: TIntegerField;
    TalaoCODCOR: TIntegerField;
    TalaoCODGRADE: TIntegerField;
    TalaoQUANTIDADE: TIntegerField;
    TalaoPEDIDO: TIntegerField;
    TalaoITEMPEDIDO: TIntegerField;
    TalaoPEDIDOCLIENTE: TStringField;
    TalaoPEDCLIDIF: TStringField;
    TalaoCODCLIENTE: TIntegerField;
    TalaoPRODUZIDO: TStringField;
    TalaoNUMMOVEST: TIntegerField;
    TalaoDTBAIXA: TDateField;
    TalaoQTDPRODUZIDA: TIntegerField;
    TalaoCANCELADO: TStringField;
    TalaoMOTIVOCANCELADO: TStringField;
    TalaoDTCANCELADO: TDateField;
    TalaoDTGERADO: TDateField;
    TalaoIMPRIMIR: TStringField;
    TalaoENCERRADO: TStringField;
    TalaoIMPRESSODATA: TDateField;
    TalaoIMPRESSOHORA: TTimeField;
    TalaoIMPRESSOUSUARIO: TStringField;
    TalaoPROCESSO: TStringField;
    tTalaoTALAO: TIntegerField;
    tTalaoCODPRODUTO: TIntegerField;
    tTalaoCODCOR: TIntegerField;
    tTalaoCODGRADE: TIntegerField;
    tTalaoQUANTIDADE: TIntegerField;
    tTalaoPEDIDO: TIntegerField;
    tTalaoITEMPEDIDO: TIntegerField;
    tTalaoPEDIDOCLIENTE: TStringField;
    tTalaoPEDCLIDIF: TStringField;
    tTalaoCODCLIENTE: TIntegerField;
    tTalaoPRODUZIDO: TStringField;
    tTalaoNUMMOVEST: TIntegerField;
    tTalaoDTBAIXA: TDateField;
    tTalaoQTDPRODUZIDA: TIntegerField;
    tTalaoCANCELADO: TStringField;
    tTalaoMOTIVOCANCELADO: TStringField;
    tTalaoDTCANCELADO: TDateField;
    tTalaoDTGERADO: TDateField;
    tTalaoIMPRIMIR: TStringField;
    tTalaoENCERRADO: TStringField;
    tTalaoIMPRESSODATA: TDateField;
    tTalaoIMPRESSOHORA: TTimeField;
    tTalaoIMPRESSOUSUARIO: TStringField;
    tTalaoPROCESSO: TStringField;
    TalaoSetor: TSQLDataSet;
    tTalaoSetor: TClientDataSet;
    TalaoSetorTALAO: TIntegerField;
    TalaoSetorCODSETOR: TIntegerField;
    TalaoSetorPROCESSO: TStringField;
    TalaoSetorQTDENTRADA: TIntegerField;
    TalaoSetorQTDQUEBRAS: TIntegerField;
    TalaoSetorQTDPRODUZIDO: TIntegerField;
    TalaoSetorNOMESETOR: TStringField;
    tTalaoTalaoSetor: TDataSetField;
    tTalaoSetorTALAO: TIntegerField;
    tTalaoSetorCODSETOR: TIntegerField;
    tTalaoSetorPROCESSO: TStringField;
    tTalaoSetorQTDENTRADA: TIntegerField;
    tTalaoSetorQTDQUEBRAS: TIntegerField;
    tTalaoSetorQTDPRODUZIDO: TIntegerField;
    dsTalaoSetor: TDataSource;
    dsTalaoSetorMestre: TDataSource;
    TalaoParadas: TSQLDataSet;
    tTalaoParadas: TClientDataSet;
    TalaoParadasTALAO: TIntegerField;
    TalaoParadasCODSETOR: TIntegerField;
    TalaoParadasITEM: TIntegerField;
    TalaoParadasCODPARADA: TIntegerField;
    TalaoParadasDTENTRADA: TDateField;
    TalaoParadasHRENTRADA: TTimeField;
    TalaoParadasDTSAIDA: TDateField;
    TalaoParadasHRSAIDA: TTimeField;
    TalaoParadasCOMPLEMENTO: TStringField;
    TalaoParadasTOTALHORAS: TFloatField;
    TalaoParadasNOMEPARADA: TStringField;
    tTalaoSetorTalaoParadas: TDataSetField;
    tTalaoParadasTALAO: TIntegerField;
    tTalaoParadasCODSETOR: TIntegerField;
    tTalaoParadasITEM: TIntegerField;
    tTalaoParadasCODPARADA: TIntegerField;
    tTalaoParadasDTENTRADA: TDateField;
    tTalaoParadasHRENTRADA: TTimeField;
    tTalaoParadasDTSAIDA: TDateField;
    tTalaoParadasHRSAIDA: TTimeField;
    tTalaoParadasCOMPLEMENTO: TStringField;
    tTalaoParadasTOTALHORAS: TFloatField;
    tTalaoParadasNOMEPARADA: TStringField;
    dsTalaoParadas: TDataSource;
    TalaoQuebras: TSQLDataSet;
    tTalaoQuebras: TClientDataSet;
    TalaoQuebrasTALAO: TIntegerField;
    TalaoQuebrasCODSETOR: TIntegerField;
    TalaoQuebrasITEM: TIntegerField;
    TalaoQuebrasCODDEFEITO: TIntegerField;
    TalaoQuebrasDATA: TDateField;
    TalaoQuebrasQTD: TIntegerField;
    TalaoQuebrasHORA: TTimeField;
    TalaoQuebrasCOMPLEMENTO: TStringField;
    TalaoQuebrasNOMEDEFEITO: TStringField;
    tTalaoSetorTalaoQuebras: TDataSetField;
    tTalaoQuebrasTALAO: TIntegerField;
    tTalaoQuebrasCODSETOR: TIntegerField;
    tTalaoQuebrasITEM: TIntegerField;
    tTalaoQuebrasCODDEFEITO: TIntegerField;
    tTalaoQuebrasDATA: TDateField;
    tTalaoQuebrasQTD: TIntegerField;
    tTalaoQuebrasHORA: TTimeField;
    tTalaoQuebrasCOMPLEMENTO: TStringField;
    tTalaoQuebrasNOMEDEFEITO: TStringField;
    dsTalaoQuebras: TDataSource;
    tTalaoSetorNOMESETOR: TStringField;
    TalaoTOTALHORAS: TFloatField;
    TalaoHORASPRODUCAO: TFloatField;
    TalaoHORASPARADA: TFloatField;
    tTalaoTOTALHORAS: TFloatField;
    tTalaoHORASPRODUCAO: TFloatField;
    tTalaoHORASPARADA: TFloatField;
    TalaoSetorTOTALHORAS: TFloatField;
    TalaoSetorHORASPRODUCAO: TFloatField;
    TalaoSetorHORASPARADAS: TFloatField;
    tTalaoSetorTOTALHORAS: TFloatField;
    tTalaoSetorHORASPRODUCAO: TFloatField;
    tTalaoSetorHORASPARADAS: TFloatField;
    TalaoQTDEMPROCESSO: TIntegerField;
    tTalaoQTDEMPROCESSO: TIntegerField;
    TalaoQTDQUEBRAS: TIntegerField;
    tTalaoQTDQUEBRAS: TIntegerField;
    sdsTalaoTerceiro: TSQLDataSet;
    dspTalaoTerceiro: TDataSetProvider;
    cdsTalaoTerceiro: TClientDataSet;
    dsTalaoTerceiro: TDataSource;
    sdsTalaoReg: TSQLDataSet;
    cdsTalaoReg: TClientDataSet;
    dsTalaoReg: TDataSource;
    sdsTalaoRegTALAO: TIntegerField;
    sdsTalaoRegITEM: TIntegerField;
    sdsTalaoRegCODSETOR: TIntegerField;
    sdsTalaoRegCODFUNCIONARIO: TIntegerField;
    sdsTalaoRegPROCESSO: TStringField;
    sdsTalaoRegQTD: TIntegerField;
    sdsTalaoRegQTDQUEBRA: TIntegerField;
    sdsTalaoRegDTMOV: TDateField;
    sdsTalaoRegHRMOV: TTimeField;
    cdsTalaoRegTALAO: TIntegerField;
    cdsTalaoRegITEM: TIntegerField;
    cdsTalaoRegCODSETOR: TIntegerField;
    cdsTalaoRegCODFUNCIONARIO: TIntegerField;
    cdsTalaoRegPROCESSO: TStringField;
    cdsTalaoRegQTD: TIntegerField;
    cdsTalaoRegQTDQUEBRA: TIntegerField;
    cdsTalaoRegDTMOV: TDateField;
    cdsTalaoRegHRMOV: TTimeField;
    dspTalaoReg: TDataSetProvider;
    sdsTalaoTerceiroTALAO: TIntegerField;
    sdsTalaoTerceiroITEM: TIntegerField;
    sdsTalaoTerceiroDTENTRADA: TDateField;
    sdsTalaoTerceiroHRENTRADA: TTimeField;
    sdsTalaoTerceiroDTSAIDA: TDateField;
    sdsTalaoTerceiroHRSAIDA: TTimeField;
    sdsTalaoTerceiroCODFUNCIONARIOLIB: TIntegerField;
    sdsTalaoTerceiroCODSETORLIB: TIntegerField;
    sdsTalaoTerceiroQTDENTRADA: TIntegerField;
    sdsTalaoTerceiroQTDPRODUZIDO: TIntegerField;
    sdsTalaoTerceiroQTDQUEBRA: TIntegerField;
    sdsTalaoTerceiroCODPARADA: TIntegerField;
    cdsTalaoTerceiroTALAO: TIntegerField;
    cdsTalaoTerceiroITEM: TIntegerField;
    cdsTalaoTerceiroDTENTRADA: TDateField;
    cdsTalaoTerceiroHRENTRADA: TTimeField;
    cdsTalaoTerceiroDTSAIDA: TDateField;
    cdsTalaoTerceiroHRSAIDA: TTimeField;
    cdsTalaoTerceiroCODFUNCIONARIOLIB: TIntegerField;
    cdsTalaoTerceiroCODSETORLIB: TIntegerField;
    cdsTalaoTerceiroQTDENTRADA: TIntegerField;
    cdsTalaoTerceiroQTDPRODUZIDO: TIntegerField;
    cdsTalaoTerceiroQTDQUEBRA: TIntegerField;
    cdsTalaoTerceiroCODPARADA: TIntegerField;
    TalaoHORASTERCEIRO: TFloatField;
    sdsTalaoTerceiroTOTALHORAS: TFloatField;
    cdsTalaoTerceiroTOTALHORAS: TFloatField;
    tTalaoHORASTERCEIRO: TFloatField;
    TalaoMov: TSQLDataSet;
    tTalaoMov: TClientDataSet;
    dsTalaoMov: TDataSource;
    TalaoMovTALAO: TIntegerField;
    TalaoMovCODSETOR: TIntegerField;
    TalaoMovITEM: TIntegerField;
    TalaoMovDTENTRADA: TDateField;
    TalaoMovHRENTRADA: TTimeField;
    TalaoMovDTSAIDA: TDateField;
    TalaoMovHRSAIDA: TTimeField;
    TalaoMovQTDENTRADA: TIntegerField;
    TalaoMovQTDPRODUZIDO: TIntegerField;
    TalaoMovQTDQUEBRA: TIntegerField;
    TalaoMovCODFUNCIONARIO: TIntegerField;
    TalaoMovTIPOSAIDA: TStringField;
    TalaoMovTOTALHORAS: TFloatField;
    TalaoMovCODPARADA: TIntegerField;
    TalaoMovNOMEFUNCIONARIO: TStringField;
    tTalaoSetorTalaoMov: TDataSetField;
    tTalaoMovTALAO: TIntegerField;
    tTalaoMovCODSETOR: TIntegerField;
    tTalaoMovITEM: TIntegerField;
    tTalaoMovDTENTRADA: TDateField;
    tTalaoMovHRENTRADA: TTimeField;
    tTalaoMovDTSAIDA: TDateField;
    tTalaoMovHRSAIDA: TTimeField;
    tTalaoMovQTDENTRADA: TIntegerField;
    tTalaoMovQTDPRODUZIDO: TIntegerField;
    tTalaoMovQTDQUEBRA: TIntegerField;
    tTalaoMovCODFUNCIONARIO: TIntegerField;
    tTalaoMovTIPOSAIDA: TStringField;
    tTalaoMovTOTALHORAS: TFloatField;
    tTalaoMovCODPARADA: TIntegerField;
    tTalaoMovNOMEFUNCIONARIO: TStringField;
    TalaoMovCODPRODUTO: TIntegerField;
    tTalaoMovCODPRODUTO: TIntegerField;
    TalaoQuebrasCODFUNCIONARIO: TIntegerField;
    tTalaoQuebrasCODFUNCIONARIO: TIntegerField;
    TalaoHRGERADO: TTimeField;
    tTalaoHRGERADO: TTimeField;
    qTalaoMov: TSQLQuery;
    qTalaoMovTALAO: TIntegerField;
    qTalaoMovCODSETOR: TIntegerField;
    qTalaoMovITEM: TIntegerField;
    qTalaoMovDTENTRADA: TDateField;
    qTalaoMovHRENTRADA: TTimeField;
    qTalaoMovDTSAIDA: TDateField;
    qTalaoMovHRSAIDA: TTimeField;
    qTalaoMovQTDENTRADA: TIntegerField;
    qTalaoMovQTDPRODUZIDO: TIntegerField;
    qTalaoMovQTDQUEBRA: TIntegerField;
    qTalaoMovCODFUNCIONARIO: TIntegerField;
    qTalaoMovTIPOSAIDA: TStringField;
    qTalaoMovTOTALHORAS: TFloatField;
    qTalaoMovCODPARADA: TIntegerField;
    qTalaoMovCODPRODUTO: TIntegerField;
    qTalaoMovTESTE: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMTalao : TDMTalao;
  ctTalao : String;
  ctTalaoTerceiro : String;

implementation

uses DmdDatabase;

{$R *.dfm}

procedure TDMTalao.DataModuleCreate(Sender: TObject);
begin
  ctTalao         := Talao.CommandText;
  ctTalaoTerceiro := cdsTalaoTerceiro.CommandText;
end;

end.