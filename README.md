"# TADVDelphi" 

[![npm][npm-image]][npm-url] [![license][license-image]][license-url]
[![changelog][changelog-image]][changelog-url]
[![gitter][gitter-image]][gitter-url]


O TADVDelphi é um Framework que cria um tipo de dado mais avançado usando record com procedures e functions.

Talvez você não saiba, mas o tipo record em pascal pode conter em sua estrutura functions e procedures desde o Delphi 2006, Sendo assim nos podemos tirar proveito disso para criar um tipo de dado mais avançado.
Vamos tomar como exemplo o tipo string. O que você consegue fazer com um dado do tipo string? Nada, apenas usar para guardar o seu conteúdo. Qualquer operação que você precise realizar nesse dado terá que usar alguma função externa.
Para contornar isso, O TADVDelphi usa o record para criar um tipo de dado mais avançado.

## Como usar?

Um exemplo usando a TADVString:

declare a untTADVString:
uses untTADVString;


var
  stString: TADVString; //declare o tipo TADVString
  stringTeste: string;
begin
  
  stString.Text := '73048256000142'; 
  stringTeste := stString.ToCNPJCpf().Text;
end  
  
 e o valor de stringTeste sera um cnpf ou cnpj com máscara: '73.048.256/0001-42'
 
 
Um exemplo usando a untTADVNumeric: 

declare a untTADVNumeric:
uses TADVNumeric;

var
  dbDouble: TADVDouble;//declare o tipo TADVDouble
  dbResultado: Double;
begin

  dbDouble.Value := 50.238569;
  dbEsperado := 50.23;

  dbResultado := dbDouble.Trunc(2);
end   

e o valor de dbResultado será 50.23
 

 Um exemplo usando a untTADVDateTime: 
 
 declare a untTADVDateTime:
uses untTADVDateTime;

var
  dtDate: TADVDate;
  dtInicial: TDateTime;
  blEsperado: Boolean;
begin
  
  dtInicial := EncodeDate(2016, 2, 24); //quarta feira

  dtDate.Value := dtInicial;
  
  blResultado := dtDate.isFimDeSemana; 

end; 

e o valor de blResultado sera falso

Isso é só um pedaço do que o framework pode fazer. 

Verifique os testes e o exemplo para mais detalhes.

## Contributing
Você pode contruibuir com esse projeto, basta enviar sua função juntamente com um teste case.

 

