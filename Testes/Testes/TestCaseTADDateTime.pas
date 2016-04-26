unit TestCaseTADDateTime;

interface
uses TestFramework, Classes, Math, DateUtils, SysUtils;

type
  //classe de teste da TADVString
  TTestCaseTADDateTime = class(TTestCase)
  private

  published

    //TADVDate.AddDias
    procedure TADVDate_AddDias_Pode_Adicionar_Datas;

    // TADVDate.INDates
    procedure TADVDate_INDates_Pode_Confirmar;
    procedure TADVDate_INDates_Nao_Pode_Confirmar;

    //TADVDate.DiaDaSemanaExtenco
    procedure TADVDate_DiaDaSemanaExtenco_Pode_Retornar;

    //TADVDate.DiasNoMes
    procedure TADVDate_DiasNoMes_Pode_Retornar;
    procedure TADVDate_DiasNoMes_Pode_Retornar_Bissexto;

    // TADVDate.Encode
    procedure TADVDate_Encode_Pode_Converter;

    //TADVDate.EncodeStr
    procedure TADVDate_EncodeStr_Pode_Converter;

    //TADVDate.EncodeFromString
    procedure TADVDate_EncodeFromString_Pode_Converter;

    //TADVDate.EncodeFromString
    procedure TADVDate_Formatar_Pode_Formatar;

    // TADVDate.GetAno
    procedure TADVDate_GetAno_Pode_Retornar;

    //TADVDate.GetDia
    procedure TADVDate_GetDia_Pode_Retornar;

    //TADVDate_GetAnoMesesDias
    procedure TADVDate_GetAnoMesesDias_Pode_Retornar;

    //TADVDate.GetDiaSemana
    procedure TADVDate_GetDiaSemana_Pode_Retornar;

    //TADVDate.GetPrimeiroDiaSemana
    procedure TADVDate_GetPrimeiroDiaSemana_Pode_Retornar;

    //TADVDate.GetUltimoDiaSemana
    procedure TADVDate_GetUltimoDiaSemana_Pode_Retornar;

    //TADVDate.GetMes
    procedure TADVDate_GetMes_Pode_Retornar;

    //TADVDate.GetPrimeiroDiaAno
    procedure TADVDate_GetPrimeiroDiaAno_Pode_Retornar;

    //TADVDate.GetPrimeiroDiaAnoData
    procedure TADVDate_GetPrimeiroDiaAnoData_Pode_Retornar;

    //TADVDate.GetPrimeiroDiaMes
    procedure TADVDate_GetPrimeiroDiaMes_Pode_Retornar;

    ///TADVDate.GetUltimoDiaMes
    procedure TADVDate_GetUltimoDiaMes_Pode_Retornar;

    //TADVDate.ADDMes
    procedure TADVDate_ADDMes_Pode_Retornar;

    //TADVDate.isAnoBiSexto
    procedure TADVDate_isAnoBiSexto_Pode_Confirmar;
    procedure TADVDate_isAnoBiSexto_Nao_Pode_Confirmar;

    //TADVDate.isFimDeSemana
    procedure TADVDate_isFimDeSemana_Pode_Confirmar;
    procedure TADVDate_isFimDeSemana_Nao_Pode_Confirmar;

    //TADVDate.MesToExtenco
    procedure TADVDate_MesToExtenco_Pode_Retornar;

    //TADVDate.ReplaceTimer
    procedure TADVDate_ReplaceTimer_Pode_Retornar;

    //TADVDate.SetDateNow
    procedure TADVDate_SetDateNow_Pode_Setar;

    //TADVDate.SubDias
    procedure TADVDate_SubDias_Pode_Subtrair;

    //TADVDate.ToExtenco
    procedure TADVDate_ToExtenco_Pode_Retornar;

    //TADVDate.ToString
    procedure TADVDate_ToString_Pode_Retornar;

    //TADVDate.ToSqlServerFormat
    procedure TADVDate_ToSqlServerFormat_Pode_Retornar;

    //TADVTime.DataHoraString
    procedure TADVTime_DataHoraString_Pode_Retornar;

    //TADVTime.GetHora
    procedure TADVTime_GetHora_Pode_Retornar;

    //TADVTime.GetMinutos
    procedure TADVTime_GetMinutos_Pode_Retornar;

    //TADVTime.GetSegundos
    procedure TADVTime_GetSegundos_Pode_Retornar;

    //TADVTime.HoraToString
    procedure TADVTime_HoraToString_Pode_Converter;

    //ToExtenco
    procedure TADVTime_ToExtenco_Pode_Converter;

    //ToMinutos
     procedure TADVTime_ToMinutos_Pode_Converter;

  end;

