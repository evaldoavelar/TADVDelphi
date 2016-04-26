
{*******************************************************************************}
{                                                                               }
{  untTADVString.pas                                                            }
{                                                                               }
{  Copyright (C) 2016 TADVDelphi                                                }
{                                                                               }
{  Autor: Evaldo  5/3/2016                                                      }
{                                                                               }
{  Descrição: Unit para operações com string                                    }
{                                                                               }
{*******************************************************************************}

unit untTADVString;

interface

uses Classes, SysUtils, {$IFDEF DELPHI12_UP}System.SysUtils,{$ENDIF}  Controls, StrUtils;

type

{$REGION 'TCSTString - Tipo de dado para trabalhar com string'}
  TADVString = record
    Text: string;

    { Substituição}
    function ReplaceString(Caracter, Subst: string): TADVString;

    {Remove os Espaços em branco }
    function Alltrim: TADVString;
    function LTrim: TADVString;
    function RTrim: TADVString;

    {Conversão}
    function Lower: TADVString;
    function Upper: TADVString;
    function CaixaMista: TADVString;

    {Pesquisa um caractere }
    function SearchLeft(Caracter: Char): integer;
    function SearchRigth(Caracter: Char): integer;

    {Variaveis}
    function StringLength: integer;
    function IsEmpty: Boolean;
    function Wordcount: integer;

    {Validações}
    function IsCPF(): boolean;
    function isCNPJ(): boolean;

    {Operações}
    function ReverseStr: TADVString;
    function ToFloat: Double;
    function ToDateTime: TDateTime;
    function ToDate: TDate;
    function ToPChar: PChar;
    function ToCurrency: Currency;
    function ToInt: Integer;
    function ToCNPJCpf: TADVString;
    function ToComma: TADVString;
    function ToCustomFormat(Mask: string): TADVString;

    function RemoveAcento: TADVString;
    function RemoveExt: TADVString;
    function ExtractNumbers: TADVString;
    function RemoveCaracteres(const Args: array of const): TADVString;
    function ReplaceChar(Caracter, Subst: char): string;

    function Explode(const Ch: Char): TStringList;
    function ExplodeTrim(const Ch: Char): TStringList;
    function SubString(PosInicial, PosFinal: Integer): TADVString;
    procedure Concatena(Separador, Valor: string);
    procedure ADD(s: string);
    procedure Clear;
    function HasString(s: string): Boolean;
    function IsFloat: Boolean;
    function IsInteger: Boolean;
    function IsDateTime: Boolean;

    { Operações PAD}
    function PadC(const Len: integer; const Ch: Char): TADVString;
    function PadL(const Len: integer; const Ch: Char): TADVString;
    function PadR(const Len: integer; const Ch: Char): TADVString;
    function isEmail(): boolean;

  private
    function Captitalizar(s: string; posicao: Integer; captilizar: Boolean): string;

  end;

{$ENDREGION}

implementation

{ TADVString }

{-------------------------------------------------------------------------------
  @abstract (Adiciona uma string com a string atual)
  @author   (Evaldo)
  @created  (2016.04.18)
  @param    (s: string)
  @return   (None)
-------------------------------------------------------------------------------}

procedure TADVString.ADD(s: string);
begin
  Self.Text := Self.Text + s;
end;

{-------------------------------------------------------------------------------
  @abstract (Remove os espaços em branco a direita e a esquerda da string)
  @author   (Evaldo)
  @created  (2016.04.18)
  @param    (None)
  @return   (string)
-------------------------------------------------------------------------------}

function TADVString.Alltrim: TADVString;
begin
  Result.Text := Trim(Self.Text);
end;

{-------------------------------------------------------------------------------
  @abstract (Coloca uma string em Caixa Mista)
  @author   (Evaldo)
  @created  (2016.04.18)
  @param    (None)
  @return   (string)
-------------------------------------------------------------------------------}

function TADVString.CaixaMista: TADVString;
var
  stAux: string;
begin
  result.Text := Captitalizar(Self.Text, 1, true);
end;

function TADVString.Captitalizar(s: string; posicao: Integer; captilizar: Boolean): string;
begin
  //posicao é igual ao tamanho da string
  if (posicao > Length(s)) then
    Exit;

  //pegar a posicao atual
  result := s[posicao];

  //verficar se é para captalizar a letra
  if (captilizar) then
  begin
    //colocar a letra em maiusculo
    result := UpperCase(result);

    //marcar para não capitalizar a proxima letra
    captilizar := false;
  end
  else
  begin
    //colocar a letra em minusculo
    result := LowerCase(result);

    //se a posição atual for vazia, a próxima letra deve ser capitalizada
    captilizar := result = ' ';
  end;

  //incrementar a posição atual
  Inc(posicao);

  //chamar novamente a função para repetir o processo
  result := result + Captitalizar(s, posicao, captilizar);

