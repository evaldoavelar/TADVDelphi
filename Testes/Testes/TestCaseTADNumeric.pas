unit TestCaseTADNumeric;

interface
uses TestFramework, Classes, Math, SysUtils;

type
  //classe de teste da TADVString
  TTestCaseTADNumeric = class(TTestCase)
  private

  published

{$REGION 'TADVDouble'}

    //TADVDouble.Clear
    procedure TADVDouble_Clear_Pode_Inicializar;

    //TADVDouble.TADVDouble.ADD
    procedure TADVDouble_ADD_Pode_Add;
    procedure TADVDouble_ADD_Pode_Add_Negativo;

    //TADVDouble.ADDAsString
    procedure TADVDouble_ADDAsString_Pode_Add;

    //TADVDouble.RoundTo
    procedure TADVDouble_RoundTo_Pode_Arredondar;

    //Trunc
    procedure TADVDouble_Trunc_Pode_Truncar;

    //TADVDouble.CalcProporcao
    procedure TADVDouble_CalcProporcao_Pode_Calcular;

    //TADVDouble.CalcularPercentual
    procedure TADVDouble_CalcularPercentual_Pode_Calcular;

    //TADVDouble.SubtrairPercentual
    procedure TADVDouble_SubtrairPercentual_Pode_Calucular;

    //TADVDouble.Dec
    procedure TADVDouble_Dec_Pode_Diminuir_Valor;

    //TADVDouble.Inc
    procedure TADVDouble_Inc_Pode_Aumentar_Valor;

    //TADVDouble.Sub
    procedure TADVDouble_Sub_Pode_Subtrair_Valor;

    //TADVDouble.Eval
    procedure TADVDouble_Eval_Pode_Converter;

    //TADVDouble.Formatar
    procedure TADVDouble_Formatar_Pode_Formatar;

    //ToExtenco
    procedure TADVDouble_ToExtenco_Pode_Converter;

    //ToExtencoReais
    procedure TADVDouble_ToExtencoReais_Pode_Converter;

    //ToReias
    procedure TADVDouble_ToReias_Pode_Converter;

    //ToSqlServerFormat
    procedure TADVDouble_ToSqlServerFormat_Pode_Converter;

    //ToString
    procedure TADVDouble_ToString_Pode_Converter;

{$ENDREGION}
{$REGION  'TADVInteger'}

    //TADVInteger.ADD
    procedure TADVInteger_ADD_Pode_Adicionar;

    //TADVInteger.Clear
    procedure ADVInteger_Clear_Pode_Inicializar;

    //TADVInteger.Dec
    procedure ADVInteger_Dec_Pode_Decrementar;

    //TADVInteger.Inc
    procedure ADVInteger_Inc_Pode_Incrementar;

    //TADVInteger.NextValue
    procedure ADVInteger_NextValue_Pode_Retornar;

    //TADVInteger.PriorValue
    procedure DVInteger_PriorValue_Pode_Retornar;

    //TADVInteger.ToExtenco
    procedure DVInteger_ToExtenco_Pode_Retornar;

    //TADVInteger.ToString
    procedure DVInteger_ToString_Pode_Retornar;

    //TADVInteger.CalcProporcao
    procedure DVInteger_CalcProporcao_Pode_Retornar;

    //TADVInteger.CalcularPercentual
    procedure DVInteger_CalcularPercentual_Pode_Retornar;

{$ENDREGION}
{$REGION  'TIntegerList'}

    //TIntegerList.Add
    procedure TIntegerList_Add_Pode_Adicionar_Para_A_Lista;

    //TIntegerList.AddIntegers
    procedure TIntegerList_AddIntegers_Pode_Adicionar_Para_A_Lista;

    //TIntegerList.Clear
    procedure TIntegerList_Clear_Pode_Resetar_A_Lista;

    //TIntegerList.Delete
    procedure TIntegerList_Delete_Pode_Remover_da_Lista;

    //TIntegerList.Equals
    procedure TIntegerList_Equals_Pode_Compara_A_Lista;

    //TIntegerList.IndexOf
    procedure TIntegerList_IndexOf_Pode_Retornar;

    //TIntegerList.Insert
    procedure TIntegerList_Insert_Pode_Inserir;

    //TIntegerList.Move
    procedure TIntegerList_Move_Pode_Mover;

{$ENDREGION}

  end;

implementation

uses untTADVNumeric;

{ TTestCaseTADNumeric }