implementation

uses untTADVDateTime;

{ TTestCaseTADDateTime }

procedure TTestCaseTADDateTime.TADVDate_AddDias_Pode_Adicionar_Datas;
var
  dtDate: TADVDate;
  dtInicial, dtEsperado, dtResultado: TDateTime;
begin
  //ambiente
  dtInicial := EncodeDate(2016, 4, 20);
  dtEsperado := EncodeDate(2016, 4, 30);

  dtDate.Value := dtInicial;

  //a��o
  dtDate.AddDias(10);
  dtResultado := dtDate.Value;

  //assertiva
  CheckEquals(dtEsperado, dtResultado, 'N�o Somou os dias a data corretamente');
end;

procedure TTestCaseTADDateTime.TADVDate_ADDMes_Pode_Retornar;
var
  dtDate: TADVDate;
  dtInicial, dtEsperado, dtResultado: TDateTime;
begin
  //ambiente
  dtInicial := EncodeDate(2016, 4, 20);
  dtEsperado := EncodeDate(2016, 8, 20);

  dtDate.Value := dtInicial;

  //a��o
  dtDate.ADDMes(4);
  dtResultado := dtDate.Value;

  //assertiva
  CheckEquals(dtEsperado, dtResultado, 'N�o Somou os meses a data corretamente');

end;

procedure TTestCaseTADDateTime.TADVDate_DiaDaSemanaExtenco_Pode_Retornar;
var
  dtDate: TADVDate;
  dtInicial: TDateTime;
  stEsperado, stResultado: string;
begin
  //ambiente
  dtInicial := EncodeDate(2016, 4, 20);
  stEsperado := 'Quarta-feira';

  dtDate.Value := dtInicial;

  //a��o
  stResultado := dtDate.DiaDaSemanaExtenco().Text;

  //assertiva
  CheckEquals(stEsperado, stResultado, 'N�o retornou por exten�o corretamente');

end;

procedure TTestCaseTADDateTime.TADVDate_DiasNoMes_Pode_Retornar;
var
  dtDate: TADVDate;
  dtInicial: TDateTime;
  inEsperado, inResultado: Integer;
begin
  //ambiente
  dtInicial := EncodeDate(2016, 4, 20);
  inEsperado := 30;

  dtDate.Value := dtInicial;

  //a��o
  inResultado := dtDate.DiasNoMes.Value;

  //assertiva
  CheckEquals(inEsperado, inResultado, 'N�o retornou o dia corretamente');

end;

procedure TTestCaseTADDateTime.TADVDate_DiasNoMes_Pode_Retornar_Bissexto;
var
  dtDate: TADVDate;
  dtInicial: TDateTime;
  inEsperado, inResultado: Integer;
begin
  //ambiente
  dtInicial := EncodeDate(2016, 2, 20); //ano bissexto
  inEsperado := 29;

  dtDate.Value := dtInicial;

  //a��o
  inResultado := dtDate.DiasNoMes.Value;

  //assertiva
  CheckEquals(inEsperado, inResultado, 'N�o retornou o dia corretamente');

end;

procedure TTestCaseTADDateTime.TADVDate_EncodeFromString_Pode_Converter;
var
  dtDate: TADVDate;
  dtEsperado, dtResultado: TDateTime;
begin
  //ambiente
  dtEsperado := EncodeDate(2016, 4, 20);

  //a��o
  dtDate.EncodeFromString('20/04/2016');
  dtResultado := dtDate.Value;

  //assertiva
  CheckEquals(dtEsperado, dtResultado, 'N�o gerou a data corretamente');

end;

procedure TTestCaseTADDateTime.TADVDate_EncodeStr_Pode_Converter;
var
  dtDate: TADVDate;
  dtEsperado, dtResultado: TDateTime;
