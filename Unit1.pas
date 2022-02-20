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
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
   grect: trect;
  gold_left: integer;
  rt: trect;
  sname: string;
  gh: thandle;
  x,y,lParamxx:Cardinal;    lp:trect;    pp:tpoint;
implementation

{$R *.dfm}
       function EnumChildWndProc(AhWnd:LongInt;
AlParam:lParam):boolean;stdcall;
var
WndClassName: array[0..254] of Char;
WndCaption: array[0..254] of Char;
begin
GetClassName(AhWnd,wndClassName,254);
GetWindowText(aHwnd,WndCaption,254);
//form1.Memo1.Lines.Add(WndCaption);
if STRING(WndCaption)='XP1' then
                           BEGIN
                                  SendMessage(ahwnd,WM_LBUTTONDOWN,0,0);
                                                    SendMessage(ahwnd,WM_LBUTTONUP,0,0);
                           END else
                           if string(wndcaption)='MPC物品栏' then
                           begin
                              form1.caption:='MPC物品栏';



                      GetClientRect(ahwnd,lp)  ;
                                pp.X:=lp.Left;
                                pp.Y:=lp.Top;
                          //   ClientToScreen(ahwnd,pp)  ;
            //    SetCursorPos(pp.X+20,pp.y+20)

                                          //在非雷区标注问号
              //模拟了鼠标右键的点击事件
              //向 扫雷 窗体的 （xOffset+16*col,yOffset+16*row）处 发送鼠标右键按下的消息
              x:=lp.Left+20;//x坐标，随机产生
              y:=lp.Top+20;//y坐标，随机产生
              lParamxx:=(y shl 16) or x;
              SendMessage(ahwnd, WM_RBUTTONDOWN, 0, lParamxx);
              //向 扫雷 窗体的 （xOffset+16*col,yOffset+16*row）处 发送鼠标右键抬起的消息
              SendMessage(ahwnd, WM_RBUTTONUP, 0, lParamxx);
                           end;

result:=true;
end;
procedure TForm1.FormShow(Sender: TObject);
var
  h: HWnd;
  p: array[0..254] of char;
var
  FPos: tpoint;
var
  lt, rb: tpoint;
  bmp: tbitmap;
  pixel: TPixelFormat;  ss:string;
begin
  gh := 0;
  h := GetWindow(Handle, GW_HWNDFIRST);
  while h <> 0 do
  begin
    if GetWindowText(h, p, 255) > 0 then
    begin

      sname := p;
      ss:='美眉征服';
      if pos( (ss),(sname))>0 then
      begin
        gh := FindWindowEx(h, 0, '#32770', nil);
        if gh <> 0 then
          caption := 'zhaodao';
      end;

    //  Memo1.Lines.Add(p);
    end;
    h := GetWindow(h, GW_HWNDNEXT);
  end;


end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
EnumChildWindows(gh,@EnumChildWndProc,0);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
   EnumChildWindows(gh,@EnumChildWndProc,0);
end;

end.
