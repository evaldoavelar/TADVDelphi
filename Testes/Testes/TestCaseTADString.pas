unit TestCaseTADString;

interface
uses TestFramework, Classes, SysUtils;

type
  //classe de teste da TADVString
  TTestCaseTADString = class(TTestCase)
  private

  published
    //IsEmpty
    procedure IsEmpty_Pode_Retornar_Verdadeiro_Se_String_Esta_Vazia;
    procedure IsEmpty_Pode_Retornar_Falso_Se_String_Nao_Esta_Vazia;

    //clear
    procedure Clear_Pode_Remover_Conteudo_De_Uma_String;

    //ADD
    procedure ADD_Pode_Concaternar_Strings;

    //Alltrim
    procedure Alltrim_Pode_Remover_Espacos_Na_Esquerda_E_Direita;
    procedure Alltrim_Pode_Remover_Espacos_Na_Esquerda;
    procedure Alltrim_Pode_Remover_Espacos_Na_Direita;

    //LTrim
    procedure Ltrim_Pode_Remover_Espacos_Na_Esquerda;

    //LTrim
    procedure Rtrim_Pode_Remover_Espacos_Na_Direita;

    //PadC
    procedure PadC_Pode_Completar_String_Direita_Esquerda;

    //PadL
    procedure PadL_Pode_Completar_String_Esquerda;

    // PadR
    procedure PadR_Pode_Completar_String_Direita;

    //CaixaMista
    procedure CaixaMista_Pode_Retornar_String_Em_CaixaMista_Minusculo;
    procedure CaixaMista_Pode_Retornar_String_Em_CaixaMista_Maiuculo;

    //Lower
    procedure Lower_Pode_Deixar_String_Minuscula;

    //Lower
    procedure Upper_Pode_Deixar_String_Maiuscula;

    //isCNPJ
    procedure isCNPJ_Pode_Validar_CNPJ_Valido;
    procedure isCNPJ_Pode_Validar_CNPJ_Valido_Com_Mascara;
    procedure isCNPJ_Nao_Pode_Validar_CNPJ_Invalido;

    //isCNPF
    procedure isCPF_Pode_Validar_CPF_Valido;
    procedure isCPF_Pode_Validar_CPF_Valido_Com_Mascara;
    procedure isCPF_Nao_Pode_Validar_CPF_Invalido;

    //Wordcount
    procedure Wordcount_Pode_Contar_Palavras;

    //SearchLeft
    procedure SearchLeft_Pode_Localizar_String;

    //SearchRigth
    procedure SearchRigth_Pode_Localizar_String;

    //Concatena
    procedure Concatena_Pode_Concaternar_Strings;

    //HasString
    procedure HasString_Pode_Retornar_Verdadeiro_Se_String_Contem_SubString;

    //Count
    procedure Count_Pode_Retornar_Quantidade_Caracteres_Na_String;

    //isEmail
    procedure isEmail_Pode_Validar_Email;
    procedure isEmail_Nao_Pode_Validar_Email_Sem_Arroba;
    procedure isEmail_Nao_Pode_Validar_Email_Sem_Dominio;
    procedure isEmail_Nao_Pode_Validar_Email_Sem_UserName;

    //Explode
    procedure Explode_Pode_explodir_string;

    //ExtractNumbers
    procedure ExtractNumbers_Pode_Extrair_Numeros_Da_String;

    //IsDateTime
    procedure IsDateTime_Pode_Retornar_Verdadeiro_Se_String_Contem_DateTime;
    procedure IsDateTime_Pode_Retornar_Falso_Se_String_Nao_Contem_DateTime;

    //IsFloat
    procedure IsFloat_Pode_Retornar_Verdadeiro_Se_String_Contem_Float;
    procedure IsFloat_Pode_Retornar_Falso_Se_String_Nao_Contem_Float;

    //IsInteger
    procedure IsInteger_Pode_Retornar_Verdadeiro_Se_String_Contem_Integer;
    procedure IsInteger_Pode_Retornar_Falso_Se_String_Nao_Contem_Integer;

    //RemoveAcento
    procedure RemoveAcento_Pode_Remover_Acentos_Da_String;

    //RemoveCaracteres
    procedure RemoveCaracteres_Pode_Remover_Caracteres_Da_String;

    //RemoveExt
    procedure RemoveExt_Pode_Remover_Extencao_Da_String;

    //ReplaceString
    procedure ReplaceString_Pode_Sobreecrever_String;

    //ReverseStr
    procedure ReverseStr_Pode_Reverter_Caracteres_Da_String;

    //SubString
    procedure SubString_Pode_Retornar_Uma_Substring;

    //ToComma
    procedure ToComma_Pode_Retornar_String_Com_Aspas;

    //ToCNPJCpf
    procedure ToCNPJCpf_Pode_Formartar_CPF;
    procedure ToCNPJCpf_Pode_Formartar_CNPJ;

    //ToCurrency
    procedure ToCurrency_Pode_Converter;
    procedure ToCurrency_Pode_Converter_Monetario_Formatado;

    //ToCustomFormat
    procedure ToCustomFormat_Pode_Formatar;

    //ToDate
    procedure ToDate_Pode_Converter;
    procedure ToDate_Pode_Converter_DateTime_Para_date;

    //ToDateTime
    procedure ToDateTime_Pode_Converter;

    //ToFloat
    procedure ToFloat_Pode_Converter;

    //ToInt
    procedure ToInt_Pode_Converter;

  end;