begin
  //ambiente
  dtEsperado := EncodeDate(2016, 4, 20);

  //a��o
  dtDate.EncodeStr('20', '4', '2016');
  dtResultado := dtDate.Value;

  //assertiva
  CheckEquals(dtEsperado, dtResultado, 'N�o gerou a data corretamente');

end;

procedure TTestCaseTADDateTime.TADVDate_Encode_Pode_Converter;
var
  dtDate: TADVDate;
  dtEsperado, dtResultado: TDateTime;
begin
  //ambiente
  dtEsperado := EncodeDate(2016, 4, 20);

  //a��o
  dtDate.Encode(20, 4, 2016);
  dtResultado := dtDate.Value;

  //assertiva
  CheckEquals(dtEsperado, dtResultado, 'N�o gerou a data corretamente');

end;

procedure TTestCaseTADDateTime.TADVDate_Formatar_Pode_Formatar;
var
  dtDate: TADVDate;
  stEsperado, stResultado: string;
begin
  //ambiente
  stEsperado := '20/04/2016';
  dtDate.Encode(20, 4, 2016);

  //a��o
  stResultado := dtDate.Formatar('dd/mm/yyyy').Text;

  //assertiva
  CheckEquals(stEsperado, stResultado, 'N�o gerou a data corretamente');

end;

procedure TTestCaseTADDateTime.TADVDate_GetAnoMesesDias_Pode_Retornar;
var
  dtDate: TADVDate;
  dtInicial, dtTeste, dtFinal: TDateTime;
  trResultado: TArAnos;
  trEsperado: TArAnos;
  i, j: integer;
begin
  //ambiente
  dtInicial := EncodeDate(2016, 1, 1);
  dtFinal := EncodeDate(2017, 12, 31);

  dtDate.Value := dtInicial;

  SetLength(trEsperado, 2);

  trEsperado[0].Ano := 2016;
  trEsperado[0].Meses[1].Value := 31;
  trEsperado[0].Meses[2].Value := 29;
  trEsperado[0].Meses[3].Value := 31;
  trEsperado[0].Meses[4].Value := 30;
  trEsperado[0].Meses[5].Value := 31;
  trEsperado[0].Meses[6].Value := 30;
  trEsperado[0].Meses[7].Value := 31;
  trEsperado[0].Meses[8].Value := 31;
  trEsperado[0].Meses[9].Value := 30;
  trEsperado[0].Meses[10].Value := 31;
  trEsperado[0].Meses[11].Value := 30;
  trEsperado[0].Meses[12].Value := 31;

  trEsperado[1].Ano := 2017;
  trEsperado[1].Meses[1].Value := 31;
  trEsperado[1].Meses[2].Value := 28;
  trEsperado[1].Meses[3].Value := 31;
  trEsperado[1].Meses[4].Value := 30;
  trEsperado[1].Meses[5].Value := 31;
  trEsperado[1].Meses[6].Value := 30;
  trEsperado[1].Meses[7].Value := 31;
  trEsperado[1].Meses[8].Value := 31;
  trEsperado[1].Meses[9].Value := 30;
  trEsperado[1].Meses[10].Value := 31;
  trEsperado[1].Meses[11].Value := 30;
  trEsperado[1].Meses[12].Value := 31;

  //a��o
  trResultado := dtDate.GetAnoMesesDias(dtInicial, dtFinal);

  //assertiva
  for I := Low(trResultado) to High(trResultado) do
  begin
    CheckEquals(trEsperado[i].Ano, trResultado[i].Ano, 'N�o retornou o ano corretamente');
    for j := Low(trResultado[i].Meses) to High(trResultado[i].Meses) do
    begin
      CheckEquals(trEsperado[i].Meses[j].Value, trResultado[i].Meses[j].Value, 'N�o retornou o Mes corretamente');
    end;
  end;

end;

procedure TTestCaseTADDateTime.TADVDate_GetAno_Pode_Retornar;
var
  dtDate: TADVDate;
  dtInicial: TDateTime;
  stEsperado, stResultado: integer;
begin
  //ambiente
  dtInicial := EncodeDate(2016, 4, 20);
  stEsperado := 2016;

  dtDate.Value := dtInicial;

  //a��o
  stResultado := dtDate.GetAno().Value;

  //assertiva
  CheckEquals(stEsperado, stResultado, 'N�o retornou ano corretamente');

end;

