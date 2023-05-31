program p_DDeServer;

uses
  Vcl.Forms,
  UDDeServer in 'UDDeServer.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFmDDeServer, FmDDeServer);
  Application.Run;
end.
