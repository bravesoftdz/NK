unit UContasPagar2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, Buttons, DBCtrls, ComCtrls, Grids, DBGrids, RXDBCtrl,
  RXLookup, Db, DBTables, RXSplit, DBFilter, RXCtrls, Menus, Printers, Mask, ToolEdit, CurrEdit, ALed, Variants, SMDBGrid, rsDBUtils;

type
  TfContasPagar2 = class(TForm)
    qParcelas: TQuery;
    qParcelasNumCPagar: TIntegerField;
    qParcelasParcCPagar: TIntegerField;
    qParcelasNumNotaEnt: TIntegerField;
    qParcelasCodForn: TIntegerField;
    qParcelasPgtoParcial: TFloatField;
    qParcelasRestParcela: TFloatField;
    qParcelasDesconto: TFloatField;
    qParcelasDtPagParcCPagar: TDateField;
    qParcelasVlrParcCPagar: TFloatField;
    qParcelasDtVencCPagar: TDateField;
    qParcelasCodConta: TIntegerField;
    qParcelasDtRecto: TDateField;
    qParcelasDtGerado: TDateField;
    qParcelasVlrDevolucao: TFloatField;
    qParcelasDiasAtraso: TFloatField;
    qParcelasNomeForn: TStringField;
    qParcelasNomeConta: TStringField;
    dsqParcelas: TDataSource;
    qParcelasclDiasAtraso: TFloatField;
    qParcelasNroDuplicata: TIntegerField;
    Panel5: TPanel;
    Label1: TLabel;
    Label6: TLabel;
    Label14: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label13: TLabel;
    Label22: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    CurrencyEdit2: TCurrencyEdit;
    BitBtn7: TBitBtn;
    GroupBox2: TGroupBox;
    ALed1: TALed;
    Label9: TLabel;
    ALed2: TALed;
    Label10: TLabel;
    ALed3: TALed;
    Label11: TLabel;
    ALed4: TALed;
    Label12: TLabel;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    DateEdit3: TDateEdit;
    DateEdit4: TDateEdit;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ProgressBar1: TProgressBar;
    CurrencyEdit1: TCurrencyEdit;
    Panel2: TPanel;
    RxSpeedButton1: TRxSpeedButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn8: TBitBtn;
    Panel3: TPanel;
    Label5: TLabel;
    Label16: TLabel;
    Label15: TLabel;
    Label4: TLabel;
    Label21: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label20: TLabel;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    SMDBGrid1: TSMDBGrid;
    qParcelasJurosParcCPagar: TFloatField;
    procedure BitBtn4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure qParcelasCalcFields(DataSet: TDataSet);
    procedure SMDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure RxSpeedButton1Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure CurrencyEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    vSQL : String;
    vExiste : Boolean;
    procedure Monta_SQLqParcelas;
    procedure Posiciona_Parcela;
  public
    { Public declarations }
  end;

var
  fContasPagar2: TfContasPagar2;

implementation

uses UDM1, UContasPagarPag, UCPagarAltera, UConsCPagarHist,
  UEstPagamentoPagar, UContasPagarDev, URelCPagar2, UContasPagarPagSel,
  ULancaCPagar;

{$R *.DFM}

procedure TfContasPagar2.Posiciona_Parcela;
begin
  vExiste := False;                                    
  if DM1.tCPagar.Locate('NumCPagar',qParcelasNumCPagar.AsInteger,[loCaseInsensitive]) then
    if DM1.tCPagarParc.Locate('NumCPagar;ParcCPagar',VarArrayOf([qParcelasNumCPagar.AsInteger,qParcelasParcCPagar.AsInteger]),[locaseinsensitive]) then
      vExiste := True;
  if not vExiste then
    ShowMessage('Parcela n�o encontrada no contas a pagar!');
end;

