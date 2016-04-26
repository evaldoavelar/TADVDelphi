{*******************************************************************************}
{                                                                               }
{  untTADVString.pas                                                            }
{                                                                               }
{  Copyright (C) 2016 TADVDelphi                                                }
{                                                                               }
{  Autor: Evaldo  5/3/2016                                                      }
{                                                                               }
{  Descrição: Unit para operações numericas                                     }
{                                                                               }
{*******************************************************************************}

unit untTADVNumeric;

interface
uses SysUtils, Math, Graphics, Classes, UntTADVString, WinTypes;

type

  TADVDouble = record
    Value: Double;
    function RoundTo(inCasas: Integer): Double;
    function Trunc(inCasas: Integer): Double;
    function CalPercentual(Percent: Double): Double;
    procedure SubtrairPercentual(Percent: Double);
    function CalcProporcao(Valor: Double): Double;
    function ToString: TADVString;
    function ToSqlServerFormat: TADVString;
    function ToExtenco: TADVString;
    function ToExtencoReais: TADVString;
    function ToReias: TADVString;
    function ToReaisPlano: TADVString;
    function Formatar(Formato: string): TADVString;
    procedure ADD(valor: Double);
    procedure Sub(valor: Double);
    procedure ADDAsString(valor: string);
    procedure Inc;
    procedure Dec;
    procedure Clear;
    procedure Eval(Num: string);
  end;

  TADVInteger = record
    Value: Integer;
    function ToString: TADVString;
    function ToExtenco: TADVString;
    procedure Inc;
    procedure ADD(valor: integer);
    function NextValue: integer;
    function PriorValue: integer;
    procedure Dec;
    procedure Clear;
    function CalcProporcao(Valor: Integer): Double;
    function CalPercentual(Percent: Integer): Integer;
  end;

  EOutOfRange = class(EListError);

  TIntegerList = class(TPersistent)
  private
    FList: TList;
    FDuplicates: TDuplicates;
    FMin: LongInt;
    FMax: LongInt;
    FSizeOfLong: Integer;
    FSorted: Boolean;
    procedure ReadMin(Reader: TReader);
    procedure WriteMin(Writer: TWriter);
    procedure ReadMax(Reader: TReader);
    procedure WriteMax(Writer: TWriter);
    procedure ReadIntegers(Reader: TReader);
    procedure WriteIntegers(Writer: TWriter);
    procedure SetSorted(Value: Boolean);
    procedure QuickSort(L, R: Integer);
  protected
    procedure DefineProperties(Filer: TFiler); override;
    function Find(N: LongInt; var Index: Integer): Boolean; virtual;
    function GetCount: Integer;
    function GetItem(Index: Integer): LongInt;
    procedure SetItem(Index: Integer; Value: LongInt); virtual;
    procedure SetMin(Value: LongInt);
    procedure SetMax(Value: LongInt);
    procedure Sort; virtual;
  public
    constructor Create;
    destructor Destroy; override;

    function Add(Value: LongInt): Integer; virtual;
    procedure AddIntegers(List: TIntegerList); virtual;
    procedure Assign(Source: TPersistent); override;
    procedure AssignTo(Dest: TPersistent); override;
    procedure Clear; virtual;
    procedure Delete(Index: Integer); virtual;
    function Equals(List: TIntegerList): Boolean;
    procedure Exchange(Index1, Index2: Integer); virtual;
    function IndexOf(N: LongInt): Integer; virtual;
    procedure Insert(Index: Integer; Value: LongInt); virtual;
    procedure Move(CurIndex, NewIndex: Integer); virtual;

    property Duplicates: TDuplicates read FDuplicates write FDuplicates;
    property Count: Integer read GetCount;
    property Items[Index: Integer]: LongInt read GetItem write SetItem; default;
    property Min: LongInt read FMin write SetMin;
    property Max: LongInt read FMax write SetMax;
    property Sorted: Boolean read FSorted write SetSorted;
  end;

implementation

resourcestring
  strNumeroForaIntervalo = 'TADVDouble: O valor está fora do intervalo' +
    ' permitido.';

