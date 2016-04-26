program TesteCasesXE10;

uses
  Forms,
  TestFramework,
  GUITestRunner,
  IWInit,
  IWGlobal,
  untTADVDateTime in '..\..\Fontes\untTADVDateTime.pas',
  untTADVNumeric in '..\..\Fontes\untTADVNumeric.pas',
  untTADVResources in '..\..\Fontes\untTADVResources.pas',
  untTADVString in '..\..\Fontes\untTADVString.pas',
  untTADVSystem in '..\..\Fontes\untTADVSystem.pas' {$R *.res},
  TestCaseTADDateTime in '..\Testes\TestCaseTADDateTime.pas',
  TestCaseTADNumeric in '..\Testes\TestCaseTADNumeric.pas',
  TestCaseTADString in '..\Testes\TestCaseTADString.pas';

{$R *.res}

begin
  //GAppModeInit(Application);
  TGUITestRunner.runRegisteredTests;
end.