procedure TTestCaseTADNumeric.ADVInteger_Clear_Pode_Inicializar;
var
  dbInteger: TADVInteger;
  dbEsperado, flResultado: Integer;
begin

  //ambiente
  dbInteger.Value := 50;
  dbEsperado := 0;

  //a��o
  dbInteger.Clear;
  flResultado := dbInteger.Value;

  //assertiva
  CheckTrue(CompareValue(flResultado, dbEsperado) = 0, 'N�o inicializou corretamente ');

end;

procedure TTestCaseTADNumeric.TADVInteger_ADD_Pode_Adicionar;
var
  dbInteger: TADVInteger;
  dbEsperado, flResultado: Integer;
begin
  //ambiente
  dbEsperado := 23 + 50;
  dbInteger.Value := 23;

  //a��o
  dbInteger.ADD(50);

  flResultado := dbInteger.Value;

  //assertiva
  CheckTrue(CompareValue(flResultado, dbEsperado) = 0, 'N�o adicionou o valor');

end;

procedure TTestCaseTADNumeric.ADVInteger_Dec_Pode_Decrementar;
var
  dbInteger: TADVInteger;
  dbEsperado, flResultado: Integer;
begin

  //ambiente
  dbInteger.Value := 50;
  dbEsperado := 49;

  //a��o
  dbInteger.Dec;
  flResultado := dbInteger.Value;

  //assertiva
  CheckTrue(CompareValue(flResultado, dbEsperado) = 0, 'N�o decrementou corretamente ');

end;

procedure TTestCaseTADNumeric.ADVInteger_Inc_Pode_Incrementar;
var
  dbInteger: TADVInteger;
  dbEsperado, flResultado: Integer;
begin

  //ambiente
  dbInteger.Value := 50;
  dbEsperado := 51;

  //a��o
  dbInteger.Inc;
  flResultado := dbInteger.Value;

  //assertiva
  CheckTrue(CompareValue(flResultado, dbEsperado) = 0, 'N�o incrementou corretamente ');

end;

procedure TTestCaseTADNumeric.ADVInteger_NextValue_Pode_Retornar;
var
  dbInteger: TADVInteger;
  dbEsperado, flResultado: Integer;
begin

  //ambiente
  dbInteger.Value := 50;
  dbEsperado := 51;

  //a��o
  flResultado := dbInteger.NextValue;

  //assertiva
  CheckTrue(CompareValue(flResultado, dbEsperado) = 0, 'N�o retornou corretamente ');
  CheckTrue(CompareValue(50, dbInteger.Value) = 0, 'N�o pode alterar o valor');

end;

procedure TTestCaseTADNumeric.DVInteger_CalcProporcao_Pode_Retornar;
var
  dbInteger: TADVInteger;
  dbEsperado, flResultado: Double;
begin

  //ambiente
  dbInteger.Value := 25; // o valor � 25

  dbEsperado := 2.5; //quantos por cento � 25 de 1000

  //a��o
  flResultado := dbInteger.CalcProporcao(1000);

  //assertiva
  CheckTrue(CompareValue(flResultado, dbEsperado) = 0, 'N�o calculou propor��o corretamente ');

end;

procedure TTestCaseTADNumeric.DVInteger_CalcularPercentual_Pode_Retornar;
var
  dbInteger: TADVInteger;
  dbEsperado, flResultado: Double;
begin

  //ambiente
  dbInteger.Value := 1000; // o valor total
  dbEsperado := 250; //calcular 25% de mil

  //a��o
  flResultado := dbInteger.CalPercentual(25);

  //assertiva
  CheckTrue(CompareValue(flResultado, dbEsperado) = 0, 'N�o calculou Percentual corretamente ')

end;

procedure TTestCaseTADNumeric.DVInteger_PriorValue_Pode_Retornar;
var
  dbInteger: TADVInteger;
  dbEsperado, flResultado: Integer;
begin

  //ambiente
  dbInteger.Value := 50;
  dbEsperado := 49;

  //a��o
  flResultado := dbInteger.PriorValue;

  //assertiva
  CheckTrue(CompareValue(flResultado, dbEsperado) = 0, 'N�o retornou corretamente ');
  CheckTrue(CompareValue(50, dbInteger.Value) = 0, 'N�o pode alterar o valor');

end;

procedure TTestCaseTADNumeric.DVInteger_ToExtenco_Pode_Retornar;
var
  dbInteger: TADVInteger;
  stResultado, stEsperado: string;
