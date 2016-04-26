unit untExemplo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, untTADVString, untTADVNumeric, untTADVDateTime;

type
  TfrmPrincipal = class(TForm)
    lbl1: TLabel;
    edtADVSValor: TEdit;
    btnProcessarTADVString: TBitBtn;
    lbl2: TLabel;
    edtADVSAlltrim: TEdit;
    Label1: TLabel;
    edtADVSLtrim: TEdit;
    Label2: TLabel;
    edtADVSRtrim: TEdit;
    Label3: TLabel;
    edtADVSCaixaMista: TEdit;
    Label7: TLabel;
    edtADVSStringLength: TEdit;
    Label8: TLabel;
    edtADVSToComma: TEdit;
    Label9: TLabel;
    edtADVSToCNPJCpf: TEdit;
    Label10: TLabel;
    edtADVSReverseStr: TEdit;
    Label11: TLabel;
    edtADVSRemoveExt: TEdit;
    Label12: TLabel;
    edtADVSToFloat: TEdit;
    Label13: TLabel;
    edtADVSToDate: TEdit;
    Label14: TLabel;
    edtADVSToDateTime: TEdit;
    lblToCurrency: TLabel;
    edtADVSToCurrency: TEdit;
    btnADVSConcatenar: TBitBtn;
    Label6: TLabel;
    edtADVSExtractNumbers: TEdit;
    Label5: TLabel;
    edtADVSLower: TEdit;
    Label4: TLabel;
    edtADVSRemoveAcento: TEdit;
    btnADVSClear: TBitBtn;
    btnADVSExplode: TBitBtn;
    chkADVSisEmail: TCheckBox;
    chkADVSIsDateTime: TCheckBox;
    btnADVSHasString: TBitBtn;
    chkADVSIsEmpty: TCheckBox;
    chkADVSIsFloat: TCheckBox;
    chkADVSIsInteger: TCheckBox;
    btnADVSRemoveCaracteres: TBitBtn;
    btnADVSReplaceString: TBitBtn;
    btnADVSSearchLeft: TBitBtn;
    btnADVSSearchRight: TBitBtn;
    Label15: TLabel;
    edtADVSToInt: TEdit;
    lblUpper: TLabel;
    edtADVSUpper: TEdit;
    Label17: TLabel;
    edtADVSWordcount: TEdit;
    chkADVSisCNPJ: TCheckBox;
    chkADVSisCPF: TCheckBox;
    Label16: TLabel;
    edtADVSPADC: TEdit;
    edtADVSTamPADC: TEdit;
    Label18: TLabel;
    edtADVSTamPADR: TEdit;
    edtADVSPADR: TEdit;
    Label19: TLabel;
    edtADVSTAMPADL: TEdit;
    edtADVSPADL: TEdit;
    Label20: TLabel;
    Label21: TLabel;
    edtADVSSubstring: TEdit;
    edtADVSPosInicial: TEdit;
    edtADVSPosFinal: TEdit;
    Label22: TLabel;
    Label23: TLabel;
    pgc1: TPageControl;
    ts1: TTabSheet;
    tsTADVDouble: TTabSheet;
    Label24: TLabel;
    edtADVDValor: TEdit;
    BitBtn1: TBitBtn;
    Label25: TLabel;
    edtADVDRoundTo: TEdit;
    Label26: TLabel;
    edtADVDTrunc: TEdit;
    Label27: TLabel;
    edtADVDCalPercentual: TEdit;
    Label29: TLabel;
    edtADVDCalcProporcao: TEdit;
    Label30: TLabel;
    edtADVDToSqlServerFormat: TEdit;
    Label31: TLabel;
    edtADVDToExtenco: TEdit;
    edtADVDTamRoundTo: TEdit;
    edtADVDTamTrunc: TEdit;
    edtADVDTamCalPercentual: TEdit;
    edtADVDTamCalcProporcao: TEdit;
    Label28: TLabel;
    edtADVDToExtencoReais: TEdit;
    edtADVToReias: TEdit;
    Label32: TLabel;
    edtADVToReaisPlano: TEdit;
    Label33: TLabel;
    btnADVDADD: TBitBtn;
    btnADVDSub: TBitBtn;
    btnADVDADDAsString: TBitBtn;
    btnADVDInc: TBitBtn;
    btnADVDDec: TBitBtn;
    btnADVDClear: TBitBtn;
    btnADVDEval: TBitBtn;
    btnSubtrairPercentual: TBitBtn;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    tsTADVInteger: TTabSheet;
    Label37: TLabel;
    edtTADIToExtenco: TEdit;
    edtTADIValor: TEdit;
    Label38: TLabel;
    BitBtn2: TBitBtn;
    Label39: TLabel;
    edtTADITAMCalcPercentual: TEdit;
    Label40: TLabel;
    edtTADICalcPercentual: TEdit;
    edtTADICalcProporcao: TEdit;
    edtTADITamCalcProporcao: TEdit;
    Label41: TLabel;
    btnTADIAdd: TBitBtn;
    btnTADISub: TBitBtn;
    btnTADIInc: TBitBtn;
    btnTADIDEc: TBitBtn;
    btnTADINextValue: TBitBtn;
    btnTADIPriorValue: TBitBtn;
    btnTADIClear: TBitBtn;
    tsTADVDate: TTabSheet;
    edtADVDTToSqlServerFormat: TEdit;
    Label42: TLabel;
    edtADVDTToExtenco: TEdit;
    Label43: TLabel;
    edtADVDTGetUltimoDiaSemana: TEdit;
    Label44: TLabel;
    edtADVDTGetMes: TEdit;
    Label45: TLabel;
    edtADVDTGEtAno: TEdit;
    Label46: TLabel;
    lblGetDiaSemana: TLabel;
    edtGetDiaSemana: TEdit;
    edtADVDTMesToExtenco: TEdit;
    Label48: TLabel;
    edtADVDTDiaDaSemanaExtenco: TEdit;
    Label49: TLabel;
    Label50: TLabel;
    edtADVDTGetDia: TEdit;
    edtADVDTGetAnoMesesDias: TEdit;
    lblGetAnoMesesDias: TLabel;
    Label55: TLabel;
    edtADVDTGetMesesDias: TEdit;
    edtADVDTGetUltimoDiaMes: TEdit;
    Label56: TLabel;
    Label57: TLabel;
    edtADVDTGetPrimeiroDiaAnoData: TEdit;
    edtADVDTGetPrimeiroDiaAno: TEdit;
    Label58: TLabel;
    Label59: TLabel;
    edtADVDTGetPrimeiroDiaMes: TEdit;
    edtTAVDTValor: TEdit;
    Label47: TLabel;
    BitBtn3: TBitBtn;
    btnAddDias: TBitBtn;
    chkADVDTisAnoBiSexto: TCheckBox;
    chkisADVDTFimDeSemana: TCheckBox;
    btnSubDias: TBitBtn;
    btnEncode: TBitBtn;
    btnEncodeFromString: TBitBtn;
    BitBtn4: TBitBtn;
    btnSetDateNow: TBitBtn;
    procedure btnProcessarTADVStringClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnADVSClearClick(Sender: TObject);
    procedure btnADVSConcatenarClick(Sender: TObject);
    procedure btnADVSExplodeClick(Sender: TObject);
    procedure btnADVSHasStringClick(Sender: TObject);
    procedure btnADVSRemoveCaracteresClick(Sender: TObject);
    procedure btnADVSReplaceStringClick(Sender: TObject);
    procedure btnADVSSearchLeftClick(Sender: TObject);
    procedure btnADVSSearchRightClick(Sender: TObject);
    procedure btnADVDADDClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnADVDSubClick(Sender: TObject);
    procedure btnADVDADDAsStringClick(Sender: TObject);
    procedure btnADVDIncClick(Sender: TObject);
    procedure btnADVDDecClick(Sender: TObject);
    procedure btnADVDClearClick(Sender: TObject);
    procedure btnADVDEvalClick(Sender: TObject);
    procedure btnSubtrairPercentualClick(Sender: TObject);
    procedure btnTADIClearClick(Sender: TObject);
    procedure btnTADIAddClick(Sender: TObject);
    procedure btnTADIIncClick(Sender: TObject);
    procedure btnTADIDEcClick(Sender: TObject);
    procedure btnTADINextValueClick(Sender: TObject);
    procedure btnTADIPriorValueClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure btnAddDiasClick(Sender: TObject);
    procedure btnSubDiasClick(Sender: TObject);
    procedure btnEncodeClick(Sender: TObject);
    procedure btnEncodeFromStringClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure btnSetDateNowClick(Sender: TObject);
  private
    { Private declarations }
    stString: TADVString;
    dbDouble: TADVDouble;
    inInteger: TADVInteger;
    dtDate: TADVDate;
    procedure setTADVString;
    procedure setTADVDouble;
    procedure setTADVInteger;
    procedure setTADVDate;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnADVSConcatenarClick(Sender: TObject);
