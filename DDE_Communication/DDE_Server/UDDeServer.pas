unit UDDeServer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DdeMan, Vcl.StdCtrls;

type
  TFmDDeServer = class(TForm)
    edtText: TEdit;
    btnConfirm: TButton;
    DdeServerConv1: TDdeServerConv;
    DDEServerText: TDdeServerItem;
    DDEServerConfirm: TDdeServerItem;
    lbLog: TListBox;
    Label1: TLabel;
    procedure edtTextChange(Sender: TObject);
    procedure btnConfirmClick(Sender: TObject);
    procedure DdeServerConv1ExecuteMacro(Sender: TObject; Msg: TStrings);
    procedure DdeServerConv1Open(Sender: TObject);
    procedure DdeServerConv1Close(Sender: TObject);
    procedure DDEServerTextPokeData(Sender: TObject);
    procedure DDEServerTextChange(Sender: TObject);
  private
    { Private declarations }
    procedure Log(AMessage : string);
  public
    { Public declarations }
  end;

var
  FmDDeServer: TFmDDeServer;

implementation

{$R *.dfm}

procedure TFmDDeServer.btnConfirmClick(Sender: TObject);
begin
  Log('Zmena textu ServerItem komponenty DDEServerConfirm na add');
  DDEServerConfirm.Text := 'add';
end;

procedure TFmDDeServer.DdeServerConv1Close(Sender: TObject);
begin
  Log('Spustena udalost OnClose');
end;

procedure TFmDDeServer.DdeServerConv1ExecuteMacro(Sender: TObject;
  Msg: TStrings);
begin
  // prijeti makra
  Log('Prijato macro s textem ' + Msg[0]);

  if Msg[0] = 'delete' then
  begin
    edtText.Text := '';
  end;
end;

procedure TFmDDeServer.DdeServerConv1Open(Sender: TObject);
begin
  Log('Spustena udalost OnOpen');
end;

procedure TFmDDeServer.DDEServerTextChange(Sender: TObject);
begin
  Log('Zachycena zmena ServerItem komponenty DDEServerText');
end;

procedure TFmDDeServer.DDEServerTextPokeData(Sender: TObject);
begin
  Log('Zachyceno poke data na ServerItem komponente DDEServerText');
  if DDEServerText.Text = 'XXX' then
  edtText.Text := 'XXX';
end;

procedure TFmDDeServer.edtTextChange(Sender: TObject);
begin
  Log('Zmena textu ServerItem komponenty DDEServerConfirm na ' + edtText.Text);
  DDEServerText.Text := edtText.Text;
end;

procedure TFmDDeServer.Log(AMessage: string);
begin
  lbLog.ItemIndex := lbLog.Items.Add('Server: ' + AMessage);
end;

end.