const
  Unidades: array[1..9] of string = ('Um', 'Dois', 'Tres', 'Quatro', 'Cinco', 'Seis', 'Sete', 'Oito', 'Nove');
  Dez: array[1..9] of string = ('Onze', 'Doze', 'Treze', 'Quatorze', 'Quinze', 'Dezesseis', 'Dezessete', 'Dezoito', 'Dezenove');
  Dezenas: array[1..9] of string = ('Dez', 'Vinte', 'Trinta', 'Quarenta', 'Cinquenta', 'Sessenta', 'Setenta', 'Oitenta', 'Noventa');
  Centenas: array[1..9] of string = ('Cento', 'Duzentos', 'Trezentos', 'Quatrocentos', 'Quinhentos', 'Seiscentos', 'Setecentos', 'Oitocentos', 'Novecentos');
  MoedaSigular = 'Real';
  MoedaPlural = 'Reais';
  CentSingular = 'Centavo';
  CentPlural = 'Centavos';
  Zero = 'Zero';

  { TADVDouble }

 {-------------------------------------------------------------------------------
   @abstract (Adiciona um valor passado para o valor atual)
   @author   (Evaldo)
   @created  (2016.04.19)
   @param    (valor: Double)
   @return   (None)
 -------------------------------------------------------------------------------}

procedure TADVDouble.ADD(valor: Double);
begin
  Self.Value := Self.Value + valor;
end;

{-------------------------------------------------------------------------------
  @abstract ( converte uma string e adiciona o valor passado para o valor atual)
  @author   (Evaldo)
  @created  (2016.04.19)
  @param    (valor: Double)
  @return   (None)
-------------------------------------------------------------------------------}

procedure TADVDouble.ADDAsString(valor: string);
var
  stAux: TADVString;
begin
  stAux.Text := valor;
  Self.Value := Self.Value + stAux.ToFloat;
end;

{-------------------------------------------------------------------------------
  @abstract (Arredonda para a quantidade de casas passada)
  @author   (Evaldo)
  @created  (2016.04.19)
  @param    (inCasas: Integer)
  @return   (Double)
-------------------------------------------------------------------------------}

function TADVDouble.RoundTo(inCasas: Integer): Double;
var
  stValor: string;
  dlValor: Double;
begin
  dlValor := Value + (5 * Power(10, -(inCasas + 1)));
  stValor := Floattostr(dlValor);
  if pos({$IF CompilerVersion >= 19}FormatSettings.{$IFEND}DecimalSeparator, stvalor) = 0 then
    stValor := stValor + {$IF CompilerVersion >= 19}FormatSettings.{$IFEND}DecimalSeparator;
  stvalor := stvalor + '0000';
  stValor := Copy(stValor, 1, pos({$IF CompilerVersion >= 19}FormatSettings.{$IFEND}DecimalSeparator, stValor) + inCasas);
  Result := StrToFloat(stValor);
end;

{-------------------------------------------------------------------------------
  @abstract (Cal quantos por cento o valor é em relação ao numero passado)
  @author   (Evaldo)
  @created  (2016.04.19)
  @param    (Valor: Double)
  @return   (Double)
-------------------------------------------------------------------------------}

function TADVDouble.CalcProporcao(Valor: Double): Double;
begin
  Result := ((Self.Value * 100) / Valor);
end;

{-------------------------------------------------------------------------------
  @abstract (Cal o percentual)
  @author   (Evaldo)
  @created  (2016.04.19)
  @param    (Percent: Double)
  @return   (Double)
-------------------------------------------------------------------------------}

function TADVDouble.CalPercentual(Percent: Double): Double;
begin
  percent := percent / 100;
  result := value * Percent;
end;

{-------------------------------------------------------------------------------
  @abstract (Subtrair um Percentual do valor)
  @author   (Evaldo)
  @created  (2016.04.19)
  @param    (Percent: Double)
  @return   (None)
-------------------------------------------------------------------------------}

procedure TADVDouble.SubtrairPercentual(Percent: Double);
var
  aux: Double;
begin
  percent := percent / 100;
  aux := value * Percent;

  Self.Sub(aux);
end;

{-------------------------------------------------------------------------------
  @abstract (Zerar o valor)
  @author   (Evaldo)
  @created  (2016.04.19)
  @param    (None)
  @return   (None)
-------------------------------------------------------------------------------}

procedure TADVDouble.Clear;
begin
  Self.Value := 0;
end;

{-------------------------------------------------------------------------------
  @abstract (Decrementar o valor de um)
  @author   (Evaldo)
  @created  (2016.04.19)
  @param    (None)
  @return   (None)
-------------------------------------------------------------------------------}

procedure TADVDouble.Dec;
begin
  self.Value := Self.Value - 1;