implementation

uses untTADVString;

{ TTestCaseTADString }

procedure TTestCaseTADString.ADD_Pode_Concaternar_Strings;
var
  stString: TADVString;
  string1, string2, string3, stringEsperado: string;
begin
  //ambiente
  stString.Text := '';

  string1 := 'String1';
  string2 := 'String2';
  string3 := 'String3';
  stringEsperado := string1 + string2 + string3;

  //ação
  stString.ADD(string1);
  stString.ADD(string2);
  stString.ADD(string3);

  CheckEquals(stringEsperado, stString.Text, 'Não concatenou corretamente as string');
end;

procedure TTestCaseTADString.Alltrim_Pode_Remover_Espacos_Na_Direita;
var
  stString: TADVString;
  stringEsperada, stringOriginal, stringTeste: string;
begin

  //ambiente
  stringOriginal := 'String Com Espacos Direita ';
  stringEsperada := 'String Com Espacos Direita';

  stString.Text := stringOriginal;

  //ação
  stringTeste := stString.Alltrim().Text;

  //assertiva
  CheckEquals(stringEsperada, stringTeste, 'Não removeu os espacos a direita da string');
end;

procedure TTestCaseTADString.Alltrim_Pode_Remover_Espacos_Na_Esquerda;
var
  stString: TADVString;
  stringEsperada, stringOriginal, stringTeste: string;
begin

  //ambiente
  stringOriginal := 'String Com Espacos Esquerda ';
  stringEsperada := 'String Com Espacos Esquerda';

  stString.Text := stringOriginal;

  //ação
  stringTeste := stString.Alltrim().Text;

  //assertiva
  CheckEquals(stringEsperada, stringTeste, 'Não removeu os espacos a Esquerda da string');

end;

procedure TTestCaseTADString.Alltrim_Pode_Remover_Espacos_Na_Esquerda_E_Direita;
var
  stString: TADVString;
  stringEsperada, stringOriginal, stringTeste: string;
begin

  //ambiente
  stringOriginal := ' String Com Espacos ';
  stringEsperada := 'String Com Espacos';

  stString.Text := stringOriginal;

  //ação
  stringTeste := stString.Alltrim().Text;

  //assertiva
  CheckEquals(stringEsperada, stringTeste, 'Não removeu os espacos a direita e a equerda da string');

end;

procedure TTestCaseTADString.CaixaMista_Pode_Retornar_String_Em_CaixaMista_Minusculo;
var
  stString: TADVString;
  stringEsperada, stringOriginal, stringTeste: string;
