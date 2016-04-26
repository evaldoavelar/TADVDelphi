unit untTADVDateTime;

interface

uses untTADVString, untTADVNumeric,Controls,SysUtils,DateUtils;

type

   TADVMeses = array[1..12] of TADVDouble;

   TAnoMese = record
      Ano: Integer;
      Meses: TADVMeses;
   end;

   TArAnos = array of TAnoMese;

{$REGION 'Classe TADVDate'}
  TADVDate = record
  private

  public
    Value: TDateTime;

    function ToString: TADVString;
    function ToSqlServerFormat: TADVString;
    function Date: TDate;
    function Formatar(Formato: string): TADVString;
    function ToExtenco: TADVString;
    function MesToExtenco: TADVString;
    function DiaDaSemanaExtenco: TADVString;
    function GetDia: TADVInteger;
    function GetMes: TADVInteger;
    function GetAno: TADVInteger;
    function GetDiaSemana: TADVInteger;
    function GetPrimeiroDiaSemana: TADVDate;
    function GetUltimoDiaSemana: TADVDate;
    function GetPrimeiroDiaMes: TADVInteger;
    function GetPrimeiroDiaAno: TADVInteger;
    function GetPrimeiroDiaAnoData: TDate;
    function GetUltimoDiaMes: TADVInteger;
    function GetMesesDias(DataInicial, DataFinal: Tdate): TADVMeses;
    function GetAnoMesesDias(DataInicial, DataFinal: Tdate): TArAnos;
    procedure ADDMes(Meses: Integer);
    function DiasNoMes: TADVInteger;
    function isAnoBiSexto: Boolean;
    function isFimDeSemana: Boolean;
    function INDates(DataInicial, DataFinal: Tdate): Boolean;
    procedure AddDias(NumDias: Integer);
    procedure SubDias(NumDias: Integer);
    procedure Encode(Dia, mes, ano: Word);
    procedure EncodeFromString(Data: string);
    procedure EncodeStr(Dia, mes, ano: string);
    procedure ReplaceTimer;
    procedure SetDateNow;

  end;
{$ENDREGION}

{$REGION 'Classe TADVTime'}
  TADVTime = record
  public
    Value: TDateTime;
    function HoraToString: TADVString;
    function ToDateTimeString: TADVString;
    function Formatar(Formato: string): TADVString;
    function GetHora: TADVInteger;
    function GetMinutos: TADVInteger;
    function GetSegundos: TADVInteger;
    function ToExtenco: TADVString;
    function ToMinutos: TADVInteger;
  end;
{$ENDREGION}

implementation

{$REGION 'TADVDate'}
{ TADVDate }


{-------------------------------------------------------------------------------
  @abstract (Adicionar dias para a data)
  @author   (Evaldo)
  @created  (2016.04.20)
  @param    (NumDias: Integer)
  @return   (None)
-------------------------------------------------------------------------------}
procedure TADVDate.AddDias(NumDias: Integer);
begin
   Self.Value := IncDay(Self.Value, NumDias);
end;


{-------------------------------------------------------------------------------
  @abstract ( Testar se uma data está em um intervalo)
  @author   (Evaldo)
  @created  (2016.04.20)
  @param    (DataInicial, DataFinal: Tdate)
  @return   (Boolean)
-------------------------------------------------------------------------------}
function TADVDate.INDates(DataInicial, DataFinal: Tdate): Boolean;
begin
   Result := ((CompareDate(Self.Value, DataInicial) >= 0)
      and (CompareDate(Self.Value, DataFinal) <= 0));
end;


{-------------------------------------------------------------------------------
  @abstract (DiaDaSemanaExtenco)
  @author   (Evaldo)
  @created  (2016.04.20)
  @param    (None)
  @return   (TADVString)
-------------------------------------------------------------------------------}
function TADVDate.DiaDaSemanaExtenco: TADVString;
const
   semana: array[1..7] of string = ('Domingo', 'Segunda-feira', 'Terça-feira', 'Quarta-feira', 'Quinta-feira', 'Sexta-feira', 'Sábado');
begin
   Result.Text := semana[DayOfWeek(Self.Value)]
end;

function TADVDate.Date: TDate;
begin
   result := Self.Value;
end;



