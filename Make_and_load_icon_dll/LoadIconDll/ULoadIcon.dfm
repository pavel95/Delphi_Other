object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 128
  ClientWidth = 234
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 184
    Top = 16
    Width = 32
    Height = 32
  end
  object Label1: TLabel
    Left = 16
    Top = 96
    Width = 21
    Height = 13
    Caption = 'Icon'
  end
  object btnChooseDll: TButton
    Left = 8
    Top = 54
    Width = 153
    Height = 32
    Caption = 'Choose DLL'
    TabOrder = 0
    OnClick = btnChooseDllClick
  end
  object btnDefaultDll: TButton
    Left = 8
    Top = 16
    Width = 153
    Height = 32
    Caption = 'Load Default DLL'
    TabOrder = 1
    OnClick = btnDefaultDllClick
  end
  object edtIcon: TEdit
    Left = 43
    Top = 92
    Width = 118
    Height = 21
    TabOrder = 2
    Text = 'L_ADD'
  end
  object OpenDialog1: TOpenDialog
    Left = 152
    Top = 48
  end
  object ImageList1: TImageList
    ColorDepth = cd32Bit
    Left = 192
    Top = 48
  end
end