procedure TTestCaseTADDateTime.TADVDate_GetDiaSemana_Pode_Retornar;
var
  dtDate: TADVDate;
  dtInicial: TDateTime;
  stEsperado, stResultado: integer;
begin
  //ambiente
  dtInicial := EncodeDate(2016, 4, 20);
  stEsperado := 3;

  dtDate.Value := dtInicial;

  //a��o
  stResultado := dtDate.GetDiaSemana().Value;

  //assertiva
  CheckEquals(stEsperado, stResultado, 'N�o retornou dia corretamente');
end;

procedure TTestCaseTADDateTime.TADVDate_GetDia_Pode_Retornar;
var
  dtDate: TADVDate;
  dtInicial: TDateTime;
  stEsperado, stResultado: integer;
begin
  //ambiente
  dtInicial := EncodeDate(2016, 4, 20);
  stEsperado := 20;

  dtDate.Value := dtInicial;

  //a��o
  stResultado := dtDate.GetDia().Value;

  //assertiva
  CheckEquals(stEsperado, stResultado, 'N�o retornou dia corretamente');

end;

procedure TTestCaseTADDateTime.TADVTime_GetHora_Pode_Retornar;
var
  dtHora: TADVTime;
  dtInicial: TDateTime;
  inEsperado, inResultado: Integer;
begin
  //ambiente
  dtInicial :=  EncodeTime(15, 41, 23, 2);
  inEsperado := 15;

  dtHora.Value := dtInicial;

  //a��o
  inResultado := dtHora.GetHora().Value;

  //assertiva
  CheckEquals(inEsperado, inResultado, 'N�o retornou a hora corretamente');

end;

procedure TTestCaseTADDateTime.TADVDate_GetMes_Pode_Retornar;
var
  dtDate: TADVDate;
  dtInicial: TDateTime;
  stEsperado, stResultado: integer;
begin
  //ambiente
  dtInicial := EncodeDate(2016, 4, 20);
  stEsperado := 4;

  dtDate.Value := dtInicial;

  //a��o
  stResultado := dtDate.GetMes().Value;

  //assertiva
  CheckEquals(stEsperado, stResultado, 'N�o retornou dia corretamente');

end;

procedure TTestCaseTADDateTime.TADVTime_GetMinutos_Pode_Retornar;
var
  dtHora: TADVTime;
  dtInicial: TDateTime;
  inEsperado, inResultado: Integer;
begin
  //ambiente
  dtInicial :=  EncodeTime(15, 41, 23, 2);
  inEsperado := 41;

  dtHora.Value := dtInicial;

  //a��o
  inResultado := dtHora.GetMinutos().Value;

  //assertiva
  CheckEquals(inEsperado, inResultado, 'N�o retornou os minutos corretamente');

end;

procedure TTestCaseTADDateTime.TADVDate_GetPrimeiroDiaAnoData_Pode_Retornar;
var
  dtDate: TADVDate;
  dtInicial: TDateTime;
  stEsperado, stResultado: TDateTime;
begin
  //ambiente
  dtInicial := EncodeDate(2016, 4, 20);
  stEsperado := EncodeDate(2016, 1, 1);
  ;

  dtDate.Value := dtInicial;

  //a��o
  stResultado := dtDate.GetPrimeiroDiaAnoData();

  //assertiva
  CheckEquals(stEsperado, stResultado, 'N�o retornou dia corretamente');

end;

procedure TTestCaseTADDateTime.TADVDate_GetPrimeiroDiaAno_Pode_Retornar;
var
  dtDate: TADVDate;
  dtInicial: TDateTime;
  stEsperado, stResultado: integer;
begin
  //ambiente
  dtInicial := EncodeDate(2016, 4, 20);
  stEsperado := 1;

  dtDate.Value := dtInicial;

  //a��o
  stResultado := dtDate.GetPrimeiroDiaAno().Value;

  //assertiva
  CheckEquals(stEsperado, stResultado, 'N�o retornou dia corretamente');

end;

procedure TTestCaseTADDateTime.TADVDate_GetPrimeiroDiaMes_Pode_Retornar;
var
  dtDate: TADVDate;
  dtInicial: TDateTime;
  stEsperado, stResultado: integer;