end;

{-------------------------------------------------------------------------------
  @abstract (Pode apagar o conteúdo de uma string)
  @author   (Evaldo)
  @created  (2016.04.18)
  @param    (None)
  @return   (None)
-------------------------------------------------------------------------------}

procedure TADVString.Clear;
begin
  Self.Text := '';
end;

{-------------------------------------------------------------------------------
  @abstract (Concatenar uma valor passado a string separado por um caracter)
  @author   (Evaldo)
  @created  (2016.04.18)
  @param    (Separador, Valor: string)
  @return   (None)
-------------------------------------------------------------------------------}

procedure TADVString.Concatena(Separador, Valor: string);
begin
  if Self.Text = '' then
    Self.Text := Self.Text + Valor
  else
    Self.Text := Self.Text + Separador + Valor;
end;

{-------------------------------------------------------------------------------
  @abstract (verifica se existe uma substring dentro da string)
  @author   (Evaldo)
  @created  (2016.04.18)
  @param    (s: string)
  @return   (Boolean)
-------------------------------------------------------------------------------}

function TADVString.HasString(s: string): Boolean;
var
  stOrigem, stSubString: string;
begin
  stOrigem := UpperCase(Self.Text);
  stSubString := UpperCase(s);
  Result := (Pos(stSubString, stOrigem) > 0);
end;

{-------------------------------------------------------------------------------
  @abstract (Retornar o tamanho da string)
  @author   (Evaldo)
  @created  (2016.04.18)
  @param    (None)
  @return   (integer)
-------------------------------------------------------------------------------}

function TADVString.StringLength: Integer;
begin
  Result := Length(Self.Text);
end;