begin

  //ambiente
  stringOriginal := 'string caixa mista';
  stringEsperada := 'String Caixa Mista';

  stString.Text := stringOriginal;

  //ação
  stringTeste := stString.CaixaMista().Text;

  //assertiva
  CheckEquals(stringEsperada, stringTeste, 'Não colocou a string em Caixa Mista');

end;

procedure TTestCaseTADString.CaixaMista_Pode_Retornar_String_Em_CaixaMista_Maiuculo;
var
  stString: TADVString;
  stringEsperada, stringOriginal, stringTeste: string;
begin

  //ambiente
  stringOriginal := 'STRING CAIXA MISTA';
  stringEsperada := 'String Caixa Mista';

  stString.Text := stringOriginal;

  //ação
  stringTeste := stString.CaixaMista().Text;

  //assertiva
  CheckEquals(stringEsperada, stringTeste, 'Não colocou a string em Caixa Mista');

end;

procedure TTestCaseTADString.Clear_Pode_Remover_Conteudo_De_Uma_String;
var
  stString: TADVString;
begin
  //ambiente
  stString.Text := 'String a zer removida';

  //ação
  stString.Clear;

  //assertiva
  CheckEquals('', stString.Text, 'Não removeu o contéudo da string');
end;

procedure TTestCaseTADString.Concatena_Pode_Concaternar_Strings;
var
  stString: TADVString;
  string1, string2, string3, stringEsperado: string;
begin
  //ambiente
  stString.Text := '';

  string1 := 'String1';
  string2 := 'String2';
  string3 := 'String3';
  stringEsperado := string1 + '|' + string2 + '|' + string3;

  //ação
  stString.Concatena('|', string1);
  stString.Concatena('|', string2);
  stString.Concatena('|', string3);

  CheckEquals(stringEsperado, stString.Text, 'Não concatenou corretamente as string');
end;

procedure TTestCaseTADString.Count_Pode_Retornar_Quantidade_Caracteres_Na_String;
var
  stString: TADVString;
  inTam: Integer;
begin
  //ambiente
  stString.Text := '123456789';

  //ação
  inTam := stString.StringLength();

  //assertiva
  CheckEquals(9, inTam, 'Não retornou o tamanho correto da string');

end;

procedure TTestCaseTADString.Explode_Pode_explodir_string;
var
  stString: TADVString;
  string1, string2, string3, stringEsperado: string;
  stringsGeradas: TStringList;
begin
  //ambiente
  stString.Text := '';

  string1 := 'String1';
  string2 := 'String2';
  string3 := 'String3';

  stString.Text := string1 + ';' + string2 + ';' + string3;

  //ação
  stringsGeradas := stString.Explode(';');

  //assertiva
  CheckNotNull(stringsGeradas, 'Não retornou uma stringlist instanciada');
  CheckEquals(3, stringsGeradas.Count, 'Não retornou a quantidade de strings esperadas');
  CheckEquals(stringsGeradas[0], string1, 'Não retornou a string esperada');
  CheckEquals(stringsGeradas[1], string2, 'Não retornou a string esperada');
  CheckEquals(stringsGeradas[2], string3, 'Não retornou a string esperada');

end;

procedure TTestCaseTADString.ExtractNumbers_Pode_Extrair_Numeros_Da_String;
var
  stString: TADVString;
  blAux: string;
begin
  //ambiente
  stString.Text := 'Teste123456789Teste';

  //ação
  blAux := stString.ExtractNumbers().Text;

  //assertiva
  CheckEquals('123456789', blAux, 'Não consegiu extrair numeros da string');

end;

procedure TTestCaseTADString.isEmail_Nao_Pode_Validar_Email_Sem_Arroba;
var
  stString: TADVString;
  blAux: Boolean;
begin
  //ambiente
  stString.Text := 'jose.gmail.com';

  //ação
  blAux := stString.isEmail();

  //assertiva
  CheckEquals(False, blAux, 'Não validou email sem arroba ');

end;