begin
  //ambiente
  dtInicial := EncodeDate(2016, 4, 20);
  stEsperado := 1;

  dtDate.Value := dtInicial;

  //a��o
  stResultado := dtDate.GetPrimeiroDiaMes().Value;

  //assertiva
  CheckEquals(stEsperado, stResultado, 'N�o retornou dia corretamente');

end;

procedure TTestCaseTADDateTime.TADVDate_GetPrimeiroDiaSemana_Pode_Retornar;
var
  dtDate: TADVDate;
  dtInicial: TDateTime;
  stEsperado, stResultado: TDateTime;
begin
  //ambiente
  dtInicial := EncodeDate(2016, 4, 20);
  stEsperado := EncodeDate(2016, 4, 18);

  dtDate.Value := dtInicial;

  //a��o
  stResultado := dtDate.GetPrimeiroDiaSemana().Value;

  //assertiva
  CheckEquals(stEsperado, stResultado, 'N�o retornou dia corretamente');

end;

procedure TTestCaseTADDateTime.TADVTime_GetSegundos_Pode_Retornar;
var
  dtHora: TADVTime;
  dtInicial: TDateTime;
  inEsperado, inResultado: Integer;
begin
  //ambiente
  dtInicial :=  EncodeTime(15, 41, 23, 2);
  inEsperado := 23;

  dtHora.Value := dtInicial;

  //a��o
  inResultado := dtHora.GetSegundos().Value;

  //assertiva
  CheckEquals(inEsperado, inResultado, 'N�o retornou os segundos corretamente');

end;

procedure TTestCaseTADDateTime.TADVDate_GetUltimoDiaMes_Pode_Retornar;
var
  dtDate: TADVDate;
  dtInicial: TDateTime;
  stEsperado, stResultado: integer;
begin
  //ambiente
  dtInicial := EncodeDate(2016, 4, 20);
  stEsperado := 30;

  dtDate.Value := dtInicial;

  //a��o
  stResultado := dtDate.GetUltimoDiaMes().Value;

  //assertiva
  CheckEquals(stEsperado, stResultado, 'N�o retornou dia corretamente');

end;

procedure TTestCaseTADDateTime.TADVDate_GetUltimoDiaSemana_Pode_Retornar;
var
  dtDate: TADVDate;
  dtInicial: TDateTime;
  stEsperado, stResultado: string;
  a: string;
begin
  //ambiente
  dtInicial := EncodeDate(2016, 4, 20);

  stEsperado := '24/04/2016';
  dtDate.Value := dtInicial;

  //a��o
  stResultado := dtDate.GetUltimoDiaSemana().ToString.Text;

  //assertiva
  CheckEquals(stEsperado, stResultado, 'N�o retornou dia corretamente');

end;

procedure TTestCaseTADDateTime.TADVTime_HoraToString_Pode_Converter;
var
  dtHora: TADVTime;
  dtInicial: TDateTime;
   stEsperado, stResultado: string;
begin
  //ambiente
  dtInicial := EncodeTime(15, 41, 23, 2);
  stEsperado := '15:41:23';

  dtHora.Value := dtInicial;

  //a��o
  stResultado := dtHora.HoraToString().Text;

  //assertiva
  CheckEquals(stEsperado, stResultado, 'N�o retornou os segundos corretamente');

end;

procedure TTestCaseTADDateTime.TADVDate_INDates_Nao_Pode_Confirmar;
var
  dtDate: TADVDate;
  dtInicial, dtTeste, dtFinal: TDateTime;
  blResultado: Boolean;
begin
  //ambiente
  dtInicial := EncodeDate(2016, 4, 20);
  dtFinal := EncodeDate(2016, 5, 5);
  dtTeste := EncodeDate(2016, 6, 29);

  dtDate.Value := dtTeste;

  //a��o
  blResultado := dtDate.INDates(dtInicial, dtFinal);

  //assertiva
  CheckEquals(False, blResultado, 'N�o poderia encontrar a data no intervalo');

end;

procedure TTestCaseTADDateTime.TADVDate_INDates_Pode_Confirmar;
var
  dtDate: TADVDate;
  dtInicial, dtTeste, dtFinal: TDateTime;
  blResultado: Boolean;
