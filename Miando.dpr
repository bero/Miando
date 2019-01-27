program Miando;

uses
  Vcl.Forms,
  MainForm in 'MainForm.pas' {MiandoForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMiandoForm, MiandoForm);
  Application.Run;
end.
