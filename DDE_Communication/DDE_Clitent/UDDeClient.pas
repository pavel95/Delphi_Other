unit UDDeClient;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DdeMan;

type
  TForm1 = class(TForm)
    lblText: TLabel;
    DdeClientConv1: TDdeClientConv;
    btnConnect: TButton;
    DDEClientText: TDdeClientItem;
    lbText: TListBox;
    DDEClientConfirm: TDdeClientItem;
    btnMacroDelete: TButton;
    btnDisconnect: TButton;
    lbLog: TListBox;
    Label1: TLabel;
    btnPoke: TButton;
    procedure btnConnectClick(Sender: TObject);
    procedure DDEClientTextChange(Sender: TObject);
    procedure DDEClientConfirmChange(Sender: TObject);
    procedure btnMacroDeleteClick(Sender: TObject);
    procedure btnPokeClick(Sender: TObject);
    procedure DdeClientConv1Close(Sender: TObject);
  private
    { Private declarations }
    procedure Log(AMessage : String);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnConnectClick(Sender: TObject);
begin
  // pripojeni k dde serveru

  // Parametry metody SetLink:
  // .. Service: exe cilove aplikace
  // .. Topic: jmeno cilove DDEServerConv komponenty
  if (DdeClientConv1.SetLink('p_DDEServer','DDEServerConv1')) then
  begin
    ShowMessage('Klient: Pripojeno k serveru!');
    // Propojeni TDdeServerItem komponent s TDdeClientItem komponenty
    // .. Kdyz pak nastane zmena v server item komponente, spusti to onChange udalost na klient item komponente
    DDEClientText.DdeItem := 'DDEServerText';
    DDEClientConfirm.DdeItem := 'DDEServerConfirm';


  end;
end;

procedure TForm1.btnMacroDeleteClick(Sender: TObject);
begin
  // .. poslani makra s jednim radkem textu - 'delete'
  if DdeClientConv1.ExecuteMacro('delete', false) then
    Log('Macro uspesne prijato serverem')
  else
    Log('Macro nebylo prijato serverem');
end;

procedure TForm1.btnPokeClick(Sender: TObject);
begin
  DdeClientConv1.PokeData('DDEServerText', 'XXX');
end;

procedure TForm1.DDEClientConfirmChange(Sender: TObject);
begin
  // Zmena v DDEServerConfirm spusti tuto udalost
  Log('Zachycena zmena z DdeClientConfirm <- DdeServerConfirm = ' + DDEClientConfirm.Text);
  // severova strana prida mezeru na konec textu.. potreba otrimovat
  if Trim(DDEClientConfirm.Text) = 'add' then
    lbText.Items.Add(lblText.Caption);
end;

procedure TForm1.DdeClientConv1Close(Sender: TObject);
begin
  Log('Zachycena udalost OnClose');
end;

procedure TForm1.DDEClientTextChange(Sender: TObject);
begin
  Log('Zachycena zmena z DdeClientText <- DdeServerText = ' + DDEClientText.Text);
  // Zmena v DDEServerText spusti tuto udalost
  lblText.Caption := DDEClientText.Text;
end;

procedure TForm1.Log(AMessage: String);
begin
  lbLog.ItemIndex := lbLog.Items.Add('Klient: ' + AMessage)
end;

end.
