unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Timer1: TTimer;
    Label1: TLabel;
    Button1: TButton;
    Timer2: TTimer;
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);

  end;

var
  g_top: thandle;
  Form1: TForm1;
  grect: trect;
  gold_left: integer;
  rt: trect;
  sname: string;
  gh: thandle;
  x, y, lParamxx: Cardinal;
  lp: trect;
  pp: tpoint;

implementation

{$R *.dfm}
function EnumChildWndProc(AhWnd: LongInt; AlParam: lParam): boolean; stdcall;
var
  WndClassName: array[0..254] of Char;
  WndCaption: array[0..254] of Char;
begin
  GetClassName(AhWnd, WndClassName, 254);
  GetWindowText(AhWnd, WndCaption, 254);
  if string(WndCaption) = 'XP1' then    //复活按钮
  begin
    SendMessage(AhWnd, WM_LBUTTONDOWN, 0, 0);
    SendMessage(AhWnd, WM_LBUTTONUP, 0, 0);
  end;

  if string(WndCaption) = 'MPC物品栏' then    // 天石包在背包第一位置 起到捡钱目的
  begin
    GetClientRect(AhWnd, lp);
    pp.X := lp.Left;
    pp.Y := lp.Top;
                          //   ClientToScreen(ahwnd,pp)  ;
            //    SetCursorPos(pp.X+20,pp.y+20)

    x := lp.Left + 20; //x坐标，
    y := lp.Top + 20; //y坐标，
    lParamxx := (y shl 16) or x;     //  高低16位各代表意义
    SendMessage(AhWnd, WM_RBUTTONDOWN, 0, lParamxx);
    SendMessage(AhWnd, WM_RBUTTONUP, 0, lParamxx);
  end;

  result := true;
end;

procedure TForm1.FormShow(Sender: TObject);
var
  h: HWnd;
  p: array[0..254] of char;
  ss: string;
begin
  g_top := 0;
  gh := 0;
  h := GetWindow(Handle, GW_HWNDFIRST);
  while h <> 0 do
  begin
    if GetWindowText(h, p, 255) > 0 then
    begin

      sname := p;
      ss := '美眉征服';
      if pos((ss), (sname)) > 0 then
      begin
        g_top := h;
        gh := FindWindowEx(h, 0, '#32770', nil);
        if gh <> 0 then
          caption := 'zhaodao';
        break;
      end;

    end;
    h := GetWindow(h, GW_HWNDNEXT);
  end;

end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  EnumChildWindows(gh, @EnumChildWndProc, 0);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  EnumChildWindows(gh, @EnumChildWndProc, 0);
end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin
  if g_top <> 0 then          //底部快捷键根据需要设置
  begin
    SetForegroundWindow(g_top);

    keybd_event(VK_F2, 0, 0, 0);
    keybd_event(VK_F2, 0, KEYEVENTF_KEYUP, 0);
  end;

end;

end.

