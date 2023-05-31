object FmDDeServer: TFmDDeServer
  Left = 0
  Top = 0
  Caption = 'SERVER'
  ClientHeight = 443
  ClientWidth = 409
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    409
    443)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 109
    Width = 17
    Height = 13
    Caption = 'Log'
  end
  object edtText: TEdit
    Left = 8
    Top = 16
    Width = 393
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    OnChange = edtTextChange
    ExplicitWidth = 218
  end
  object btnConfirm: TButton
    Left = 40
    Top = 56
    Width = 328
    Height = 25
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Confirm'
    TabOrder = 1
    OnClick = btnConfirmClick
    ExplicitWidth = 153
  end
  object lbLog: TListBox
    Left = 8
    Top = 128
    Width = 393
    Height = 296
    Anchors = [akLeft, akTop, akRight, akBottom]
    ItemHeight = 13
    TabOrder = 2
    ExplicitWidth = 218
    ExplicitHeight = 225
  end
  object DdeServerConv1: TDdeServerConv
    OnOpen = DdeServerConv1Open
    OnClose = DdeServerConv1Close
    OnExecuteMacro = DdeServerConv1ExecuteMacro
    Left = 48
    Top = 232
  end
  object DDEServerText: TDdeServerItem
    ServerConv = DdeServerConv1
    OnChange = DDEServerTextChange
    OnPokeData = DDEServerTextPokeData
    Left = 160
    Top = 232
  end
  object DDEServerConfirm: TDdeServerItem
    ServerConv = DdeServerConv1
    Left = 160
    Top = 304
  end
end
