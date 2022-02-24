unit utils;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, bitmapdata, StdCtrls, ExtCtrls;


function IsFileInUse(AName: string): boolean;

implementation

function dlGetDesktopRect(h: thandle; nLeft, nTop, nWidth, nHeight: integer; pixel: TPixelFormat): TBitmap;
var
  dcDesk: hdc;
  bmp: TBitmap;
begin
  bmp := TBitmap.Create;
  bmp.PixelFormat := pixel;
  bmp.Width := nWidth;
  bmp.Height := nHeight;
  dcDesk := GetDC(h);
  BitBlt(bmp.Canvas.Handle, 0, 0, nWidth, nHeight, dcDesk, nLeft, nTop, SRCCOPY);
  result := bmp;
  DeleteDC(dcDesk);
end;

function IsFileInUse(AName: string): boolean;
var
  hFileRes: HFILE;
begin
  Result := False;
  if not FileExists(AName) then
    exit;
  hFileRes := CreateFile(PChar(AName), GENERIC_READ or GENERIC_WRITE, 0, nil, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
  Result := hFileRes = INVALID_HANDLE_VALUE;
  if not Result then
    CloseHandle(hFileRes);
end;

end.