procedure TTestCaseTADString.isEmail_Nao_Pode_Validar_Email_Sem_Dominio;
var
  stString: TADVString;
  blAux: Boolean;
begin
  //ambiente
  stString.Text := 'jose@gmail';

  //ação
  blAux := stString.isEmail();

  //assertiva
  CheckEquals(False, blAux, 'Não validou email sem domínio ');

end;

procedure TTestCaseTADString.isEmail_Nao_Pode_Validar_Email_Sem_UserName;
var
  stString: TADVString;
  blAux: Boolean;
begin
  //ambiente
  stString.Text := '@gmail.com';

  //ação
  blAux := stString.isEmail();

  //assertiva
  CheckEquals(False, blAux, 'Não validou email sem username ');

end;

procedure TTestCaseTADString.isEmail_Pode_Validar_Email;
var
  stString: TADVString;
  blAux: Boolean;
begin
  //ambiente
  stString.Text := 'jose@gmail.com';

  //ação
  blAux := stString.isEmail();

  //assertiva
  CheckEquals(true, blAux, 'Não validou email correto');

end;

procedure TTestCaseTADString.HasString_Pode_Retornar_Verdadeiro_Se_String_Contem_SubString;
var
  stString: TADVString;
  blAux: Boolean;
begin
  //ambiente
  stString.Text := 'bláblábTESTEblábláblá';

  //ação
  blAux := stString.HasString('teste');

  //assertiva
  CheckEquals(true, blAux, 'Não retornou verdadeiro para a sub string');

end;

procedure TTestCaseTADString.IsDateTime_Pode_Retornar_Falso_Se_String_Nao_Contem_DateTime;
var
  stString: TADVString;
  blAux: Boolean;
begin
  //ambiente
  stString.Text := '20/02/195w0';

  //ação
  blAux := stString.IsDateTime();

  //assertiva
  CheckEquals(False, blAux, 'Não retornou falso para a string sem um dateTime');

end;

procedure TTestCaseTADString.IsDateTime_Pode_Retornar_Verdadeiro_Se_String_Contem_DateTime;
var
  stString: TADVString;
  blAux: Boolean;
begin
  //ambiente
  stString.Text := DateToStr(Now);

  //ação
  blAux := stString.IsDateTime();

  //assertiva
  CheckEquals(true, blAux, 'Não retornou verdadeiro para a string contendo dateTime');

end;

procedure TTestCaseTADString.IsEmpty_Pode_Retornar_Falso_Se_String_Nao_Esta_Vazia;
var
  stString: TADVString;
begin
  //ação
  stString.Text := 'String não está vazia';

  //assertiva
  CheckEquals(false, stString.IsEmpty, 'Não retornou Falso em uma string NÂO vazia');
end;

procedure TTestCaseTADString.IsEmpty_Pode_Retornar_Verdadeiro_Se_String_Esta_Vazia;
var
  stString: TADVString;
begin
  //ação
  stString.Text := '';

  //assertiva
  CheckEquals(true, stString.IsEmpty, 'Não retornou verdadeiro na string vazia');
end;

procedure TTestCaseTADString.IsFloat_Pode_Retornar_Falso_Se_String_Nao_Contem_Float;
var
  stString: TADVString;
  blAux: Boolean;
begin
  //ambiente
  stString.Text := 'Teste';

  //ação
  blAux := stString.IsFloat();

  //assertiva
  CheckEquals(False, blAux, 'Não retornou Falso para a string contendo Float');

end;

procedure TTestCaseTADString.IsFloat_Pode_Retornar_Verdadeiro_Se_String_Contem_Float;
var
  stString: TADVString;
  blAux: Boolean;
begin
  //ambiente
  stString.Text := FloatToStr(5.26);

  //ação
  blAux := stString.IsFloat();

  //assertiva
  CheckEquals(true, blAux, 'Não retornou Verdadeiro para a string contendo Float');

end;

procedure TTestCaseTADString.IsInteger_Pode_Retornar_Falso_Se_String_Nao_Contem_Integer;
var
  stString: TADVString;
  blAux: Boolean;
