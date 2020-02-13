{
  Sample: RGBToGray
  Project Git: https://github.com/CarlosHe/OpenCV-Android-Firemonkey

  Author: Carlos Modesto
}

unit Main.View;

interface

uses

  Androidapi.JNI.GraphicsContentViewText, Android.BitmapHelpers,

  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, Android.OpenCV,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects;

type
  TMainView = class(TForm)
    ButtonConvRGBToGray: TButton;
    ImageLenna: TImage;
    procedure ButtonConvRGBToGrayClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainView: TMainView;

implementation

{$R *.fmx}

procedure TMainView.ButtonConvRGBToGrayClick(Sender: TObject);
var
  LSrcMat: JMat;
  LDstMat: JMat;
  LJBitmap: JBitmap;
begin

  // init JMat
  LSrcMat := TJMat.JavaClass.init;
  LDstMat := TJMat.JavaClass.init;

  // init JBitmap
  LJBitmap := TJBitmap.JavaClass.createBitmap(Trunc(ImageLenna.Bitmap.Width),
    Trunc(ImageLenna.Bitmap.Height), TJBitmap_Config.JavaClass.ARGB_8888);

  // convert TBitmap to JBitmap and convert JBitmap to JMat
  TJandroid_Utils.JavaClass.bitmapToMat
    (BitmapToJBitmap(ImageLenna.Bitmap), LSrcMat);

  // convert JMat color - RGB to Gray
  TJImgproc.JavaClass.cvtColor(LSrcMat, LDstMat,
    TJImgproc.JavaClass.COLOR_RGB2GRAY);

  // convert JMat to JBitmap
  TJandroid_Utils.JavaClass.MatToBitmap(LDstMat, LJBitmap);

  // convert JBitmap to TBitmap and copy TBitmap to TImage.Bitmap
  ImageLenna.Bitmap.CopyFromBitmap(JBitmapToBitmap(LJBitmap));

end;

initialization

TJOpenCVLoader.JavaClass.initDebug;

end.
