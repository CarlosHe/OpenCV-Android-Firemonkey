{
  Sample: Contours
  Project Git: https://github.com/CarlosHe/OpenCV-Android-Firemonkey

  Author: Carlos Modesto
}

unit Main.View;

interface

uses

  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.JavaTypes,
  Android.BitmapHelpers,
  System.Permissions,
  Androidapi.Helpers,
  Androidapi.JNI.Os,
  FMX.DialogService,
  System.Threading,

  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, Android.OpenCV,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Media;

type
  TMainView = class(TForm)
    ButtonConvRGBToGray: TButton;
    ImageCam: TImage;
    Camera: TCameraComponent;
    procedure ButtonConvRGBToGrayClick(Sender: TObject);
    procedure CameraSampleBufferReady(Sender: TObject; const ATime: TMediaTime);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FOpenCVInProgress: boolean;
    FCamBitmap: TBitmap;
    procedure ParseBitmap;
    procedure DisplayRationale(Sender: TObject;
      const APermissions: TArray<string>; const APostRationaleProc: TProc);

    procedure TakePicturePermissionRequestResult(Sender: TObject;
      const APermissions: TArray<string>;
      const AGrantResults: TArray<TPermissionStatus>);
  public
    { Public declarations }
  end;

var
  MainView: TMainView;

implementation

{$R *.fmx}

procedure TMainView.ButtonConvRGBToGrayClick(Sender: TObject);
begin

  PermissionsService.RequestPermissions
    ([JStringToString(TJManifest_permission.JavaClass.Camera)],
    TakePicturePermissionRequestResult, DisplayRationale);

end;

procedure TMainView.CameraSampleBufferReady(Sender: TObject;
  const ATime: TMediaTime);
begin
  TThread.Synchronize(TThread.CurrentThread, ParseBitmap);
end;

procedure TMainView.DisplayRationale(Sender: TObject;
  const APermissions: TArray<string>; const APostRationaleProc: TProc);
var
  I: Integer;
  RationaleMsg: string;
begin
  for I := 0 to High(APermissions) do
  begin
    if APermissions[I] = JStringToString(TJManifest_permission.JavaClass.Camera)
    then
      RationaleMsg := RationaleMsg + 'The app needs to access the camera'
  end;
  TDialogService.ShowMessage(RationaleMsg,
    procedure(const AResult: TModalResult)
    begin
      APostRationaleProc;
    end)
end;

procedure TMainView.FormCreate(Sender: TObject);
begin
  FCamBitmap := TBitmap.Create(Trunc(ImageCam.Width), Trunc(ImageCam.Height));
end;

procedure TMainView.FormDestroy(Sender: TObject);
begin
  FCamBitmap.Free;
end;

procedure TMainView.ParseBitmap;
begin
  if FOpenCVInProgress then
    exit;

  Camera.SampleBufferToBitmap(FCamBitmap, True);

  TTask.Run(
    procedure
    var
      LSrcMat: JMat;
      LDstMat: JMat;
      LHierarchyMat: JMat;
      LJBitmap: JBitmap;
      LThreshold: Double;
      LContoursList: JList;
    begin

      FOpenCVInProgress := True;
      try

        LSrcMat := TJMat.JavaClass.init;
        LDstMat := TJMat.JavaClass.init;
        LHierarchyMat:= TJMat.JavaClass.init;
        LContoursList:= JList(TJArrayList.JavaClass.init(0));

        LJBitmap := TJBitmap.JavaClass.createBitmap(Trunc(FCamBitmap.Width),
          Trunc(FCamBitmap.Height), TJBitmap_Config.JavaClass.ARGB_8888);

        TJandroid_Utils.JavaClass.bitmapToMat
          (BitmapToJBitmap(FCamBitmap), LSrcMat);

        TJImgproc.JavaClass.cvtColor(LSrcMat, LDstMat,
          TJImgproc.JavaClass.COLOR_RGB2GRAY);

        LThreshold := TJImgproc.JavaClass.threshold(LDstMat, LDstMat,
          100, 255, 0);

        TJImgproc.JavaClass.Canny(LDstMat, LDstMat, LThreshold, LThreshold * 2);

        TJImgproc.JavaClass.findContours(LDstMat, LContoursList, LHierarchyMat, TJImgproc.JavaClass.RETR_EXTERNAL, TJImgproc.JavaClass.CHAIN_APPROX_SIMPLE );

        TJImgproc.JavaClass.cvtColor(LDstMat, LDstMat,
          TJImgproc.JavaClass.COLOR_GRAY2RGB);

        TJImgproc.JavaClass.drawContours(LDstMat, LContoursList, -1, TJScalar.JavaClass.init(255,0,0) , 3);

        TJandroid_Utils.JavaClass.MatToBitmap(LDstMat, LJBitmap);

        FCamBitmap := JBitmapToBitmap(LJBitmap);

        TThread.Synchronize(nil,
          procedure
          begin
            ImageCam.Bitmap.Height := FCamBitmap.Height;
            ImageCam.Bitmap.Width := FCamBitmap.Width;
            ImageCam.Bitmap.CopyFromBitmap(FCamBitmap);
          end);

      finally
        FOpenCVInProgress := False;
      end;

    end);

end;

procedure TMainView.TakePicturePermissionRequestResult(Sender: TObject;
const APermissions: TArray<string>;
const AGrantResults: TArray<TPermissionStatus>);
begin
  if (AGrantResults[0] = TPermissionStatus.Granted) then
  begin

    try
      Camera.Active := False;
      Camera.Quality := FMX.Media.TVideoCaptureQuality.LowQuality;
      Camera.Active := True;
    finally

      FOpenCVInProgress := False;

      Camera.Active := False;
      Camera.Kind := FMX.Media.TCameraKind.BackCamera;
      Camera.FocusMode := FMX.Media.TFocusMode.ContinuousAutoFocus;
      Camera.Quality := FMX.Media.TVideoCaptureQuality.MediumQuality;
      Camera.Active := True;

    end;

  end
  else
  begin
    TDialogService.ShowMessage
      ('Required camera permissions are not all granted!');
  end;
end;

initialization

TJOpenCVLoader.JavaClass.initDebug;

end.
