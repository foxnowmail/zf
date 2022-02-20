object Form1: TForm1
  Left = 192
  Top = 131
  Width = 376
  Height = 261
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 136
    Top = 64
    Width = 96
    Height = 29
    Caption = #27515#20129#22238#22478
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Button1: TButton
    Left = 88
    Top = 120
    Width = 139
    Height = 25
    Caption = #27979#35797#29289#21697#26639#25171#24320#22825#30707#21253
    TabOrder = 0
    OnClick = Button1Click
  end
  object Timer1: TTimer
    Interval = 90000
    OnTimer = Timer1Timer
    Left = 264
    Top = 88
  end
end