{-------------------------------------------------------------------------------
  @abstract (Retornar o numero de dias no mes)
  @author   (Evaldo)
  @created  (2016.04.20)
  @param    (None)
  @return   (TADVInteger)
-------------------------------------------------------------------------------}
function TADVDate.DiasNoMes: TADVInteger;
const
   DaysInMonth: array[1..12] of Integer = (31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
begin
   Result.Value := DaysInMonth[Self.GetMes.Value];
   if (Self.GetMes.Value = 2) and Self.isAnoBiSexto then
      Inc(Result.Value);
end;

{-------------------------------------------------------------------------------
  @abstract (Transforma o dia,mes e ano em uma data)
  @author   (Evaldo)
  @created  (2016.04.20)
  @param    (Dia, mes, ano: Word)
  @return   (None)
-------------------------------------------------------------------------------}
procedure TADVDate.Encode(Dia, mes, ano: Word);
begin
   Self.Value := EncodeDate(ano, mes, dia);
end;



{-------------------------------------------------------------------------------
  @abstract (Transforma o dia,mes e ano em uma data)
  @author   (Evaldo)
  @created  (2016.04.20)
  @param    (Dia, mes, ano: string)
  @return   (None)
-------------------------------------------------------------------------------}
procedure TADVDate.EncodeStr(Dia, mes, ano: string);
begin
   try
   Self.Value := EncodeDate( StrToInt(ano), StrToInt( mes),StrToInt(dia));
   except
       raise Exception.Create('TADVDate: encode inválido!');
   end;
end;

{-------------------------------------------------------------------------------
  @abstract (Conveter uma string para uma data)
  @author   (Evaldo)
  @created  (2016.04.20)
  @param    (Data: string)
  @return   (None)
-------------------------------------------------------------------------------}
procedure TADVDate.EncodeFromString(Data: string);
begin
   Self.Value := StrToDate(data);
end;


{-------------------------------------------------------------------------------
  @abstract (Retornar a data formatada de acordo com o parametro passado)
  @author   (Evaldo)
  @created  (2016.04.20)
  @param    (Formato: string)
  @return   (TADVString)
-------------------------------------------------------------------------------}
function TADVDate.Formatar(Formato: string): TADVString;
begin
   Result.Text := FormatDateTime(Formato, Self.Value);
end;


{-------------------------------------------------------------------------------
  @abstract ( Retornar o ano)
  @author   (Evaldo)
  @created  (2016.04.20)
  @param    (None)
  @return   (TADVInteger)
-------------------------------------------------------------------------------}
function TADVDate.GetAno: TADVInteger;
var
   ano, mes, dia: Word;
begin
   DecodeDate(Self.Value, ano, mes, dia);
   Result.Value := ano;
end;


{-------------------------------------------------------------------------------
  @abstract (Retorna um array de ano mês e dia dentro de um  intervalo de data)
  @author   (Evaldo)
  @created  (2016.04.20)
  @param    (DataInicial, DataFinal: Tdate)
  @return   (TArAnos)
-------------------------------------------------------------------------------}
function TADVDate.GetAnoMesesDias(DataInicial, DataFinal: Tdate): TArAnos;
var
   i, Ano, AnoAtual, AnoFinal: Integer;
   Cont: TADVInteger;
   DtInicial, DtFinal, UltimoDiaAno: TDateTime;
   AuxTime: TTime;
begin
   AnoAtual := 0;

   Cont.Clear;
   Ano := AnoAtual;
   AnoFinal := YearOf(DataFinal);

   DtFinal := DataFinal;
   DtInicial := DataInicial;

   AuxTime := EncodeTime(0, 0, 0, 0);

   ReplaceTime(DtFinal, AuxTime);
   ReplaceTime(DtInicial, AuxTime);

   //contar os anos
   while DtInicial <= DtFinal do
   begin
      AnoAtual := YearOf(DtInicial);

      if AnoAtual <> Ano then
      begin
         Ano := AnoAtual;
         Cont.inc;

         SetLength(Result, cont.Value);

         Result[Cont.Value - 1].Ano := Ano;
         if AnoAtual < AnoFinal then
         begin
            UltimoDiaAno := EncodeDate(AnoAtual, 12, 31);
            ReplaceTime(UltimoDiaAno, AuxTime);
            Result[Cont.Value - 1].Meses := Self.GetMesesDias(DtInicial, UltimoDiaAno);
         end
         else
         begin
            Result[Cont.Value - 1].Meses := Self.GetMesesDias(DtInicial, DataFinal);
         end;
      end;

      DtInicial := IncDay(DtInicial, 1);
   end;

end;


{-------------------------------------------------------------------------------
  @abstract ( Retornar o dia)
  @author   (Evaldo)
  @created  (2016.04.20)
  @param    (None)
  @return   (TADVInteger)
-------------------------------------------------------------------------------}
function TADVDate.GetDia: TADVInteger;
var
   ano, mes, dia: Word;
begin
   DecodeDate(Self.Value, ano, mes, dia);
   Result.Value := dia;
end;

{-------------------------------------------------------------------------------
  @abstract (Retornar o dia da semana)
  @author   (Evaldo)
  @created  (2016.04.20)
  @param    (None)
  @return   (TADVInteger)
-------------------------------------------------------------------------------}
function TADVDate.GetDiaSemana: TADVInteger;
begin
   Result.Value := DayOfTheWeek(Self.Value)
end;



{-------------------------------------------------------------------------------
  @abstract (Retornar o Primeiro Dia Semana da semana)
  @author   (Evaldo)
  @created  (2016.04.20)
  @param    (None)
  @return   (TADVDate)
-------------------------------------------------------------------------------}
function TADVDate.GetPrimeiroDiaSemana: TADVDate;
begin
  Result.Value :=  StartOfTheWeek(Self.Value) ;
end;
{-------------------------------------------------------------------------------
  @abstract (Retornar o Ultimo Dia Semana da semana)
  @author   (Evaldo)
  @created  (2016.04.20)
  @param    (None)
  @return   (TADVDate)
-------------------------------------------------------------------------------}

function TADVDate.GetUltimoDiaSemana: TADVDate;
begin
  Result.Value := EndOfTheWeek( Self.Value );
end;




{-------------------------------------------------------------------------------
  @abstract (Retornar o mes da data)
  @author   (Evaldo)
  @created  (2016.04.20)
  @param    (None)
  @return   (TADVInteger)
-------------------------------------------------------------------------------}
function TADVDate.GetMes: TADVInteger;
var
   ano, mes, dia: Word;
begin
   DecodeDate(Self.Value, ano, mes, dia);
   Result.Value := mes;
end;

{-------------------------------------------------------------------------------
  @abstract (Contar os dias de cada  Mes em um intervalo de datas)
  @author   (Evaldo)
  @created  (2016.04.20)
  @param    (DataInicial, DataFinal: Tdate)
  @return   (TADVMeses)
-------------------------------------------------------------------------------}
function TADVDate.GetMesesDias(DataInicial, DataFinal: Tdate): TADVMeses;
var
   i, MES: Integer;

begin
   //Zerar os meses
   for I := 1 to 12 do
   begin
      Result[i].Value := 0;
   end;

   //contar os dias
   while DataInicial <= DataFinal do
   begin
      MES := MonthOf(DataInicial);

      Result[MES].inc;

      DataInicial := IncDay(DataInicial, 1);
   end;
end;




{-------------------------------------------------------------------------------
  @abstract (Retornar o primeiro dia do ano)
  @author   (Evaldo)
  @created  (2016.04.20)
  @param    (None)
  @return   (TADVInteger)
-------------------------------------------------------------------------------}
function TADVDate.GetPrimeiroDiaAno: TADVInteger;
begin
   Result.Value := DayOf(GetPrimeiroDiaAnoData);
end;

{-------------------------------------------------------------------------------
  @abstract (Retornar o primeiro dia do ano)
  @author   (Evaldo)
  @created  (2016.04.20)
  @param    (None)
  @return   (TADVInteger)
-------------------------------------------------------------------------------}
function TADVDate.GetPrimeiroDiaAnoData: TDate;
var
   ano, mes, dia: word;      
begin
   DecodeDate(Self.Value, ano, mes, dia);

   mes := 1;
   dia := 1;

   Result := EncodeDate(ano, 1, 1);

end;

{-------------------------------------------------------------------------------
  @abstract (Retornar o primeiro dia do mês)
  @author   (Evaldo)
  @created  (2016.04.20)
  @param    (None)
  @return   (TADVInteger)
-------------------------------------------------------------------------------}
function TADVDate.GetPrimeiroDiaMes: TADVInteger;
begin
   Result.Value := 1;
end;

{<md>-------------------------------------------------------------------------------
  Procedure: TADVDate.GetUltimoDiaMes
  Author:    Evaldo 26/8/2010
  Arguments: Nenhum
  Result:    Nenhum
  Objetivo:  Retornar o ultimo dia do mes
-------------------------------------------------------------------------------<md>}

function TADVDate.GetUltimoDiaMes: TADVInteger;
var
   ano, mes, dia: word;
   temp: TDate;
begin
   DecodeDate(Self.Value, ano, mes, dia);

   mes := mes + 1;
   if mes = 13 then
   begin
      mes := 1;
      ano := ano + 1;
   end;
   temp := EncodeDate(ano, mes, 1) - 1;

   Result.Value := DayOf(temp);
end;


{-------------------------------------------------------------------------------
  @abstract (Adcionar um numero de meses a data)
  @author   (Evaldo)
  @created  (2016.04.20)
  @param    (Meses: Integer)
  @return   (None)
-------------------------------------------------------------------------------}
procedure TADVDate.ADDMes(Meses: Integer);
begin
   Self.Value := IncMonth(Self.Value, Meses);
end;


{-------------------------------------------------------------------------------
  @abstract (Retornar se o ano é bissexto)
  @author   (Evaldo)
  @created  (2016.04.20)
  @param    (None)
  @return   (Boolean)
-------------------------------------------------------------------------------}
function TADVDate.isAnoBiSexto: Boolean;
begin
   Result := (Self.GetAno.Value mod 4 = 0) and ((Self.GetAno.Value mod 100 <> 0) or (Self.GetAno.Value mod 400 = 0));
end;


{-------------------------------------------------------------------------------
  @abstract ( Retorna se a data é um fim de semana)
  @author   (Evaldo)
  @created  (2016.04.20)
  @param    (None)
  @return   (Boolean)
-------------------------------------------------------------------------------}
function TADVDate.isFimDeSemana: Boolean;

{Verifica se uma data informada cai em um final de semana}
begin
   if DayOfWeek(Self.Value) in [2..6] then
      result := false
   else
      result := true;
end;


{-------------------------------------------------------------------------------
  @abstract (Retornar o mês por extenco)
  @author   (Evaldo)
  @created  (2016.04.20)
  @param    (None)
  @return   (TADVString)
-------------------------------------------------------------------------------}
function TADVDate.MesToExtenco: TADVString;
begin
   case Self.GetMes.Value of
      1: Result.Text := 'Janeiro';
      2: Result.Text := 'Fevereiro';
      3: Result.Text := 'Março';
      4: Result.Text := 'Abril';
      5: Result.Text := 'Maio';
      6: Result.Text := 'Junho';
      7: Result.Text := 'Julho';
      8: Result.Text := 'Agosto';
      9: Result.Text := 'Setembro';
      10: Result.Text := 'Outubro';
      11: Result.Text := 'Novembro';
      12: Result.Text := 'Dezembro';
   else
      Result.Text := '';
   end;
end;



{-------------------------------------------------------------------------------
  @abstract (Remover a hora da data)
  @author   (Evaldo)
  @created  (2016.04.20)
  @param    (None)
  @return   (None)
-------------------------------------------------------------------------------}
procedure TADVDate.ReplaceTimer;
var
   newTime: TDateTime;
begin
   newTime := EncodeTime(0, 0, 0, 0);
   ReplaceTime(self.Value, newTime);
end;


{-------------------------------------------------------------------------------
  @abstract (Setar a data do momento)
  @author   (Evaldo)
  @created  (2016.04.20)
  @param    (None)
  @return   (None)
-------------------------------------------------------------------------------}
procedure TADVDate.SetDateNow;
begin
   Self.Value := Now;
end;

{-------------------------------------------------------------------------------
  @abstract (Subtrair um numero de dias da data)
  @author   (Evaldo)
  @created  (2016.04.20)
  @param    (NumDias: Integer)
  @return   (None)
-------------------------------------------------------------------------------}
procedure TADVDate.SubDias(NumDias: Integer);
begin
   NumDias := (NumDias * -1);
   Self.AddDias(NumDias);
end;



{-------------------------------------------------------------------------------
  @abstract (Retornar a data por extenço)
  @author   (Evaldo)
  @created  (2016.04.20)
  @param    (None)
  @return   (TADVString)
-------------------------------------------------------------------------------}
function TADVDate.ToExtenco: TADVString;
begin
   Result.Text := FormatDateTime('dddddd', Self.Value);
end;



{-------------------------------------------------------------------------------
  @abstract (Retornar a data em string)
  @author   (Evaldo)
  @created  (2016.04.20)
  @param    (None)
  @return   (TADVString)
-------------------------------------------------------------------------------}
function TADVDate.ToString: TADVString;
begin
   Result.Text := DateToStr(Self.Value);
end;


{-------------------------------------------------------------------------------
  @abstract (Converter para o formato de data do sqlServer)
  @author   (Evaldo)
  @created  (2016.04.20)
  @param    (None)
  @return   (TADVString)
-------------------------------------------------------------------------------}
function TADVDate.ToSqlServerFormat: TADVString;
begin
   Result.Text := FormatDateTime('YYYY-MM-DD', Self.Value);
end;

{$ENDREGION}

{$REGION 'TADVTime'}
{ TADVTime }


{-------------------------------------------------------------------------------
  @abstract (Retorna datahora em string)
  @author   (Evaldo)
  @created  (2016.04.20)
  @param    (None)
  @return   (TADVString)
-------------------------------------------------------------------------------}
function TADVTime.ToDateTimeString: TADVString;
begin
   Result.Text := DateTimeToStr(Self.Value);
end;


{-------------------------------------------------------------------------------
  @abstract (Formatar de acordo com formato passado)
  @author   (Evaldo)
  @created  (2016.04.20)
  @param    (Formato: string)
  @return   (TADVString)
-------------------------------------------------------------------------------}
function TADVTime.Formatar(Formato: string): TADVString;
begin
   Result.Text := FormatDateTime(Formato, Self.Value);
end;

{-------------------------------------------------------------------------------
  @abstract (Retorna a hora)
  @author   (Evaldo)
  @created  (2016.04.20)
  @param    (Formato: string)
  @return   (TADVString)
-------------------------------------------------------------------------------}
function TADVTime.GetHora: TADVInteger;
var
   hora, minutos, segundos, mcsegundos: Word;
begin
   Decodetime(Self.Value, hora, minutos, segundos, mcsegundos);
   Result.value := hora;
end;

{-------------------------------------------------------------------------------
  @abstract (Retorna os Minutos)
  @author   (Evaldo)
  @created  (2016.04.20)
  @param    (Formato: string)
  @return   (TADVString)
-------------------------------------------------------------------------------}
function TADVTime.GetMinutos: TADVInteger;
var
   hora, minutos, segundos, mcsegundos: Word;
begin
   Decodetime(Self.Value, hora, minutos, segundos, mcsegundos);
   Result.value := (minutos);

end;

{-------------------------------------------------------------------------------
  @abstract (Retorna os segundos)
  @author   (Evaldo)
  @created  (2016.04.20)
  @param    (Formato: string)
  @return   (TADVString)
-------------------------------------------------------------------------------}
function TADVTime.GetSegundos: TADVInteger;
var
   hora, minutos, segundos, mcsegundos: Word;
begin
   Decodetime(Self.Value, hora, minutos, segundos, mcsegundos);
   Result.value := (segundos);
end;


{-------------------------------------------------------------------------------
  @abstract (Converte a hora para string)
  @author   (Evaldo)
  @created  (2016.04.20)
  @param    (Formato: string)
  @return   (TADVString)
-------------------------------------------------------------------------------}
function TADVTime.HoraToString: TADVString;
begin
   Result.Text := TimeToStr(Self.Value);
end;


 {-------------------------------------------------------------------------------
  @abstract (Retorna a hora em extenço)
  @author   (Evaldo)
  @created  (2016.04.20)
  @param    (Formato: string)
  @return   (TADVString)
-------------------------------------------------------------------------------}
function TADVTime.ToExtenco: TADVString;
var
   Hora, Minuto: TADVInteger;

begin
   Hora.Value := Trunc(Frac(self.Value) * 24); // Obtém Horas
   Minuto.Value := Round(Frac(Frac(self.Value) * 24) * 60); // Obtém Minutos
   if Minuto.Value = 60 then
   begin
      Hora.Value := Hora.Value + 1;
      Minuto.Value := 0;
   end;
   Result.Text := Hora.ToExtenco.Text + ' hora';
   if Hora.Value > 1 then
      Result.Text := Result.Text + 's';
   if Minuto.Value > 0 then
   begin
      Result.Text := Result.Text + ' e ' + Minuto.ToExtenco.Text + ' minuto';
      if Minuto.Value > 1 then
         Result.Text := Result.Text + 's'
   end;
end;


 {-------------------------------------------------------------------------------
  @abstract (Converte a hora em minutos - contando a partir da zero hora)
  @author   (Evaldo)
  @created  (2016.04.20)
  @param    (Formato: string)
  @return   (TADVString)
-------------------------------------------------------------------------------}
function TADVTime.ToMinutos: TADVInteger;
begin
   Result.Value := (StrToInt(Copy(Self.HoraToString.Text, 1, 2)) * 60) + StrToInt(Copy(Self.HoraToString.Text, 4, 2));
end;

{$ENDREGION}



{$ENDREGION}

end.


