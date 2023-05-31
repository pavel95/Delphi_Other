program p_DDeClient;

uses
  Vcl.Forms,
  UDDeClient in 'UDDeClient.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