begin
  stString.ADD(InputBox('Digite a string', '', 'Nova String'));
  stString.Text := edtADVSValor.Text;
  setTADVString;
end;

procedure TfrmPrincipal.btnADVSExplodeClick(Sender: TObject);
var
  stQuebra: string;
  caractere: Char;
begin
  stString.Text := edtADVSValor.Text;
  stQuebra := InputBox('Digite o carater de quebra', '', ';');
  if (Length(stQuebra) > 0) then
  begin
    caractere := stQuebra[1];
    ShowMessage(stString.Explode(caractere).Text);
  end
  else
    ShowMessage('Digite um caracter');
end;

procedure TfrmPrincipal.btnADVSHasStringClick(Sender: TObject);
var
  stSubString: string;
begin
  stSubString := (InputBox('Digite a sub-string', '', 'subString'));
  stString.Text := edtADVSValor.Text;
  ShowMessage(BoolToStr(stString.HasString(stSubString)));

end;

procedure TfrmPrincipal.btnADVSSearchRightClick(Sender: TObject);
var
  stAux: string;
  caractere: Char;
  inResultado: Integer;
begin
  stString.Text := edtADVSValor.Text;
  stAux := InputBox('Digite o carater', '', 'a');
  if (Length(stAux) > 0) then
  begin
    caractere := stAux[1];
    inResultado := (stString.SearchRigth(caractere));

    if inResultado > 0 then
      ShowMessage('Encontrado na posição: ' + IntToStr(inResultado))
    else
      ShowMessage('Não Encontrado na string');

  end
  else
    ShowMessage('Digite um caracter');