procedure TfContasPagar2.Monta_SQLqParcelas;
begin
  qParcelas.Close;
  qParcelas.SQL.Clear;
  qParcelas.SQL.Add(vSQL);
  if RxDBLookupCombo1.Text <> '' then
    begin
      qParcelas.SQL.Add(' AND (dbCPagarParc.CodForn = :CodForn) ');
      qParcelas.ParamByName('CodForn').AsInteger := RxDBLookupCombo1.KeyValue;
    end;
  if CurrencyEdit1.AsInteger > 0 then
    begin
      qParcelas.SQL.Add(' AND (dbCPagarParc.NroDuplicata = :NroDuplicata) ');
      qParcelas.ParamByName('NroDuplicata').AsInteger := CurrencyEdit1.AsInteger;
    end;
  if CurrencyEdit2.AsInteger > 0 then
    begin
      qParcelas.SQL.Add(' AND (dbCPagarParc.NumCPagar = :NumCPagar) ');
      qParcelas.ParamByName('NumCPagar').AsInteger := CurrencyEdit2.AsInteger;
    end;
  if DateEdit1.Date > 0 then
    begin
      qParcelas.SQL.Add(' AND (dbCPagarParc.DtVencCPagar >= :DtVectoIni) ');
      qParcelas.ParamByName('DtVectoIni').AsDate := DateEdit1.Date;
    end;
  if DateEdit2.Date > 0 then
    begin
      qParcelas.SQL.Add(' AND (dbCPagarParc.DtVencCPagar <= :DtVectoFin) ');
      qParcelas.ParamByName('DtVectoFin').AsDate := DateEdit2.Date;
    end;
  if DateEdit3.Date > 0 then
    begin
      qParcelas.SQL.Add(' AND (dbCPagarParc.DtGerado >= :DtEmissaoIni) ');
      qParcelas.ParamByName('DtEmissaoIni').AsDate := DateEdit3.Date;
    end;
  if DateEdit4.Date > 0 then
    begin
      qParcelas.SQL.Add(' AND (dbCPagarParc.DtGerado <= :DtEmissaoFin) ');
      qParcelas.ParamByName('DtEmissaoFin').AsDate := DateEdit4.Date;
    end;
  case ComboBox1.ItemIndex of
    0 : qParcelas.SQL.Add(' AND (dbCPagarParc.RestParcela > 0)');
    1 : qParcelas.SQL.Add(' AND (dbCPagarParc.PgtoParcial > 0)');
  end;
  case ComboBox2.ItemIndex of
    0 : qParcelas.SQL.Add('ORDER BY dbCPagarParc.DtVencCPagar, dbFornecedores.NomeForn, dbCPagarParc.NroDuplicata');
    1 : qParcelas.SQL.Add('ORDER BY dbCPagarParc.DtGerado, dbFornecedores.NomeForn, dbCPagarParc.NroDuplicata');
    2 : qParcelas.SQL.Add('ORDER BY dbFornecedores.NomeForn, dbCPagarParc.DtVencCPagar, dbCPagarParc.NroDuplicata');
    3 : qParcelas.SQL.Add('ORDER BY dbCPagarParc.NroDuplicata, dbFornecedores.NomeForn, dbCPagarParc.DtVencCPagar');
    4 : qParcelas.SQL.Add('ORDER BY dbCPagarParc.VlrParcCPagar, dbFornecedores.NomeForn, dbCPagarParc.DtVencCPagar');
  end;
  qParcelas.Open;
end;

procedure TfContasPagar2.BitBtn4Click(Sender: TObject);
begin
  Close;
end;

procedure TfContasPagar2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  oDBUtils.OpenTables(False,Self);
  Action := Cafree;
end;

procedure TfContasPagar2.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tFornecedores.IndexFieldNames := 'NomeForn';
end;

procedure TfContasPagar2.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_F4 then
    BitBtn7Click(Sender);
  if key = vk_F5 then
    BitBtn1Click(Sender);
  if key = vk_F6 then
    BitBtn2Click(Sender);
  if key = vk_F7 then
    BitBtn3Click(Sender);
  if key = vk_F8 then
    BitBtn5Click(Sender);
  if key = vk_F9 then
    BitBtn6Click(Sender);
end;