begin
  //ambiente
  dbInteger.Value := 1613;
  stEsperado := 'Um Mil  e Seiscentos e Treze';

  //a��o
  stResultado := dbInteger.ToExtenco.Text;

  //assertiva
  CheckEquals(stEsperado, stResultado, 'N�o consegiu escrever em exten�o corretamente');

end;

procedure TTestCaseTADNumeric.DVInteger_ToString_Pode_Retornar;
var
  dbInteger: TADVInteger;
  stResultado, stEsperado: string;
begin
  //ambiente
  dbInteger.Value := 1613;
  stEsperado := '1613';

  //a��o
  stResultado := dbInteger.ToString.Text;

  //assertiva
  CheckEquals(stEsperado, stResultado, 'N�o consegiu converter corretamente');

end;

procedure TTestCaseTADNumeric.TADVDouble_ADDAsString_Pode_Add;
var
  dbDouble: TADVDouble;
  dbEsperado, flResultado: Double;
begin
  //ambiente
  dbEsperado := 23.6 + 50.2385;
  dbDouble.Value := 23.6;

  //a��o
  dbDouble.ADDAsString('50.2385');
  flResultado := dbDouble.Value;

  //assertiva
  CheckTrue(CompareValue(flResultado, dbEsperado) = 0, 'N�o adicionou o valor');

end;

procedure TTestCaseTADNumeric.TADVDouble_ADD_Pode_Add;
var
  dbDouble: TADVDouble;
  dbEsperado, flResultado: Double;
begin
  //ambiente
  dbEsperado := 23.6 + 50.2385;
  dbDouble.Value := 23.6;

  //a��o
  dbDouble.ADD(50.2385);

  flResultado := dbDouble.Value;

  //assertiva
  CheckTrue(CompareValue(flResultado, dbEsperado) = 0, 'N�o adicionou o valor');

end;

procedure TTestCaseTADNumeric.TADVDouble_ADD_Pode_Add_Negativo;
var
  dbDouble: TADVDouble;
  dbEsperado, flResultado: Double;
begin
  //ambiente
  dbEsperado := 153.6 - 50.2385;
  dbDouble.Value := 153.6;

  //a��o
  dbDouble.ADD(-50.2385);
  flResultado := dbDouble.Value;

  //assertiva
  CheckTrue(CompareValue(flResultado, dbEsperado) = 0, 'N�o adicionou numero negativo ');

end;

procedure TTestCaseTADNumeric.TADVDouble_CalcProporcao_Pode_Calcular;
var
  dbDouble: TADVDouble;
  dbEsperado, flResultado: Double;
begin

  //ambiente
  dbDouble.Value := 25; // o valor � 25

  dbEsperado := 2.5; //quantos por cento � 25 de 1000

  //a��o
  flResultado := dbDouble.CalcProporcao(1000);

  //assertiva
  CheckTrue(CompareValue(flResultado, dbEsperado) = 0, 'N�o calculou propor��o corretamente ');

end;

procedure TTestCaseTADNumeric.TADVDouble_CalcularPercentual_Pode_Calcular;
var
  dbDouble: TADVDouble;
  dbEsperado, flResultado: Double;
begin

  //ambiente
  dbDouble.Value := 1000; // o valor total
  dbEsperado := 250; //calcular 25% de mil

  //a��o
  flResultado := dbDouble.CalPercentual(25);

  //assertiva
  CheckTrue(CompareValue(flResultado, dbEsperado) = 0, 'N�o calculou Percentual corretamente ');

end;

procedure TTestCaseTADNumeric.TADVDouble_Clear_Pode_Inicializar;
var
  dbDouble: TADVDouble;
  dbEsperado, flResultado: Double;
begin

  //ambiente
  dbDouble.Value := 50.238569;
  dbEsperado := 0;

  //a��o
  dbDouble.Clear;
  flResultado := dbDouble.Value;

  //assertiva
  CheckTrue(CompareValue(flResultado, dbEsperado) = 0, 'N�o inicializou corretamente ');

end;

procedure TTestCaseTADNumeric.TADVDouble_Dec_Pode_Diminuir_Valor;
var
  dbDouble: TADVDouble;
  dbEsperado, flResultado: Double;