end;

{-------------------------------------------------------------------------------
  @abstract (Converte a string passada para Double)
  @author   (Evaldo)
  @created  (2016.04.19)
  @param    (Num: string)
  @return   (None)
-------------------------------------------------------------------------------}

procedure TADVDouble.Eval(Num: string);
begin
  num := StringReplace(Num, '.', '', [rfReplaceAll]);
  if Trim(num) <> '' then
    Self.Value := StrToFloat(Num)
  else
    self.value := 0;
end;

{-------------------------------------------------------------------------------
  @abstract (Formatar o valor de acordo com formato passado )
  @author   (Evaldo)
  @created  (2016.04.19)
  @param    (Formato: string)
  @return   (TADVString)
-------------------------------------------------------------------------------}

function TADVDouble.Formatar(Formato: string): TADVString;
begin
  Result.Text := FormatFloat(Formato, Self.Value);
end;

{-------------------------------------------------------------------------------
  @abstract (Incrementa de um o valor )
  @author   (Evaldo)
  @created  (2016.04.19)
  @param    (None)
  @return   (None)
-------------------------------------------------------------------------------}

procedure TADVDouble.Inc;
begin
  self.Value := Self.Value + 1;
end;

{-------------------------------------------------------------------------------
  @abstract (Subtrai o valor passado do valor)
  @author   (Evaldo)
  @created  (2016.04.19)
  @param    (valor: Double)
  @return   (None)
-------------------------------------------------------------------------------}

procedure TADVDouble.Sub(valor: Double);
begin
  self.Value := Self.Value - valor;
end;

{-------------------------------------------------------------------------------
  @abstract (Converter o valor para extenço)
  @author   (Internet)
  @created  (2016.04.19)
  @param    (None)
  @return   (TADVString)
-------------------------------------------------------------------------------}

function TADVDouble.ToExtenco: TADVString;
var
  Texto, Milhar, Centena, Centavos: string;
  ////////////////////////////////fucao auxiliar extenso////////////////////////////////
  function ifs(Expressao: Boolean; CasoVerdadeiro, CasoFalso: string): string;
  begin
    if Expressao then
      Result := CasoVerdadeiro
    else
      Result := CasoFalso;
  end;
  ////////////////////////////funcao auxiliar extenso/////////////////////////
  function MiniExtenso(trio: string): string;
  var
    Unidade, Dezena, Centena: string;
  begin
    Unidade := '';
    Dezena := '';
    Centena := '';
    if (trio[2] = '1') and (trio[3] <> '0') then
    begin
      Unidade := Dez[strtoint(trio[3])];
      Dezena := '';
    end
    else
    begin
      if trio[2] <> '0' then
        Dezena := Dezenas[strtoint(trio[2])];
      if trio[3] <> '0' then
        Unidade := Unidades[strtoint(trio[3])];
    end;
    if (trio[1] = '1') and (Unidade = '') and (Dezena = '') then
      Centena := 'Cem'
    else if trio[1] <> '0' then
      Centena := Centenas[strtoint(trio[1])]
    else
      Centena := '';
    Result := Centena + ifs((Centena <> '') and ((Dezena <> '') or (Unidade <> '')), ' e ', '')
      + Dezena + ifs((Dezena <> '') and (Unidade <> ''), ' e ', '') + Unidade;
  end;

begin
  if (self.value > 999999.99) or (self.value < 0) then
  begin
    raise Exception.Create(strNumeroForaIntervalo);
  end;
  if self.value = 0 then
  begin
    Result.Text := '';
    Exit;
  end;
  Texto := formatfloat('000000.00', self.value);
  Milhar := MiniExtenso(Copy(Texto, 1, 3));
  Centena := MiniExtenso(Copy(Texto, 4, 3));
  Centavos := MiniExtenso('0' + Copy(Texto, 8, 2));
  Result.Text := Milhar;
  if Milhar <> '' then
  begin
    Result.Text := Result.Text + ' Mil ';
  end;
  if (((copy(texto, 4, 2) = '00') and (Milhar <> '') and (copy(texto, 6, 1) <> '0'))) or (centavos = '') and (milhar <> '') then
    Result.Text := Result.Text + ' e ';
  if (Milhar + Centena <> '') then
    Result.Text := Result.Text + Centena;

  if Centavos = '' then
  begin
    Exit;
  end
  else
  begin
    if Milhar + Centena = '' then
      Result.Text := Centavos
    else
      Result.Text := Result.Text + ' e ' + Centavos;
  end;