end;

procedure TfrmPrincipal.btnEncodeClick(Sender: TObject);
var
  stAno, stDia, stMes: string;
begin
  stAno := (InputBox('Digite o ano:', '', '2016'));
  stDia := (InputBox('Digite o dia:', '', '10'));
  stMes := (InputBox('Digite o mês:', '', '4'));

  dtDate.Encode(StrToInt(stDia), StrToInt(stMes), StrToInt(stAno));

  edtTAVDTValor.Text := dtDate.ToString.Text;
  setTADVDate;

end;

procedure TfrmPrincipal.btnEncodeFromStringClick(Sender: TObject);
var
  stAux: string;
begin
  stAux := (InputBox('Digite a data:', '', '04/04/2016'));
  dtDate.EncodeFromString(stAux);

  edtTAVDTValor.Text := dtDate.ToString.Text;
  setTADVDate;

end;

procedure TfrmPrincipal.BitBtn1Click(Sender: TObject);
begin
  setTADVInteger;
end;

procedure TfrmPrincipal.BitBtn3Click(Sender: TObject);
begin
  setTADVDate;
end;

procedure TfrmPrincipal.BitBtn4Click(Sender: TObject);
var
  staux: string;
begin
  staux := (InputBox('Digite a data hora', '', '16/04/2016 12:53:25'));

  dtDate.Value := StrToDateTime(staux);
  dtDate.ReplaceTimer();

  edtTAVDTValor.Text := dtDate.ToString.Text;
  setTADVDate;

end;

procedure TfrmPrincipal.btnAddDiasClick(Sender: TObject);
var
  staux: string;
begin
  staux := (InputBox('Digite o valor', '', '10'));

  dtDate.Value := StrToDate(edtTAVDTValor.Text);
  dtDate.AddDias(StrToInt(staux));

  edtTAVDTValor.Text := dtDate.ToString.Text;
  setTADVDate;

end;

procedure TfrmPrincipal.btnADVDADDAsStringClick(Sender: TObject);
var
  staux: string;
begin
  staux := (InputBox('Digite o valor', '', '10'));

  dbDouble.Value := StrToFloat(edtADVDValor.Text);
  dbDouble.ADDAsString(staux);

  edtADVDValor.Text := dbDouble.ToString.Text;
  setTADVDouble;

end;

procedure TfrmPrincipal.btnADVDADDClick(Sender: TObject);
var
  staux: string;
begin
  staux := (InputBox('Digite o valor', '', '10'));
  dbDouble.Value := StrToFloat(edtADVDValor.Text);
  dbDouble.ADD(StrToFloat(staux));

  edtADVDValor.Text := dbDouble.ToString.Text;
  setTADVDouble;