begin
  //ambiente
  dtInicial := EncodeDate(2016, 4, 20);
  dtFinal := EncodeDate(2016, 5, 5);
  dtTeste := EncodeDate(2016, 4, 29);

  dtDate.Value := dtTeste;

  //a��o
  blResultado := dtDate.INDates(dtInicial, dtFinal);

  //assertiva
  CheckEquals(True, blResultado, 'N�o encontrou a data no intervalo');

end;

procedure TTestCaseTADDateTime.TADVDate_isAnoBiSexto_Nao_Pode_Confirmar;
var
  dtDate: TADVDate;
  dtInicial: TDateTime;
  blEsperado, blResultado: Boolean;
begin
  //ambiente
  dtInicial := EncodeDate(2015, 2, 20); //ano n�o bissexto
  blEsperado := false;

  dtDate.Value := dtInicial;

  //a��o
  blResultado := dtDate.isAnoBiSexto;

  //assertiva
  CheckEquals(blEsperado, blResultado, 'N�o retornou corretamente');

end;

procedure TTestCaseTADDateTime.TADVDate_isAnoBiSexto_Pode_Confirmar;
var
  dtDate: TADVDate;
  dtInicial: TDateTime;
  blEsperado, blResultado: Boolean;
begin
  //ambiente
  dtInicial := EncodeDate(2016, 2, 20); //ano bissexto
  blEsperado := true;

  dtDate.Value := dtInicial;

  //a��o
  blResultado := dtDate.isAnoBiSexto;

  //assertiva
  CheckEquals(blEsperado, blResultado, 'N�o retornou corretamente');

end;

procedure TTestCaseTADDateTime.TADVDate_isFimDeSemana_Nao_Pode_Confirmar;
var
  dtDate: TADVDate;
  dtInicial: TDateTime;
  blEsperado, blResultado: Boolean;
begin
  //ambiente
  dtInicial := EncodeDate(2016, 2, 24); //quarta feira
  blEsperado := false;

  dtDate.Value := dtInicial;

  //a��o
  blResultado := dtDate.isFimDeSemana;

  //assertiva
  CheckEquals(blEsperado, blResultado, 'N�o retornou corretamente');

end;

procedure TTestCaseTADDateTime.TADVDate_isFimDeSemana_Pode_Confirmar;
var
  dtDate: TADVDate;
  dtInicial: TDateTime;
  blEsperado, blResultado: Boolean;
begin
  //ambiente
  dtInicial := EncodeDate(2016, 2, 27); //s�bado
  blEsperado := true;

  dtDate.Value := dtInicial;

  //a��o
  blResultado := dtDate.isFimDeSemana;

  //assertiva
  CheckEquals(blEsperado, blResultado, 'N�o retornou corretamente');

end;

procedure TTestCaseTADDateTime.TADVDate_MesToExtenco_Pode_Retornar;
var
  dtDate: TADVDate;
  dtInicial: TDateTime;
  stEsperado, stResultado: string;
begin
  //ambiente
  dtInicial := EncodeDate(2016, 4, 20);
  stEsperado := 'Abril';

  dtDate.Value := dtInicial;

  //a��o
  stResultado := dtDate.MesToExtenco().Text;

  //assertiva
  CheckEquals(stEsperado, stResultado, 'N�o retornou por exten�o corretamente');

end;

procedure TTestCaseTADDateTime.TADVDate_ReplaceTimer_Pode_Retornar;
var
  dtDate: TADVDate;
  dtInicial: TDateTime;
  stEsperado, stResultado: TDateTime;
begin
  //ambiente
  dtInicial := EncodeDateTime(2016, 4, 20, 15, 41, 23, 2);
  stEsperado := EncodeDate(2016, 4, 20);

  dtDate.Value := dtInicial;

  //a��o
  dtDate.ReplaceTimer();
  stResultado := dtDate.Value;

  //assertiva
  CheckEquals(stEsperado, stResultado, 'N�o retornou data corretamente');

end;

procedure TTestCaseTADDateTime.TADVDate_SetDateNow_Pode_Setar;
var
  dtDate: TADVDate;
  stEsperado, stResultado: TDateTime;
begin
  //ambiente
  stEsperado := now;

  //a��o
  dtDate.SetDateNow();
  stResultado := dtDate.Value;

  //assertiva
  CheckEquals(stEsperado, stResultado, 'N�o retornou data corretamente');

end;