end;

{-------------------------------------------------------------------------------
  @abstract (Converter o valor para extenço em reais)
  @author   (Evaldo)
  @created  (2016.04.19)
  @param    (None)
  @return   (TADVString)
-------------------------------------------------------------------------------}

function TADVDouble.ToExtencoReais: TADVString;
var
  Texto, Milhar, Centena, Centavos: string;
  ////////////////////////////////fucao auxiliar extenso////////////////////////////////
  function ifs(Expressao: Boolean; CasoVerdadeiro, CasoFalso: string): string;
  begin
    if Expressao then
      Result := CasoVerdadeiro
    else
      Result := CasoFalso;
  end;
  ////////////////////////////funcao auxiliar extenso/////////////////////////
  function MiniExtenso(trio: string): string;
  var
    Unidade, Dezena, Centena: string;
  begin
    Unidade := '';
    Dezena := '';
    Centena := '';
    if (trio[2] = '1') and (trio[3] <> '0') then
    begin
      Unidade := Dez[strtoint(trio[3])];
      Dezena := '';
    end
    else
    begin
      if trio[2] <> '0' then
        Dezena := Dezenas[strtoint(trio[2])];
      if trio[3] <> '0' then
        Unidade := Unidades[strtoint(trio[3])];
    end;
    if (trio[1] = '1') and (Unidade = '') and (Dezena = '') then
      Centena := 'Cem'
    else if trio[1] <> '0' then
      Centena := Centenas[strtoint(trio[1])]
    else
      Centena := '';
    Result := Centena + ifs((Centena <> '') and ((Dezena <> '') or (Unidade <> '')), ' e ', '')
      + Dezena + ifs((Dezena <> '') and (Unidade <> ''), ' e ', '') + Unidade;
  end;

begin
  if (self.value > 999999.99) or (self.value < 0) then
  begin
    raise Exception.Create(strNumeroForaIntervalo);
  end;
  if self.value = 0 then
  begin
    Result.Text := '';
    Exit;
  end;
  Texto := formatfloat('000000.00', self.value);
  Milhar := MiniExtenso(Copy(Texto, 1, 3));
  Centena := MiniExtenso(Copy(Texto, 4, 3));
  Centavos := MiniExtenso('0' + Copy(Texto, 8, 2));
  Result.Text := Milhar;
  if Milhar <> '' then
  begin
    if copy(texto, 4, 3) = '000' then
      Result.Text := Result.Text + ' Mil Reais'
    else
      Result.Text := Result.Text + ' Mil ';
  end;
  if (((copy(texto, 4, 2) = '00') and (Milhar <> '') and (copy(texto, 6, 1) <> '0'))) or (centavos = '') and (milhar <> '') then
    Result.Text := Result.Text + ' e ';
  if (Milhar + Centena <> '') then
    Result.Text := Result.Text + Centena;
  if (Milhar = '') and (copy(texto, 4, 3) = '001') then
    Result.Text := Result.Text + ' Real'
  else if (copy(texto, 4, 3) <> '000') then
    Result.Text := Result.Text + ' Reais';
  if Centavos = '' then
  begin
    Result.Text := Result.Text + '.';
    Exit;
  end
  else
  begin
    if Milhar + Centena = '' then
      Result.Text := Centavos
    else
      Result.Text := Result.Text + ' e ' + Centavos;
  end;
  if (copy(texto, 8, 2) = '01') and (Centavos <> '') then
    Result.Text := Result.Text + ' Centavo.'
  else
    Result.Text := Result.Text + ' Centavos.';

end;

{-------------------------------------------------------------------------------
  @abstract (Converter para Reais sem cifrão)
  @author   (Evaldo)
  @created  (2016.04.19)
  @param    (None)
  @return   (TADVString)
-------------------------------------------------------------------------------}

function TADVDouble.ToReaisPlano: TADVString;
begin
  Result.Text := FormatFloat('0.00', Self.Value);
end;

{-------------------------------------------------------------------------------
  @abstract (Converter para Reais)
  @author   (Evaldo)
  @created  (2016.04.19)
  @param    (None)
  @return   (TADVString)
-------------------------------------------------------------------------------}

function TADVDouble.ToReias: TADVString;
begin
  Result.Text := FormatFloat('R$ 0.,00', Self.Value);