begin
  //ambiente
  stString.Text := FloatToStr(5.26);

  //ação
  blAux := stString.IsFloat();

  //assertiva
  CheckEquals(true, blAux, 'Não retornou Falso para a string contendo Float');

end;

procedure TTestCaseTADString.IsInteger_Pode_Retornar_Verdadeiro_Se_String_Contem_Integer;
var
  stString: TADVString;
  blAux: Boolean;
begin
  //ambiente
  stString.Text := IntToStr(5);

  //ação
  blAux := stString.IsInteger();

  //assertiva
  CheckEquals(true, blAux, 'Não retornou verdadeiro para a string contendo Integer');

end;

procedure TTestCaseTADString.Lower_Pode_Deixar_String_Minuscula;
var
  stString: TADVString;
  stAux: string;
begin
  //ambiente
  stString.Text := 'TESTE';

  //ação
  stAux := stString.Lower().Text;

  //assertiva
  CheckEquals('teste', stAux, 'Não retornou uma string minuscula');

end;

procedure TTestCaseTADString.Ltrim_Pode_Remover_Espacos_Na_Esquerda;
var
  stString: TADVString;
  stringEsperada, stringOriginal, stringTeste: string;
begin

  //ambiente
  stringOriginal := ' String Com Espacos Esquerda';
  stringEsperada := 'String Com Espacos Esquerda';

  stString.Text := stringOriginal;

  //ação
  stringTeste := stString.Ltrim().Text;

  //assertiva
  CheckEquals(stringEsperada, stringTeste, 'Não removeu os espacos a Esquerda da string');

end;

procedure TTestCaseTADString.PadC_Pode_Completar_String_Direita_Esquerda;
var
  stString: TADVString;
  stringEsperada, stringOriginal, stringTeste: string;
begin

  //ambiente
  stringOriginal := 'String';
  stringEsperada := '=====String=====';

  stString.Text := stringOriginal;

  //ação
  stringTeste := stString.PadC(16, '=').Text;

  //assertiva
  CheckEquals(stringEsperada, stringTeste, 'Não adicionou caracteres a string');

end;

procedure TTestCaseTADString.PadL_Pode_Completar_String_Esquerda;
var
  stString: TADVString;
  stringEsperada, stringOriginal, stringTeste: string;
begin

  //ambiente
  stringOriginal := 'String';
  stringEsperada := '=====String';

  stString.Text := stringOriginal;

  //ação
  stringTeste := stString.PadL(11, '=').Text;

  //assertiva
  CheckEquals(stringEsperada, stringTeste, 'Não adicionou caracteres a string');

end;

procedure TTestCaseTADString.PadR_Pode_Completar_String_Direita;
var
  stString: TADVString;
  stringEsperada, stringOriginal, stringTeste: string;
begin

  //ambiente
  stringOriginal := 'String';
  stringEsperada := 'String=====';

  stString.Text := stringOriginal;

  //ação
  stringTeste := stString.PadR(11, '=').Text;

  //assertiva
  CheckEquals(stringEsperada, stringTeste, 'Não adicionou caracteres a string');

end;

procedure TTestCaseTADString.RemoveAcento_Pode_Remover_Acentos_Da_String;
var
  stString: TADVString;
  stringEsperada, stringOriginal, stringTeste: string;
begin

  //ambiente
  stringOriginal := 'String Com áçentós';
  stringEsperada := 'String Com acentos';

  stString.Text := stringOriginal;

  //ação
  stringTeste := stString.RemoveAcento().Text;

  //assertiva
  CheckEquals(stringEsperada, stringTeste, 'Não removeu os espacos a Esquerda da string');

end;

procedure TTestCaseTADString.RemoveCaracteres_Pode_Remover_Caracteres_Da_String;
var
  stString: TADVString;
  stringEsperada, stringOriginal, stringTeste: string;
begin

  //ambiente
  stringOriginal := 'String Orig&nal com @ e outro @';
  stringEsperada := 'String Orignal com  e outro ';

  stString.Text := stringOriginal;

  //ação
  stringTeste := stString.RemoveCaracteres(['@', '&']).Text;

  //assertiva
  CheckEquals(stringEsperada, stringTeste, 'Não removeu os Caracteres da string');