procedure TfContasPagar2.BitBtn3Click(Sender: TObject);
begin
  if DM1.tUsuarioCPagarPag.AsBoolean then
    begin
      if qParcelasNumCPagar.AsInteger > 0 then
        Posiciona_Parcela;
      if not vExiste then
        exit;
      if DM1.tCPagarParcRestParcela.AsFloat > 0 then
        begin
          Application.CreateForm(TfContasPagarPag, fContasPagarPag);
          fContasPagarPag.ShowModal;
        end
      else
        begin
          ShowMessage('Parcela j� quitada!');
          CurrencyEdit1.SetFocus;
        end;
    end
  else
    ShowMessage('Usu�rio "' + DM1.tUsuarioUsuario.AsString + '" n�o autorizado a abrir este formul�rio!');
end;
procedure TfContasPagar2.BitBtn2Click(Sender: TObject);
begin
  if DM1.tUsuarioCPagarAltera.AsBoolean then
    begin
      if qParcelasNumCPagar.AsInteger > 0 then
        Posiciona_Parcela;
      if not vExiste then
        exit;
      if  DM1.tCPagarParcRestParcela.AsFloat > 0 then
        begin
          fCPagarAltera := TfCPagarAltera.Create(self);
          fCPagarAltera.ShowModal;
        end
      else
        begin
          ShowMessage('Parcela j� quitada!');
          CurrencyEdit1.SetFocus;
        end;
    end
  else
    ShowMessage('Usu�rio "' + DM1.tUsuarioUsuario.AsString + '" n�o autorizado a abrir este formul�rio!');
end;

procedure TfContasPagar2.BitBtn1Click(Sender: TObject);
begin
  if qParcelasNumCPagar.AsInteger > 0 then
    Posiciona_Parcela;
  if not vExiste then
    exit;
  fConsCPagarHist := TfConsCPagarHist.Create(Self);
  fConsCPagarHist.ShowModal;
  CurrencyEdit1.SetFocus;
end;