end;

{-------------------------------------------------------------------------------
  @abstract (Converter para o formato do SqlServer)
  @author   (Evaldo)
  @created  (2016.04.19)
  @param    (None)
  @return   (TADVString)
-------------------------------------------------------------------------------}

function TADVDouble.ToSqlServerFormat: TADVString;
var
  Aux: TADVString;
begin
  Aux.Text := FloatToStr(Self.Value);
  Result.Text := Aux.ReplaceChar(',', '.');
end;

{-------------------------------------------------------------------------------
  @abstract (Converter para String)
  @author   (Evaldo)
  @created  (2016.04.19)
  @param    (None)
  @return   (TADVString)
-------------------------------------------------------------------------------}

function TADVDouble.ToString: TADVString;
begin
  Result.Text := FloatToStr(Self.Value);
end;

{-------------------------------------------------------------------------------
  @abstract (Truncar o valor com determinado numero de casas decimais)
  @author   (Evaldo)
  @created  (2016.04.19)
  @param    (inCasas: Integer)
  @return   (Double)
-------------------------------------------------------------------------------}

function TADVDouble.Trunc(inCasas: Integer): Double;
var
  stValor: string;
begin
  stValor := Floattostr(Value);
  if pos({$IF CompilerVersion >= 19}FormatSettings.{$IFEND}DecimalSeparator, stvalor) = 0 then
    stValor := stValor + {$IF CompilerVersion >= 19}FormatSettings.{$IFEND}DecimalSeparator;
  stvalor := stvalor + '0000';
  stValor := Copy(stValor, 1, pos({$IF CompilerVersion >= 19}FormatSettings.{$IFEND}DecimalSeparator, stValor) + inCasas);
  Result := StrToFloat(stValor);

end;

{ TADVInteger }



{-------------------------------------------------------------------------------
  @abstract (Incrementa o valor com o valor passado)
  @author   (Evaldo)
  @created  (2016.04.19)
  @param    (valor: integer)
  @return   (None)
-------------------------------------------------------------------------------}
procedure TADVInteger.ADD(valor: integer);
begin
  Self.Value := self.Value + valor;
end;


{-------------------------------------------------------------------------------
  @abstract (Inicializa O valor)
  @author   (Evaldo)
  @created  (2016.04.19)
  @param    (None)
  @return   (None)
-------------------------------------------------------------------------------}
procedure TADVInteger.Clear;
begin
  Self.Value := 0;
end;


{-------------------------------------------------------------------------------
  @abstract (Decrementar o valor de um)
  @author   (Evaldo)
  @created  (2016.04.19)
  @param    (None)
  @return   (None)
-------------------------------------------------------------------------------}
procedure TADVInteger.Dec;
begin
  Self.Value := Self.Value - 1;
end;


{-------------------------------------------------------------------------------
  @abstract (Incrementar o valor de um)
  @author   (Evaldo)
  @created  (2016.04.19)
  @param    (None)
  @return   (None)
-------------------------------------------------------------------------------}
procedure TADVInteger.Inc;
begin
  Self.Value := Self.Value + 1;
end;

{-------------------------------------------------------------------------------
  @abstract (Retorna o Proximo valor sem alterar o atual)
  @author   (Evaldo)
  @created  (2016.04.19)
  @param    (None)
  @return   (None)
-------------------------------------------------------------------------------}

function TADVInteger.NextValue: integer;
begin
  Result := self.Value + 1;
end;



{-------------------------------------------------------------------------------
  @abstract (Retorna o valor anterior sem alterar o atual)
  @author   (Evaldo)
  @created  (2016.04.19)
  @param    (None)
  @return   (integer)
-------------------------------------------------------------------------------}
function TADVInteger.PriorValue: integer;
begin
  result := self.value - 1;
end;



{-------------------------------------------------------------------------------
  @abstract (Retorna o valor por extenço)
  @author   (Evaldo)
  @created  (2016.04.19)
  @param    (None)
  @return   (TADVString)
-------------------------------------------------------------------------------}
function TADVInteger.ToExtenco: TADVString;
var
  Num: TADVDouble;
begin
  Num.Value := Self.Value;
  Result := Num.ToExtenco;
end;


{-------------------------------------------------------------------------------
  @abstract (Convete o valor para string)
  @author   (Evaldo)
  @created  (2016.04.19)
  @param    (None)
  @return   (TADVString)
-------------------------------------------------------------------------------}
function TADVInteger.ToString: TADVString;
begin
  Result.Text := IntToStr(Self.Value);
