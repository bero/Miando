program MiandoFmx;

uses
  System.StartUpCopy,
  FMX.Forms,
  Main in 'Main.pas' {MainForm},
  Dirutils in 'Dirutils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