end;

procedure TTestCaseTADString.RemoveExt_Pode_Remover_Extencao_Da_String;
var
  stString: TADVString;
  stringEsperada, stringOriginal, stringTeste: string;
begin

  //ambiente
  stringOriginal := 'Teste.exe';
  stringEsperada := 'Teste';

  stString.Text := stringOriginal;

  //ação
  stringTeste := stString.RemoveExt().Text;

  //assertiva
  CheckEquals(stringEsperada, stringTeste, 'Não removeu a extenção da string');

end;

procedure TTestCaseTADString.ReplaceString_Pode_Sobreecrever_String;
var
  stString: TADVString;
  stringEsperada, stringOriginal, stringTeste: string;
begin

  //ambiente
  stringOriginal := 'String Com replace';
  stringEsperada := 'String sem replace';

  stString.Text := stringOriginal;

  //ação
  stringTeste := stString.ReplaceString('Com', 'sem').Text;

  //assertiva
  CheckEquals(stringEsperada, stringTeste, 'Não substitui a substring');
end;

procedure TTestCaseTADString.ReverseStr_Pode_Reverter_Caracteres_Da_String;
var
  stString: TADVString;
  stringEsperada, stringOriginal, stringTeste: string;
begin

  //ambiente
  stringOriginal := 'Pode reverter essa string';
  stringEsperada := 'gnirts asse retrever edoP';

  stString.Text := stringOriginal;

  //ação
  stringTeste := stString.ReverseStr().Text;

  //assertiva
  CheckEquals(stringEsperada, stringTeste, 'Não removeu reverteu a string');

end;

procedure TTestCaseTADString.Rtrim_Pode_Remover_Espacos_Na_Direita;
var
  stString: TADVString;
  stringEsperada, stringOriginal, stringTeste: string;
begin

  //ambiente
  stringOriginal := 'String Com Espacos Esquerda ';
  stringEsperada := 'String Com Espacos Esquerda';

  stString.Text := stringOriginal;

  //ação
  stringTeste := stString.Rtrim().Text;

  //assertiva
  CheckEquals(stringEsperada, stringTeste, 'Não removeu os espacos a Esquerda da string');

end;

  procedure TTestCaseTADString.SearchLeft_Pode_Localizar_String;
var
  stString: TADVString;
  inPOs: Integer;
begin
  //ambiente
  stString.Text := 'teste9 teste blá 7lá blá';

  //ação
  inPOs := stString.SearchLeft('7');

  //assertiva
  CheckEquals(18, inPOs, 'Não retornou uma string Maiuscula');

end;

procedure TTestCaseTADString.SearchRigth_Pode_Localizar_String;
var
  stString: TADVString;
  inPOs: Integer;
begin
  //ambiente
  stString.Text := 'teste9 teste blá 7lá blá';

  //ação
  inPOs := stString.SearchRigth('7');

  //assertiva
  CheckEquals(18, inPOs, 'Não retornou uma string Maiuscula');

end;

procedure TTestCaseTADString.SubString_Pode_Retornar_Uma_Substring;
var
  stString: TADVString;
  stringEsperada, stringOriginal, stringTeste: string;
begin
  //ambiente
  stringOriginal := 'teste9 teste blá 7lá blá';
  stringEsperada := '7lá';

  stString.Text := stringOriginal;

  //ação
  stringTeste := stString.SubString(18, 21).Text;

  //assertiva
  CheckEquals(stringEsperada, stringTeste, 'Não retornou uma string Maiuscula');

end;

procedure TTestCaseTADString.ToCNPJCpf_Pode_Formartar_CNPJ;
var
  stString: TADVString;
  stringEsperada, stringOriginal, stringTeste: string;
