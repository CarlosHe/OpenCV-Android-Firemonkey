{
  Helper: AndroidBitmapHelpers
  Project Git: https://github.com/CarlosHe/OpenCV-Android-Firemonkey

  Author: Carlos Modesto
}

unit Android.BitmapHelpers;

interface

uses
  FMX.Surfaces, FMX.Graphics, FMX.Helpers.Android,
  Androidapi.JNI.GraphicsContentViewText;

function BitmapToJBitmap(const ABitmap: TBitmap): JBitmap;
function JBitmapToBitmap(const ABitmap: JBitmap): TBitmap;

implementation

function BitmapToJBitmap(const ABitmap: TBitmap): JBitmap;
var
  LSurface: TBitmapSurface;
begin
  if not Assigned(Result) then
    Result := TJBitmap.JavaClass.createBitmap(ABitmap.Width, ABitmap.Height,
      TJBitmap_Config.JavaClass.ARGB_8888);
  LSurface := TBitmapSurface.Create;
  try
    LSurface.Assign(ABitmap);
    SurfaceToJBitmap(LSurface, Result);
  finally
    LSurface.Free;
  end;
end;

function JBitmapToBitmap(const ABitmap: JBitmap): TBitmap;
var
  LSurface: TBitmapSurface;
begin
  if not Assigned(Result) then
    Result := TBitmap.Create;
  Result.Width := ABitmap.getWidth;
  Result.Height := ABitmap.getHeight;
  LSurface := TBitmapSurface.Create;
  try
    JBitmapToSurface(ABitmap, LSurface);
    Result.Assign(LSurface);
  finally
    LSurface.Free;
  end;
end;

end.
