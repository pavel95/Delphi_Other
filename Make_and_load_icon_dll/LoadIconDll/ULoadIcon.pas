unit ULoadIcon;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  System.ImageList, Vcl.ImgList, Vcl.ExtCtrls;

// *****************************************************************************************************************
// Before using this example, make sure to build the project in MakeIconDll folder to create the necessary DLL file.
// *****************************************************************************************************************
type
  TForm1 = class(TForm)
    btnChooseDll: TButton;
    OpenDialog1: TOpenDialog;
    ImageList1: TImageList;
    Image1: TImage;
    btnDefaultDll: TButton;
    edtIcon: TEdit;
    Label1: TLabel;
    procedure btnChooseDllClick(Sender: TObject);
    procedure btnDefaultDllClick(Sender: TObject);
  private
    { Private declarations }
    FDllPath : string;

    procedure LoadIconFromDll(AFileName : string);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

const
  defaultRelativePath = '..\..\..\MakeIconDll\Win32\Debug\pMakeIconDll.dll';


implementation

{$R *.dfm}

procedure TForm1.btnChooseDllClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    // jestli-ze jsem otevrel dll
    if (AnsiCompareText(ExtractFileExt(OpenDialog1.FileName), '.dll') = 0) then
      LoadIconFromDll(OpenDialog1.FileName);
  end;
end;

procedure TForm1.btnDefaultDllClick(Sender: TObject);
var
  absolutePath : string;
begin
  // Nacte defaultni dll, ktere je kompilovano v projektu pMakeIconDll
  absolutePath := ExpandFileName(defaultRelativePath);
  LoadIconFromDll(absolutePath);
end;

procedure TForm1.LoadIconFromDll(AFileName : string);
var
  helpHandle, iconHandle: THandle;
  icon: TIcon;
begin
  ImageList1.Clear;
  // nastaveni image listu
  ImageList1.Height := 32;
  ImageList1.Width := 32;
  ImageList1.ColorDepth := cd32Bit;

  // Vytazeni ikony z resu v dll
  helpHandle := LoadLibrary(pchar(AFileName));
  iconHandle := LoadIcon(helpHandle, pchar(edtIcon.Text));
  icon := TIcon.Create;
  try
    icon.ReleaseHandle;
    icon.handle := iconHandle;

    ImageList1.AddIcon(icon); // Pridani ikony do omageListu

    Image1.Stretch := true; // roztahne obrazek na celou plochu
    Image1.Proportional := true; // zanecha pomer vysky a sirky
    Image1.Picture.Bitmap := nil; // vymaze predchozi obrazek

    // zkopiruje z ImageListu obrazek do image.. pro zachovani
    // transparentnosti pouzit GetIcon misto GetBitmap
    ImageList1.GetIcon(0, Image1.Picture.icon);
  finally
    FreeAndNil(icon);
  end;
end;

end.