begin
  //ambiente
  stringOriginal := '73048256000142';
  stringEsperada := '73.048.256/0001-42';

  stString.Text := stringOriginal;

  //ação
  stringTeste := stString.ToCNPJCpf().Text;

  //assertiva
  CheckEquals(stringEsperada, stringTeste, 'Não retornou um cnpj formatado');

end;

procedure TTestCaseTADString.ToCNPJCpf_Pode_Formartar_CPF;
var
  stString: TADVString;
  stringEsperada, stringOriginal, stringTeste: string;
begin
  //ambiente
  stringOriginal := '21185458433';
  stringEsperada := '211.854.584-33';

  stString.Text := stringOriginal;

  //ação
  stringTeste := stString.ToCNPJCpf().Text;

  //assertiva
  CheckEquals(stringEsperada, stringTeste, 'Não retornou um cpf formatado');

end;

procedure TTestCaseTADString.ToComma_Pode_Retornar_String_Com_Aspas;
var
  stString: TADVString;
  stringEsperada, stringOriginal, stringTeste: string;
begin
  //ambiente
  stringOriginal := 'teste';
  stringEsperada := '''teste''';

  stString.Text := stringOriginal;

  //ação
  stringTeste := stString.ToComma().Text;

  //assertiva
  CheckEquals(stringEsperada, stringTeste, 'Não retornou uma string Maiuscula');

end;

procedure TTestCaseTADString.ToCurrency_Pode_Converter;
var
  stString: TADVString;
  curResultado, curEsperado: Currency;
begin
  //ambiente
  stString.Text := '23,6';
  curEsperado := 23.6;

  //ação
  curResultado := stString.ToCurrency();

  //assertiva
  CheckEquals(curEsperado, curResultado, 'Não consegiu converter para Currency');

end;

procedure TTestCaseTADString.ToCurrency_Pode_Converter_Monetario_Formatado;
var
  stString: TADVString;
  curResultado, curEsperado: Currency;
begin
  //ambiente
  stString.Text := 'R$ 1223,60';
  curEsperado := 1223.60;

  //ação
  curResultado := stString.ToCurrency();

  //assertiva
  CheckEquals(curEsperado, curResultado, 'Não consegiu converter para Currency');

end;

procedure TTestCaseTADString.ToCustomFormat_Pode_Formatar;
var
  stString: TADVString;
  stringResultado, stringTeste, stringEsperada: string;

begin

  //ambiente
  stringTeste := 'FORMATAÇÃO';
  stringEsperada := 'Esse é um teste de FORMATAÇÃO';

  stString.Text := stringTeste;

  //ação
  stringResultado := stString.ToCustomFormat('Esse é um teste de %s').Text;

  //assertiva
  CheckEquals(stringEsperada, stringResultado, 'Não todas as palavres na string');

end;

procedure TTestCaseTADString.ToDateTime_Pode_Converter;
var
  stString: TADVString;
  dtResultado, dtEsperado: TDateTime;
begin
  //ambiente
  stString.Text := '20/02/2016 08:55:03';

  dtEsperado := StrToDateTime('20/02/2016 08:55:03');

  //ação
  dtResultado := stString.ToDateTime();

  //assertiva
  CheckEquals(dtEsperado, dtResultado, 'Não retornou converteu a string para TDateTime');

end;

procedure TTestCaseTADString.ToDate_Pode_Converter;
var
  stString: TADVString;
  dtResultado, dtEsperado: TDateTime;
begin
  //ambiente
  stString.Text := '20/02/2016';

  dtEsperado := StrToDate('20/02/2016');

  //ação
    dtResultado := stString.ToDate();

  //assertiva
  CheckEquals(dtEsperado, dtResultado, 'Não retornou converteu a string para date');

end;

procedure TTestCaseTADString.ToDate_Pode_Converter_DateTime_Para_date;
var
  stString: TADVString;
  dtResultado, dtEsperado: TDateTime;
begin
  //ambiente
  stString.Text := '20/02/2016 08:55:03';

  dtEsperado := StrToDate('20/02/2016');

  //ação
  dtResultado := stString.ToDate();

  //assertiva
  CheckEquals(dtEsperado, dtResultado, 'Não retornou converteu a string para date');