{-------------------------------------------------------------------------------
  @abstract (Verifica se o Email é Valido)
  @author   (Ernesto D'Spirito)
  @created  (2016.04.18)
  @param    (None)
  @return   (boolean)
-------------------------------------------------------------------------------}

function TADVString.isEmail: boolean;
const
  // Valid characters in an "atom"
  atom_chars = [#33..#255] - ['(', ')', '<', '>', '@', ',', ';', ':', '\', '/', '"', '.', '[', ']', #127];

  // Valid characters in a "quoted-string"
  quoted_string_chars = [#0..#255] - ['"', #13, '\'];

  // Valid characters in a subdomain
  letters = ['A'..'Z', 'a'..'z'];
  letters_digits = ['0'..'9', 'A'..'Z', 'a'..'z'];
  subdomain_chars = ['-', '0'..'9', 'A'..'Z', 'a'..'z'];

type
  States = (STATE_BEGIN, STATE_ATOM, STATE_QTEXT, STATE_QCHAR,
    STATE_QUOTE, STATE_LOCAL_PERIOD, STATE_EXPECTING_SUBDOMAIN,
    STATE_SUBDOMAIN, STATE_HYPHEN);

var
  State: States;
  i, n, subdomains: integer;
  c: char;
begin

  State := STATE_BEGIN;
  n := Length(Self.Text);
  i := 1;
  subdomains := 1;

  while (i <= n) do
  begin
    c := Self.Text[i];

    case State of

      STATE_BEGIN:
        if c in atom_chars then
          State := STATE_ATOM
        else if c = '"' then
          State := STATE_QTEXT
        else
          break;
      STATE_ATOM:
        if c = '@' then
          State := STATE_EXPECTING_SUBDOMAIN
        else if c = '.' then
          State := STATE_LOCAL_PERIOD
        else if not (c in atom_chars) then
          break;
      STATE_QTEXT:
        if c = '\' then
          State := STATE_QCHAR
        else if c = '"' then
          State := STATE_QUOTE
        else if not (c in quoted_string_chars) then
          break;
      STATE_QCHAR:
        State := STATE_QTEXT;
      STATE_QUOTE:
        if c = '@' then
          State := STATE_EXPECTING_SUBDOMAIN
        else if c = '.' then
          State := STATE_LOCAL_PERIOD
        else
          break;
      STATE_LOCAL_PERIOD:
        if c in atom_chars then
          State := STATE_ATOM
        else if c = '"' then
          State := STATE_QTEXT
        else
          break;
      STATE_EXPECTING_SUBDOMAIN:
        if c in letters then
          State := STATE_SUBDOMAIN
        else
          break;
      STATE_SUBDOMAIN:
        if c = '.' then
        begin
          inc(subdomains);
          State := STATE_EXPECTING_SUBDOMAIN
        end
        else if c = '-' then
          State := STATE_HYPHEN
        else if not (c in letters_digits) then
          break;
      STATE_HYPHEN:
        if c in letters_digits then
          State := STATE_SUBDOMAIN
        else if c <> '-' then
          break;
    end;
    inc(i);
  end;

  if i <= n then
    Result := False
  else
    Result := (State = STATE_SUBDOMAIN) and (subdomains >= 2);

end;

{-------------------------------------------------------------------------------
  @abstract (Explode a string em uma lista de strings de acordo com o carater separador)
  @author   (Evaldo)
  @created  (2016.04.18)
  @param    (const Ch: Char)
  @return   (TStringList)
-------------------------------------------------------------------------------}

function TADVString.Explode(const Ch: Char): TStringList;
var
  I: word;
  stAux: string;
begin
  Result := TStringList.Create;
  I := 0;

  stAux := Self.Text;
  while stAux <> '' do
  begin
    if Pos(CH, stAux) > 0 then
    begin
      Result.Add(Copy(stAux, 1, Pos(CH, stAux) - 1));
      Delete(stAux, 1, Length(Result[I]) + Length(CH));
    end
    else
    begin
      Result.Add(stAux);
      stAux := '';
    end;
    inc(I);
  end;

end;

{-------------------------------------------------------------------------------
  @abstract (Explode a string em uma lista de strings de acordo com o carater separador, sem espaços em branco)
  @author   (Evaldo)
  @created  (2016.04.18)
  @param    (const Ch: Char)
  @return   (TStringList)
-------------------------------------------------------------------------------}

function TADVString.ExplodeTrim(const Ch: Char): TStringList;
var
  I: Integer;
begin
  Result := Self.Explode(ch);

  for I := 0 to Result.Count - 1 do
  begin
    Result.Strings[i] := Trim(Result.Strings[i]);
  end;

end;

{-------------------------------------------------------------------------------
  @abstract (Extrair todos os numeros de uma string)
  @author   (Evaldo)
  @created  (2016.04.18)
  @param    (None)
  @return   (Integer)
-------------------------------------------------------------------------------}

function TADVString.ExtractNumbers: TADVString;
var
  i: Integer;
begin
  Result.Clear;
  for i := 1 to Length(Self.Text) do
    if (self.Text[i] in ['0'..'9']) then
    begin
      Result.Text := Result.Text + self.Text[i];
    end;
end;

{-------------------------------------------------------------------------------
  @abstract ( Verificar se a string é do tipo DateTime)
  @author   (Evaldo)
  @created  (2016.04.18)
  @param    (None)
  @return   (Boolean)
-------------------------------------------------------------------------------}

function TADVString.IsDateTime: Boolean;
var
  i: Integer;
begin
  if (self.Text = '') then
  begin
    Result := False;
    Exit;
  end;

  Result := True;

  for i := 1 to Length(self.Text) do
    if not (self.Text[i] in ['0'..'9', {$IF CompilerVersion >= 19}FormatSettings.{$IFEND}DateSeparator]) then
    begin
      Result := False;
      Break;
    end;

end;

{-------------------------------------------------------------------------------
  @abstract (TADVString.IsEmpty verifica se conteudo da string é vazio)
  @author   (Evaldo)
  @created  (2016.04.18)
  @param    (None)
  @return   (Boolean)
-------------------------------------------------------------------------------}

function TADVString.IsEmpty: Boolean;
begin
  result := Self.Text = '';
end;

{-------------------------------------------------------------------------------
  @abstract ( Verificar se a string é um float)
  @author   (Evaldo)
  @created  (2016.04.18)
  @param    (None)
  @return   (Boolean)
-------------------------------------------------------------------------------}

function TADVString.IsFloat: Boolean;
var
  Value: Extended;
begin
  try
    Result := TextToFloat(Self.ToPChar, Value, fvExtended);
  except
    result := False;
  end;
end;

{-------------------------------------------------------------------------------
  @abstract (Verificar se a string é um inteiro)
  @author   (Evaldo)
  @created  (2016.04.18)
  @param    (None)
  @return   (Boolean)
-------------------------------------------------------------------------------}

function TADVString.IsInteger: Boolean;
begin
  if (Pos('.', Self.Text) > 0) or (self.Text = '') then
  begin
    Result := False;
    Exit;
  end;

  try
    StrToInt(Self.Text);
    Result := True;
  except
    Result := False;
  end;
end;

{-------------------------------------------------------------------------------
  @abstract (Transforma a string em caixa baixa)
  @author   (Evaldo)
  @created  (2016.04.18)
  @param    (None)
  @return   (string)
-------------------------------------------------------------------------------}

function TADVString.Lower: TADVString;
begin
  result.Text := LowerCase(Self.Text);
end;

{-------------------------------------------------------------------------------
  @abstract (Remove os Espaços em branco à esquerda da string)
  @author   (Evaldo)
  @created  (2016.04.18)
  @param    (None)
  @return   (string)
-------------------------------------------------------------------------------}

function TADVString.LTrim: TADVString;
var
  I: Integer;
begin
  I := 0;
  while True do
  begin
    inc(I);
    if I > length(self.Text) then
      break;
    if self.Text[I] <> #32 then
      break;
  end;
  Result.Text := Copy(self.Text, I, length(self.Text));

end;

{-------------------------------------------------------------------------------
  @abstract (Completa a string com caracter passado a esquerda e a direita da string
  de acordo com o tamanho indicado)
  @author   (Evaldo)
  @created  (2016.04.18)
  @param    (const Len: integer; const Ch: Char)
  @return   (string)
-------------------------------------------------------------------------------}

function TADVString.PadC(const Len: integer; const Ch: Char): TADVString;
var
  I, J: integer;
  Pad: string;
  Impar: boolean;
begin
  I := Length(self.Text);
  if I < Len then
  begin
    J := Len - I;
    Impar := J mod 2 = 1;
    J := J div 2;
    Pad := StringOfChar(Ch, J);
    Result.Text := Pad + Self.Text + Pad;
    if Impar then
      Result.Text := Result.Text + Ch;
  end
  else if I > Len then
  begin
    J := I - Len;
    Impar := J mod 2 = 1;
    J := J div 2;
    Result.Text := Self.Text;
    Delete(Result.Text, I - J + 1, J);
    Delete(Result.Text, 1, J);
    if Impar then
    begin
      Dec(I, J * 2);
      Delete(Result.Text, I, 1);
    end;
  end
  else
    Result.Text := Self.Text;

end;

{-------------------------------------------------------------------------------
  @abstract (Completa a string com caracter passado a esquerda da string de acordo com o tamanho indicado)
  @author   (Evaldo)
  @created  (2016.04.18)
  @param    (const Len: integer; const Ch: Char)
  @return   (string)
-------------------------------------------------------------------------------}

function TADVString.PadL(const Len: integer; const Ch: Char): TADVString;
var
  LenS: integer;
begin
  LenS := Length(Self.Text);
  if LenS < Len then
    Result.Text := StringOfChar(Ch, Len - LenS) + self.Text
  else if LenS > Len then
    Result.Text := Copy(self.Text, LenS - Len + 1, Len)
  else
    Result.Text := self.Text;

end;

{-------------------------------------------------------------------------------
  @abstract (Completa a string com caracter passado a direita da string de acordo com o tamanho indicado)
  @author   (Evaldo)
  @created  (2016.04.18)
  @param    (const Len: integer; const Ch: Char)
  @return   (string)
-------------------------------------------------------------------------------}

function TADVString.PadR(const Len: integer; const Ch: Char): TADVString;
var
  LenS: integer;
begin
  LenS := Length(self.Text);
  if LenS < Len then
    Result.Text := self.Text + StringOfChar(Ch, Len - LenS)
  else if LenS > Len then
    Result.Text := Copy(self.Text, 1, Len)
  else
    Result.Text := self.Text;
end;

{-------------------------------------------------------------------------------
  @abstract (Remover os acentos da string)
  @author   (Evaldo)
  @created  (2016.04.18)
  @param    (None)
  @return   (string)
-------------------------------------------------------------------------------}

function TADVString.RemoveAcento: TADVString;
const
  ComAcento = 'àâêôûãõáéíóúçüÀÂÊÔÛÃÕÁÉÍÓÚÇÜ';
  SemAcento = 'aaeouaoaeioucuAAEOUAOAEIOUCU';
var
  x: Integer;
begin

  Result.Text := Self.Text;
  for x := 1 to Length(Self.Text) do
  begin
    if Pos(Self.Text[x], ComAcento) <> 0 then
      Result.Text[x] := SemAcento[Pos(Text[x], ComAcento)]
  end;

end;

function TADVString.RemoveCaracteres(const Args: array of const): TADVString;
var
  i: integer;

  function Verifica(Caracter: char; const Args: array of const): Boolean;
  var
    j: Integer;
  begin
    result := True;
    for j := 0 to Length(Args) - 1 do
      case (Args[j]).VType of
        2,9:
          begin
            {$IF CompilerVersion >= 19}
            if Caracter = Args[j].VWideChar then
            {$ELSE}
             if Caracter = Args[j].VChar then
            {$IFEND}
            begin
              result := false;
              Break;
            end;
          end;
      end;
  end;

begin
  Result.Text := '';
  for i := 1 to length(self.Text) do
  begin
    if Verifica(self.Text[i], Args) then
      Result.Text := Result.Text + Self.Text[i];
  end;
end;

{-------------------------------------------------------------------------------
  @abstract (Remove a extenção do nome de um arquivo)
  @author   (Evaldo)
  @created  (2016.04.18)
  @param    (None)
  @return   (TADVString)
-------------------------------------------------------------------------------}

function TADVString.RemoveExt: TADVString;
begin
  result.Text := ChangeFileExt(Text, '');
end;

{-------------------------------------------------------------------------------
  @abstract (Trocar uma substring por outra )
  @author   (Evaldo)
  @created  (2016.04.18)
  @param    (Caracter, Subst: string)
  @return   (TADVString)
-------------------------------------------------------------------------------}

function TADVString.ReplaceString(Caracter, Subst: string): TADVString;
begin
  Result.Text := StringReplace(Self.Text, Caracter, Subst, [rfReplaceAll, rfIgnoreCase]);
end;

{-------------------------------------------------------------------------------
  @abstract (Reverrter uma string)
  @author   (Evaldo)
  @created  (2016.04.18)
  @param    (None)
  @return   (TADVString)
-------------------------------------------------------------------------------}

function TADVString.ReverseStr: TADVString;
var
  I: Integer;
begin
  Result.Text := '';
  for I := Length(self.Text) downto 1 do
    Result.Text := Result.Text + self.Text[I];
end;

{-------------------------------------------------------------------------------
  @abstract ( Remover os espços em branco a direita da string )
  @author   (Evaldo)
  @created  (2016.04.18)
  @param    (None)
  @return   (string)
-------------------------------------------------------------------------------}

function TADVString.RTrim: TADVString;
var
  I: Integer;
begin
  I := length(self.Text) + 1;
  while True do
  begin
    Dec(I);
    if I <= 0 then
      break;
    if self.Text[I] <> #32 then
      break;
  end;
  Result.Text := Copy(self.Text, 1, I);

end;

{-------------------------------------------------------------------------------
  @abstract (Pesquisa um caractere à esquerda da string, retornando sua posição)
  @author   (Evaldo)
  @created  (2016.04.18)
  @param    (Caracter: string)
  @return   (integer)
-------------------------------------------------------------------------------}

function TADVString.SearchLeft(Caracter: Char): integer;
var
  i: integer;
begin
  result := -1;
  for i := 0 to length(self.Text) do
  begin
    if self.Text[i] = Caracter then
    begin
      Result := i;
      exit;
    end;
  end;

end;

{-------------------------------------------------------------------------------
  @abstract (Pesquisa um caractere à direita da string, retornando sua posição)
  @author   (Evaldo)
  @created  (2016.04.18)
  @param    (Caracter: string)
  @return   (integer)
-------------------------------------------------------------------------------}

function TADVString.SearchRigth(Caracter: Char): integer;
var
  i: integer;
begin
  result := -1;
  for i := length(self.Text) downto 0 do
  begin
    if self.Text[i] = Caracter then
    begin
      Result := i;
      exit;
    end;
  end;
end;

{-------------------------------------------------------------------------------
  @abstract (Retorna uma substring)
  @author   (Evaldo)
  @created  (2016.04.18)
  @param    (PosInicial, PosFinal: Integer)
  @return   (TADVString)
-------------------------------------------------------------------------------}

function TADVString.SubString(PosInicial, PosFinal: Integer): TADVString;
begin
  Result.Text := Copy(Self.Text, PosInicial, PosFinal - PosInicial);
end;

{-------------------------------------------------------------------------------
  @abstract (Substiuir um caracter  dentro da string)
  @author   (Evaldo)
  @created  (2016.04.19)
  @param    (Caracter, Subst: char)
  @return   (string)
-------------------------------------------------------------------------------}

function TADVString.ReplaceChar(Caracter, Subst: char): string;
var
  i: integer;
begin
  Result := Self.Text;
  for i := 0 to length(self.Text) - 1 do
  begin
    if self.Text[i] = Caracter then
    begin
      Result[i] := Subst;
    end;
  end;
end;

{-------------------------------------------------------------------------------
  @abstract (Retorna a striong com aspas)
  @author   (Evaldo)
  @created  (2016.04.18)
  @param    (None)
  @return   (TADVString)
-------------------------------------------------------------------------------}

function TADVString.ToComma: TADVString;
begin
  Result.Text := QuotedStr(Self.Text);
end;

{-------------------------------------------------------------------------------
  @abstract (formata Cpf/Cnpj sem que o usuario tenha que digitar os pontos, traços e barra)
  @author   (Internet)
  @created  (2016.04.18)
  @param    (None)
  @return   (TADVString)
-------------------------------------------------------------------------------}

function TADVString.ToCNPJCpf: TADVString;
var
  vTam, xx: Integer;
  vDoc: string;
begin
  vTam := Length(Self.Text);
  for xx := 1 to vTam do
    if (Copy(Self.Text, xx, 1) <> '.') and (Copy(Self.Text, xx, 1) <> '-') and (Copy(Self.Text, xx, 1) <> '/') then
      vDoc := vDoc + Copy(Self.Text, xx, 1);
  Self.Text := vDoc;
  vTam := Length(Self.Text);
  vDoc := '';
  vDoc := '';
  for xx := 1 to vTam do
  begin
    vDoc := vDoc + Copy(Self.Text, xx, 1);
    if vTam = 11 then
    begin
      if (xx in [3, 6]) then
        vDoc := vDoc + '.';
      if xx = 9 then
        vDoc := vDoc + '-';
    end;
    if vTam = 14 then
    begin
      if (xx in [2, 5]) then
        vDoc := vDoc + '.';
      if xx = 8 then
        vDoc := vDoc + '/';
      if xx = 12 then
        vDoc := vDoc + '-';
    end;
  end;
  Result.Text := vDoc;

end;

{-------------------------------------------------------------------------------
  @abstract (Converter para Currency)
  @author   (Evaldo)
  @created  (2016.04.18)
  @param    (None)
  @return   (Currency)
-------------------------------------------------------------------------------}

function TADVString.ToCurrency: Currency;
var
  i: Integer;
  stAux: string;
  blSeenDecimal, blSeenSgn: Boolean;
begin
  stAux := '';
  blSeenDecimal := False;
  blSeenSgn := False;

  if Self.Text = '' then
    raise Exception.Create('String Vazia');

  {Percorre os caracteres da string:}
  for i := Length(Self.Text) downto 0 do
    {Filtra a string, aceitando somente números e separador decimal:}
    if (Self.Text[i] in ['0'..'9', '-', '+', {$IF CompilerVersion >= 19}FormatSettings.{$IFEND} DecimalSeparator]) then
    begin
      if (Self.Text[i] = {$IF CompilerVersion >= 19}FormatSettings.{$IFEND}DecimalSeparator ) and (not blSeenDecimal) then
      begin
        stAux := Self.Text[i] + stAux;
        blSeenDecimal := True;
      end
      else if (Self.Text[i] in ['+', '-']) and (not blSeenSgn) and (i = 1) then
      begin
        stAux := Self.Text[i] + stAux;
        blSeenSgn := True;
      end
      else if Self.Text[i] in ['0'..'9'] then
      begin
        stAux := Self.Text[i] + stAux;
      end;
    end;

  Result := StrToCurr(stAux);
end;

{-------------------------------------------------------------------------------
  @abstract (Format  a string de acordo com o formato passado)
  @author   (Evaldo)
  @created  (2016.04.19)
  @param    (Mask: string)
  @return   (TADVString)
-------------------------------------------------------------------------------}

function TADVString.ToCustomFormat(Mask: string): TADVString;
begin
  result.Text := Format(Mask, [Self.Text])
end;

{-------------------------------------------------------------------------------
  @abstract (Converte a string para Date)
  @author   (Evaldo)
  @created  (2016.04.19)
  @param    (None)
  @return   (TDate)
-------------------------------------------------------------------------------}

function TADVString.ToDate: TDate;
var
  dtAux: TDateTime;
begin
  dtAux := StrToDateTime(Self.Text);
  ReplaceTime(dtAux, 0);

  Result := dtAux;
end;

{-------------------------------------------------------------------------------
  @abstract (Converte a string para DateTime)
  @author   (Evaldo)
  @created  (2016.04.19)
  @param    (None)
  @return   (TDateTime)
-------------------------------------------------------------------------------}

function TADVString.ToDateTime: TDateTime;
begin
  Result := StrToDateTime(Self.Text);
end;

{-------------------------------------------------------------------------------
  @abstract (Converter para Double)
  @author   (Evaldo)
  @created  (2016.04.19)
  @param    (None)
  @return   (Double)
-------------------------------------------------------------------------------}

function TADVString.ToFloat: Double;
var
  Aux: string;
begin
  Aux := self.ReplaceChar('.', ',');

  Result := StrToFloat(aux);
end;

{-------------------------------------------------------------------------------
  @abstract (Converter para inteiro)
  @author   (Evaldo)
  @created  (2016.04.19)
  @param    (None)
  @return   (Integer)
-------------------------------------------------------------------------------}

function TADVString.ToInt: Integer;
begin
  Result := StrToInt(Self.Text);
end;

{-------------------------------------------------------------------------------
  @abstract ( Retornar um ponteiro para char)
  @author   (Internet)
  @created  (2016.04.18)
  @param    (None)
  @return   (PChar)
-------------------------------------------------------------------------------}

function TADVString.ToPChar: PChar;
type
  TRingIndex = 0..7;
var
  Ring: array[TRingIndex] of PChar;
  RingIndex: TRingIndex;
  Ptr: PChar;
begin

  if self.Text = '' then
    raise Exception.Create('String Vazia');

  Ptr := @self.Text[Length(self.Text)];
  Inc(Ptr);
  if Ptr^ = #0 then
  begin
    Result := @self.Text[1];
  end
  else
  begin
    Result := StrAlloc(Length(self.Text) + 1);
    RingIndex := (RingIndex + 1) mod (High(TRingIndex) + 1);
    StrPCopy(Result, self.Text);
    StrDispose(Ring[RingIndex]);
    Ring[RingIndex] := Result;
  end;

end;

{-------------------------------------------------------------------------------
  @abstract (Converter a string para maiúsculo)
  @author   (Evaldo)
  @created  (2016.04.18)
  @param    (None)
  @return   (TADVString)
-------------------------------------------------------------------------------}

function TADVString.Upper: TADVString;
begin
  Result.Text := UpperCase(self.Text);
end;

{-------------------------------------------------------------------------------
  @abstract (Valida um CNPJ)
  @author   (Internet)
  @created  (2016.04.18)
  @param    (None)
  @return   (boolean)
-------------------------------------------------------------------------------}

function TADVString.isCNPJ: boolean;
var
  cnpj: string;
  dg1, dg2: integer;
  x, total: integer;
  ret: boolean;
begin
  ret := False;
  cnpj := '';
  //Analisa os formatos
  if Length(Self.Text) = 18 then
    if (Copy(Self.Text, 3, 1) + Copy(Self.Text, 7, 1) + Copy(Self.Text, 11, 1) + Copy(Self.Text, 16, 1) = '../-') then
    begin
      cnpj := Copy(Self.Text, 1, 2) + Copy(Self.Text, 4, 3) + Copy(Self.Text, 8, 3) + Copy(Self.Text, 12, 4) + Copy(Self.Text, 17, 2);
      ret := True;
    end;
  if Length(Self.Text) = 14 then
  begin
    cnpj := Self.Text;
    ret := True;
  end;
  //Verifica
  if ret then
  begin
    try
      //1° digito
      total := 0;
      for x := 1 to 12 do
      begin
        if x < 5 then
          Inc(total, StrToInt(Copy(cnpj, x, 1)) * (6 - x))
        else
          Inc(total, StrToInt(Copy(cnpj, x, 1)) * (14 - x));
      end;
      dg1 := 11 - (total mod 11);
      if dg1 > 9 then
        dg1 := 0;
      //2° digito
      total := 0;
      for x := 1 to 13 do
      begin
        if x < 6 then
          Inc(total, StrToInt(Copy(cnpj, x, 1)) * (7 - x))
        else
          Inc(total, StrToInt(Copy(cnpj, x, 1)) * (15 - x));
      end;
      dg2 := 11 - (total mod 11);
      if dg2 > 9 then
        dg2 := 0;
      //Validação final
      if (dg1 = StrToInt(Copy(cnpj, 13, 1))) and (dg2 = StrToInt(Copy(cnpj, 14, 1))) then
        ret := True
      else
        ret := False;
    except
      ret := False;
    end;
    //Inválidos
    case AnsiIndexStr(cnpj, ['00000000000000', '11111111111111', '22222222222222', '33333333333333', '44444444444444',
      '55555555555555', '66666666666666', '77777777777777', '88888888888888', '99999999999999']) of

      0..9: ret := False;

    end;
  end;
  isCNPJ := ret;

end;

{-------------------------------------------------------------------------------
  @abstract (TADVString.IsCPF)
  @author   (Internet)
  @created  (2016.04.18)
  @param    (None)
  @return   (boolean)
-------------------------------------------------------------------------------}

function TADVString.IsCPF: boolean;
var
  i: integer;
  Want: char;
  Wvalid: boolean;
  Wdigit1, Wdigit2: integer;
  cpfcnpj: string;
begin

  try
    cpfcnpj := Self.Text;

    if Self.StringLength < 11 then
    begin
      result := false;
      Exit;
    end;

    Wdigit1 := 0;
    Wdigit2 := 0;
    Want := cpfcnpj[1]; //variavel para testar se o cpfcnpj é repetido como 111.111.111-11
    Delete(cpfcnpj, ansipos('.', cpfcnpj), 1); //retira as mascaras se houver
    Delete(cpfcnpj, ansipos('.', cpfcnpj), 1);
    Delete(cpfcnpj, ansipos('-', cpfcnpj), 1);
    //testar se o cpfcnpj é repetido como 111.111.111-11
    for i := 1 to length(cpfcnpj) do
    begin
      if cpfcnpj[i] <> Want then
      begin
        Wvalid := true; // se o cpfcnpj possui um digito diferente ele passou no primeiro teste
        break
      end
      else
        Wvalid := false;
    end;
    // se o cpfcnpj é composto por numeros repetido retorna falso
    if Wvalid = false then
    begin
      result := false;
      exit;
    end;

    //executa o calculo para o primeiro verificador
    for i := 1 to 9 do
    begin
      wdigit1 := Wdigit1 + (strtoint(cpfcnpj[10 - i]) * (I + 1));
    end;

    // Wdigit1 :=( (  (11 – (Wdigit1 mod 11) ) mod 11) mod 10 );
    Wdigit1 := (((11 - (Wdigit1 mod 11)) mod 11) mod 10);

    //verifica se o 1° digito confere
    if IntToStr(Wdigit1) <> cpfcnpj[10] then
    begin
      result := false;
      exit;
    end;

    for i := 1 to 10 do
    begin
      wdigit2 := Wdigit2 + (strtoint(cpfcnpj[11 - i]) * (I + 1));
    end;
    Wdigit2 := (((11 - (Wdigit2 mod 11)) mod 11) mod 10);
    {formula do segundo verificador
       soma=1°*2+2°*3+3°*4.. até 10°*11
       digito1 = 11 – soma mod 11
       se digito > 10 digito1 =0
     }

  // confere o 2° digito verificador
    if IntToStr(Wdigit2) <> cpfcnpj[11] then
    begin
      result := false;
      exit;
    end;

    //cpf é valido
    result := true;
  except
    result := False;
  end;

end;

{-------------------------------------------------------------------------------
  @abstract (Retorna o número de palavras que contem em uma string)
  @author   (Evaldo)
  @created  (2016.04.18)
  @param    (None)
  @return   (integer)
-------------------------------------------------------------------------------}

function TADVString.Wordcount: integer;
var
  i: integer;
  len: integer;
begin
  len := length(Self.Text);
  Result := 0;
  i := 1;
  while i <= len do
  begin
    while ((i <= len) and ((Self.Text[i] = #32) or (Self.Text[i] = #9) or
      (Self.Text[i] = ';'))) do
      inc(i);
    if i <= len then
      inc(Result);
    while ((i <= len) and ((Self.Text[i] <> #32) and (Self.Text[i] <> #9) and
      (Self.Text[i] <>
      ';'))) do
      inc(i);
  end;
end;

end.