end;

procedure TfrmPrincipal.btnADVDClearClick(Sender: TObject);
begin
  dbDouble.Clear;

  edtADVDValor.Text := dbDouble.ToString.Text;
  setTADVDouble;
end;

procedure TfrmPrincipal.btnADVDDecClick(Sender: TObject);
begin
  dbDouble.Value := StrToFloat(edtADVDValor.Text);
  dbDouble.Dec;

  edtADVDValor.Text := dbDouble.ToString.Text;
  setTADVDouble;
end;

procedure TfrmPrincipal.btnADVDEvalClick(Sender: TObject);
var
  staux: string;
begin
  staux := (InputBox('Digite o valor', '', '10'));

  dbDouble.Value := StrToFloat(edtADVDValor.Text);
  dbDouble.Eval(staux);

  edtADVDValor.Text := dbDouble.ToString.Text;
  setTADVDouble;
end;

procedure TfrmPrincipal.btnADVDIncClick(Sender: TObject);
begin
  dbDouble.Value := StrToFloat(edtADVDValor.Text);
  dbDouble.Inc;

  edtADVDValor.Text := dbDouble.ToString.Text;
  setTADVDouble;
end;

procedure TfrmPrincipal.btnADVDSubClick(Sender: TObject);
var
  staux: string;
begin
  staux := (InputBox('Digite o valor', '', '10'));

  dbDouble.Value := StrToFloat(edtTADIValor.Text);
  dbDouble.Sub(StrToFloat(staux));

  edtTADIValor.Text := dbDouble.ToString.Text;
  setTADVInteger;
end;

procedure TfrmPrincipal.btnADVSClearClick(Sender: TObject);
begin
  stString.Clear;
  edtADVSValor.Text := stString.Text;
  setTADVString;
end;

procedure TfrmPrincipal.btnProcessarTADVStringClick(Sender: TObject);
begin
  setTADVString;
end;

procedure TfrmPrincipal.btnSetDateNowClick(Sender: TObject);
begin
  dtDate.SetDateNow;
  edtTAVDTValor.Text := dtDate.ToString.Text;
  setTADVDate;
end;

procedure TfrmPrincipal.btnSubDiasClick(Sender: TObject);
var
  staux: string;
begin
  staux := (InputBox('Digite o valor', '', '10'));

  dtDate.Value := StrToDate(edtTAVDTValor.Text);
  dtDate.SubDias(StrToInt(staux));

  edtTAVDTValor.Text := dtDate.ToString.Text;
  setTADVDate;

end;

procedure TfrmPrincipal.btnSubtrairPercentualClick(Sender: TObject);
var
  staux: string;
  dbTam: Double;
begin
  staux := (InputBox('Digite o valor', '', '10'));

  dbDouble.Value := StrToFloat(edtADVDValor.Text);

  dbTam := StrToFloat(staux);
  dbDouble.SubtrairPercentual(dbTam);

  edtADVDValor.Text := dbDouble.ToString.Text;
  setTADVDouble;
end;

procedure TfrmPrincipal.btnTADIAddClick(Sender: TObject);
var
  staux: string;
begin
  staux := (InputBox('Digite o valor', '', '10'));
  inInteger.Value := StrToInt(edtTADIValor.Text);
  inInteger.ADD(StrToInt(staux));

  edtTADIValor.Text := inInteger.ToString.Text;
  setTADVInteger;

end;

procedure TfrmPrincipal.btnTADIClearClick(Sender: TObject);
begin
  inInteger.Clear;
  edtTADIValor.Text := inInteger.ToString.Text;
  setTADVInteger;
end;

procedure TfrmPrincipal.btnTADIDEcClick(Sender: TObject);
begin
  inInteger.Value := StrToInt(edtTADIValor.Text);
  inInteger.Dec;

  edtTADIValor.Text := inInteger.ToString.Text;
  setTADVInteger;
end;

procedure TfrmPrincipal.btnTADIIncClick(Sender: TObject);
begin
  inInteger.Value := StrToInt(edtTADIValor.Text);
  inInteger.Inc;

  edtTADIValor.Text := inInteger.ToString.Text;
  setTADVInteger;

end;

procedure TfrmPrincipal.btnTADINextValueClick(Sender: TObject);
begin
  inInteger.Value := StrToInt(edtTADIValor.Text);
  ShowMessage(IntToStr(inInteger.NextValue));
end;