procedure TTestCaseTADDateTime.TADVDate_SubDias_Pode_Subtrair;
var
  dtDate: TADVDate;
  dtInicial, dtEsperado, dtResultado: TDateTime;
begin
  //ambiente
  dtInicial := EncodeDate(2016, 4, 20);
  dtEsperado := EncodeDate(2016, 3, 31);

  dtDate.Value := dtInicial;

  //a��o
  dtDate.SubDias(20);
  dtResultado := dtDate.Value;

  //assertiva
  CheckEquals(dtEsperado, dtResultado, 'N�o subtraiu os dias da data corretamente');

end;

procedure TTestCaseTADDateTime.TADVTime_ToExtenco_Pode_Converter;
var
  dtHora: TADVTime;
  dtInicial: TDateTime;
   stEsperado, stResultado: string;
begin
  //ambiente
  dtInicial := EncodeTime(15, 41, 23, 2);
  stEsperado := 'Quinze horas e Quarenta e Um minutos';

  dtHora.Value := dtInicial;

  //a��o
  stResultado := dtHora.ToExtenco().Text;

  //assertiva
  CheckEquals(stEsperado, stResultado, 'N�o converteu corretamente');

end;

procedure TTestCaseTADDateTime.TADVTime_ToMinutos_Pode_Converter;
var
  dtHora: TADVTime;
  dtInicial: TDateTime;
  inEsperado, inResultado: Integer;
begin
  //ambiente
  dtInicial :=  EncodeTime(1, 0, 0, 0);   //definir como uma hora da manh�
  inEsperado := 60; //passaram-se 60 minutos a partir da zero hora

  dtHora.Value := dtInicial;

  //a��o
  inResultado := dtHora.ToMinutos().Value;

  //assertiva
  CheckEquals(inEsperado, inResultado, 'N�o retornou os minutos corretamente');

end;

procedure TTestCaseTADDateTime.TADVDate_ToExtenco_Pode_Retornar;
var
  dtDate: TADVDate;
  dtInicial: TDateTime;
  stEsperado, stResultado: string;
begin
  //ambiente
  dtInicial := EncodeDate(2016, 4, 20);
  stEsperado := 'quarta-feira, 20 de abril de 2016';

  dtDate.Value := dtInicial;

  //a��o
  stResultado := dtDate.ToExtenco().Text;

  //assertiva
  CheckEquals(stEsperado, stResultado, 'N�o retornou por exten�o corretamente');

end;

procedure TTestCaseTADDateTime.TADVDate_ToSqlServerFormat_Pode_Retornar;
var
  dtDate: TADVDate;
  dtInicial: TDateTime;
  stEsperado, stResultado: string;
begin
  //ambiente
  dtInicial := EncodeDate(2016, 4, 20);
  stEsperado := '2016-04-20';

  dtDate.Value := dtInicial;

  //a��o
  stResultado := dtDate.ToSqlServerFormat().Text;

  //assertiva
  CheckEquals(stEsperado, stResultado, 'N�o converteu corretamente');

end;

procedure TTestCaseTADDateTime.TADVDate_ToString_Pode_Retornar;
var
  dtDate: TADVDate;
  dtInicial: TDateTime;
  stEsperado, stResultado: string;
begin
  //ambiente
  dtInicial := EncodeDate(2016, 4, 20);
  stEsperado := '20/04/2016';

  dtDate.Value := dtInicial;

  //a��o
  stResultado := dtDate.ToString().Text;

  //assertiva
  CheckEquals(stEsperado, stResultado, 'N�o retornou corretamente');

end;

procedure TTestCaseTADDateTime.TADVTime_DataHoraString_Pode_Retornar;
var
  dtHora: TADVTime;
  dtInicial: TDateTime;
  stEsperado, stResultado: string;
begin
  //ambiente
  dtInicial := EncodeDateTime(2016, 4, 20, 15, 41, 23, 2);
  stEsperado := '20/04/2016 15:41:23';

  dtHora.Value := dtInicial;

  //a��o
  stResultado := dtHora.ToDateTimeString().Text;

  //assertiva
  CheckEquals(stEsperado, stResultado, 'N�o retornou corretamente');

end;

initialization
  TestFramework.RegisterTest(TTestCaseTADDateTime.Suite);

end.