begin

  //ambiente
  dbDouble.Value := 50;
  dbEsperado := 49;

  //a��o
  dbDouble.Dec;
  flResultado := dbDouble.Value;

  //assertiva
  CheckTrue(CompareValue(flResultado, dbEsperado) = 0, 'N�o diminuiu corretamente ');

end;

procedure TTestCaseTADNumeric.TADVDouble_Eval_Pode_Converter;
var
  dbDouble: TADVDouble;
  dbEsperado, flResultado: Double;
begin

  //ambiente
  dbDouble.Clear;
  dbEsperado := 50.238569;

  //a��o
  dbDouble.Eval('50,238569');
  flResultado := dbDouble.Value;

  //assertiva
  CheckTrue(CompareValue(flResultado, dbEsperado) = 0, 'N�o Converteu corretamente ');

end;

procedure TTestCaseTADNumeric.TADVDouble_Formatar_Pode_Formatar;
var
  dbDouble: TADVDouble;
  stResultado, stEsperado: string;
begin
  //ambiente
  dbDouble.Value := 1223.60;
  stEsperado := 'R$ 1.223,60';

  //a��o
  stResultado := dbDouble.Formatar('R$ 0.,00').Text;

  //assertiva
  CheckEquals(stEsperado, stResultado, 'N�o consegiu formatar corretamente');

end;

procedure TTestCaseTADNumeric.TADVDouble_Inc_Pode_Aumentar_Valor;
var
  dbDouble: TADVDouble;
  dbEsperado, flResultado: Double;
begin

  //ambiente
  dbDouble.Value := 50;
  dbEsperado := 51;

  //a��o
  dbDouble.Inc;
  flResultado := dbDouble.Value;

  //assertiva
  CheckTrue(CompareValue(flResultado, dbEsperado) = 0, 'N�o arredondou corretamente ');

end;

procedure TTestCaseTADNumeric.TADVDouble_RoundTo_Pode_Arredondar;
var
  dbDouble: TADVDouble;
  dbEsperado, flResultado: Double;
begin

  //ambiente
  dbDouble.Value := 50.238569;
  dbEsperado := 50.24;

  //a��o
  flResultado := dbDouble.RoundTo(2);

  //assertiva
  CheckTrue(CompareValue(flResultado, dbEsperado) = 0, 'N�o arredondou corretamente ');

end;

procedure TTestCaseTADNumeric.TADVDouble_SubtrairPercentual_Pode_Calucular;
var
  dbDouble: TADVDouble;
  dbEsperado, flResultado: Double;
begin

  //ambiente
  dbDouble.Value := 1000; // o valor total
  dbEsperado := 750; //subtrair 25% de mil

  //a��o
  dbDouble.SubtrairPercentual(25.0);
  flResultado := dbDouble.Value;

  //assertiva
  CheckTrue(CompareValue(flResultado, dbEsperado) = 0, 'N�o Subtraiu Percentual corretamente ');

end;

procedure TTestCaseTADNumeric.TADVDouble_Sub_Pode_Subtrair_Valor;
var
  dbDouble: TADVDouble;
  dbEsperado, flResultado: Double;
begin

  //ambiente
  dbDouble.Value := 50.2568;
  dbEsperado := 19.6026;

  //a��o
  dbDouble.Sub(30.6542);
  flResultado := dbDouble.Value;

  //assertiva
  CheckTrue(CompareValue(flResultado, dbEsperado) = 0, 'N�o Subtraiu corretamente ');

end;

procedure TTestCaseTADNumeric.TADVDouble_ToExtencoReais_Pode_Converter;
var
  dbDouble: TADVDouble;
  stResultado, stEsperado: string;
begin
  //ambiente
  dbDouble.Value := 1613.60;
  stEsperado := 'Um Mil Seiscentos e Treze Reais e Sessenta Centavos.';

  //a��o
  stResultado := dbDouble.ToExtencoReais.Text;

  //assertiva
  CheckEquals(stEsperado, stResultado, 'N�o consegiu escrever em exten�o corretamente');

end;

procedure TTestCaseTADNumeric.TADVDouble_ToExtenco_Pode_Converter;
var
  dbDouble: TADVDouble;
  stResultado, stEsperado: string;
begin
  //ambiente
  dbDouble.Value := 1613.60;
  stEsperado := 'Um Mil Seiscentos e Treze e Sessenta';

  //a��o
  stResultado := dbDouble.ToExtenco.Text;

  //assertiva
  CheckEquals(stEsperado, stResultado, 'N�o consegiu escrever em exten�o corretamente');