procedure TfrmPrincipal.btnTADIPriorValueClick(Sender: TObject);
begin
  inInteger.Value := StrToInt(edtTADIValor.Text);
  ShowMessage(IntToStr(inInteger.PriorValue));
end;

procedure TfrmPrincipal.btnADVSRemoveCaracteresClick(Sender: TObject);
var
  stAux: string;
  caractere: Char;
begin
  stString.Text := edtADVSValor.Text;
  stAux := InputBox('Digite o carater', '', ';');
  if (Length(stAux) > 0) then
  begin
    caractere := stAux[1];
    edtADVSValor.Text := (stString.RemoveCaracteres([caractere]).Text);
    setTADVString;
  end
  else
    ShowMessage('Digite um caracter');
end;

procedure TfrmPrincipal.btnADVSReplaceStringClick(Sender: TObject);
var
  stOldString, stNewString: string;
begin
  stOldString := (InputBox('Digite a string a ser substituida:', '', ''));
  stNewString := (InputBox('Digite a nova string:', '', ''));

  stString.Text := edtADVSValor.Text;
  edtADVSValor.Text := stString.ReplaceString(stOldString, stNewString).Text;
  setTADVString;
end;

procedure TfrmPrincipal.btnADVSSearchLeftClick(Sender: TObject);
var
  stAux: string;
  caractere: Char;
  inResultado: Integer;
begin
  stString.Text := edtADVSValor.Text;
  stAux := InputBox('Digite o carater', '', 'a');
  if (Length(stAux) > 0) then
  begin
    caractere := stAux[1];
    inResultado := (stString.SearchLeft(caractere));

    if inResultado > 0 then
      ShowMessage('Encontrado na posição: ' + IntToStr(inResultado))
    else
      ShowMessage('Não Encontrado na string');

  end
  else
    ShowMessage('Digite um caracter');
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  setTADVDouble;
  setTADVString;
  dtDate.SetDateNow;
  edtTAVDTValor.Text := dtDate.ToString.Text;
  setTADVDate;
end;

procedure TfrmPrincipal.setTADVDate;
begin
  dtDate.Value := StrToDateTime(edtTAVDTValor.Text);

  edtADVDTGetPrimeiroDiaAno.Text := dtDate.GetPrimeiroDiaAno.ToString.Text;
  edtADVDTGetPrimeiroDiaMes.Text := dtDate.GetPrimeiroDiaMes.ToString.Text;
  edtADVDTToSqlServerFormat.Text := dtDate.ToSqlServerFormat.Text;
  //edtADVDTGetAnoMesesDias.Text := dtDate.GetAnoMesesDias.ToString.Text;
  //edtADVDTGetMesesDias.Text := dtDate.GetMesesDias.ToString.Text;
  edtADVDTGetUltimoDiaMes.Text := dtDate.GetUltimoDiaMes.ToString.Text;
  edtADVDTGetPrimeiroDiaAnoData.Text := DateToStr(dtDate.GetPrimeiroDiaAnoData);
  edtADVDTGetUltimoDiaSemana.Text := dtDate.GetUltimoDiaSemana.ToString.Text;
  edtGetDiaSemana.Text := dtDate.GetDiaSemana.ToString.Text;
  edtADVDTGEtAno.Text := dtDate.GEtAno.ToString.Text;
  edtADVDTGetMes.Text := dtDate.GetMes.ToString.Text;
  edtADVDTGetDia.Text := dtDate.GetDia.ToString.Text;
  edtADVDTDiaDaSemanaExtenco.Text := dtDate.DiaDaSemanaExtenco.Text;
  edtADVDTMesToExtenco.Text := dtDate.MesToExtenco.Text;
  edtADVDTToExtenco.Text := dtDate.ToExtenco.Text;

  chkADVDTisAnoBiSexto.Checked := dtDate.isAnoBiSexto;
  chkisADVDTFimDeSemana.Checked := dtDate.isFimDeSemana;
end;

procedure TfrmPrincipal.setTADVDouble;
var
  inTam: Integer;
  dbTam: Double;
