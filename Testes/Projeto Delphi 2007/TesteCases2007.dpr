program TesteCases2007;


uses
  SysUtils,
  Forms,
  TestFramework in 'dunit-9.3.0\src\TestFramework.pas',
  GUITestRunner in 'dunit-9.3.0\src\GUITestRunner.pas',
  FastMMMemLeakMonitor in 'dunit-9.3.0\src\FastMMMemLeakMonitor.pas',
  TestCaseTADDateTime in '..\Testes\TestCaseTADDateTime.pas',
  TestCaseTADNumeric in '..\Testes\TestCaseTADNumeric.pas',
  TestCaseTADString in '..\Testes\TestCaseTADString.pas',
  untTADVDateTime in '..\..\Fontes\untTADVDateTime.pas',
  untTADVNumeric in '..\..\Fontes\untTADVNumeric.pas',
  untTADVResources in '..\..\Fontes\untTADVResources.pas',
  untTADVString in '..\..\Fontes\untTADVString.pas',
  untTADVSystem in '..\..\Fontes\untTADVSystem.pas';

begin
  try
    { TODO -oUser -cConsole Main : Insert code here }
    Application.Initialize;
    GUITestRunner.RunRegisteredTests;
  except
    on E:Exception do
      Writeln(E.Classname, ': ', E.Message);
  end;
end.
