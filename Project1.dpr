program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  bitmapdata in 'bitmapdata.pas',
  utils in 'utils.pas',
  u_Debug in 'u_debug.pas';

{$R *.res}

begin
  Application.Initialize;

  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