end;


{-------------------------------------------------------------------------------
  @abstract (Cal quantos por cento o valor é em relação ao numero passado)
  @author   (Evaldo)
  @created  (2016.04.19)
  @param    (Valor: Double)
  @return   (Double)
-------------------------------------------------------------------------------}
function TADVInteger.CalcProporcao(Valor: Integer): Double;
begin
  Result := ((Self.Value * 100) / Valor);
end;


{-------------------------------------------------------------------------------
  @abstract (Cal o percentual)
  @author   (Evaldo)
  @created  (2016.04.19)
  @param    (Percent: Integer)
  @return   (Integer)
-------------------------------------------------------------------------------}
function TADVInteger.CalPercentual(Percent: Integer): Integer;
begin
  Result := Trunc(((Percent * Self.Value) / 100));
end;



constructor TIntegerList.Create;
begin
  inherited Create;
  FList := TList.Create;
  FSizeOfLong := SizeOf(LongInt);
end;

destructor TIntegerList.Destroy;
begin
  Clear;
  FList.Free;
  inherited Destroy;
end;

procedure TIntegerList.Assign(Source: TPersistent);
begin
  if Source is TIntegerList then
  begin
    Clear;
    AddIntegers(TIntegerList(Source));
  end
  else
    inherited Assign(Source);
end;

procedure TIntegerList.DefineProperties(Filer: TFiler);
begin
  Filer.DefineProperty('Min', ReadMin, WriteMin, FMin <> 0);
  Filer.DefineProperty('Max', ReadMax, WriteMax, FMax <> 0);
  Filer.DefineProperty('Integers', ReadIntegers, WriteIntegers, Count > 0);
end;

procedure TIntegerList.ReadMin(Reader: TReader);
begin
  FMin := Reader.ReadInteger;
end;

procedure TIntegerList.WriteMin(Writer: TWriter);
begin
  Writer.WriteInteger(FMin);
end;

procedure TIntegerList.ReadMax(Reader: TReader);
begin
  FMax := Reader.ReadInteger;
end;

procedure TIntegerList.WriteMax(Writer: TWriter);
begin
  Writer.WriteInteger(FMax);
end;

procedure TIntegerList.ReadIntegers(Reader: TReader);
begin
  Reader.ReadListBegin;
  Clear;
  while not Reader.EndOfList do
    Add(Reader.ReadInteger);
  Reader.ReadListEnd;
end;

procedure TIntegerList.WriteIntegers(Writer: TWriter);
var
  I: Integer;
begin
  Writer.WriteListBegin;
  for I := 0 to Count - 1 do
    Writer.WriteInteger(GetItem(I));
  Writer.WriteListEnd;
end;

procedure TIntegerList.SetSorted(Value: Boolean);
begin
  if FSorted <> Value then
  begin
    if Value then
      Sort;
    FSorted := Value;
  end;
end;

function TIntegerList.GetCount: Integer;
begin
  Result := FList.Count;
end;

function TIntegerList.GetItem(Index: Integer): LongInt;
begin
  Result := PLongInt(FList.Items[Index])^;
end;

procedure TIntegerList.SetItem(Index: Integer; Value: LongInt);
begin
  if (FMin <> FMax) and ((Value < FMin) or (Value > FMax)) then
    raise EOutOfRange.CreateFmt(
      'Value must be within %d..%d', [FMin, FMax]);
  PLongInt(FList.Items[Index])^ := Value;
end;

procedure TIntegerList.SetMin(Value: LongInt);
var
  I: Integer;
begin
  if Value <> FMin then
  begin
    for I := 0 to Count - 1 do
    begin
      if GetItem(I) < Value then
        raise EOutOfRange.CreateFmt(
          'Unable to set new minimum value.'#13 +
          'List contains values below %d', [Value]);
    end; { for }
    FMin := Value;
    if FMin > FMax then
      FMax := FMin;
  end; { if }
end;

procedure TIntegerList.SetMax(Value: LongInt);
var
  I: Integer;
begin
  if Value <> FMax then
  begin
    for I := 0 to Count - 1 do
    begin
      if GetItem(I) > Value then
        raise EOutOfRange.CreateFmt(
          'Unable to set new maximum value.'#13 +
          'List contains values above %d', [Value]);
    end; { for }
    FMax := Value;
    if FMax < FMin then
      FMin := FMax;
  end; { if }
