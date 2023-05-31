object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'KLIENT'
  ClientHeight = 625
  ClientWidth = 464
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    464
    625)
  PixelsPerInch = 96
  TextHeight = 13
  object lblText: TLabel
    Left = 32
    Top = 24
    Width = 32
    Height = 13
    Caption = 'lblText'
  end
  object Label1: TLabel
    Left = 32
    Top = 349
    Width = 17
    Height = 13
    Caption = 'Log'
  end
  object btnConnect: TButton
    Left = 32
    Top = 287
    Width = 406
    Height = 25
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Connect'
    TabOrder = 0
    OnClick = btnConnectClick
  end
  object lbText: TListBox
    Left = 32
    Top = 43
    Width = 406
    Height = 158
    Anchors = [akLeft, akTop, akRight]
    ItemHeight = 13
    TabOrder = 1
  end
  object btnMacroDelete: TButton
    Left = 32
    Top = 207
    Width = 406
    Height = 25
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Send Macro: Delete'
    TabOrder = 2
    OnClick = btnMacroDeleteClick
  end
  object btnDisconnect: TButton
    Left = 32
    Top = 318
    Width = 406
    Height = 25
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Disconnect'
    TabOrder = 3
  end
  object lbLog: TListBox
    Left = 32
    Top = 368
    Width = 406
    Height = 241
    Anchors = [akLeft, akTop, akRight, akBottom]
    ItemHeight = 13
    TabOrder = 4
  end
  object btnPoke: TButton
    Left = 32
    Top = 238
    Width = 406
    Height = 25
    Caption = 'Poke: XXX'
    TabOrder = 5
    OnClick = btnPokeClick
  end
  object DdeClientConv1: TDdeClientConv
    OnClose = DdeClientConv1Close
    Left = 48
    Top = 232
  end
  object DDEClientText: TDdeClientItem
    DdeConv = DdeClientConv1
    OnChange = DDEClientTextChange
    Left = 168
    Top = 232
  end
  object DDEClientConfirm: TDdeClientItem
    DdeConv = DdeClientConv1
    OnChange = DDEClientConfirmChange
    Left = 168
    Top = 288
  end
end