end;

procedure TTestCaseTADNumeric.TADVDouble_ToReias_Pode_Converter;
var
  dbDouble: TADVDouble;
  stResultado, stEsperado: string;
begin
  //ambiente
  dbDouble.Value := 1613.60;
  stEsperado := 'R$ 1.613,60';

  //a��o
  stResultado := dbDouble.ToReias.Text;

  //assertiva
  CheckEquals(stEsperado, stResultado, 'N�o consegiu converter corretamente');

end;

procedure TTestCaseTADNumeric.TADVDouble_ToSqlServerFormat_Pode_Converter;
var
  dbDouble: TADVDouble;
  stResultado, stEsperado: string;
begin
  //ambiente
  dbDouble.Value := 1613.60;
  stEsperado := '1613.6';

  //a��o
  stResultado := dbDouble.ToSqlServerFormat.Text;

  //assertiva
  CheckEquals(stEsperado, stResultado, 'N�o consegiu converter corretamente');

end;

procedure TTestCaseTADNumeric.TADVDouble_ToString_Pode_Converter;
var
  dbDouble: TADVDouble;
  stResultado, stEsperado: string;
begin
  //ambiente
  dbDouble.Value := 1613.60;
  stEsperado := '1613,6';

  //a��o
  stResultado := dbDouble.ToString.Text;

  //assertiva
  CheckEquals(stEsperado, stResultado, 'N�o consegiu converter corretamente');

end;

procedure TTestCaseTADNumeric.TADVDouble_Trunc_Pode_Truncar;
var
  dbDouble: TADVDouble;
  dbEsperado, flResultado: Double;
begin

  //ambiente
  dbDouble.Value := 50.238569;
  dbEsperado := 50.23;

  //a��o
  flResultado := dbDouble.Trunc(2);

  //assertiva
  CheckTrue(CompareValue(flResultado, dbEsperado) = 0, 'N�o truncou corretamente ');

end;

procedure TTestCaseTADNumeric.TIntegerList_AddIntegers_Pode_Adicionar_Para_A_Lista;
var
  list1: TIntegerList;
  list2: TIntegerList;
begin

  //ambiente
  list1 := TIntegerList.Create;
  list2 := TIntegerList.Create;

  //a��o
  list1.Add(1);
  list1.Add(2);
  list1.Add(3);

  list2.Add(4);
  list2.Add(5);
  list2.Add(6);

  list1.AddIntegers(list2);

  //assertiva
  CheckEquals(6, list1.Count, 'N�o adicionou todos os numeros a lista');
  CheckEquals(1, list1[0], 'N�o adicionou o numero a lista');
  CheckEquals(2, list1[1], 'N�o adicionou o numero a lista');
  CheckEquals(3, list1[2], 'N�o adicionou o numero a lista');
  CheckEquals(4, list1[3], 'N�o adicionou o numero a lista');
  CheckEquals(5, list1[4], 'N�o adicionou o numero a lista');
  CheckEquals(6, list1[5], 'N�o adicionou o numero a lista');

  FreeAndNil(list1);

  CheckNull(list1, 'N�o liberou o objeto da memoria');

end;

procedure TTestCaseTADNumeric.TIntegerList_Add_Pode_Adicionar_Para_A_Lista;
var
  list: TIntegerList;
begin

  //ambiente
  list := TIntegerList.Create;

  //a��o
  list.Add(1);
  list.Add(2);
  list.Add(3);

  //assertiva
  CheckEquals(3, list.Count, 'N�o adicionou todos os numeros a lista');
  CheckEquals(1, list[0], 'N�o adicionou o numero a lista');
  CheckEquals(2, list[1], 'N�o adicionou o numero a lista');
  CheckEquals(3, list[2], 'N�o adicionou o numero a lista');

  FreeAndNil(list);

  CheckNull(list, 'N�o liberou o objeto da memoria');

end;


procedure TTestCaseTADNumeric.TIntegerList_Clear_Pode_Resetar_A_Lista;
var
  list1: TIntegerList;
begin

  //ambiente
  list1 := TIntegerList.Create;
  list1.Add(1);
  list1.Add(2);
  list1.Add(3);

  CheckEquals(3, list1.Count, 'N�o adicionou todos os numeros a lista');


  //a��o
  list1.Clear;

  //assertiva
  CheckEquals(0, list1.Count, 'N�o resetou a lista');

  FreeAndNil(list1);

  CheckNull(list1, 'N�o liberou o objeto da memoria');