end;

procedure TTestCaseTADString.ToFloat_Pode_Converter;
var
  stString: TADVString;
  flEsperado, flResultado: Double;
begin
  //ambiente
  flEsperado := 115.26;

  stString.Text := '115,26';

  //ação
  flResultado := stString.ToFloat();

  //assertiva
  CheckEquals(flResultado, flEsperado, 'Não retornou Verdadeiro para a string contendo Double');

end;

procedure TTestCaseTADString.ToInt_Pode_Converter;
var
  stString: TADVString;
  flEsperado, flResultado: Double;
begin
  //ambiente
  flEsperado := 115;

  stString.Text := '115';

  //ação
  flResultado := stString.ToInt();

  //assertiva
  CheckEquals(flResultado, flEsperado, 'Não retornou Verdadeiro para a string contendo Inteiro');

end;

procedure TTestCaseTADString.Upper_Pode_Deixar_String_Maiuscula;
var
  stString: TADVString;
  stAux: string;
begin
  //ambiente
  stString.Text := 'teste';

  //ação
  stAux := stString.Upper().Text;

  //assertiva
  CheckEquals('TESTE', stAux, 'Não retornou uma string Maiuscula');

end;

procedure TTestCaseTADString.Wordcount_Pode_Contar_Palavras;
var
  stString: TADVString;
  stringTeste: string;
  total: Integer;
begin

  //ambiente
  stringTeste := ' uma duas tres quatro cinco';

  stString.Text := stringTeste;

  //ação
  total := stString.Wordcount;

  //assertiva
  CheckEquals(5, total, 'Não todas as palavres na string');

end;

procedure TTestCaseTADString.isCNPJ_Nao_Pode_Validar_CNPJ_Invalido;
var
  stString: TADVString;
  blAux: Boolean;
begin
  //ambiente
  stString.Text := 'jose@gmail.com';

  //ação
  blAux := stString.isCNPJ();

  //assertiva
  CheckEquals(false, blAux, 'validou CNPJ inválido');

end;

procedure TTestCaseTADString.isCNPJ_Pode_Validar_CNPJ_Valido;
var
  stString: TADVString;
  blAux: Boolean;
begin
  //ambiente
  stString.Text := '73048256000142';

  //ação
  blAux := stString.isCNPJ();

  //assertiva
  CheckEquals(true, blAux, 'Não validou CNPJ válido');
end;

procedure TTestCaseTADString.isCNPJ_Pode_Validar_CNPJ_Valido_Com_Mascara;
var
  stString: TADVString;
  blAux: Boolean;
begin
  //ambiente
  stString.Text := '73.048.256/0001-42';

  //ação
  blAux := stString.isCNPJ();

  //assertiva
  CheckEquals(true, blAux, 'Não validou CNPJ válido');

end;

procedure TTestCaseTADString.isCPF_Nao_Pode_Validar_CPF_Invalido;
var
  stString: TADVString;
  blAux: Boolean;
begin
  //ambiente
  stString.Text := '123456789';

  //ação
  blAux := stString.isCPF();

  //assertiva
  CheckEquals(false, blAux, 'Não validou  CPF válido');

end;

procedure TTestCaseTADString.isCPF_Pode_Validar_CPF_Valido;
var
  stString: TADVString;
  blAux: Boolean;
begin
  //ambiente
  stString.Text := '21185458433';

  //ação
  blAux := stString.isCPF();

  //assertiva
  CheckEquals(true, blAux, 'Não validou  CPF válido');

end;

procedure TTestCaseTADString.isCPF_Pode_Validar_CPF_Valido_Com_Mascara;
var
  stString: TADVString;
  blAux: Boolean;
begin
  //ambiente
  stString.Text := '211.854.584-33';

  //ação
  blAux := stString.isCPF();

  //assertiva
  CheckEquals(true, blAux, 'Não validou  CPF válido Mascara');

end;

initialization
  TestFramework.RegisterTest(TTestCaseTADString.Suite);

end.