begin
  dbDouble.Value := StrToFloat(edtADVDValor.Text);

  inTam := StrToInt(edtADVDTamRoundTo.Text);
  edtADVDRoundTo.Text := FloatToStr(dbDouble.RoundTo(inTam));

  inTam := StrToInt(edtADVDTamTrunc.Text);
  edtADVDTrunc.Text := FloatToStr(dbDouble.Trunc(inTam));

  inTam := StrToInt(edtADVDTamCalPercentual.Text);
  edtADVDCalPercentual.Text := FloatToStr(dbDouble.CalPercentual(inTam));

  inTam := StrToInt(edtADVDTamCalcProporcao.Text);
  edtADVDCalcProporcao.Text := FloatToStr(dbDouble.CalcProporcao(inTam));

  edtADVDToSqlServerFormat.Text := dbDouble.ToSqlServerFormat.Text;

  edtADVDToExtenco.Text := dbDouble.ToExtenco.Text;

  edtADVDToExtencoReais.Text := dbDouble.ToExtencoReais.Text;

  edtADVToReias.Text := dbDouble.ToReias.Text;

  edtADVToReaisPlano.Text := dbDouble.ToReaisPlano.Text;

end;

procedure TfrmPrincipal.setTADVInteger;
var
  inTam: Integer;
  dbTam: Double;
begin
  inInteger.Value := StrToInt(edtTADIValor.Text);

  inTam := StrToInt(edtTADITAMCalcPercentual.Text);
  edtTADICalcPercentual.Text := FloatToStr(inInteger.CalPercentual(inTam));

  edtTADIToExtenco.Text := inInteger.ToExtenco.Text;

  inTam := StrToInt(edtTADITamCalcProporcao.Text);
  edtTADICalcProporcao.Text := FloatToStr(inInteger.CalcProporcao(inTam));

end;

procedure TfrmPrincipal.setTADVString;
begin
  stString.Text := edtADVSValor.Text;
  chkADVSisEmail.Checked := stString.isEmail();
  chkADVSIsDateTime.Checked := stString.IsDateTime();
  chkADVSIsFloat.Checked := stString.IsFloat();
  chkADVSIsEmpty.Checked := stString.IsEmpty();
  chkADVSIsInteger.Checked := stString.IsInteger();
  chkADVSisCNPJ.Checked := stString.isCNPJ();
  chkADVSisCPF.Checked := stString.IsCPF();

  edtADVSAlltrim.Text := stString.Alltrim().Text;
  edtADVSLtrim.Text := stString.LTrim().Text;
  edtADVSRtrim.Text := stString.RTrim().Text;
  edtADVSCaixaMista.Text := stString.CaixaMista().Text;
  edtADVSStringLength.Text := IntToStr(stString.StringLength);
  edtADVSToComma.Text := stString.ToComma().Text;

  edtADVSReverseStr.Text := stString.ReverseStr().Text;
  edtADVSRemoveExt.Text := stString.RemoveExt().Text;

  edtADVSPADC.Text := stString.PadC(StrToInt(edtADVSTamPADC.Text), '*').Text;
  edtADVSPADR.Text := stString.PadR(StrToInt(edtADVSTamPADR.Text), '*').Text;
  edtADVSPADL.Text := stString.PadL(StrToInt(edtADVSTAMPADL.Text), '*').Text;

  edtADVSSubstring.Text := stString.SubString(StrToInt(edtADVSPosInicial.Text), StrToInt(edtADVSPosFinal.Text)).Text;

  try
    edtADVSToFloat.Text := FloatToStr(stString.ToFloat());
  except
    edtADVSToFloat.Text := '';
  end;

  try
    edtADVSToDate.Text := DateToStr(stString.ToDate());
  except
    edtADVSToDate.Text := '';
  end;

  try
    edtADVSToDateTime.Text := DateTimeToStr(stString.ToDateTime());
  except on e: Exception do
      edtADVSToDateTime.Text := '';
  end;

  try
    edtADVSToCurrency.Text := CurrToStr(stString.ToCurrency());
  except
    edtADVSToDateTime.Text := '';
  end;

  try
    edtADVSExtractNumbers.Text := stString.ExtractNumbers().Text;
  except
    edtADVSExtractNumbers.Text := '';
  end;

  edtADVSLower.Text := stString.Lower().Text;
  edtADVSRemoveAcento.Text := stString.RemoveAcento().Text;

  try
    edtADVSToInt.Text := IntToStr(stString.ToInt());
  except
    edtADVSToInt.Text := '';
  end;
  edtADVSUpper.Text := stString.Upper().Text;

  edtADVSWordcount.Text := IntToStr(stString.Wordcount());

  try
    edtADVSToCNPJCpf.Text := stString.ToCNPJCpf().Text;
  except
    edtADVSToCNPJCpf.Text := '';
  end;

end;

end.