procedure TfContasPagar2.BitBtn5Click(Sender: TObject);
begin
  if DM1.tUsuarioEstPgtoPagar.AsBoolean then
    begin
      if qParcelasNumCPagar.AsInteger > 0 then
        Posiciona_Parcela;
      if not vExiste then
        exit;
      fEstPagamentoPagar := TfEstPagamentoPagar.Create(Self);
      if MessageDlg('Deseja fazer estorno de Pgto?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
        begin
          fEstPagamentoPagar.RxDBFilter1.Active := True;
          fEstPagamentoPagar.BitBtn2.Enabled    := False;
          fEstPagamentoPagar.BitBtn3.Enabled    := True;
          if DM1.tCPagarParcHist.RecordCount > 0 then
            fEstPagamentoPagar.ShowModal
          else
            ShowMessage('N�o h� pagamentos a estornar!');
        end
      else
        begin
          fEstPagamentoPagar.RxDBFilter2.Active := True;
          fEstPagamentoPagar.BitBtn3.Enabled    := False;
          fEstPagamentoPagar.BitBtn2.Enabled    := True;
          if DM1.tCPagarParcHist.RecordCount > 0 then
            fEstPagamentoPagar.ShowModal
          else
            ShowMessage('N�o h� devolu��es a estornar!');
        end;
      fEstPagamentoPagar.RxDBFilter1.Active := False;
      fEstPagamentoPagar.RxDBFilter2.Active := False;
    end
  else
    ShowMessage('Usu�rio "' + DM1.tUsuarioUsuario.AsString + '" n�o autorizado a abrir este formul�rio!');
end;

procedure TfContasPagar2.BitBtn6Click(Sender: TObject);
begin
  if DM1.tUsuarioCPagarPag.AsBoolean then
    begin
      if qParcelasNumCPagar.AsInteger > 0 then
        Posiciona_Parcela;
      if not vExiste then
        exit;
      if DM1.tCPagarParcRestParcela.AsFloat > 0 then
        begin
          fContasPagarDev := tfContasPagarDev.Create(Self);
          fContasPagarDev.ShowModal;
        end
      else
        ShowMessage('Parcela j� quitada!');
    end
  else
    ShowMessage('Usu�rio "' + DM1.tUsuarioUsuario.AsString + '" n�o autorizado a abrir este formul�rio!');
end;

procedure TfContasPagar2.BitBtn7Click(Sender: TObject);
begin
  Monta_SQLqParcelas;
end;

procedure TfContasPagar2.qParcelasCalcFields(DataSet: TDataSet);
begin
  if StrToFloat(FormatFloat('0.00',qParcelasRestParcela.AsFloat)) > 0 then
    qParcelasclDiasAtraso.AsFloat := Date - qParcelasDtVencCPagar.AsDateTime
  else
    qParcelasclDiasAtraso.AsFloat := qParcelasDtPagParcCPagar.AsDateTime - qParcelasDtVencCPagar.AsDateTime;
  if qParcelasclDiasAtraso.AsFloat <= 0 then
    qParcelasclDiasAtraso.AsInteger := 0;
end;

procedure TfContasPagar2.SMDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if StrToFloat(FormatFloat('0.00',qParcelasRestParcela.AsFloat)) <= 0 then
    begin
      Background  := clTeal;
      AFont.Color := clWhite;
    end
  else
  if qParcelasclDiasAtraso.AsFloat > 0 then
    begin
      Background  := clRed;
      AFont.Color := clWhite;
    end
  else
  if qParcelasDtRecto.AsDateTime > 1 then
    begin
      Background  := clYellow;
      AFont.Color := clBlack;
    end;
end;

procedure TfContasPagar2.RxSpeedButton1Click(Sender: TObject);
begin
  SMDBGrid1.DisableScroll;
  fRelCPagar2 := TfRelCPagar2.Create(Self);
  fRelCPagar2.RLReport1.Preview;
  fRelCPagar2.RLReport1.Free;
  SMDBGrid1.EnableScroll;
end;

procedure TfContasPagar2.BitBtn8Click(Sender: TObject);
begin
  fContasPagarPagSel := tfContasPagarPagSel.Create(Self);
  fContasPagarPagSel.ShowModal;
end;

procedure TfContasPagar2.BitBtn9Click(Sender: TObject);
begin
  if DM1.tUsuarioLctoPagar.AsBoolean then
    begin
      fLancaCPagar := tfLancaCPagar.Create(Self);
      fLancaCPagar.ShowModal;
    end
  else
    ShowMessage('Usu�rio "' + DM1.tUsuarioUsuario.AsString + '" n�o autorizado a abrir este formul�rio!');
end;

procedure TfContasPagar2.BitBtn10Click(Sender: TObject);
begin
  if DM1.tUsuarioLctoPagar.AsBoolean then
    begin
      if qParcelasNumCPagar.AsInteger > 0 then
        Posiciona_Parcela;
      if not vExiste then
        exit;
      fLancaCPagar := tfLancaCPagar.Create(Self);
      fLancaCPagar.Tag := 1;
      fLancaCPagar.ShowModal;
    end
  else
    ShowMessage('Usu�rio "' + DM1.tUsuarioUsuario.AsString + '" n�o autorizado a abrir este formul�rio!');
end;

procedure TfContasPagar2.CurrencyEdit1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_Return) and (CurrencyEdit1.AsInteger > 0) then
    begin
      ComboBox1.ItemIndex := 2;
      BitBtn7Click(Sender);
    end;
end;

procedure TfContasPagar2.FormCreate(Sender: TObject);
begin
  oDBUtils.OpenTables(True,Self);
  oDBUtils.ActiveDataSet(True,dm1.tCPagar,Name);
  oDBUtils.ActiveDataSet(True,dm1.tCPagarParc,Name);
  oDBUtils.ActiveDataSet(True,dm1.tCPagarParcHist,Name);
  oDBUtils.ActiveDataSet(True,dm1.tCheque,Name);
  oDBUtils.ActiveDataSet(True,dm1.tChequeCPagar,Name);

  Top    := 0;
  Left   := 0;
  Width  := Screen.Width;
  Height := Screen.Height - 35;

  vSQL := qParcelas.SQL.Text;
end;

end.
