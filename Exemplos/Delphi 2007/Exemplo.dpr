program Exemplo;

uses
  Forms,
  untExemplo in 'untExemplo.pas' {frmPrincipal},
  untTADVDateTime in '..\..\Fontes\untTADVDateTime.pas',
  untTADVNumeric in '..\..\Fontes\untTADVNumeric.pas',
  untTADVResources in '..\..\Fontes\untTADVResources.pas',
  untTADVString in '..\..\Fontes\untTADVString.pas',
  untTADVSystem in '..\..\Fontes\untTADVSystem.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