end;

procedure TTestCaseTADNumeric.TIntegerList_Delete_Pode_Remover_da_Lista;
var
  list1: TIntegerList;
begin

  //ambiente
  list1 := TIntegerList.Create;
  list1.Add(1);
  list1.Add(2);
  list1.Add(3);
  CheckEquals(3, list1.Count, 'N�o adicionou todos os numeros a lista');

  //a��o
  list1.Delete(1); //deletar o numero 2 que est� no indice 1

  //assertiva
  CheckEquals(2, list1.Count, 'N�o removeu o numero da lista');
  CheckEquals(3, list1[1], 'N�o removeu o numero da lista');

  FreeAndNil(list1);

  CheckNull(list1, 'N�o liberou o objeto da memoria');

end;

procedure TTestCaseTADNumeric.TIntegerList_Equals_Pode_Compara_A_Lista;
var
  list1: TIntegerList;
  list2: TIntegerList;
  blResultado: Boolean;
begin

  //ambiente
  list1 := TIntegerList.Create;
  list2 := TIntegerList.Create;

  list1.Add(1);
  list1.Add(2);
  list1.Add(3);

  list2.Add(1);
  list2.Add(2);
  list2.Add(3);


  //a��o
  blResultado := list1.Equals(list2);

  //assertiva
  CheckEquals(list2.Count, list1.Count, 'As lista n�o tem o mesmo numero de elementos');
  CheckEquals(true,blResultado, 'N�o retornou corretamente ');
  CheckEquals(list1[0], list2[0], 'lista est�o diferentes');
  CheckEquals(list1[1], list2[1], 'lista est�o diferentes');
  CheckEquals(list1[2], list2[2], 'lista est�o diferentes');

  FreeAndNil(list1);

  CheckNull(list1, 'N�o liberou o objeto da memoria');


end;

procedure TTestCaseTADNumeric.TIntegerList_IndexOf_Pode_Retornar;
var
  list1: TIntegerList;
  inEsperado:Integer;
begin

  //ambiente
  list1 := TIntegerList.Create;
  list1.Add(1);
  list1.Add(2);
  list1.Add(3);

  //a��o
  inEsperado := list1.IndexOf(2); //encontrar a posi��o do numero 2 que est� no indice 1

  //assertiva
  CheckEquals(1, inEsperado, 'N�o encontrou a posi��o do numero 2');

  FreeAndNil(list1);

  CheckNull(list1, 'N�o liberou o objeto da memoria');

end;

procedure TTestCaseTADNumeric.TIntegerList_Insert_Pode_Inserir;
var
  list1: TIntegerList;
  inEsperado:Integer;
begin

  //ambiente
  list1 := TIntegerList.Create;
  list1.Add(1);
  list1.Add(2);
  list1.Add(3);

  //a��o
  list1.Insert(1,4);

  //assertiva
  CheckEquals(4, list1.Count, 'As lista n�o tem o mesmo numero de elementos');

  CheckEquals(1, list1[0], 'elemento n�o encontrado na lista');
  CheckEquals(4, list1[1], 'elemento n�o encontrado na lista');
  CheckEquals(2, list1[2], 'elemento n�o encontrado na lista');
  CheckEquals(3, list1[3], 'elemento n�o encontrado na lista');

  FreeAndNil(list1);

  CheckNull(list1, 'N�o liberou o objeto da memoria');

end;

procedure TTestCaseTADNumeric.TIntegerList_Move_Pode_Mover;
var
  list1: TIntegerList;
  inEsperado:Integer;
begin

  //ambiente
  list1 := TIntegerList.Create;
  list1.Add(1);
  list1.Add(2);
  list1.Add(3);


  //a��o
  list1.Move(1,2);//trocar dos numeros 2 e 3

  //assertiva
  CheckEquals(3, list1.Count, 'As lista n�o tem o mesmo numero de elementos');

  CheckEquals(1, list1[0], 'elemento n�o encontrado na lista');
  CheckEquals(3, list1[1], 'elemento n�o encontrado na lista');
  CheckEquals(2, list1[2], 'elemento n�o encontrado na lista');

  FreeAndNil(list1);

  CheckNull(list1, 'N�o liberou o objeto da memoria');

end;

initialization
  TestFramework.RegisterTest(TTestCaseTADNumeric.Suite);

end.