end;

procedure TIntegerList.AddIntegers(List: TIntegerList);
var
  I: Integer;
begin
  for I := 0 to Pred(List.Count) do
    Add(List[I]);
end;

function TIntegerList.Add(Value: LongInt): Integer;
begin
  if FDuplicates <> dupAccept then
  begin
    Result := IndexOf(Value);
    if Result >= 0 then
    begin
      if FDuplicates = dupIgnore then
        Exit;
      if FDuplicates = dupError then
        raise EListError.CreateFmt('Value %d already exists in the no duplicates list', [Value]);
    end;
  end;
  Insert(Count, Value);
  if Sorted then
  begin
    Sorted := False;
    Sorted := True;
  end;
  Result := IndexOf(Value);
end;

procedure TIntegerList.Clear;
var
  I: Integer;
begin
  for I := 0 to Pred(FList.Count) do
    Dispose(PLongInt(FList.Items[I]));
  FList.Clear;
end;

procedure TIntegerList.Delete(Index: Integer);
begin
  Dispose(PLongInt(FList.Items[Index]));
  FList.Delete(Index);
end;

function TIntegerList.Equals(List: TIntegerList): Boolean;
var
  I, Count: Integer;
begin
  Count := GetCount;
  if Count <> List.GetCount then
    Result := False
  else
  begin
    I := 0;
    while (I < Count) and (GetItem(I) = List.GetItem(I)) do
      Inc(I);
    Result := I = Count;
  end; {if else }
end;

procedure TIntegerList.Exchange(Index1, Index2: Integer);
begin
  FList.Exchange(Index1, Index2);
end;

{ List must be sorted }

function TIntegerList.Find(N: LongInt; var Index: Integer): Boolean;
var
  L, H, I: Integer;
begin
  Result := False;
  L := 0;
  H := Count - 1;
  while L <= H do
  begin
    I := (L + H) shr 1;
    if PLongInt(FList[I])^ < N then
      L := I + 1
    else
    begin
      H := I - 1;
      if PLongInt(FList[I])^ = N then
      begin
        Result := True;
        if Duplicates <> dupAccept then
          L := I;
      end; { if =N then }
    end; { if else }
  end; { while }
  Index := L;
end;

function TIntegerList.IndexOf(N: LongInt): Integer;
var
  I: Integer;
begin
  Result := -1;
  if not Sorted then
  begin
    for I := 0 to Pred(GetCount) do
    begin
      if GetItem(I) = N then
        Result := I;
    end; { for }
  end { if not sorted then }
  else if Find(N, I) then
    Result := I;
end;

procedure TIntegerList.Insert(Index: Integer; Value: LongInt);
var
  P: PLongInt;
begin
  if (FMin <> FMax) and ((Value < FMin) or (Value > FMax)) then
    raise EOutOfRange.CreateFmt(
      'Value must be within %d..%d', [FMin, FMax]);
  New(P);
  P^ := Value;
  FList.Insert(Index, P)
end;

procedure TIntegerList.Move(CurIndex, NewIndex: Integer);
begin
  FList.Move(CurIndex, NewIndex);
end;

procedure TIntegerList.QuickSort(L, R: Integer);
var
  I, J: Integer;
  P: PLongInt;
begin
  I := L;
  J := R;
  P := PLongInt(FList[(L + R) shr 1]);
  repeat
    while PLongInt(FList[I])^ < P^ do
      Inc(I);
    while PLongInt(FList[J])^ > P^ do
      Dec(J);
    if I <= J then
    begin
      FList.Exchange(I, J);
      Inc(I);
      Dec(J);
    end; { if }
  until I > J;
  if L < J then
    QuickSort(L, J);
  if I < R then
    QuickSort(I, R);
end;

procedure TIntegerList.Sort;
begin
  if not Sorted and (FList.Count > 1) then
    QuickSort(0, FList.Count - 1);
end;

procedure TIntegerList.AssignTo(Dest: TPersistent);
var
  i: integer;
  FStr: TStrings;
begin
  if Dest is TStrings then
  begin
    FStr := TStrings(Dest);
    FStr.Clear;
    for i := 0 to Count - 1 do
      FStr.Add(IntToStr(Items[i]));
  end
  else
    inherited AssignTo(Dest);
end;

end.
