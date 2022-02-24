unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  u_Debug, Dialogs, bitmapdata, Clipbrd, StdCtrls, ExtCtrls, utils;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button5: TButton;
    Timer6: TTimer;
    Button9: TButton;
    Panel1: TPanel;
    procedure Button5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer6Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button9Click(Sender: TObject);
  private
  end;

var
  Form1: TForm1;
  gh: thandle;

var
  rect: trect;
  xwidth, yheight: Integer;

var
  bmp1: TBitmap;
  Bit1: TBDBitmapData;
  panel1_dc, game_dc: HDC;
  compdc: HDC;



implementation

{$R *.dfm}

procedure TForm1.FormShow(Sender: TObject);
var
  h: HWnd;
  p: array[0..254] of char;
  finded: boolean;
  ss, sname: string;
begin
  Bit1 := TBDBitmapData.Create;
  bmp1 := TBitmap.create;
  finded := false;
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
        gh := FindWindowEx(h, 0, '#32770', nil);
        if gh <> 0 then
          finded := true;
        break;
      end;
    end;
    h := GetWindow(h, GW_HWNDNEXT);
  end;
  if finded then
  begin
    caption := '游戏找到';
    GetWindowRect(gh, rect);

    xwidth := rect.Right - rect.Left;
    yheight := rect.Bottom - rect.Top;
    Form1.Width := xwidth + memo1.Width;
    Form1.Height := yheight;

    panel1_dc := GetDC(panel1.Handle);
    game_dc := GetDC(gh);
    compdc := CreateCompatibleDC(panel1_dc);

    bmp1.PixelFormat := pf24bit;
    bmp1.Width := xwidth;
    bmp1.Height := yheight;
  end
  else
    caption := '游戏没找到'

end;

procedure TForm1.Timer6Timer(Sender: TObject);
begin
  Button9Click(Self);

end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Bit1.Free;
  bmp1.Free;
  ReleaseDC(Panel1.Handle, panel1_dc);
  ReleaseDC(gh, game_dc);
  DeleteDC(compdc);
end;

procedure TForm1.Button5Click(Sender: TObject);
var
  x1, y1: Integer;
begin

//  Bit1.LoadFromFile(bmp_path);
  Bit1.LoadFromBitmap(bmp1);
  if Bit1.FindCenterColor($5A8BE4, x1, y1) then
  begin

    begin
      memo1.Lines.Add('天石包位置:' + inttostr(x1) + ' ' + inttostr(y1));
    end;
  end
  else
    Debug.show('--');

end;

procedure TForm1.Button9Click(Sender: TObject);
var
  holdbmp: hgdiobj;
var
  x1, y1: Integer;
begin
  Timer6.Enabled := false;
  BitBlt(bmp1.Canvas.Handle, 0, 0, xwidth, yheight, game_dc, 0, 0, SRCCOPY);

 // hbmp1 := LoadImage(0, bmp_path, IMAGE_BITMAP, 0, 0, LR_LOADFROMFILE);

  holdbmp := SelectObject(compdc, bmp1.Handle);

//  BitBlt(dc, 0, 0, xwidth, yheight, memdc, 0, 0, SRCCOPY);
//     TransparentBlt(dc,0,0,xwidth,yheight,memdc,0,0,xwidth,yheight,RGB(255,255,255));
  TransparentBlt(panel1_dc, 0, 0, xwidth, yheight, compdc, 0, 0, xwidth, yheight, RGB(0, 0, 0));

  SelectObject(compdc, holdbmp);

  Bit1.LoadFromBitmap(bmp1);
  if Bit1.FindCenterColor($5A8BE4, x1, y1) then
    Memo1.Lines.Text := '天石包位置:' + inttostr(x1) + ' ' + inttostr(y1)
  else
    Memo1.Lines.Text := 'no';

  Timer6.Enabled := true;
end;

end.

