object Form1: TForm1
  Left = 257
  Top = 93
  Width = 1607
  Height = 895
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 113
    Height = 856
    Align = alLeft
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
  end
  object Button5: TButton
    Left = 256
    Top = 584
    Width = 75
    Height = 25
    Caption = 'Button5'
    TabOrder = 1
    Visible = False
    OnClick = Button5Click
  end
  object Button9: TButton
    Left = 352
    Top = 56
    Width = 75
    Height = 25
    Caption = 'Button9'
    TabOrder = 2
    Visible = False
    OnClick = Button9Click
  end
  object Panel1: TPanel
    Left = 113
    Top = 0
    Width = 1478
    Height = 856
    Align = alClient
    Caption = 'Panel1'
    TabOrder = 3
  end
  object Timer6: TTimer
    Interval = 60
    OnTimer = Timer6Timer
    Left = 272
    Top = 672
  end
end
