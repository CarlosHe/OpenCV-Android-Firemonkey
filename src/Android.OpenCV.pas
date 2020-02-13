
unit Android.OpenCV;

interface

uses
  Androidapi.JNIBridge,
  Androidapi.JNI.App,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.Hardware,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.OpenGL,
  Androidapi.JNI.Util;

{$I AndroidOpenCV.inc}
{$I AndroidOpenCV3rdparty.inc}

type
// ===== Forward declarations =====

  JAnimator = interface;//android.animation.Animator
  JAnimator_AnimatorListener = interface;//android.animation.Animator$AnimatorListener
  JAnimator_AnimatorPauseListener = interface;//android.animation.Animator$AnimatorPauseListener
  JKeyframe = interface;//android.animation.Keyframe
  JLayoutTransition = interface;//android.animation.LayoutTransition
  JLayoutTransition_TransitionListener = interface;//android.animation.LayoutTransition$TransitionListener
  JPropertyValuesHolder = interface;//android.animation.PropertyValuesHolder
  JStateListAnimator = interface;//android.animation.StateListAnimator
  JTimeInterpolator = interface;//android.animation.TimeInterpolator
  JTypeConverter = interface;//android.animation.TypeConverter
  JTypeEvaluator = interface;//android.animation.TypeEvaluator
  JValueAnimator = interface;//android.animation.ValueAnimator
  JValueAnimator_AnimatorUpdateListener = interface;//android.animation.ValueAnimator$AnimatorUpdateListener
  JPathMotion = interface;//android.transition.PathMotion
  JScene = interface;//android.transition.Scene
  JTransition = interface;//android.transition.Transition
  JTransition_EpicenterCallback = interface;//android.transition.Transition$EpicenterCallback
  JTransition_TransitionListener = interface;//android.transition.Transition$TransitionListener
  JTransitionManager = interface;//android.transition.TransitionManager
  JTransitionPropagation = interface;//android.transition.TransitionPropagation
  JTransitionValues = interface;//android.transition.TransitionValues
  JInterpolator = interface;//android.view.animation.Interpolator
  JToolbar_LayoutParams = interface;//android.widget.Toolbar$LayoutParams
  JBaseLoaderCallback = interface;//org.opencv.android.BaseLoaderCallback
  JCameraGLRendererBase = interface;//org.opencv.android.CameraGLRendererBase
  JCamera2Renderer = interface;//org.opencv.android.Camera2Renderer
  JCameraActivity = interface;//org.opencv.android.CameraActivity
  JCameraBridgeViewBase = interface;//org.opencv.android.CameraBridgeViewBase
  JCameraBridgeViewBase_CvCameraViewFrame = interface;//org.opencv.android.CameraBridgeViewBase$CvCameraViewFrame
  JCameraBridgeViewBase_CvCameraViewListener = interface;//org.opencv.android.CameraBridgeViewBase$CvCameraViewListener
  JCameraBridgeViewBase_CvCameraViewListener2 = interface;//org.opencv.android.CameraBridgeViewBase$CvCameraViewListener2
  JCameraBridgeViewBase_ListItemAccessor = interface;//org.opencv.android.CameraBridgeViewBase$ListItemAccessor
  JCameraGLSurfaceView = interface;//org.opencv.android.CameraGLSurfaceView
  JCameraGLSurfaceView_CameraTextureListener = interface;//org.opencv.android.CameraGLSurfaceView$CameraTextureListener
  JCameraRenderer = interface;//org.opencv.android.CameraRenderer
  JFpsMeter = interface;//org.opencv.android.FpsMeter
  JInstallCallbackInterface = interface;//org.opencv.android.InstallCallbackInterface
  JJavaCamera2View = interface;//org.opencv.android.JavaCamera2View
  JJavaCamera2View_JavaCameraSizeAccessor = interface;//org.opencv.android.JavaCamera2View$JavaCameraSizeAccessor
  JJavaCameraView = interface;//org.opencv.android.JavaCameraView
  JJavaCameraView_JavaCameraSizeAccessor = interface;//org.opencv.android.JavaCameraView$JavaCameraSizeAccessor
  JLoaderCallbackInterface = interface;//org.opencv.android.LoaderCallbackInterface
  JOpenCVLoader = interface;//org.opencv.android.OpenCVLoader
  Jandroid_Utils = interface;//org.opencv.android.Utils
  JCalib3d = interface;//org.opencv.calib3d.Calib3d
  JAlgorithm = interface;//org.opencv.core.Algorithm
  JStereoMatcher = interface;//org.opencv.calib3d.StereoMatcher
  JStereoBM = interface;//org.opencv.calib3d.StereoBM
  JStereoSGBM = interface;//org.opencv.calib3d.StereoSGBM
  JCore = interface;//org.opencv.core.Core
  JCore_MinMaxLocResult = interface;//org.opencv.core.Core$MinMaxLocResult
  JCvException = interface;//org.opencv.core.CvException
  JCvType = interface;//org.opencv.core.CvType
  JDMatch = interface;//org.opencv.core.DMatch
  JKeyPoint = interface;//org.opencv.core.KeyPoint
  JMat = interface;//org.opencv.core.Mat
  JMatOfByte = interface;//org.opencv.core.MatOfByte
  JMatOfDMatch = interface;//org.opencv.core.MatOfDMatch
  JMatOfDouble = interface;//org.opencv.core.MatOfDouble
  JMatOfFloat = interface;//org.opencv.core.MatOfFloat
  JMatOfFloat4 = interface;//org.opencv.core.MatOfFloat4
  JMatOfFloat6 = interface;//org.opencv.core.MatOfFloat6
  JMatOfInt = interface;//org.opencv.core.MatOfInt
  JMatOfInt4 = interface;//org.opencv.core.MatOfInt4
  JMatOfKeyPoint = interface;//org.opencv.core.MatOfKeyPoint
  JMatOfPoint = interface;//org.opencv.core.MatOfPoint
  JMatOfPoint2f = interface;//org.opencv.core.MatOfPoint2f
  JMatOfPoint3 = interface;//org.opencv.core.MatOfPoint3
  JMatOfPoint3f = interface;//org.opencv.core.MatOfPoint3f
  JMatOfRect = interface;//org.opencv.core.MatOfRect
  JMatOfRect2d = interface;//org.opencv.core.MatOfRect2d
  JMatOfRotatedRect = interface;//org.opencv.core.MatOfRotatedRect
  Jcore_Point = interface;//org.opencv.core.Point
  JPoint3 = interface;//org.opencv.core.Point3
  Jcore_Range = interface;//org.opencv.core.Range
  Jcore_Rect = interface;//org.opencv.core.Rect
  JRect2d = interface;//org.opencv.core.Rect2d
  JRotatedRect = interface;//org.opencv.core.RotatedRect
  JScalar = interface;//org.opencv.core.Scalar
  Jcore_Size = interface;//org.opencv.core.Size
  JTermCriteria = interface;//org.opencv.core.TermCriteria
  JTickMeter = interface;//org.opencv.core.TickMeter
  JNet = interface;//org.opencv.dnn.Net
  JModel = interface;//org.opencv.dnn.Model
  JClassificationModel = interface;//org.opencv.dnn.ClassificationModel
  JDetectionModel = interface;//org.opencv.dnn.DetectionModel
  JDictValue = interface;//org.opencv.dnn.DictValue
  JDnn = interface;//org.opencv.dnn.Dnn
  JKeypointsModel = interface;//org.opencv.dnn.KeypointsModel
  JLayer = interface;//org.opencv.dnn.Layer
  JSegmentationModel = interface;//org.opencv.dnn.SegmentationModel
  JFeature2D = interface;//org.opencv.features2d.Feature2D
  JAKAZE = interface;//org.opencv.features2d.AKAZE
  JAgastFeatureDetector = interface;//org.opencv.features2d.AgastFeatureDetector
  JDescriptorMatcher = interface;//org.opencv.features2d.DescriptorMatcher
  JBFMatcher = interface;//org.opencv.features2d.BFMatcher
  JBOWImgDescriptorExtractor = interface;//org.opencv.features2d.BOWImgDescriptorExtractor
  JBOWTrainer = interface;//org.opencv.features2d.BOWTrainer
  JBOWKMeansTrainer = interface;//org.opencv.features2d.BOWKMeansTrainer
  JBRISK = interface;//org.opencv.features2d.BRISK
  JFastFeatureDetector = interface;//org.opencv.features2d.FastFeatureDetector
  JFeatures2d = interface;//org.opencv.features2d.Features2d
  JFlannBasedMatcher = interface;//org.opencv.features2d.FlannBasedMatcher
  JGFTTDetector = interface;//org.opencv.features2d.GFTTDetector
  JKAZE = interface;//org.opencv.features2d.KAZE
  JMSER = interface;//org.opencv.features2d.MSER
  JORB = interface;//org.opencv.features2d.ORB
  JParams = interface;//org.opencv.features2d.Params
  JSimpleBlobDetector = interface;//org.opencv.features2d.SimpleBlobDetector
  JImgcodecs = interface;//org.opencv.imgcodecs.Imgcodecs
  JCLAHE = interface;//org.opencv.imgproc.CLAHE
  JGeneralizedHough = interface;//org.opencv.imgproc.GeneralizedHough
  JGeneralizedHoughBallard = interface;//org.opencv.imgproc.GeneralizedHoughBallard
  JGeneralizedHoughGuil = interface;//org.opencv.imgproc.GeneralizedHoughGuil
  JImgproc = interface;//org.opencv.imgproc.Imgproc
  JLineSegmentDetector = interface;//org.opencv.imgproc.LineSegmentDetector
  Jimgproc_Moments = interface;//org.opencv.imgproc.Moments
  JSubdiv2D = interface;//org.opencv.imgproc.Subdiv2D
  JStatModel = interface;//org.opencv.ml.StatModel
  JANN_MLP = interface;//org.opencv.ml.ANN_MLP
  JDTrees = interface;//org.opencv.ml.DTrees
  JBoost = interface;//org.opencv.ml.Boost
  JEM = interface;//org.opencv.ml.EM
  JKNearest = interface;//org.opencv.ml.KNearest
  JLogisticRegression = interface;//org.opencv.ml.LogisticRegression
  JMl = interface;//org.opencv.ml.Ml
  JNormalBayesClassifier = interface;//org.opencv.ml.NormalBayesClassifier
  JParamGrid = interface;//org.opencv.ml.ParamGrid
  JRTrees = interface;//org.opencv.ml.RTrees
  JSVM = interface;//org.opencv.ml.SVM
  JSVMSGD = interface;//org.opencv.ml.SVMSGD
  JTrainData = interface;//org.opencv.ml.TrainData
  JBaseCascadeClassifier = interface;//org.opencv.objdetect.BaseCascadeClassifier
  JCascadeClassifier = interface;//org.opencv.objdetect.CascadeClassifier
  JHOGDescriptor = interface;//org.opencv.objdetect.HOGDescriptor
  JObjdetect = interface;//org.opencv.objdetect.Objdetect
  JQRCodeDetector = interface;//org.opencv.objdetect.QRCodeDetector
  JOpenCVInterface = interface;//org.opencv.osgi.OpenCVInterface
  JOpenCVNativeLoader = interface;//org.opencv.osgi.OpenCVNativeLoader
  JAlignExposures = interface;//org.opencv.photo.AlignExposures
  JAlignMTB = interface;//org.opencv.photo.AlignMTB
  JCalibrateCRF = interface;//org.opencv.photo.CalibrateCRF
  JCalibrateDebevec = interface;//org.opencv.photo.CalibrateDebevec
  JCalibrateRobertson = interface;//org.opencv.photo.CalibrateRobertson
  JMergeExposures = interface;//org.opencv.photo.MergeExposures
  JMergeDebevec = interface;//org.opencv.photo.MergeDebevec
  JMergeMertens = interface;//org.opencv.photo.MergeMertens
  JMergeRobertson = interface;//org.opencv.photo.MergeRobertson
  JPhoto = interface;//org.opencv.photo.Photo
  JTonemap = interface;//org.opencv.photo.Tonemap
  JTonemapDrago = interface;//org.opencv.photo.TonemapDrago
  JTonemapMantiuk = interface;//org.opencv.photo.TonemapMantiuk
  JTonemapReinhard = interface;//org.opencv.photo.TonemapReinhard
  JConverters = interface;//org.opencv.utils.Converters
  JBackgroundSubtractor = interface;//org.opencv.video.BackgroundSubtractor
  JBackgroundSubtractorKNN = interface;//org.opencv.video.BackgroundSubtractorKNN
  JBackgroundSubtractorMOG2 = interface;//org.opencv.video.BackgroundSubtractorMOG2
  JDenseOpticalFlow = interface;//org.opencv.video.DenseOpticalFlow
  JDISOpticalFlow = interface;//org.opencv.video.DISOpticalFlow
  JFarnebackOpticalFlow = interface;//org.opencv.video.FarnebackOpticalFlow
  JKalmanFilter = interface;//org.opencv.video.KalmanFilter
  JSparseOpticalFlow = interface;//org.opencv.video.SparseOpticalFlow
  JSparsePyrLKOpticalFlow = interface;//org.opencv.video.SparsePyrLKOpticalFlow
  JVariationalRefinement = interface;//org.opencv.video.VariationalRefinement
  JVideo = interface;//org.opencv.video.Video
  JVideoCapture = interface;//org.opencv.videoio.VideoCapture
  JVideoWriter = interface;//org.opencv.videoio.VideoWriter
  JVideoio = interface;//org.opencv.videoio.Videoio

// ===== Interface declarations =====

  JAnimatorClass = interface(JObjectClass)
    ['{3F76A5DF-389E-4BD3-9861-04C5B00CEADE}']
    {class} function init: JAnimator; cdecl;//Deprecated
    {class} function clone: JAnimator; cdecl;//Deprecated
    {class} procedure &end; cdecl;//Deprecated
    {class} function getDuration: Int64; cdecl;//Deprecated
    {class} function isPaused: Boolean; cdecl;
    {class} function isRunning: Boolean; cdecl;
    {class} function isStarted: Boolean; cdecl;
    {class} procedure removePauseListener(listener: JAnimator_AnimatorPauseListener); cdecl;
    {class} procedure resume; cdecl;
    {class} function setDuration(duration: Int64): JAnimator; cdecl;
    {class} procedure setupEndValues; cdecl;
    {class} procedure setupStartValues; cdecl;
    {class} procedure start; cdecl;
  end;

  [JavaSignature('android/animation/Animator')]
  JAnimator = interface(JObject)
    ['{FA13E56D-1B6D-4A3D-8327-9E5BA785CF21}']
    procedure addListener(listener: JAnimator_AnimatorListener); cdecl;//Deprecated
    procedure addPauseListener(listener: JAnimator_AnimatorPauseListener); cdecl;//Deprecated
    procedure cancel; cdecl;//Deprecated
    function getInterpolator: JTimeInterpolator; cdecl;
    function getListeners: JArrayList; cdecl;
    function getStartDelay: Int64; cdecl;
    procedure pause; cdecl;
    procedure removeAllListeners; cdecl;
    procedure removeListener(listener: JAnimator_AnimatorListener); cdecl;
    procedure setInterpolator(value: JTimeInterpolator); cdecl;
    procedure setStartDelay(startDelay: Int64); cdecl;
    procedure setTarget(target: JObject); cdecl;
  end;
  TJAnimator = class(TJavaGenericImport<JAnimatorClass, JAnimator>) end;

  JAnimator_AnimatorListenerClass = interface(IJavaClass)
    ['{5ED6075A-B997-469C-B8D9-0AA8FB7E4798}']
    {class} procedure onAnimationCancel(animation: JAnimator); cdecl;//Deprecated
  end;

  [JavaSignature('android/animation/Animator$AnimatorListener')]
  JAnimator_AnimatorListener = interface(IJavaInstance)
    ['{E2DE8DD6-628B-4D84-AA46-8A1E3F00FF13}']
    procedure onAnimationEnd(animation: JAnimator); cdecl;//Deprecated
    procedure onAnimationRepeat(animation: JAnimator); cdecl;//Deprecated
    procedure onAnimationStart(animation: JAnimator); cdecl;//Deprecated
  end;
  TJAnimator_AnimatorListener = class(TJavaGenericImport<JAnimator_AnimatorListenerClass, JAnimator_AnimatorListener>) end;

  JAnimator_AnimatorPauseListenerClass = interface(IJavaClass)
    ['{CB0DC3F0-63BC-4284-ADD0-2ED367AE11E5}']
  end;

  [JavaSignature('android/animation/Animator$AnimatorPauseListener')]
  JAnimator_AnimatorPauseListener = interface(IJavaInstance)
    ['{43C9C106-65EA-4A7D-A958-FAB9E43FA4A6}']
    procedure onAnimationPause(animation: JAnimator); cdecl;//Deprecated
    procedure onAnimationResume(animation: JAnimator); cdecl;//Deprecated
  end;
  TJAnimator_AnimatorPauseListener = class(TJavaGenericImport<JAnimator_AnimatorPauseListenerClass, JAnimator_AnimatorPauseListener>) end;

  JKeyframeClass = interface(JObjectClass)
    ['{D383116E-5CCF-48D8-9EA1-B26FBF24BA39}']
    {class} function init: JKeyframe; cdecl;//Deprecated
    {class} function getType: Jlang_Class; cdecl;
    {class} function getValue: JObject; cdecl;
    {class} function hasValue: Boolean; cdecl;
    {class} function ofFloat(fraction: Single; value: Single): JKeyframe; cdecl; overload;
    {class} function ofFloat(fraction: Single): JKeyframe; cdecl; overload;
    {class} function ofInt(fraction: Single; value: Integer): JKeyframe; cdecl; overload;
    {class} function ofInt(fraction: Single): JKeyframe; cdecl; overload;
    {class} function ofObject(fraction: Single; value: JObject): JKeyframe; cdecl; overload;
    {class} function ofObject(fraction: Single): JKeyframe; cdecl; overload;
  end;

  [JavaSignature('android/animation/Keyframe')]
  JKeyframe = interface(JObject)
    ['{9D0687A4-669E-440F-8290-154739405019}']
    function clone: JKeyframe; cdecl;
    function getFraction: Single; cdecl;
    function getInterpolator: JTimeInterpolator; cdecl;
    procedure setFraction(fraction: Single); cdecl;//Deprecated
    procedure setInterpolator(interpolator: JTimeInterpolator); cdecl;//Deprecated
    procedure setValue(value: JObject); cdecl;//Deprecated
  end;
  TJKeyframe = class(TJavaGenericImport<JKeyframeClass, JKeyframe>) end;

  JLayoutTransitionClass = interface(JObjectClass)
    ['{433C5359-0A96-4796-AD7B-8084EF7EF7C4}']
    {class} function _GetAPPEARING: Integer; cdecl;
    {class} function _GetCHANGE_APPEARING: Integer; cdecl;
    {class} function _GetCHANGE_DISAPPEARING: Integer; cdecl;
    {class} function _GetCHANGING: Integer; cdecl;
    {class} function _GetDISAPPEARING: Integer; cdecl;
    {class} function init: JLayoutTransition; cdecl;//Deprecated
    {class} procedure addChild(parent: JViewGroup; child: JView); cdecl;//Deprecated
    {class} function getAnimator(transitionType: Integer): JAnimator; cdecl;
    {class} function getDuration(transitionType: Integer): Int64; cdecl;
    {class} function getInterpolator(transitionType: Integer): JTimeInterpolator; cdecl;
    {class} procedure hideChild(parent: JViewGroup; child: JView); cdecl; overload;//Deprecated
    {class} procedure hideChild(parent: JViewGroup; child: JView; newVisibility: Integer); cdecl; overload;
    {class} function isChangingLayout: Boolean; cdecl;
    {class} procedure removeTransitionListener(listener: JLayoutTransition_TransitionListener); cdecl;
    {class} procedure setAnimateParentHierarchy(animateParentHierarchy: Boolean); cdecl;
    {class} procedure setAnimator(transitionType: Integer; animator: JAnimator); cdecl;
    {class} procedure setStagger(transitionType: Integer; duration: Int64); cdecl;
    {class} procedure setStartDelay(transitionType: Integer; delay: Int64); cdecl;
    {class} procedure showChild(parent: JViewGroup; child: JView); cdecl; overload;//Deprecated
    {class} property APPEARING: Integer read _GetAPPEARING;
    {class} property CHANGE_APPEARING: Integer read _GetCHANGE_APPEARING;
    {class} property CHANGE_DISAPPEARING: Integer read _GetCHANGE_DISAPPEARING;
    {class} property CHANGING: Integer read _GetCHANGING;
    {class} property DISAPPEARING: Integer read _GetDISAPPEARING;
  end;

  [JavaSignature('android/animation/LayoutTransition')]
  JLayoutTransition = interface(JObject)
    ['{42450BEE-EBF2-4954-B9B7-F8DAE7DF0EC1}']
    procedure addTransitionListener(listener: JLayoutTransition_TransitionListener); cdecl;
    procedure disableTransitionType(transitionType: Integer); cdecl;
    procedure enableTransitionType(transitionType: Integer); cdecl;
    function getStagger(transitionType: Integer): Int64; cdecl;
    function getStartDelay(transitionType: Integer): Int64; cdecl;
    function getTransitionListeners: JList; cdecl;
    function isRunning: Boolean; cdecl;
    function isTransitionTypeEnabled(transitionType: Integer): Boolean; cdecl;
    procedure removeChild(parent: JViewGroup; child: JView); cdecl;
    procedure setDuration(duration: Int64); cdecl; overload;
    procedure setDuration(transitionType: Integer; duration: Int64); cdecl; overload;
    procedure setInterpolator(transitionType: Integer; interpolator: JTimeInterpolator); cdecl;
    procedure showChild(parent: JViewGroup; child: JView; oldVisibility: Integer); cdecl; overload;//Deprecated
  end;
  TJLayoutTransition = class(TJavaGenericImport<JLayoutTransitionClass, JLayoutTransition>) end;

  JLayoutTransition_TransitionListenerClass = interface(IJavaClass)
    ['{9FA6F1EC-8EDB-4A05-AF58-B55A525AE114}']
  end;

  [JavaSignature('android/animation/LayoutTransition$TransitionListener')]
  JLayoutTransition_TransitionListener = interface(IJavaInstance)
    ['{0FBE048F-FCDA-4692-B6F1-DE0F07FAE885}']
    procedure endTransition(transition: JLayoutTransition; container: JViewGroup; view: JView; transitionType: Integer); cdecl;
    procedure startTransition(transition: JLayoutTransition; container: JViewGroup; view: JView; transitionType: Integer); cdecl;
  end;
  TJLayoutTransition_TransitionListener = class(TJavaGenericImport<JLayoutTransition_TransitionListenerClass, JLayoutTransition_TransitionListener>) end;

  JPropertyValuesHolderClass = interface(JObjectClass)
    ['{36C77AFF-9C3F-42B6-88F3-320FE8CF9B25}']
    {class} function ofMultiFloat(propertyName: JString; values: TJavaBiArray<Single>): JPropertyValuesHolder; cdecl; overload;//Deprecated
    {class} function ofMultiFloat(propertyName: JString; path: JPath): JPropertyValuesHolder; cdecl; overload;//Deprecated
    {class} function ofMultiInt(propertyName: JString; values: TJavaBiArray<Integer>): JPropertyValuesHolder; cdecl; overload;
    {class} function ofMultiInt(propertyName: JString; path: JPath): JPropertyValuesHolder; cdecl; overload;
    {class} function ofObject(propertyName: JString; converter: JTypeConverter; path: JPath): JPropertyValuesHolder; cdecl; overload;
    {class} function ofObject(property_: JProperty; converter: JTypeConverter; path: JPath): JPropertyValuesHolder; cdecl; overload;
    {class} procedure setConverter(converter: JTypeConverter); cdecl;
    {class} procedure setEvaluator(evaluator: JTypeEvaluator); cdecl;
    {class} procedure setProperty(property_: JProperty); cdecl;
    {class} procedure setPropertyName(propertyName: JString); cdecl;
  end;

  [JavaSignature('android/animation/PropertyValuesHolder')]
  JPropertyValuesHolder = interface(JObject)
    ['{12B4ABFD-CBCA-4636-AF2D-C386EF895DC3}']
    function clone: JPropertyValuesHolder; cdecl;//Deprecated
    function getPropertyName: JString; cdecl;//Deprecated
    function toString: JString; cdecl;
  end;
  TJPropertyValuesHolder = class(TJavaGenericImport<JPropertyValuesHolderClass, JPropertyValuesHolder>) end;

  JStateListAnimatorClass = interface(JObjectClass)
    ['{109E4067-E218-47B1-93EB-65B8916A98D8}']
    {class} function init: JStateListAnimator; cdecl;//Deprecated
    {class} procedure jumpToCurrentState; cdecl;//Deprecated
  end;

  [JavaSignature('android/animation/StateListAnimator')]
  JStateListAnimator = interface(JObject)
    ['{CA2A9587-26AA-4DC2-8DFF-A1305A37608F}']
    procedure addState(specs: TJavaArray<Integer>; animator: JAnimator); cdecl;//Deprecated
    function clone: JStateListAnimator; cdecl;//Deprecated
  end;
  TJStateListAnimator = class(TJavaGenericImport<JStateListAnimatorClass, JStateListAnimator>) end;

  JTimeInterpolatorClass = interface(IJavaClass)
    ['{1E682A1C-9102-461D-A3CA-5596683F1D66}']
  end;

  [JavaSignature('android/animation/TimeInterpolator')]
  JTimeInterpolator = interface(IJavaInstance)
    ['{639F8A83-7D9B-49AF-A19E-96B27E46D2AB}']
    function getInterpolation(input: Single): Single; cdecl;
  end;
  TJTimeInterpolator = class(TJavaGenericImport<JTimeInterpolatorClass, JTimeInterpolator>) end;

  JTypeConverterClass = interface(JObjectClass)
    ['{BE2DD177-6D79-4B0C-B4F5-4E4CD9D7436D}']
    {class} function init(fromClass: Jlang_Class; toClass: Jlang_Class): JTypeConverter; cdecl;//Deprecated
    {class} function convert(value: JObject): JObject; cdecl;
  end;

  [JavaSignature('android/animation/TypeConverter')]
  JTypeConverter = interface(JObject)
    ['{BFEA4116-0766-4AD9-AA8F-4C15A583EB2E}']
  end;
  TJTypeConverter = class(TJavaGenericImport<JTypeConverterClass, JTypeConverter>) end;

  JTypeEvaluatorClass = interface(IJavaClass)
    ['{15B67CAF-6F50-4AA3-A88F-C5AF78D62FD4}']
  end;

  [JavaSignature('android/animation/TypeEvaluator')]
  JTypeEvaluator = interface(IJavaInstance)
    ['{F436383D-6F44-40D8-ACDD-9057777691FC}']
    function evaluate(fraction: Single; startValue: JObject; endValue: JObject): JObject; cdecl;
  end;
  TJTypeEvaluator = class(TJavaGenericImport<JTypeEvaluatorClass, JTypeEvaluator>) end;

  JValueAnimatorClass = interface(JAnimatorClass)
    ['{FF3B71ED-5A33-45B0-8500-7672B0B98E2C}']
    {class} function _GetINFINITE: Integer; cdecl;
    {class} function _GetRESTART: Integer; cdecl;
    {class} function _GetREVERSE: Integer; cdecl;
    {class} function init: JValueAnimator; cdecl;//Deprecated
    {class} procedure &end; cdecl;//Deprecated
    {class} function getAnimatedFraction: Single; cdecl;//Deprecated
    {class} function getAnimatedValue: JObject; cdecl; overload;
    {class} function getAnimatedValue(propertyName: JString): JObject; cdecl; overload;
    {class} function getCurrentPlayTime: Int64; cdecl;
    {class} function getFrameDelay: Int64; cdecl;//Deprecated
    {class} function getRepeatCount: Integer; cdecl;//Deprecated
    {class} function getRepeatMode: Integer; cdecl;//Deprecated
    {class} function getStartDelay: Int64; cdecl;//Deprecated
    {class} procedure removeAllUpdateListeners; cdecl;//Deprecated
    {class} procedure removeUpdateListener(listener: JValueAnimator_AnimatorUpdateListener); cdecl;//Deprecated
    {class} procedure resume; cdecl;//Deprecated
    {class} procedure setCurrentPlayTime(playTime: Int64); cdecl;//Deprecated
    {class} function setDuration(duration: Int64): JValueAnimator; cdecl;//Deprecated
    {class} procedure setEvaluator(value: JTypeEvaluator); cdecl;//Deprecated
    {class} procedure setFrameDelay(frameDelay: Int64); cdecl;
    {class} procedure setInterpolator(value: JTimeInterpolator); cdecl;
    {class} procedure setRepeatCount(value: Integer); cdecl;
    {class} procedure start; cdecl;
    {class} function toString: JString; cdecl;
    {class} property INFINITE: Integer read _GetINFINITE;
    {class} property RESTART: Integer read _GetRESTART;
    {class} property REVERSE: Integer read _GetREVERSE;
  end;

  [JavaSignature('android/animation/ValueAnimator')]
  JValueAnimator = interface(JAnimator)
    ['{70F92B14-EFD4-4DC7-91DE-6617417AE194}']
    procedure addUpdateListener(listener: JValueAnimator_AnimatorUpdateListener); cdecl;//Deprecated
    procedure cancel; cdecl;//Deprecated
    function clone: JValueAnimator; cdecl;//Deprecated
    function getDuration: Int64; cdecl;//Deprecated
    function getInterpolator: JTimeInterpolator; cdecl;//Deprecated
    function getValues: TJavaObjectArray<JPropertyValuesHolder>; cdecl;//Deprecated
    function isRunning: Boolean; cdecl;//Deprecated
    function isStarted: Boolean; cdecl;//Deprecated
    procedure pause; cdecl;//Deprecated
    procedure reverse; cdecl;//Deprecated
    procedure setCurrentFraction(fraction: Single); cdecl;//Deprecated
    procedure setRepeatMode(value: Integer); cdecl;
    procedure setStartDelay(startDelay: Int64); cdecl;
  end;
  TJValueAnimator = class(TJavaGenericImport<JValueAnimatorClass, JValueAnimator>) end;

  JValueAnimator_AnimatorUpdateListenerClass = interface(IJavaClass)
    ['{9CA50CBF-4462-4445-82CD-13CE985E2DE4}']
    {class} procedure onAnimationUpdate(animation: JValueAnimator); cdecl;//Deprecated
  end;

  [JavaSignature('android/animation/ValueAnimator$AnimatorUpdateListener')]
  JValueAnimator_AnimatorUpdateListener = interface(IJavaInstance)
    ['{0F883491-52EF-4A40-B7D2-FC23E11E46FE}']
  end;
  TJValueAnimator_AnimatorUpdateListener = class(TJavaGenericImport<JValueAnimator_AnimatorUpdateListenerClass, JValueAnimator_AnimatorUpdateListener>) end;

  JPathMotionClass = interface(JObjectClass)
    ['{E1CD1A94-115C-492C-A490-37F0E72956EB}']
    {class} function init: JPathMotion; cdecl; overload;//Deprecated
    {class} function init(context: JContext; attrs: JAttributeSet): JPathMotion; cdecl; overload;//Deprecated
    {class} function getPath(startX: Single; startY: Single; endX: Single; endY: Single): JPath; cdecl;
  end;

  [JavaSignature('android/transition/PathMotion')]
  JPathMotion = interface(JObject)
    ['{BDC08353-C9FB-42D7-97CC-C35837D2F536}']
  end;
  TJPathMotion = class(TJavaGenericImport<JPathMotionClass, JPathMotion>) end;

  JSceneClass = interface(JObjectClass)
    ['{8B9120CA-AEEA-4DE3-BDC9-15CFD23A7B07}']
    {class} function init(sceneRoot: JViewGroup): JScene; cdecl; overload;//Deprecated
    {class} function init(sceneRoot: JViewGroup; layout: JView): JScene; cdecl; overload;//Deprecated
    {class} function init(sceneRoot: JViewGroup; layout: JViewGroup): JScene; cdecl; overload;//Deprecated
    {class} procedure exit; cdecl;
    {class} function getSceneForLayout(sceneRoot: JViewGroup; layoutId: Integer; context: JContext): JScene; cdecl;
    {class} function getSceneRoot: JViewGroup; cdecl;
  end;

  [JavaSignature('android/transition/Scene')]
  JScene = interface(JObject)
    ['{85A60B99-5837-4F1F-A344-C627DD586B82}']
    procedure enter; cdecl;
    procedure setEnterAction(action: JRunnable); cdecl;//Deprecated
    procedure setExitAction(action: JRunnable); cdecl;//Deprecated
  end;
  TJScene = class(TJavaGenericImport<JSceneClass, JScene>) end;

  JTransitionClass = interface(JObjectClass)
    ['{60EC06BC-8F7A-4416-A04B-5B57987EB18E}']
    {class} function _GetMATCH_ID: Integer; cdecl;
    {class} function _GetMATCH_INSTANCE: Integer; cdecl;
    {class} function _GetMATCH_ITEM_ID: Integer; cdecl;
    {class} function _GetMATCH_NAME: Integer; cdecl;
    {class} function init: JTransition; cdecl; overload;//Deprecated
    {class} function init(context: JContext; attrs: JAttributeSet): JTransition; cdecl; overload;//Deprecated
    {class} function addListener(listener: JTransition_TransitionListener): JTransition; cdecl;//Deprecated
    {class} function addTarget(targetId: Integer): JTransition; cdecl; overload;//Deprecated
    {class} function addTarget(targetName: JString): JTransition; cdecl; overload;//Deprecated
    {class} function canRemoveViews: Boolean; cdecl;//Deprecated
    {class} procedure captureEndValues(transitionValues: JTransitionValues); cdecl;//Deprecated
    {class} procedure captureStartValues(transitionValues: JTransitionValues); cdecl;//Deprecated
    {class} function excludeChildren(target: JView; exclude: Boolean): JTransition; cdecl; overload;//Deprecated
    {class} function excludeChildren(type_: Jlang_Class; exclude: Boolean): JTransition; cdecl; overload;//Deprecated
    {class} function excludeTarget(targetId: Integer; exclude: Boolean): JTransition; cdecl; overload;//Deprecated
    {class} function getDuration: Int64; cdecl;
    {class} function getEpicenter: JRect; cdecl;
    {class} function getEpicenterCallback: JTransition_EpicenterCallback; cdecl;
    {class} function getPropagation: JTransitionPropagation; cdecl;
    {class} function getStartDelay: Int64; cdecl;
    {class} function getTargetIds: JList; cdecl;
    {class} function getTransitionProperties: TJavaObjectArray<JString>; cdecl;
    {class} function getTransitionValues(view: JView; start: Boolean): JTransitionValues; cdecl;
    {class} function isTransitionRequired(startValues: JTransitionValues; endValues: JTransitionValues): Boolean; cdecl;
    {class} function removeTarget(target: JView): JTransition; cdecl; overload;
    {class} function removeTarget(target: Jlang_Class): JTransition; cdecl; overload;
    {class} procedure setPathMotion(pathMotion: JPathMotion); cdecl;//Deprecated
    {class} procedure setPropagation(transitionPropagation: JTransitionPropagation); cdecl;//Deprecated
    {class} property MATCH_ID: Integer read _GetMATCH_ID;
    {class} property MATCH_INSTANCE: Integer read _GetMATCH_INSTANCE;
    {class} property MATCH_ITEM_ID: Integer read _GetMATCH_ITEM_ID;
    {class} property MATCH_NAME: Integer read _GetMATCH_NAME;
  end;

  [JavaSignature('android/transition/Transition')]
  JTransition = interface(JObject)
    ['{C2F8200F-1C83-40AE-8C5B-C0C8BFF17F88}']
    function addTarget(targetType: Jlang_Class): JTransition; cdecl; overload;//Deprecated
    function addTarget(target: JView): JTransition; cdecl; overload;//Deprecated
    function clone: JTransition; cdecl;//Deprecated
    function createAnimator(sceneRoot: JViewGroup; startValues: JTransitionValues; endValues: JTransitionValues): JAnimator; cdecl;//Deprecated
    function excludeChildren(targetId: Integer; exclude: Boolean): JTransition; cdecl; overload;//Deprecated
    function excludeTarget(targetName: JString; exclude: Boolean): JTransition; cdecl; overload;
    function excludeTarget(target: JView; exclude: Boolean): JTransition; cdecl; overload;
    function excludeTarget(type_: Jlang_Class; exclude: Boolean): JTransition; cdecl; overload;
    function getInterpolator: JTimeInterpolator; cdecl;
    function getName: JString; cdecl;
    function getPathMotion: JPathMotion; cdecl;
    function getTargetNames: JList; cdecl;
    function getTargetTypes: JList; cdecl;
    function getTargets: JList; cdecl;
    function removeListener(listener: JTransition_TransitionListener): JTransition; cdecl;
    function removeTarget(targetId: Integer): JTransition; cdecl; overload;
    function removeTarget(targetName: JString): JTransition; cdecl; overload;
    function setDuration(duration: Int64): JTransition; cdecl;//Deprecated
    procedure setEpicenterCallback(epicenterCallback: JTransition_EpicenterCallback); cdecl;//Deprecated
    function setInterpolator(interpolator: JTimeInterpolator): JTransition; cdecl;//Deprecated
    function setStartDelay(startDelay: Int64): JTransition; cdecl;//Deprecated
    function toString: JString; cdecl;//Deprecated
  end;
  TJTransition = class(TJavaGenericImport<JTransitionClass, JTransition>) end;

  JTransition_EpicenterCallbackClass = interface(JObjectClass)
    ['{8141257A-130B-466C-A08D-AA3A00946F4C}']
    {class} function init: JTransition_EpicenterCallback; cdecl;//Deprecated
    {class} function onGetEpicenter(transition: JTransition): JRect; cdecl;
  end;

  [JavaSignature('android/transition/Transition$EpicenterCallback')]
  JTransition_EpicenterCallback = interface(JObject)
    ['{CE004917-266F-4076-8913-F23184824FBA}']
  end;
  TJTransition_EpicenterCallback = class(TJavaGenericImport<JTransition_EpicenterCallbackClass, JTransition_EpicenterCallback>) end;

  JTransition_TransitionListenerClass = interface(IJavaClass)
    ['{D5083752-E8A6-46DF-BE40-AE11073C387E}']
    {class} procedure onTransitionCancel(transition: JTransition); cdecl;
    {class} procedure onTransitionStart(transition: JTransition); cdecl;
  end;

  [JavaSignature('android/transition/Transition$TransitionListener')]
  JTransition_TransitionListener = interface(IJavaInstance)
    ['{C32BE107-6E05-4898-AF0A-FAD970D66E29}']
    procedure onTransitionEnd(transition: JTransition); cdecl;
    procedure onTransitionPause(transition: JTransition); cdecl;
    procedure onTransitionResume(transition: JTransition); cdecl;
  end;
  TJTransition_TransitionListener = class(TJavaGenericImport<JTransition_TransitionListenerClass, JTransition_TransitionListener>) end;

  JTransitionManagerClass = interface(JObjectClass)
    ['{4160EFA0-3499-4964-817E-46497BB5B957}']
    {class} function init: JTransitionManager; cdecl;//Deprecated
    {class} procedure beginDelayedTransition(sceneRoot: JViewGroup); cdecl; overload;
    {class} procedure beginDelayedTransition(sceneRoot: JViewGroup; transition: JTransition); cdecl; overload;//Deprecated
    {class} procedure endTransitions(sceneRoot: JViewGroup); cdecl;//Deprecated
    {class} procedure go(scene: JScene); cdecl; overload;//Deprecated
    {class} procedure go(scene: JScene; transition: JTransition); cdecl; overload;//Deprecated
    {class} procedure setTransition(scene: JScene; transition: JTransition); cdecl; overload;//Deprecated
  end;

  [JavaSignature('android/transition/TransitionManager')]
  JTransitionManager = interface(JObject)
    ['{FF5E1210-1F04-4F81-9CAC-3D7A5C4E972B}']
    procedure setTransition(fromScene: JScene; toScene: JScene; transition: JTransition); cdecl; overload;//Deprecated
    procedure transitionTo(scene: JScene); cdecl;//Deprecated
  end;
  TJTransitionManager = class(TJavaGenericImport<JTransitionManagerClass, JTransitionManager>) end;

  JTransitionPropagationClass = interface(JObjectClass)
    ['{A881388A-C877-4DD9-9BAD-1BA4F56133EE}']
    {class} function init: JTransitionPropagation; cdecl;//Deprecated
    {class} procedure captureValues(transitionValues: JTransitionValues); cdecl;//Deprecated
    {class} function getPropagationProperties: TJavaObjectArray<JString>; cdecl;//Deprecated
  end;

  [JavaSignature('android/transition/TransitionPropagation')]
  JTransitionPropagation = interface(JObject)
    ['{7595B7EF-6BCE-4281-BC67-335E2FB6C091}']
    function getStartDelay(sceneRoot: JViewGroup; transition: JTransition; startValues: JTransitionValues; endValues: JTransitionValues): Int64; cdecl;
  end;
  TJTransitionPropagation = class(TJavaGenericImport<JTransitionPropagationClass, JTransitionPropagation>) end;

  JTransitionValuesClass = interface(JObjectClass)
    ['{3BF98CFA-6A4D-4815-8D42-15E97C916D91}']
    {class} function _Getvalues: JMap; cdecl;
    {class} function init: JTransitionValues; cdecl;//Deprecated
    {class} function hashCode: Integer; cdecl;
    {class} function toString: JString; cdecl;
    {class} property values: JMap read _Getvalues;
  end;

  [JavaSignature('android/transition/TransitionValues')]
  JTransitionValues = interface(JObject)
    ['{178E09E6-D32C-48A9-ADCF-8CCEA804052A}']
    function _Getview: JView; cdecl;
    procedure _Setview(Value: JView); cdecl;
    function equals(other: JObject): Boolean; cdecl;
    property view: JView read _Getview write _Setview;
  end;
  TJTransitionValues = class(TJavaGenericImport<JTransitionValuesClass, JTransitionValues>) end;

  JInterpolatorClass = interface(JTimeInterpolatorClass)
    ['{A575B46A-E489-409C-807A-1B8F2BE092E8}']
  end;

  [JavaSignature('android/view/animation/Interpolator')]
  JInterpolator = interface(JTimeInterpolator)
    ['{F1082403-52DA-4AF0-B017-DAB334325FC7}']
  end;
  TJInterpolator = class(TJavaGenericImport<JInterpolatorClass, JInterpolator>) end;

  JToolbar_LayoutParamsClass = interface(JActionBar_LayoutParamsClass)
    ['{6D43796C-C163-4084-BB30-6FE68AFD7ABB}']
    {class} function init(c: JContext; attrs: JAttributeSet): JToolbar_LayoutParams; cdecl; overload;//Deprecated
    {class} function init(width: Integer; height: Integer): JToolbar_LayoutParams; cdecl; overload;//Deprecated
    {class} function init(width: Integer; height: Integer; gravity: Integer): JToolbar_LayoutParams; cdecl; overload;//Deprecated
    {class} function init(gravity: Integer): JToolbar_LayoutParams; cdecl; overload;//Deprecated
    {class} function init(source: JToolbar_LayoutParams): JToolbar_LayoutParams; cdecl; overload;//Deprecated
    {class} function init(source: JActionBar_LayoutParams): JToolbar_LayoutParams; cdecl; overload;//Deprecated
    {class} function init(source: JViewGroup_MarginLayoutParams): JToolbar_LayoutParams; cdecl; overload;//Deprecated
    {class} function init(source: JViewGroup_LayoutParams): JToolbar_LayoutParams; cdecl; overload;//Deprecated
  end;

  [JavaSignature('android/widget/Toolbar$LayoutParams')]
  JToolbar_LayoutParams = interface(JActionBar_LayoutParams)
    ['{BCD101F9-B7B7-4B2F-9460-056B3EA7B9F0}']
  end;
  TJToolbar_LayoutParams = class(TJavaGenericImport<JToolbar_LayoutParamsClass, JToolbar_LayoutParams>) end;

  JBaseLoaderCallbackClass = interface(JObjectClass)
    ['{92CF6D8F-78F1-4A0D-A1C7-87F31D3BB1C5}']
    {class} function init(AppContext: JContext): JBaseLoaderCallback; cdecl;
    {class} procedure onManagerConnected(status: Integer); cdecl;
    {class} procedure onPackageInstall(operation: Integer; callback: JInstallCallbackInterface); cdecl;
  end;

  [JavaSignature('org/opencv/android/BaseLoaderCallback')]
  JBaseLoaderCallback = interface(JObject)
    ['{C2E9B442-D835-48C7-BED2-4FBA22096006}']
  end;
  TJBaseLoaderCallback = class(TJavaGenericImport<JBaseLoaderCallbackClass, JBaseLoaderCallback>) end;

  JCameraGLRendererBaseClass = interface(JObjectClass)
    ['{D985E11B-A6D8-4830-B5B0-957F0DE6DE90}']
    {class} function init(view: JCameraGLSurfaceView): JCameraGLRendererBase; cdecl;
    {class} procedure disableView; cdecl;//Deprecated
    {class} procedure onSurfaceChanged(gl: JGL10; surfaceWidth: Integer; surfaceHeight: Integer); cdecl;//Deprecated
    {class} procedure onSurfaceCreated(gl: JGL10; config: JEGLConfig); cdecl;//Deprecated
    {class} procedure setMaxCameraPreviewSize(maxWidth: Integer; maxHeight: Integer); cdecl;//Deprecated
  end;

  [JavaSignature('org/opencv/android/CameraGLRendererBase')]
  JCameraGLRendererBase = interface(JObject)
    ['{9C2D4E05-98A0-4D49-9A22-C45CE7E95076}']
    procedure enableView; cdecl;//Deprecated
    procedure onDrawFrame(gl: JGL10); cdecl;//Deprecated
    procedure onFrameAvailable(surfaceTexture: JSurfaceTexture); cdecl;//Deprecated
    procedure onPause; cdecl;//Deprecated
    procedure onResume; cdecl;//Deprecated
    procedure setCameraIndex(cameraIndex: Integer); cdecl;//Deprecated
  end;
  TJCameraGLRendererBase = class(TJavaGenericImport<JCameraGLRendererBaseClass, JCameraGLRendererBase>) end;

  JCamera2RendererClass = interface(JCameraGLRendererBaseClass)
    ['{8C988EE9-0270-4326-B95B-C3F87F38F7CC}']
  end;

  [JavaSignature('org/opencv/android/Camera2Renderer')]
  JCamera2Renderer = interface(JCameraGLRendererBase)
    ['{157E5C16-F1D1-4C9E-8AD3-033205DE2974}']
  end;
  TJCamera2Renderer = class(TJavaGenericImport<JCamera2RendererClass, JCamera2Renderer>) end;

  JCameraActivityClass = interface(JActivityClass)
    ['{CAA92F16-B3B3-4016-A405-22B68B2507C1}']
    {class} function init: JCameraActivity; cdecl;
    {class} procedure onRequestPermissionsResult(requestCode: Integer; permissions: TJavaObjectArray<JString>; grantResults: TJavaArray<Integer>); cdecl;//Deprecated
  end;

  [JavaSignature('org/opencv/android/CameraActivity')]
  JCameraActivity = interface(JActivity)
    ['{DD42262F-12CC-472F-AE32-3E82915CD64C}']
  end;
  TJCameraActivity = class(TJavaGenericImport<JCameraActivityClass, JCameraActivity>) end;

  JCameraBridgeViewBaseClass = interface(JSurfaceViewClass)
    ['{C679CD9C-D5E6-4CC7-BE7B-E50034C54B89}']
    {class} function _GetCAMERA_ID_ANY: Integer; cdecl;
    {class} function _GetCAMERA_ID_BACK: Integer; cdecl;
    {class} function _GetCAMERA_ID_FRONT: Integer; cdecl;
    {class} function _GetGRAY: Integer; cdecl;
    {class} function _GetRGBA: Integer; cdecl;
    {class} function init(context: JContext; cameraId: Integer): JCameraBridgeViewBase; cdecl; overload;
    {class} function init(context: JContext; attrs: JAttributeSet): JCameraBridgeViewBase; cdecl; overload;
    {class} procedure SetCaptureFormat(format: Integer); cdecl;//Deprecated
    {class} procedure disableFpsMeter; cdecl;//Deprecated
    {class} procedure disableView; cdecl;
    {class} procedure setCameraIndex(cameraIndex: Integer); cdecl;
    {class} procedure setCvCameraViewListener(listener: JCameraBridgeViewBase_CvCameraViewListener2); cdecl; overload;//Deprecated
    {class} procedure setCvCameraViewListener(listener: JCameraBridgeViewBase_CvCameraViewListener); cdecl; overload;//Deprecated
    {class} procedure setMaxFrameSize(maxWidth: Integer; maxHeight: Integer); cdecl;
    {class} procedure surfaceChanged(arg0: JSurfaceHolder; arg1: Integer; arg2: Integer; arg3: Integer); cdecl;//Deprecated
    {class} property CAMERA_ID_ANY: Integer read _GetCAMERA_ID_ANY;
    {class} property CAMERA_ID_BACK: Integer read _GetCAMERA_ID_BACK;
    {class} property CAMERA_ID_FRONT: Integer read _GetCAMERA_ID_FRONT;
    {class} property GRAY: Integer read _GetGRAY;
    {class} property RGBA: Integer read _GetRGBA;
  end;

  [JavaSignature('org/opencv/android/CameraBridgeViewBase')]
  JCameraBridgeViewBase = interface(JSurfaceView)
    ['{301ABAC3-AAFC-4B7E-AC58-72CE9F5B8AC3}']
    procedure enableFpsMeter; cdecl;//Deprecated
    procedure enableView; cdecl;//Deprecated
    procedure setCameraPermissionGranted; cdecl;//Deprecated
    procedure surfaceCreated(holder: JSurfaceHolder); cdecl;//Deprecated
    procedure surfaceDestroyed(holder: JSurfaceHolder); cdecl;//Deprecated
  end;
  TJCameraBridgeViewBase = class(TJavaGenericImport<JCameraBridgeViewBaseClass, JCameraBridgeViewBase>) end;

  JCameraBridgeViewBase_CvCameraViewFrameClass = interface(IJavaClass)
    ['{3BA4E4FB-7136-425A-AAFF-8D0505FDBD38}']
  end;

  [JavaSignature('org/opencv/android/CameraBridgeViewBase$CvCameraViewFrame')]
  JCameraBridgeViewBase_CvCameraViewFrame = interface(IJavaInstance)
    ['{29E77779-9D6D-4883-A390-3DEAEA4DF3D4}']
    function gray: JMat; cdecl;
    function rgba: JMat; cdecl;
  end;
  TJCameraBridgeViewBase_CvCameraViewFrame = class(TJavaGenericImport<JCameraBridgeViewBase_CvCameraViewFrameClass, JCameraBridgeViewBase_CvCameraViewFrame>) end;

  JCameraBridgeViewBase_CvCameraViewListenerClass = interface(IJavaClass)
    ['{CE021F2F-6C94-493B-8E40-87D3F13F40E4}']
    {class} procedure onCameraViewStopped; cdecl;
  end;

  [JavaSignature('org/opencv/android/CameraBridgeViewBase$CvCameraViewListener')]
  JCameraBridgeViewBase_CvCameraViewListener = interface(IJavaInstance)
    ['{B3AB05CB-B34C-4C15-8D62-F82FCE8260F1}']
    function onCameraFrame(inputFrame: JMat): JMat; cdecl;
    procedure onCameraViewStarted(width: Integer; height: Integer); cdecl;//Deprecated
  end;
  TJCameraBridgeViewBase_CvCameraViewListener = class(TJavaGenericImport<JCameraBridgeViewBase_CvCameraViewListenerClass, JCameraBridgeViewBase_CvCameraViewListener>) end;

  JCameraBridgeViewBase_CvCameraViewListener2Class = interface(IJavaClass)
    ['{C75F7A80-A9F5-4806-BDF4-DE666BFA1118}']
    {class} procedure onCameraViewStopped; cdecl;//Deprecated
  end;

  [JavaSignature('org/opencv/android/CameraBridgeViewBase$CvCameraViewListener2')]
  JCameraBridgeViewBase_CvCameraViewListener2 = interface(IJavaInstance)
    ['{BF4B5F0F-C52F-48ED-80D7-7C9FFDDC2D30}']
    function onCameraFrame(inputFrame: JCameraBridgeViewBase_CvCameraViewFrame): JMat; cdecl;
    procedure onCameraViewStarted(width: Integer; height: Integer); cdecl;
  end;
  TJCameraBridgeViewBase_CvCameraViewListener2 = class(TJavaGenericImport<JCameraBridgeViewBase_CvCameraViewListener2Class, JCameraBridgeViewBase_CvCameraViewListener2>) end;

  JCameraBridgeViewBase_ListItemAccessorClass = interface(IJavaClass)
    ['{EA7E071E-37E2-4B91-B365-D1619A0053D6}']
    {class} function getHeight(obj: JObject): Integer; cdecl;
  end;

  [JavaSignature('org/opencv/android/CameraBridgeViewBase$ListItemAccessor')]
  JCameraBridgeViewBase_ListItemAccessor = interface(IJavaInstance)
    ['{120B1683-F95D-42B4-94FA-43228038482F}']
    function getWidth(obj: JObject): Integer; cdecl;//Deprecated
  end;
  TJCameraBridgeViewBase_ListItemAccessor = class(TJavaGenericImport<JCameraBridgeViewBase_ListItemAccessorClass, JCameraBridgeViewBase_ListItemAccessor>) end;

  JCameraGLSurfaceViewClass = interface(JGLSurfaceViewClass)
    ['{2CA60D5B-9E8F-4538-8975-235CEF72E646}']
    {class} function init(context: JContext; attrs: JAttributeSet): JCameraGLSurfaceView; cdecl;
    {class} procedure enableView; cdecl;//Deprecated
    {class} function getCameraTextureListener: JCameraGLSurfaceView_CameraTextureListener; cdecl;//Deprecated
    {class} procedure onPause; cdecl;//Deprecated
    {class} procedure surfaceCreated(holder: JSurfaceHolder); cdecl;
    {class} procedure surfaceDestroyed(holder: JSurfaceHolder); cdecl;
  end;

  [JavaSignature('org/opencv/android/CameraGLSurfaceView')]
  JCameraGLSurfaceView = interface(JGLSurfaceView)
    ['{49A7AA77-05C5-48DF-8EEB-19DBED070B3D}']
    procedure disableView; cdecl;//Deprecated
    procedure onResume; cdecl;//Deprecated
    procedure setCameraIndex(cameraIndex: Integer); cdecl;
    procedure setCameraTextureListener(texListener: JCameraGLSurfaceView_CameraTextureListener); cdecl;
    procedure setMaxCameraPreviewSize(maxWidth: Integer; maxHeight: Integer); cdecl;//Deprecated
    procedure surfaceChanged(holder: JSurfaceHolder; format: Integer; w: Integer; h: Integer); cdecl;
  end;
  TJCameraGLSurfaceView = class(TJavaGenericImport<JCameraGLSurfaceViewClass, JCameraGLSurfaceView>) end;

  JCameraGLSurfaceView_CameraTextureListenerClass = interface(IJavaClass)
    ['{E2263BAC-9D12-4241-82CD-ECFA74C67A20}']
    {class} function onCameraTexture(texIn: Integer; texOut: Integer; width: Integer; height: Integer): Boolean; cdecl;
    {class} procedure onCameraViewStarted(width: Integer; height: Integer); cdecl;
  end;

  [JavaSignature('org/opencv/android/CameraGLSurfaceView$CameraTextureListener')]
  JCameraGLSurfaceView_CameraTextureListener = interface(IJavaInstance)
    ['{BD94BADE-D19E-4ADF-A5A5-B5B27351CB24}']
    procedure onCameraViewStopped; cdecl;
  end;
  TJCameraGLSurfaceView_CameraTextureListener = class(TJavaGenericImport<JCameraGLSurfaceView_CameraTextureListenerClass, JCameraGLSurfaceView_CameraTextureListener>) end;

  JCameraRendererClass = interface(JCameraGLRendererBaseClass)
    ['{6141EEE3-1131-4B07-821F-2069274F01E8}']
    {class} function _GetLOGTAG: JString; cdecl;
    {class} procedure setCameraPreviewSize(width: Integer; height: Integer); cdecl;
    {class} property LOGTAG: JString read _GetLOGTAG;
  end;

  [JavaSignature('org/opencv/android/CameraRenderer')]
  JCameraRenderer = interface(JCameraGLRendererBase)
    ['{D74168FC-FC8D-41B4-800F-D948FA67DC52}']
  end;
  TJCameraRenderer = class(TJavaGenericImport<JCameraRendererClass, JCameraRenderer>) end;

  JFpsMeterClass = interface(JObjectClass)
    ['{8FEA30E0-4CC1-4496-90C6-A1969DFCD59C}']
    {class} function init: JFpsMeter; cdecl;
    {class} procedure draw(canvas: JCanvas; offsetx: Single; offsety: Single); cdecl;
    {class} procedure measure; cdecl;
    {class} procedure setResolution(width: Integer; height: Integer); cdecl;
  end;

  [JavaSignature('org/opencv/android/FpsMeter')]
  JFpsMeter = interface(JObject)
    ['{F2B9FC11-16E1-4F1B-A11A-6D53583B4234}']
  end;
  TJFpsMeter = class(TJavaGenericImport<JFpsMeterClass, JFpsMeter>) end;

  JInstallCallbackInterfaceClass = interface(IJavaClass)
    ['{2EAF74C4-C2BF-4707-A059-C87B02676B33}']
    {class} function _GetINSTALLATION_PROGRESS: Integer; cdecl;
    {class} function _GetNEW_INSTALLATION: Integer; cdecl;
    {class} procedure cancel; cdecl;
    {class} procedure wait_install; cdecl;
    {class} property INSTALLATION_PROGRESS: Integer read _GetINSTALLATION_PROGRESS;
    {class} property NEW_INSTALLATION: Integer read _GetNEW_INSTALLATION;
  end;

  [JavaSignature('org/opencv/android/InstallCallbackInterface')]
  JInstallCallbackInterface = interface(IJavaInstance)
    ['{D8D15620-91D4-4CFB-A5D2-D3D1F6433B43}']
    function getPackageName: JString; cdecl;
    procedure install; cdecl;
  end;
  TJInstallCallbackInterface = class(TJavaGenericImport<JInstallCallbackInterfaceClass, JInstallCallbackInterface>) end;

  JJavaCamera2ViewClass = interface(JCameraBridgeViewBaseClass)
    ['{A4F0DB87-FAA1-4D12-BC34-35C45EA70DE4}']
    {class} function init(context: JContext; cameraId: Integer): JJavaCamera2View; cdecl; overload;
    {class} function init(context: JContext; attrs: JAttributeSet): JJavaCamera2View; cdecl; overload;
  end;

  [JavaSignature('org/opencv/android/JavaCamera2View')]
  JJavaCamera2View = interface(JCameraBridgeViewBase)
    ['{12769DA2-DA6D-4007-9E82-996967393C94}']
  end;
  TJJavaCamera2View = class(TJavaGenericImport<JJavaCamera2ViewClass, JJavaCamera2View>) end;

  JJavaCamera2View_JavaCameraSizeAccessorClass = interface(JObjectClass)
    ['{8C01A6E7-CFE3-4268-9D5E-B04FF82A0DBE}']
    {class} function init: JJavaCamera2View_JavaCameraSizeAccessor; cdecl;
    {class} function getHeight(obj: JObject): Integer; cdecl;//Deprecated
    {class} function getWidth(obj: JObject): Integer; cdecl;//Deprecated
  end;

  [JavaSignature('org/opencv/android/JavaCamera2View$JavaCameraSizeAccessor')]
  JJavaCamera2View_JavaCameraSizeAccessor = interface(JObject)
    ['{5F0EB793-9C21-45DE-A3EA-4E4695D41602}']
  end;
  TJJavaCamera2View_JavaCameraSizeAccessor = class(TJavaGenericImport<JJavaCamera2View_JavaCameraSizeAccessorClass, JJavaCamera2View_JavaCameraSizeAccessor>) end;

  JJavaCameraViewClass = interface(JCameraBridgeViewBaseClass)
    ['{D909EBA7-D824-4CCE-91DA-559244A5B03C}']
    {class} function init(context: JContext; cameraId: Integer): JJavaCameraView; cdecl; overload;
    {class} function init(context: JContext; attrs: JAttributeSet): JJavaCameraView; cdecl; overload;
  end;

  [JavaSignature('org/opencv/android/JavaCameraView')]
  JJavaCameraView = interface(JCameraBridgeViewBase)
    ['{59A0166B-34E5-42F3-BAD4-6BE5C4BB946F}']
    procedure onPreviewFrame(frame: TJavaArray<Byte>; arg1: JCamera); cdecl;//Deprecated
  end;
  TJJavaCameraView = class(TJavaGenericImport<JJavaCameraViewClass, JJavaCameraView>) end;

  JJavaCameraView_JavaCameraSizeAccessorClass = interface(JObjectClass)
    ['{CA3BB125-F1BC-4175-A95D-0B128BC90D07}']
    {class} function init: JJavaCameraView_JavaCameraSizeAccessor; cdecl;
    {class} function getHeight(obj: JObject): Integer; cdecl;//Deprecated
  end;

  [JavaSignature('org/opencv/android/JavaCameraView$JavaCameraSizeAccessor')]
  JJavaCameraView_JavaCameraSizeAccessor = interface(JObject)
    ['{31E669A4-1386-4500-A999-54A2B65853BF}']
    function getWidth(obj: JObject): Integer; cdecl;
  end;
  TJJavaCameraView_JavaCameraSizeAccessor = class(TJavaGenericImport<JJavaCameraView_JavaCameraSizeAccessorClass, JJavaCameraView_JavaCameraSizeAccessor>) end;

  JLoaderCallbackInterfaceClass = interface(IJavaClass)
    ['{B68F097D-9805-452A-9583-995291FBC4DA}']
    {class} function _GetINCOMPATIBLE_MANAGER_VERSION: Integer; cdecl;
    {class} function _GetINIT_FAILED: Integer; cdecl;
    {class} function _GetINSTALL_CANCELED: Integer; cdecl;
    {class} function _GetMARKET_ERROR: Integer; cdecl;
    {class} function _GetSUCCESS: Integer; cdecl;
    {class} procedure onManagerConnected(status: Integer); cdecl;
    {class} procedure onPackageInstall(operation: Integer; callback: JInstallCallbackInterface); cdecl;
    {class} property INCOMPATIBLE_MANAGER_VERSION: Integer read _GetINCOMPATIBLE_MANAGER_VERSION;
    {class} property INIT_FAILED: Integer read _GetINIT_FAILED;
    {class} property INSTALL_CANCELED: Integer read _GetINSTALL_CANCELED;
    {class} property MARKET_ERROR: Integer read _GetMARKET_ERROR;
    {class} property SUCCESS: Integer read _GetSUCCESS;
  end;

  [JavaSignature('org/opencv/android/LoaderCallbackInterface')]
  JLoaderCallbackInterface = interface(IJavaInstance)
    ['{CC2221C0-2A01-447D-A098-1FB3BDBFD557}']
  end;
  TJLoaderCallbackInterface = class(TJavaGenericImport<JLoaderCallbackInterfaceClass, JLoaderCallbackInterface>) end;

  JOpenCVLoaderClass = interface(JObjectClass)
    ['{2D4206BA-4159-4DD5-B084-16C331F08BFB}']
    {class} function _GetOPENCV_VERSION: JString; cdecl;
    {class} function _GetOPENCV_VERSION_2_4_10: JString; cdecl;
    {class} function _GetOPENCV_VERSION_2_4_11: JString; cdecl;
    {class} function _GetOPENCV_VERSION_2_4_12: JString; cdecl;
    {class} function _GetOPENCV_VERSION_2_4_13: JString; cdecl;
    {class} function _GetOPENCV_VERSION_2_4_2: JString; cdecl;
    {class} function _GetOPENCV_VERSION_2_4_3: JString; cdecl;
    {class} function _GetOPENCV_VERSION_2_4_4: JString; cdecl;
    {class} function _GetOPENCV_VERSION_2_4_5: JString; cdecl;
    {class} function _GetOPENCV_VERSION_2_4_6: JString; cdecl;
    {class} function _GetOPENCV_VERSION_2_4_7: JString; cdecl;
    {class} function _GetOPENCV_VERSION_2_4_8: JString; cdecl;
    {class} function _GetOPENCV_VERSION_2_4_9: JString; cdecl;
    {class} function _GetOPENCV_VERSION_3_0_0: JString; cdecl;
    {class} function _GetOPENCV_VERSION_3_1_0: JString; cdecl;
    {class} function _GetOPENCV_VERSION_3_2_0: JString; cdecl;
    {class} function _GetOPENCV_VERSION_3_3_0: JString; cdecl;
    {class} function _GetOPENCV_VERSION_3_4_0: JString; cdecl;
    {class} function init: JOpenCVLoader; cdecl;
    {class} function initAsync(Version: JString; AppContext: JContext; Callback: JLoaderCallbackInterface): Boolean; cdecl;
    {class} function initDebug: Boolean; cdecl; overload;
    {class} function initDebug(InitCuda: Boolean): Boolean; cdecl; overload;
    {class} property OPENCV_VERSION: JString read _GetOPENCV_VERSION;
    {class} property OPENCV_VERSION_2_4_10: JString read _GetOPENCV_VERSION_2_4_10;
    {class} property OPENCV_VERSION_2_4_11: JString read _GetOPENCV_VERSION_2_4_11;
    {class} property OPENCV_VERSION_2_4_12: JString read _GetOPENCV_VERSION_2_4_12;
    {class} property OPENCV_VERSION_2_4_13: JString read _GetOPENCV_VERSION_2_4_13;
    {class} property OPENCV_VERSION_2_4_2: JString read _GetOPENCV_VERSION_2_4_2;
    {class} property OPENCV_VERSION_2_4_3: JString read _GetOPENCV_VERSION_2_4_3;
    {class} property OPENCV_VERSION_2_4_4: JString read _GetOPENCV_VERSION_2_4_4;
    {class} property OPENCV_VERSION_2_4_5: JString read _GetOPENCV_VERSION_2_4_5;
    {class} property OPENCV_VERSION_2_4_6: JString read _GetOPENCV_VERSION_2_4_6;
    {class} property OPENCV_VERSION_2_4_7: JString read _GetOPENCV_VERSION_2_4_7;
    {class} property OPENCV_VERSION_2_4_8: JString read _GetOPENCV_VERSION_2_4_8;
    {class} property OPENCV_VERSION_2_4_9: JString read _GetOPENCV_VERSION_2_4_9;
    {class} property OPENCV_VERSION_3_0_0: JString read _GetOPENCV_VERSION_3_0_0;
    {class} property OPENCV_VERSION_3_1_0: JString read _GetOPENCV_VERSION_3_1_0;
    {class} property OPENCV_VERSION_3_2_0: JString read _GetOPENCV_VERSION_3_2_0;
    {class} property OPENCV_VERSION_3_3_0: JString read _GetOPENCV_VERSION_3_3_0;
    {class} property OPENCV_VERSION_3_4_0: JString read _GetOPENCV_VERSION_3_4_0;
  end;

  [JavaSignature('org/opencv/android/OpenCVLoader')]
  JOpenCVLoader = interface(JObject)
    ['{3B8FA69F-37FC-4638-AC9C-0A65EBB56F58}']
  end;
  TJOpenCVLoader = class(TJavaGenericImport<JOpenCVLoaderClass, JOpenCVLoader>) end;

  Jandroid_UtilsClass = interface(JObjectClass)
    ['{BE56FEC8-DC13-4973-B958-19F3505AB138}']
    {class} function init: Jandroid_Utils; cdecl;
    {class} procedure bitmapToMat(bmp: JBitmap; mat: JMat; unPremultiplyAlpha: Boolean); cdecl; overload;//Deprecated
    {class} procedure bitmapToMat(bmp: JBitmap; mat: JMat); cdecl; overload;//Deprecated
    {class} function exportResource(context: JContext; resourceId: Integer): JString; cdecl; overload;//Deprecated
    {class} function exportResource(context: JContext; resourceId: Integer; dirname: JString): JString; cdecl; overload;//Deprecated
    {class} function loadResource(context: JContext; resourceId: Integer): JMat; cdecl; overload;//Deprecated
    {class} function loadResource(context: JContext; resourceId: Integer; flags: Integer): JMat; cdecl; overload;//Deprecated
    {class} procedure matToBitmap(mat: JMat; bmp: JBitmap; premultiplyAlpha: Boolean); cdecl; overload;//Deprecated
    {class} procedure matToBitmap(mat: JMat; bmp: JBitmap); cdecl; overload;
  end;

  [JavaSignature('org/opencv/android/Utils')]
  Jandroid_Utils = interface(JObject)
    ['{E9EBB2F6-1941-4CB5-BA21-46B2C7C2D6BC}']
  end;
  TJandroid_Utils = class(TJavaGenericImport<Jandroid_UtilsClass, Jandroid_Utils>) end;

  JCalib3dClass = interface(JObjectClass)
    ['{BAF50AF8-0481-40D0-96E8-4BC000196824}']
    {class} function _GetCALIB_CB_ACCURACY: Integer; cdecl;
    {class} function _GetCALIB_CB_ADAPTIVE_THRESH: Integer; cdecl;
    {class} function _GetCALIB_CB_ASYMMETRIC_GRID: Integer; cdecl;
    {class} function _GetCALIB_CB_CLUSTERING: Integer; cdecl;
    {class} function _GetCALIB_CB_EXHAUSTIVE: Integer; cdecl;
    {class} function _GetCALIB_CB_FAST_CHECK: Integer; cdecl;
    {class} function _GetCALIB_CB_FILTER_QUADS: Integer; cdecl;
    {class} function _GetCALIB_CB_NORMALIZE_IMAGE: Integer; cdecl;
    {class} function _GetCALIB_CB_SYMMETRIC_GRID: Integer; cdecl;
    {class} function _GetCALIB_FIX_ASPECT_RATIO: Integer; cdecl;
    {class} function _GetCALIB_FIX_FOCAL_LENGTH: Integer; cdecl;
    {class} function _GetCALIB_FIX_INTRINSIC: Integer; cdecl;
    {class} function _GetCALIB_FIX_K1: Integer; cdecl;
    {class} function _GetCALIB_FIX_K2: Integer; cdecl;
    {class} function _GetCALIB_FIX_K3: Integer; cdecl;
    {class} function _GetCALIB_FIX_K4: Integer; cdecl;
    {class} function _GetCALIB_FIX_K5: Integer; cdecl;
    {class} function _GetCALIB_FIX_K6: Integer; cdecl;
    {class} function _GetCALIB_FIX_PRINCIPAL_POINT: Integer; cdecl;
    {class} function _GetCALIB_FIX_S1_S2_S3_S4: Integer; cdecl;
    {class} function _GetCALIB_FIX_TANGENT_DIST: Integer; cdecl;
    {class} function _GetCALIB_FIX_TAUX_TAUY: Integer; cdecl;
    {class} function _GetCALIB_HAND_EYE_ANDREFF: Integer; cdecl;
    {class} function _GetCALIB_HAND_EYE_DANIILIDIS: Integer; cdecl;
    {class} function _GetCALIB_HAND_EYE_HORAUD: Integer; cdecl;
    {class} function _GetCALIB_HAND_EYE_PARK: Integer; cdecl;
    {class} function _GetCALIB_HAND_EYE_TSAI: Integer; cdecl;
    {class} function _GetCALIB_NINTRINSIC: Integer; cdecl;
    {class} function _GetCALIB_RATIONAL_MODEL: Integer; cdecl;
    {class} function _GetCALIB_SAME_FOCAL_LENGTH: Integer; cdecl;
    {class} function _GetCALIB_THIN_PRISM_MODEL: Integer; cdecl;
    {class} function _GetCALIB_TILTED_MODEL: Integer; cdecl;
    {class} function _GetCALIB_USE_EXTRINSIC_GUESS: Integer; cdecl;
    {class} function _GetCALIB_USE_INTRINSIC_GUESS: Integer; cdecl;
    {class} function _GetCALIB_USE_LU: Integer; cdecl;
    {class} function _GetCALIB_USE_QR: Integer; cdecl;
    {class} function _GetCALIB_ZERO_DISPARITY: Integer; cdecl;
    {class} function _GetCALIB_ZERO_TANGENT_DIST: Integer; cdecl;
    {class} function _GetCV_DLS: Integer; cdecl;
    {class} function _GetCV_EPNP: Integer; cdecl;
    {class} function _GetCV_ITERATIVE: Integer; cdecl;
    {class} function _GetCV_P3P: Integer; cdecl;
    {class} function _GetCirclesGridFinderParameters_ASYMMETRIC_GRID: Integer; cdecl;
    {class} function _GetCirclesGridFinderParameters_SYMMETRIC_GRID: Integer; cdecl;
    {class} function _GetCvLevMarq_CALC_J: Integer; cdecl;
    {class} function _GetCvLevMarq_CHECK_ERR: Integer; cdecl;
    {class} function _GetCvLevMarq_DONE: Integer; cdecl;
    {class} function _GetCvLevMarq_STARTED: Integer; cdecl;
    {class} function _GetFM_7POINT: Integer; cdecl;
    {class} function _GetFM_8POINT: Integer; cdecl;
    {class} function _GetFM_LMEDS: Integer; cdecl;
    {class} function _GetFM_RANSAC: Integer; cdecl;
    {class} function _GetLMEDS: Integer; cdecl;
    {class} function _GetPROJ_SPHERICAL_EQRECT: Integer; cdecl;
    {class} function _GetPROJ_SPHERICAL_ORTHO: Integer; cdecl;
    {class} function _GetRANSAC: Integer; cdecl;
    {class} function _GetRHO: Integer; cdecl;
    {class} function _GetSOLVEPNP_AP3P: Integer; cdecl;
    {class} function _GetSOLVEPNP_DLS: Integer; cdecl;
    {class} function _GetSOLVEPNP_EPNP: Integer; cdecl;
    {class} function _GetSOLVEPNP_IPPE: Integer; cdecl;
    {class} function _GetSOLVEPNP_IPPE_SQUARE: Integer; cdecl;
    {class} function _GetSOLVEPNP_ITERATIVE: Integer; cdecl;
    {class} function _GetSOLVEPNP_MAX_COUNT: Integer; cdecl;
    {class} function _GetSOLVEPNP_P3P: Integer; cdecl;
    {class} function _GetSOLVEPNP_UPNP: Integer; cdecl;
    {class} function _Getfisheye_CALIB_CHECK_COND: Integer; cdecl;
    {class} function _Getfisheye_CALIB_FIX_INTRINSIC: Integer; cdecl;
    {class} function _Getfisheye_CALIB_FIX_K1: Integer; cdecl;
    {class} function _Getfisheye_CALIB_FIX_K2: Integer; cdecl;
    {class} function _Getfisheye_CALIB_FIX_K3: Integer; cdecl;
    {class} function _Getfisheye_CALIB_FIX_K4: Integer; cdecl;
    {class} function _Getfisheye_CALIB_FIX_PRINCIPAL_POINT: Integer; cdecl;
    {class} function _Getfisheye_CALIB_FIX_SKEW: Integer; cdecl;
    {class} function _Getfisheye_CALIB_RECOMPUTE_EXTRINSIC: Integer; cdecl;
    {class} function _Getfisheye_CALIB_USE_INTRINSIC_GUESS: Integer; cdecl;
    {class} function init: JCalib3d; cdecl;
    {class} function RQDecomp3x3(src: JMat; mtxR: JMat; mtxQ: JMat; Qx: JMat; Qy: JMat; Qz: JMat): TJavaArray<Double>; cdecl; overload;//Deprecated
    {class} function RQDecomp3x3(src: JMat; mtxR: JMat; mtxQ: JMat; Qx: JMat; Qy: JMat): TJavaArray<Double>; cdecl; overload;//Deprecated
    {class} function RQDecomp3x3(src: JMat; mtxR: JMat; mtxQ: JMat; Qx: JMat): TJavaArray<Double>; cdecl; overload;//Deprecated
    {class} function RQDecomp3x3(src: JMat; mtxR: JMat; mtxQ: JMat): TJavaArray<Double>; cdecl; overload;//Deprecated
    {class} procedure Rodrigues(src: JMat; dst: JMat; jacobian: JMat); cdecl; overload;//Deprecated
    {class} procedure Rodrigues(src: JMat; dst: JMat); cdecl; overload;//Deprecated
    {class} function calibrateCamera(objectPoints: JList; imagePoints: JList; imageSize: Jcore_Size; cameraMatrix: JMat; distCoeffs: JMat; rvecs: JList; tvecs: JList; flags: Integer; criteria: JTermCriteria): Double; cdecl; overload;//Deprecated
    {class} function calibrateCamera(objectPoints: JList; imagePoints: JList; imageSize: Jcore_Size; cameraMatrix: JMat; distCoeffs: JMat; rvecs: JList; tvecs: JList; flags: Integer): Double; cdecl; overload;//Deprecated
    {class} function calibrateCamera(objectPoints: JList; imagePoints: JList; imageSize: Jcore_Size; cameraMatrix: JMat; distCoeffs: JMat; rvecs: JList; tvecs: JList): Double; cdecl; overload;//Deprecated
    {class} function calibrateCameraExtended(objectPoints: JList; imagePoints: JList; imageSize: Jcore_Size; cameraMatrix: JMat; distCoeffs: JMat; rvecs: JList; tvecs: JList; stdDeviationsIntrinsics: JMat; stdDeviationsExtrinsics: JMat; perViewErrors: JMat; flags: Integer; criteria: JTermCriteria): Double; cdecl; overload;//Deprecated
    {class} function calibrateCameraExtended(objectPoints: JList; imagePoints: JList; imageSize: Jcore_Size; cameraMatrix: JMat; distCoeffs: JMat; rvecs: JList; tvecs: JList; stdDeviationsIntrinsics: JMat; stdDeviationsExtrinsics: JMat; perViewErrors: JMat; flags: Integer): Double; cdecl; overload;//Deprecated
    {class} function calibrateCameraExtended(objectPoints: JList; imagePoints: JList; imageSize: Jcore_Size; cameraMatrix: JMat; distCoeffs: JMat; rvecs: JList; tvecs: JList; stdDeviationsIntrinsics: JMat; stdDeviationsExtrinsics: JMat; perViewErrors: JMat): Double; cdecl; overload;//Deprecated
    {class} function calibrateCameraRO(objectPoints: JList; imagePoints: JList; imageSize: Jcore_Size; iFixedPoint: Integer; cameraMatrix: JMat; distCoeffs: JMat; rvecs: JList; tvecs: JList; newObjPoints: JMat; flags: Integer; criteria: JTermCriteria): Double; cdecl; overload;//Deprecated
    {class} function calibrateCameraRO(objectPoints: JList; imagePoints: JList; imageSize: Jcore_Size; iFixedPoint: Integer; cameraMatrix: JMat; distCoeffs: JMat; rvecs: JList; tvecs: JList; newObjPoints: JMat; flags: Integer): Double; cdecl; overload;//Deprecated
    {class} function calibrateCameraRO(objectPoints: JList; imagePoints: JList; imageSize: Jcore_Size; iFixedPoint: Integer; cameraMatrix: JMat; distCoeffs: JMat; rvecs: JList; tvecs: JList; newObjPoints: JMat): Double; cdecl; overload;//Deprecated
    {class} function calibrateCameraROExtended(objectPoints: JList; imagePoints: JList; imageSize: Jcore_Size; iFixedPoint: Integer; cameraMatrix: JMat; distCoeffs: JMat; rvecs: JList; tvecs: JList; newObjPoints: JMat; stdDeviationsIntrinsics: JMat; stdDeviationsExtrinsics: JMat; stdDeviationsObjPoints: JMat; perViewErrors: JMat; flags: Integer; criteria: JTermCriteria): Double; cdecl; overload;//Deprecated
    {class} function calibrateCameraROExtended(objectPoints: JList; imagePoints: JList; imageSize: Jcore_Size; iFixedPoint: Integer; cameraMatrix: JMat; distCoeffs: JMat; rvecs: JList; tvecs: JList; newObjPoints: JMat; stdDeviationsIntrinsics: JMat; stdDeviationsExtrinsics: JMat; stdDeviationsObjPoints: JMat; perViewErrors: JMat; flags: Integer): Double; cdecl; overload;//Deprecated
    {class} function calibrateCameraROExtended(objectPoints: JList; imagePoints: JList; imageSize: Jcore_Size; iFixedPoint: Integer; cameraMatrix: JMat; distCoeffs: JMat; rvecs: JList; tvecs: JList; newObjPoints: JMat; stdDeviationsIntrinsics: JMat; stdDeviationsExtrinsics: JMat; stdDeviationsObjPoints: JMat; perViewErrors: JMat): Double; cdecl; overload;//Deprecated
    {class} procedure calibrateHandEye(R_gripper2base: JList; t_gripper2base: JList; R_target2cam: JList; t_target2cam: JList; R_cam2gripper: JMat; t_cam2gripper: JMat; method: Integer); cdecl; overload;//Deprecated
    {class} procedure calibrateHandEye(R_gripper2base: JList; t_gripper2base: JList; R_target2cam: JList; t_target2cam: JList; R_cam2gripper: JMat; t_cam2gripper: JMat); cdecl; overload;
    {class} procedure calibrationMatrixValues(cameraMatrix: JMat; imageSize: Jcore_Size; apertureWidth: Double; apertureHeight: Double; fovx: TJavaArray<Double>; fovy: TJavaArray<Double>; focalLength: TJavaArray<Double>; principalPoint: Jcore_Point; aspectRatio: TJavaArray<Double>); cdecl;
    {class} function checkChessboard(img: JMat; size: Jcore_Size): Boolean; cdecl;
    {class} procedure composeRT(rvec1: JMat; tvec1: JMat; rvec2: JMat; tvec2: JMat; rvec3: JMat; tvec3: JMat; dr3dr1: JMat; dr3dt1: JMat; dr3dr2: JMat; dr3dt2: JMat; dt3dr1: JMat; dt3dt1: JMat; dt3dr2: JMat; dt3dt2: JMat); cdecl; overload;
    {class} procedure composeRT(rvec1: JMat; tvec1: JMat; rvec2: JMat; tvec2: JMat; rvec3: JMat; tvec3: JMat; dr3dr1: JMat; dr3dt1: JMat; dr3dr2: JMat; dr3dt2: JMat; dt3dr1: JMat; dt3dt1: JMat; dt3dr2: JMat); cdecl; overload;
    {class} procedure composeRT(rvec1: JMat; tvec1: JMat; rvec2: JMat; tvec2: JMat; rvec3: JMat; tvec3: JMat; dr3dr1: JMat; dr3dt1: JMat; dr3dr2: JMat; dr3dt2: JMat; dt3dr1: JMat; dt3dt1: JMat); cdecl; overload;
    {class} procedure composeRT(rvec1: JMat; tvec1: JMat; rvec2: JMat; tvec2: JMat; rvec3: JMat; tvec3: JMat; dr3dr1: JMat; dr3dt1: JMat; dr3dr2: JMat; dr3dt2: JMat; dt3dr1: JMat); cdecl; overload;
    {class} procedure composeRT(rvec1: JMat; tvec1: JMat; rvec2: JMat; tvec2: JMat; rvec3: JMat; tvec3: JMat; dr3dr1: JMat; dr3dt1: JMat; dr3dr2: JMat; dr3dt2: JMat); cdecl; overload;
    {class} procedure composeRT(rvec1: JMat; tvec1: JMat; rvec2: JMat; tvec2: JMat; rvec3: JMat; tvec3: JMat; dr3dr1: JMat; dr3dt1: JMat; dr3dr2: JMat); cdecl; overload;
    {class} procedure composeRT(rvec1: JMat; tvec1: JMat; rvec2: JMat; tvec2: JMat; rvec3: JMat; tvec3: JMat; dr3dr1: JMat; dr3dt1: JMat); cdecl; overload;
    {class} procedure composeRT(rvec1: JMat; tvec1: JMat; rvec2: JMat; tvec2: JMat; rvec3: JMat; tvec3: JMat; dr3dr1: JMat); cdecl; overload;
    {class} procedure composeRT(rvec1: JMat; tvec1: JMat; rvec2: JMat; tvec2: JMat; rvec3: JMat; tvec3: JMat); cdecl; overload;
    {class} procedure computeCorrespondEpilines(points: JMat; whichImage: Integer; F: JMat; lines: JMat); cdecl;
    {class} procedure convertPointsFromHomogeneous(src: JMat; dst: JMat); cdecl;
    {class} procedure convertPointsToHomogeneous(src: JMat; dst: JMat); cdecl;
    {class} procedure correctMatches(F: JMat; points1: JMat; points2: JMat; newPoints1: JMat; newPoints2: JMat); cdecl;
    {class} procedure decomposeEssentialMat(E: JMat; R1: JMat; R2: JMat; t: JMat); cdecl;
    {class} function decomposeHomographyMat(H: JMat; K: JMat; rotations: JList; translations: JList; normals: JList): Integer; cdecl;
    {class} procedure decomposeProjectionMatrix(projMatrix: JMat; cameraMatrix: JMat; rotMatrix: JMat; transVect: JMat; rotMatrixX: JMat; rotMatrixY: JMat; rotMatrixZ: JMat; eulerAngles: JMat); cdecl; overload;
    {class} procedure decomposeProjectionMatrix(projMatrix: JMat; cameraMatrix: JMat; rotMatrix: JMat; transVect: JMat; rotMatrixX: JMat; rotMatrixY: JMat; rotMatrixZ: JMat); cdecl; overload;
    {class} procedure decomposeProjectionMatrix(projMatrix: JMat; cameraMatrix: JMat; rotMatrix: JMat; transVect: JMat; rotMatrixX: JMat; rotMatrixY: JMat); cdecl; overload;
    {class} procedure decomposeProjectionMatrix(projMatrix: JMat; cameraMatrix: JMat; rotMatrix: JMat; transVect: JMat; rotMatrixX: JMat); cdecl; overload;//Deprecated
    {class} procedure decomposeProjectionMatrix(projMatrix: JMat; cameraMatrix: JMat; rotMatrix: JMat; transVect: JMat); cdecl; overload;//Deprecated
    {class} procedure drawChessboardCorners(image: JMat; patternSize: Jcore_Size; corners: JMatOfPoint2f; patternWasFound: Boolean); cdecl;//Deprecated
    {class} procedure drawFrameAxes(image: JMat; cameraMatrix: JMat; distCoeffs: JMat; rvec: JMat; tvec: JMat; length: Single; thickness: Integer); cdecl; overload;//Deprecated
    {class} procedure drawFrameAxes(image: JMat; cameraMatrix: JMat; distCoeffs: JMat; rvec: JMat; tvec: JMat; length: Single); cdecl; overload;//Deprecated
    {class} function estimateAffine2D(from: JMat; to_: JMat; inliers: JMat; method: Integer; ransacReprojThreshold: Double; maxIters: Int64; confidence: Double; refineIters: Int64): JMat; cdecl; overload;//Deprecated
    {class} function estimateAffine2D(from: JMat; to_: JMat; inliers: JMat; method: Integer; ransacReprojThreshold: Double; maxIters: Int64; confidence: Double): JMat; cdecl; overload;//Deprecated
    {class} function estimateAffine2D(from: JMat; to_: JMat; inliers: JMat; method: Integer; ransacReprojThreshold: Double; maxIters: Int64): JMat; cdecl; overload;//Deprecated
    {class} function estimateAffine2D(from: JMat; to_: JMat; inliers: JMat; method: Integer; ransacReprojThreshold: Double): JMat; cdecl; overload;//Deprecated
    {class} function estimateAffine2D(from: JMat; to_: JMat; inliers: JMat; method: Integer): JMat; cdecl; overload;//Deprecated
    {class} function estimateAffine2D(from: JMat; to_: JMat; inliers: JMat): JMat; cdecl; overload;//Deprecated
    {class} function estimateAffine2D(from: JMat; to_: JMat): JMat; cdecl; overload;//Deprecated
    {class} function estimateAffine3D(src: JMat; dst: JMat; out_: JMat; inliers: JMat; ransacThreshold: Double; confidence: Double): Integer; cdecl; overload;//Deprecated
    {class} function estimateAffine3D(src: JMat; dst: JMat; out_: JMat; inliers: JMat; ransacThreshold: Double): Integer; cdecl; overload;//Deprecated
    {class} function estimateAffine3D(src: JMat; dst: JMat; out_: JMat; inliers: JMat): Integer; cdecl; overload;//Deprecated
    {class} function estimateAffinePartial2D(from: JMat; to_: JMat; inliers: JMat; method: Integer; ransacReprojThreshold: Double; maxIters: Int64; confidence: Double; refineIters: Int64): JMat; cdecl; overload;//Deprecated
    {class} function estimateAffinePartial2D(from: JMat; to_: JMat; inliers: JMat; method: Integer; ransacReprojThreshold: Double; maxIters: Int64; confidence: Double): JMat; cdecl; overload;//Deprecated
    {class} function estimateAffinePartial2D(from: JMat; to_: JMat; inliers: JMat; method: Integer; ransacReprojThreshold: Double; maxIters: Int64): JMat; cdecl; overload;
    {class} function estimateAffinePartial2D(from: JMat; to_: JMat; inliers: JMat; method: Integer; ransacReprojThreshold: Double): JMat; cdecl; overload;
    {class} function estimateAffinePartial2D(from: JMat; to_: JMat; inliers: JMat; method: Integer): JMat; cdecl; overload;
    {class} function estimateAffinePartial2D(from: JMat; to_: JMat; inliers: JMat): JMat; cdecl; overload;
    {class} function estimateAffinePartial2D(from: JMat; to_: JMat): JMat; cdecl; overload;
    {class} procedure filterHomographyDecompByVisibleRefpoints(rotations: JList; normals: JList; beforePoints: JMat; afterPoints: JMat; possibleSolutions: JMat; pointsMask: JMat); cdecl; overload;
    {class} procedure filterHomographyDecompByVisibleRefpoints(rotations: JList; normals: JList; beforePoints: JMat; afterPoints: JMat; possibleSolutions: JMat); cdecl; overload;
    {class} procedure filterSpeckles(img: JMat; newVal: Double; maxSpeckleSize: Integer; maxDiff: Double; buf: JMat); cdecl; overload;
    {class} procedure filterSpeckles(img: JMat; newVal: Double; maxSpeckleSize: Integer; maxDiff: Double); cdecl; overload;
    {class} function find4QuadCornerSubpix(img: JMat; corners: JMat; region_size: Jcore_Size): Boolean; cdecl;
    {class} function findChessboardCorners(image: JMat; patternSize: Jcore_Size; corners: JMatOfPoint2f; flags: Integer): Boolean; cdecl; overload;
    {class} function findChessboardCorners(image: JMat; patternSize: Jcore_Size; corners: JMatOfPoint2f): Boolean; cdecl; overload;
    {class} function findChessboardCornersSB(image: JMat; patternSize: Jcore_Size; corners: JMat; flags: Integer): Boolean; cdecl; overload;
    {class} function findChessboardCornersSB(image: JMat; patternSize: Jcore_Size; corners: JMat): Boolean; cdecl; overload;
    {class} function findCirclesGrid(image: JMat; patternSize: Jcore_Size; centers: JMat; flags: Integer): Boolean; cdecl; overload;
    {class} function findCirclesGrid(image: JMat; patternSize: Jcore_Size; centers: JMat): Boolean; cdecl; overload;
    {class} function findEssentialMat(points1: JMat; points2: JMat; cameraMatrix: JMat; method: Integer; prob: Double; threshold: Double; mask: JMat): JMat; cdecl; overload;
    {class} function findEssentialMat(points1: JMat; points2: JMat; cameraMatrix: JMat; method: Integer; prob: Double; threshold: Double): JMat; cdecl; overload;
    {class} function findEssentialMat(points1: JMat; points2: JMat; cameraMatrix: JMat; method: Integer; prob: Double): JMat; cdecl; overload;
    {class} function findEssentialMat(points1: JMat; points2: JMat; cameraMatrix: JMat; method: Integer): JMat; cdecl; overload;
    {class} function findEssentialMat(points1: JMat; points2: JMat; cameraMatrix: JMat): JMat; cdecl; overload;
    {class} function findEssentialMat(points1: JMat; points2: JMat; focal: Double; pp: Jcore_Point; method: Integer; prob: Double; threshold: Double; mask: JMat): JMat; cdecl; overload;
    {class} function findEssentialMat(points1: JMat; points2: JMat; focal: Double; pp: Jcore_Point; method: Integer; prob: Double; threshold: Double): JMat; cdecl; overload;
    {class} function findEssentialMat(points1: JMat; points2: JMat; focal: Double; pp: Jcore_Point; method: Integer; prob: Double): JMat; cdecl; overload;//Deprecated
    {class} function findEssentialMat(points1: JMat; points2: JMat; focal: Double; pp: Jcore_Point; method: Integer): JMat; cdecl; overload;//Deprecated
    {class} function findEssentialMat(points1: JMat; points2: JMat; focal: Double; pp: Jcore_Point): JMat; cdecl; overload;//Deprecated
    {class} function findEssentialMat(points1: JMat; points2: JMat; focal: Double): JMat; cdecl; overload;//Deprecated
    {class} function findEssentialMat(points1: JMat; points2: JMat): JMat; cdecl; overload;//Deprecated
    {class} function findFundamentalMat(points1: JMatOfPoint2f; points2: JMatOfPoint2f; method: Integer; ransacReprojThreshold: Double; confidence: Double; mask: JMat): JMat; cdecl; overload;//Deprecated
    {class} function findFundamentalMat(points1: JMatOfPoint2f; points2: JMatOfPoint2f; method: Integer; ransacReprojThreshold: Double; confidence: Double): JMat; cdecl; overload;//Deprecated
    {class} function findFundamentalMat(points1: JMatOfPoint2f; points2: JMatOfPoint2f; method: Integer; ransacReprojThreshold: Double): JMat; cdecl; overload;//Deprecated
    {class} function findFundamentalMat(points1: JMatOfPoint2f; points2: JMatOfPoint2f; method: Integer): JMat; cdecl; overload;//Deprecated
    {class} function findFundamentalMat(points1: JMatOfPoint2f; points2: JMatOfPoint2f): JMat; cdecl; overload;//Deprecated
    {class} function findHomography(srcPoints: JMatOfPoint2f; dstPoints: JMatOfPoint2f; method: Integer; ransacReprojThreshold: Double; mask: JMat; maxIters: Integer; confidence: Double): JMat; cdecl; overload;//Deprecated
    {class} function findHomography(srcPoints: JMatOfPoint2f; dstPoints: JMatOfPoint2f; method: Integer; ransacReprojThreshold: Double; mask: JMat; maxIters: Integer): JMat; cdecl; overload;//Deprecated
    {class} function findHomography(srcPoints: JMatOfPoint2f; dstPoints: JMatOfPoint2f; method: Integer; ransacReprojThreshold: Double; mask: JMat): JMat; cdecl; overload;//Deprecated
    {class} function findHomography(srcPoints: JMatOfPoint2f; dstPoints: JMatOfPoint2f; method: Integer; ransacReprojThreshold: Double): JMat; cdecl; overload;//Deprecated
    {class} function findHomography(srcPoints: JMatOfPoint2f; dstPoints: JMatOfPoint2f; method: Integer): JMat; cdecl; overload;//Deprecated
    {class} function findHomography(srcPoints: JMatOfPoint2f; dstPoints: JMatOfPoint2f): JMat; cdecl; overload;//Deprecated
    {class} function fisheye_calibrate(objectPoints: JList; imagePoints: JList; image_size: Jcore_Size; K: JMat; D: JMat; rvecs: JList; tvecs: JList; flags: Integer; criteria: JTermCriteria): Double; cdecl; overload;//Deprecated
    {class} function fisheye_calibrate(objectPoints: JList; imagePoints: JList; image_size: Jcore_Size; K: JMat; D: JMat; rvecs: JList; tvecs: JList; flags: Integer): Double; cdecl; overload;//Deprecated
    {class} function fisheye_calibrate(objectPoints: JList; imagePoints: JList; image_size: Jcore_Size; K: JMat; D: JMat; rvecs: JList; tvecs: JList): Double; cdecl; overload;//Deprecated
    {class} procedure fisheye_distortPoints(undistorted: JMat; distorted: JMat; K: JMat; D: JMat; alpha: Double); cdecl; overload;//Deprecated
    {class} procedure fisheye_distortPoints(undistorted: JMat; distorted: JMat; K: JMat; D: JMat); cdecl; overload;//Deprecated
    {class} procedure fisheye_estimateNewCameraMatrixForUndistortRectify(K: JMat; D: JMat; image_size: Jcore_Size; R: JMat; P: JMat; balance: Double; new_size: Jcore_Size; fov_scale: Double); cdecl; overload;//Deprecated
    {class} procedure fisheye_estimateNewCameraMatrixForUndistortRectify(K: JMat; D: JMat; image_size: Jcore_Size; R: JMat; P: JMat; balance: Double; new_size: Jcore_Size); cdecl; overload;//Deprecated
    {class} procedure fisheye_estimateNewCameraMatrixForUndistortRectify(K: JMat; D: JMat; image_size: Jcore_Size; R: JMat; P: JMat; balance: Double); cdecl; overload;
    {class} procedure fisheye_estimateNewCameraMatrixForUndistortRectify(K: JMat; D: JMat; image_size: Jcore_Size; R: JMat; P: JMat); cdecl; overload;
    {class} procedure fisheye_initUndistortRectifyMap(K: JMat; D: JMat; R: JMat; P: JMat; size: Jcore_Size; m1type: Integer; map1: JMat; map2: JMat); cdecl;
    {class} procedure fisheye_projectPoints(objectPoints: JMat; imagePoints: JMat; rvec: JMat; tvec: JMat; K: JMat; D: JMat; alpha: Double; jacobian: JMat); cdecl; overload;
    {class} procedure fisheye_projectPoints(objectPoints: JMat; imagePoints: JMat; rvec: JMat; tvec: JMat; K: JMat; D: JMat; alpha: Double); cdecl; overload;
    {class} procedure fisheye_projectPoints(objectPoints: JMat; imagePoints: JMat; rvec: JMat; tvec: JMat; K: JMat; D: JMat); cdecl; overload;
    {class} function fisheye_stereoCalibrate(objectPoints: JList; imagePoints1: JList; imagePoints2: JList; K1: JMat; D1: JMat; K2: JMat; D2: JMat; imageSize: Jcore_Size; R: JMat; T: JMat; flags: Integer; criteria: JTermCriteria): Double; cdecl; overload;
    {class} function fisheye_stereoCalibrate(objectPoints: JList; imagePoints1: JList; imagePoints2: JList; K1: JMat; D1: JMat; K2: JMat; D2: JMat; imageSize: Jcore_Size; R: JMat; T: JMat; flags: Integer): Double; cdecl; overload;
    {class} function fisheye_stereoCalibrate(objectPoints: JList; imagePoints1: JList; imagePoints2: JList; K1: JMat; D1: JMat; K2: JMat; D2: JMat; imageSize: Jcore_Size; R: JMat; T: JMat): Double; cdecl; overload;
    {class} procedure fisheye_stereoRectify(K1: JMat; D1: JMat; K2: JMat; D2: JMat; imageSize: Jcore_Size; R: JMat; tvec: JMat; R1: JMat; R2: JMat; P1: JMat; P2: JMat; Q: JMat; flags: Integer; newImageSize: Jcore_Size; balance: Double; fov_scale: Double); cdecl; overload;
    {class} procedure fisheye_stereoRectify(K1: JMat; D1: JMat; K2: JMat; D2: JMat; imageSize: Jcore_Size; R: JMat; tvec: JMat; R1: JMat; R2: JMat; P1: JMat; P2: JMat; Q: JMat; flags: Integer; newImageSize: Jcore_Size; balance: Double); cdecl; overload;
    {class} procedure fisheye_stereoRectify(K1: JMat; D1: JMat; K2: JMat; D2: JMat; imageSize: Jcore_Size; R: JMat; tvec: JMat; R1: JMat; R2: JMat; P1: JMat; P2: JMat; Q: JMat; flags: Integer; newImageSize: Jcore_Size); cdecl; overload;
    {class} procedure fisheye_stereoRectify(K1: JMat; D1: JMat; K2: JMat; D2: JMat; imageSize: Jcore_Size; R: JMat; tvec: JMat; R1: JMat; R2: JMat; P1: JMat; P2: JMat; Q: JMat; flags: Integer); cdecl; overload;
    {class} procedure fisheye_undistortImage(distorted: JMat; undistorted: JMat; K: JMat; D: JMat; Knew: JMat; new_size: Jcore_Size); cdecl; overload;
    {class} procedure fisheye_undistortImage(distorted: JMat; undistorted: JMat; K: JMat; D: JMat; Knew: JMat); cdecl; overload;
    {class} procedure fisheye_undistortImage(distorted: JMat; undistorted: JMat; K: JMat; D: JMat); cdecl; overload;
    {class} procedure fisheye_undistortPoints(distorted: JMat; undistorted: JMat; K: JMat; D: JMat; R: JMat; P: JMat); cdecl; overload;
    {class} procedure fisheye_undistortPoints(distorted: JMat; undistorted: JMat; K: JMat; D: JMat; R: JMat); cdecl; overload;
    {class} procedure fisheye_undistortPoints(distorted: JMat; undistorted: JMat; K: JMat; D: JMat); cdecl; overload;
    {class} function getDefaultNewCameraMatrix(cameraMatrix: JMat; imgsize: Jcore_Size; centerPrincipalPoint: Boolean): JMat; cdecl; overload;
    {class} function getDefaultNewCameraMatrix(cameraMatrix: JMat; imgsize: Jcore_Size): JMat; cdecl; overload;
    {class} function getDefaultNewCameraMatrix(cameraMatrix: JMat): JMat; cdecl; overload;
    {class} function getOptimalNewCameraMatrix(cameraMatrix: JMat; distCoeffs: JMat; imageSize: Jcore_Size; alpha: Double; newImgSize: Jcore_Size; validPixROI: Jcore_Rect; centerPrincipalPoint: Boolean): JMat; cdecl; overload;
    {class} function getOptimalNewCameraMatrix(cameraMatrix: JMat; distCoeffs: JMat; imageSize: Jcore_Size; alpha: Double; newImgSize: Jcore_Size; validPixROI: Jcore_Rect): JMat; cdecl; overload;
    {class} function getOptimalNewCameraMatrix(cameraMatrix: JMat; distCoeffs: JMat; imageSize: Jcore_Size; alpha: Double; newImgSize: Jcore_Size): JMat; cdecl; overload;//Deprecated
    {class} function getOptimalNewCameraMatrix(cameraMatrix: JMat; distCoeffs: JMat; imageSize: Jcore_Size; alpha: Double): JMat; cdecl; overload;//Deprecated
    {class} function getValidDisparityROI(roi1: Jcore_Rect; roi2: Jcore_Rect; minDisparity: Integer; numberOfDisparities: Integer; SADWindowSize: Integer): Jcore_Rect; cdecl;//Deprecated
    {class} function initCameraMatrix2D(objectPoints: JList; imagePoints: JList; imageSize: Jcore_Size; aspectRatio: Double): JMat; cdecl; overload;//Deprecated
    {class} function initCameraMatrix2D(objectPoints: JList; imagePoints: JList; imageSize: Jcore_Size): JMat; cdecl; overload;//Deprecated
    {class} procedure initUndistortRectifyMap(cameraMatrix: JMat; distCoeffs: JMat; R: JMat; newCameraMatrix: JMat; size: Jcore_Size; m1type: Integer; map1: JMat; map2: JMat); cdecl;//Deprecated
    {class} procedure matMulDeriv(A: JMat; B: JMat; dABdA: JMat; dABdB: JMat); cdecl;//Deprecated
    {class} procedure projectPoints(objectPoints: JMatOfPoint3f; rvec: JMat; tvec: JMat; cameraMatrix: JMat; distCoeffs: JMatOfDouble; imagePoints: JMatOfPoint2f; jacobian: JMat; aspectRatio: Double); cdecl; overload;//Deprecated
    {class} procedure projectPoints(objectPoints: JMatOfPoint3f; rvec: JMat; tvec: JMat; cameraMatrix: JMat; distCoeffs: JMatOfDouble; imagePoints: JMatOfPoint2f; jacobian: JMat); cdecl; overload;//Deprecated
    {class} procedure projectPoints(objectPoints: JMatOfPoint3f; rvec: JMat; tvec: JMat; cameraMatrix: JMat; distCoeffs: JMatOfDouble; imagePoints: JMatOfPoint2f); cdecl; overload;//Deprecated
    {class} function recoverPose(E: JMat; points1: JMat; points2: JMat; R: JMat; t: JMat; focal: Double; pp: Jcore_Point; mask: JMat): Integer; cdecl; overload;//Deprecated
    {class} function recoverPose(E: JMat; points1: JMat; points2: JMat; R: JMat; t: JMat; focal: Double; pp: Jcore_Point): Integer; cdecl; overload;//Deprecated
    {class} function recoverPose(E: JMat; points1: JMat; points2: JMat; R: JMat; t: JMat; focal: Double): Integer; cdecl; overload;//Deprecated
    {class} function recoverPose(E: JMat; points1: JMat; points2: JMat; R: JMat; t: JMat): Integer; cdecl; overload;//Deprecated
    {class} function recoverPose(E: JMat; points1: JMat; points2: JMat; cameraMatrix: JMat; R: JMat; t: JMat; mask: JMat): Integer; cdecl; overload;//Deprecated
    {class} function recoverPose(E: JMat; points1: JMat; points2: JMat; cameraMatrix: JMat; R: JMat; t: JMat): Integer; cdecl; overload;//Deprecated
    {class} function recoverPose(E: JMat; points1: JMat; points2: JMat; cameraMatrix: JMat; R: JMat; t: JMat; distanceThresh: Double; mask: JMat; triangulatedPoints: JMat): Integer; cdecl; overload;//Deprecated
    {class} function recoverPose(E: JMat; points1: JMat; points2: JMat; cameraMatrix: JMat; R: JMat; t: JMat; distanceThresh: Double; mask: JMat): Integer; cdecl; overload;//Deprecated
    {class} function recoverPose(E: JMat; points1: JMat; points2: JMat; cameraMatrix: JMat; R: JMat; t: JMat; distanceThresh: Double): Integer; cdecl; overload;//Deprecated
    {class} function rectify3Collinear(cameraMatrix1: JMat; distCoeffs1: JMat; cameraMatrix2: JMat; distCoeffs2: JMat; cameraMatrix3: JMat; distCoeffs3: JMat; imgpt1: JList; imgpt3: JList; imageSize: Jcore_Size; R12: JMat; T12: JMat; R13: JMat; T13: JMat; R1: JMat; R2: JMat; R3: JMat; P1: JMat; P2: JMat; P3: JMat; Q: JMat; alpha: Double; newImgSize: Jcore_Size; roi1: Jcore_Rect; roi2: Jcore_Rect; flags: Integer): Single; cdecl;//Deprecated
    {class} procedure reprojectImageTo3D(disparity: JMat; _3dImage: JMat; Q: JMat; handleMissingValues: Boolean; ddepth: Integer); cdecl; overload;//Deprecated
    {class} procedure reprojectImageTo3D(disparity: JMat; _3dImage: JMat; Q: JMat; handleMissingValues: Boolean); cdecl; overload;//Deprecated
    {class} procedure reprojectImageTo3D(disparity: JMat; _3dImage: JMat; Q: JMat); cdecl; overload;//Deprecated
    {class} function sampsonDistance(pt1: JMat; pt2: JMat; F: JMat): Double; cdecl;//Deprecated
    {class} function solveP3P(objectPoints: JMat; imagePoints: JMat; cameraMatrix: JMat; distCoeffs: JMat; rvecs: JList; tvecs: JList; flags: Integer): Integer; cdecl;//Deprecated
    {class} function solvePnP(objectPoints: JMatOfPoint3f; imagePoints: JMatOfPoint2f; cameraMatrix: JMat; distCoeffs: JMatOfDouble; rvec: JMat; tvec: JMat; useExtrinsicGuess: Boolean; flags: Integer): Boolean; cdecl; overload;//Deprecated
    {class} function solvePnP(objectPoints: JMatOfPoint3f; imagePoints: JMatOfPoint2f; cameraMatrix: JMat; distCoeffs: JMatOfDouble; rvec: JMat; tvec: JMat; useExtrinsicGuess: Boolean): Boolean; cdecl; overload;//Deprecated
    {class} function solvePnP(objectPoints: JMatOfPoint3f; imagePoints: JMatOfPoint2f; cameraMatrix: JMat; distCoeffs: JMatOfDouble; rvec: JMat; tvec: JMat): Boolean; cdecl; overload;//Deprecated
    {class} function solvePnPGeneric(objectPoints: JMat; imagePoints: JMat; cameraMatrix: JMat; distCoeffs: JMat; rvecs: JList; tvecs: JList; useExtrinsicGuess: Boolean; flags: Integer; rvec: JMat; tvec: JMat; reprojectionError: JMat): Integer; cdecl; overload;//Deprecated
    {class} function solvePnPGeneric(objectPoints: JMat; imagePoints: JMat; cameraMatrix: JMat; distCoeffs: JMat; rvecs: JList; tvecs: JList; useExtrinsicGuess: Boolean; flags: Integer; rvec: JMat; tvec: JMat): Integer; cdecl; overload;//Deprecated
    {class} function solvePnPGeneric(objectPoints: JMat; imagePoints: JMat; cameraMatrix: JMat; distCoeffs: JMat; rvecs: JList; tvecs: JList; useExtrinsicGuess: Boolean; flags: Integer; rvec: JMat): Integer; cdecl; overload;//Deprecated
    {class} function solvePnPGeneric(objectPoints: JMat; imagePoints: JMat; cameraMatrix: JMat; distCoeffs: JMat; rvecs: JList; tvecs: JList; useExtrinsicGuess: Boolean; flags: Integer): Integer; cdecl; overload;//Deprecated
    {class} function solvePnPGeneric(objectPoints: JMat; imagePoints: JMat; cameraMatrix: JMat; distCoeffs: JMat; rvecs: JList; tvecs: JList; useExtrinsicGuess: Boolean): Integer; cdecl; overload;//Deprecated
    {class} function solvePnPGeneric(objectPoints: JMat; imagePoints: JMat; cameraMatrix: JMat; distCoeffs: JMat; rvecs: JList; tvecs: JList): Integer; cdecl; overload;//Deprecated
    {class} function solvePnPRansac(objectPoints: JMatOfPoint3f; imagePoints: JMatOfPoint2f; cameraMatrix: JMat; distCoeffs: JMatOfDouble; rvec: JMat; tvec: JMat; useExtrinsicGuess: Boolean; iterationsCount: Integer; reprojectionError: Single; confidence: Double; inliers: JMat; flags: Integer): Boolean; cdecl; overload;//Deprecated
    {class} function solvePnPRansac(objectPoints: JMatOfPoint3f; imagePoints: JMatOfPoint2f; cameraMatrix: JMat; distCoeffs: JMatOfDouble; rvec: JMat; tvec: JMat; useExtrinsicGuess: Boolean; iterationsCount: Integer; reprojectionError: Single; confidence: Double; inliers: JMat): Boolean; cdecl; overload;//Deprecated
    {class} function solvePnPRansac(objectPoints: JMatOfPoint3f; imagePoints: JMatOfPoint2f; cameraMatrix: JMat; distCoeffs: JMatOfDouble; rvec: JMat; tvec: JMat; useExtrinsicGuess: Boolean; iterationsCount: Integer; reprojectionError: Single; confidence: Double): Boolean; cdecl; overload;//Deprecated
    {class} function solvePnPRansac(objectPoints: JMatOfPoint3f; imagePoints: JMatOfPoint2f; cameraMatrix: JMat; distCoeffs: JMatOfDouble; rvec: JMat; tvec: JMat; useExtrinsicGuess: Boolean; iterationsCount: Integer; reprojectionError: Single): Boolean; cdecl; overload;//Deprecated
    {class} function solvePnPRansac(objectPoints: JMatOfPoint3f; imagePoints: JMatOfPoint2f; cameraMatrix: JMat; distCoeffs: JMatOfDouble; rvec: JMat; tvec: JMat; useExtrinsicGuess: Boolean; iterationsCount: Integer): Boolean; cdecl; overload;
    {class} function solvePnPRansac(objectPoints: JMatOfPoint3f; imagePoints: JMatOfPoint2f; cameraMatrix: JMat; distCoeffs: JMatOfDouble; rvec: JMat; tvec: JMat; useExtrinsicGuess: Boolean): Boolean; cdecl; overload;
    {class} function solvePnPRansac(objectPoints: JMatOfPoint3f; imagePoints: JMatOfPoint2f; cameraMatrix: JMat; distCoeffs: JMatOfDouble; rvec: JMat; tvec: JMat): Boolean; cdecl; overload;
    {class} procedure solvePnPRefineLM(objectPoints: JMat; imagePoints: JMat; cameraMatrix: JMat; distCoeffs: JMat; rvec: JMat; tvec: JMat; criteria: JTermCriteria); cdecl; overload;
    {class} procedure solvePnPRefineLM(objectPoints: JMat; imagePoints: JMat; cameraMatrix: JMat; distCoeffs: JMat; rvec: JMat; tvec: JMat); cdecl; overload;
    {class} procedure solvePnPRefineVVS(objectPoints: JMat; imagePoints: JMat; cameraMatrix: JMat; distCoeffs: JMat; rvec: JMat; tvec: JMat; criteria: JTermCriteria; VVSlambda: Double); cdecl; overload;
    {class} procedure solvePnPRefineVVS(objectPoints: JMat; imagePoints: JMat; cameraMatrix: JMat; distCoeffs: JMat; rvec: JMat; tvec: JMat; criteria: JTermCriteria); cdecl; overload;
    {class} procedure solvePnPRefineVVS(objectPoints: JMat; imagePoints: JMat; cameraMatrix: JMat; distCoeffs: JMat; rvec: JMat; tvec: JMat); cdecl; overload;
    {class} function stereoCalibrate(objectPoints: JList; imagePoints1: JList; imagePoints2: JList; cameraMatrix1: JMat; distCoeffs1: JMat; cameraMatrix2: JMat; distCoeffs2: JMat; imageSize: Jcore_Size; R: JMat; T: JMat; E: JMat; F: JMat; flags: Integer; criteria: JTermCriteria): Double; cdecl; overload;
    {class} function stereoCalibrate(objectPoints: JList; imagePoints1: JList; imagePoints2: JList; cameraMatrix1: JMat; distCoeffs1: JMat; cameraMatrix2: JMat; distCoeffs2: JMat; imageSize: Jcore_Size; R: JMat; T: JMat; E: JMat; F: JMat; flags: Integer): Double; cdecl; overload;
    {class} function stereoCalibrate(objectPoints: JList; imagePoints1: JList; imagePoints2: JList; cameraMatrix1: JMat; distCoeffs1: JMat; cameraMatrix2: JMat; distCoeffs2: JMat; imageSize: Jcore_Size; R: JMat; T: JMat; E: JMat; F: JMat): Double; cdecl; overload;
    {class} function stereoCalibrateExtended(objectPoints: JList; imagePoints1: JList; imagePoints2: JList; cameraMatrix1: JMat; distCoeffs1: JMat; cameraMatrix2: JMat; distCoeffs2: JMat; imageSize: Jcore_Size; R: JMat; T: JMat; E: JMat; F: JMat; perViewErrors: JMat; flags: Integer; criteria: JTermCriteria): Double; cdecl; overload;
    {class} function stereoCalibrateExtended(objectPoints: JList; imagePoints1: JList; imagePoints2: JList; cameraMatrix1: JMat; distCoeffs1: JMat; cameraMatrix2: JMat; distCoeffs2: JMat; imageSize: Jcore_Size; R: JMat; T: JMat; E: JMat; F: JMat; perViewErrors: JMat; flags: Integer): Double; cdecl; overload;
    {class} function stereoCalibrateExtended(objectPoints: JList; imagePoints1: JList; imagePoints2: JList; cameraMatrix1: JMat; distCoeffs1: JMat; cameraMatrix2: JMat; distCoeffs2: JMat; imageSize: Jcore_Size; R: JMat; T: JMat; E: JMat; F: JMat; perViewErrors: JMat): Double; cdecl; overload;
    {class} procedure stereoRectify(cameraMatrix1: JMat; distCoeffs1: JMat; cameraMatrix2: JMat; distCoeffs2: JMat; imageSize: Jcore_Size; R: JMat; T: JMat; R1: JMat; R2: JMat; P1: JMat; P2: JMat; Q: JMat; flags: Integer; alpha: Double; newImageSize: Jcore_Size; validPixROI1: Jcore_Rect; validPixROI2: Jcore_Rect); cdecl; overload;
    {class} procedure stereoRectify(cameraMatrix1: JMat; distCoeffs1: JMat; cameraMatrix2: JMat; distCoeffs2: JMat; imageSize: Jcore_Size; R: JMat; T: JMat; R1: JMat; R2: JMat; P1: JMat; P2: JMat; Q: JMat; flags: Integer; alpha: Double; newImageSize: Jcore_Size; validPixROI1: Jcore_Rect); cdecl; overload;
    {class} procedure stereoRectify(cameraMatrix1: JMat; distCoeffs1: JMat; cameraMatrix2: JMat; distCoeffs2: JMat; imageSize: Jcore_Size; R: JMat; T: JMat; R1: JMat; R2: JMat; P1: JMat; P2: JMat; Q: JMat; flags: Integer; alpha: Double; newImageSize: Jcore_Size); cdecl; overload;
    {class} procedure stereoRectify(cameraMatrix1: JMat; distCoeffs1: JMat; cameraMatrix2: JMat; distCoeffs2: JMat; imageSize: Jcore_Size; R: JMat; T: JMat; R1: JMat; R2: JMat; P1: JMat; P2: JMat; Q: JMat; flags: Integer; alpha: Double); cdecl; overload;
    {class} procedure stereoRectify(cameraMatrix1: JMat; distCoeffs1: JMat; cameraMatrix2: JMat; distCoeffs2: JMat; imageSize: Jcore_Size; R: JMat; T: JMat; R1: JMat; R2: JMat; P1: JMat; P2: JMat; Q: JMat; flags: Integer); cdecl; overload;
    {class} procedure stereoRectify(cameraMatrix1: JMat; distCoeffs1: JMat; cameraMatrix2: JMat; distCoeffs2: JMat; imageSize: Jcore_Size; R: JMat; T: JMat; R1: JMat; R2: JMat; P1: JMat; P2: JMat; Q: JMat); cdecl; overload;
    {class} function stereoRectifyUncalibrated(points1: JMat; points2: JMat; F: JMat; imgSize: Jcore_Size; H1: JMat; H2: JMat; threshold: Double): Boolean; cdecl; overload;
    {class} function stereoRectifyUncalibrated(points1: JMat; points2: JMat; F: JMat; imgSize: Jcore_Size; H1: JMat; H2: JMat): Boolean; cdecl; overload;
    {class} procedure triangulatePoints(projMatr1: JMat; projMatr2: JMat; projPoints1: JMat; projPoints2: JMat; points4D: JMat); cdecl;
    {class} procedure undistort(src: JMat; dst: JMat; cameraMatrix: JMat; distCoeffs: JMat; newCameraMatrix: JMat); cdecl; overload;
    {class} procedure undistort(src: JMat; dst: JMat; cameraMatrix: JMat; distCoeffs: JMat); cdecl; overload;
    {class} procedure undistortPoints(src: JMatOfPoint2f; dst: JMatOfPoint2f; cameraMatrix: JMat; distCoeffs: JMat; R: JMat; P: JMat); cdecl; overload;
    {class} procedure undistortPoints(src: JMatOfPoint2f; dst: JMatOfPoint2f; cameraMatrix: JMat; distCoeffs: JMat; R: JMat); cdecl; overload;
    {class} procedure undistortPoints(src: JMatOfPoint2f; dst: JMatOfPoint2f; cameraMatrix: JMat; distCoeffs: JMat); cdecl; overload;
    {class} procedure undistortPointsIter(src: JMat; dst: JMat; cameraMatrix: JMat; distCoeffs: JMat; R: JMat; P: JMat; criteria: JTermCriteria); cdecl;
    {class} procedure validateDisparity(disparity: JMat; cost: JMat; minDisparity: Integer; numberOfDisparities: Integer; disp12MaxDisp: Integer); cdecl; overload;
    {class} procedure validateDisparity(disparity: JMat; cost: JMat; minDisparity: Integer; numberOfDisparities: Integer); cdecl; overload;
    {class} property CALIB_CB_ACCURACY: Integer read _GetCALIB_CB_ACCURACY;
    {class} property CALIB_CB_ADAPTIVE_THRESH: Integer read _GetCALIB_CB_ADAPTIVE_THRESH;
    {class} property CALIB_CB_ASYMMETRIC_GRID: Integer read _GetCALIB_CB_ASYMMETRIC_GRID;
    {class} property CALIB_CB_CLUSTERING: Integer read _GetCALIB_CB_CLUSTERING;
    {class} property CALIB_CB_EXHAUSTIVE: Integer read _GetCALIB_CB_EXHAUSTIVE;
    {class} property CALIB_CB_FAST_CHECK: Integer read _GetCALIB_CB_FAST_CHECK;
    {class} property CALIB_CB_FILTER_QUADS: Integer read _GetCALIB_CB_FILTER_QUADS;
    {class} property CALIB_CB_NORMALIZE_IMAGE: Integer read _GetCALIB_CB_NORMALIZE_IMAGE;
    {class} property CALIB_CB_SYMMETRIC_GRID: Integer read _GetCALIB_CB_SYMMETRIC_GRID;
    {class} property CALIB_FIX_ASPECT_RATIO: Integer read _GetCALIB_FIX_ASPECT_RATIO;
    {class} property CALIB_FIX_FOCAL_LENGTH: Integer read _GetCALIB_FIX_FOCAL_LENGTH;
    {class} property CALIB_FIX_INTRINSIC: Integer read _GetCALIB_FIX_INTRINSIC;
    {class} property CALIB_FIX_K1: Integer read _GetCALIB_FIX_K1;
    {class} property CALIB_FIX_K2: Integer read _GetCALIB_FIX_K2;
    {class} property CALIB_FIX_K3: Integer read _GetCALIB_FIX_K3;
    {class} property CALIB_FIX_K4: Integer read _GetCALIB_FIX_K4;
    {class} property CALIB_FIX_K5: Integer read _GetCALIB_FIX_K5;
    {class} property CALIB_FIX_K6: Integer read _GetCALIB_FIX_K6;
    {class} property CALIB_FIX_PRINCIPAL_POINT: Integer read _GetCALIB_FIX_PRINCIPAL_POINT;
    {class} property CALIB_FIX_S1_S2_S3_S4: Integer read _GetCALIB_FIX_S1_S2_S3_S4;
    {class} property CALIB_FIX_TANGENT_DIST: Integer read _GetCALIB_FIX_TANGENT_DIST;
    {class} property CALIB_FIX_TAUX_TAUY: Integer read _GetCALIB_FIX_TAUX_TAUY;
    {class} property CALIB_HAND_EYE_ANDREFF: Integer read _GetCALIB_HAND_EYE_ANDREFF;
    {class} property CALIB_HAND_EYE_DANIILIDIS: Integer read _GetCALIB_HAND_EYE_DANIILIDIS;
    {class} property CALIB_HAND_EYE_HORAUD: Integer read _GetCALIB_HAND_EYE_HORAUD;
    {class} property CALIB_HAND_EYE_PARK: Integer read _GetCALIB_HAND_EYE_PARK;
    {class} property CALIB_HAND_EYE_TSAI: Integer read _GetCALIB_HAND_EYE_TSAI;
    {class} property CALIB_NINTRINSIC: Integer read _GetCALIB_NINTRINSIC;
    {class} property CALIB_RATIONAL_MODEL: Integer read _GetCALIB_RATIONAL_MODEL;
    {class} property CALIB_SAME_FOCAL_LENGTH: Integer read _GetCALIB_SAME_FOCAL_LENGTH;
    {class} property CALIB_THIN_PRISM_MODEL: Integer read _GetCALIB_THIN_PRISM_MODEL;
    {class} property CALIB_TILTED_MODEL: Integer read _GetCALIB_TILTED_MODEL;
    {class} property CALIB_USE_EXTRINSIC_GUESS: Integer read _GetCALIB_USE_EXTRINSIC_GUESS;
    {class} property CALIB_USE_INTRINSIC_GUESS: Integer read _GetCALIB_USE_INTRINSIC_GUESS;
    {class} property CALIB_USE_LU: Integer read _GetCALIB_USE_LU;
    {class} property CALIB_USE_QR: Integer read _GetCALIB_USE_QR;
    {class} property CALIB_ZERO_DISPARITY: Integer read _GetCALIB_ZERO_DISPARITY;
    {class} property CALIB_ZERO_TANGENT_DIST: Integer read _GetCALIB_ZERO_TANGENT_DIST;
    {class} property CV_DLS: Integer read _GetCV_DLS;
    {class} property CV_EPNP: Integer read _GetCV_EPNP;
    {class} property CV_ITERATIVE: Integer read _GetCV_ITERATIVE;
    {class} property CV_P3P: Integer read _GetCV_P3P;
    {class} property CirclesGridFinderParameters_ASYMMETRIC_GRID: Integer read _GetCirclesGridFinderParameters_ASYMMETRIC_GRID;
    {class} property CirclesGridFinderParameters_SYMMETRIC_GRID: Integer read _GetCirclesGridFinderParameters_SYMMETRIC_GRID;
    {class} property CvLevMarq_CALC_J: Integer read _GetCvLevMarq_CALC_J;
    {class} property CvLevMarq_CHECK_ERR: Integer read _GetCvLevMarq_CHECK_ERR;
    {class} property CvLevMarq_DONE: Integer read _GetCvLevMarq_DONE;
    {class} property CvLevMarq_STARTED: Integer read _GetCvLevMarq_STARTED;
    {class} property FM_7POINT: Integer read _GetFM_7POINT;
    {class} property FM_8POINT: Integer read _GetFM_8POINT;
    {class} property FM_LMEDS: Integer read _GetFM_LMEDS;
    {class} property FM_RANSAC: Integer read _GetFM_RANSAC;
    {class} property LMEDS: Integer read _GetLMEDS;
    {class} property PROJ_SPHERICAL_EQRECT: Integer read _GetPROJ_SPHERICAL_EQRECT;
    {class} property PROJ_SPHERICAL_ORTHO: Integer read _GetPROJ_SPHERICAL_ORTHO;
    {class} property RANSAC: Integer read _GetRANSAC;
    {class} property RHO: Integer read _GetRHO;
    {class} property SOLVEPNP_AP3P: Integer read _GetSOLVEPNP_AP3P;
    {class} property SOLVEPNP_DLS: Integer read _GetSOLVEPNP_DLS;
    {class} property SOLVEPNP_EPNP: Integer read _GetSOLVEPNP_EPNP;
    {class} property SOLVEPNP_IPPE: Integer read _GetSOLVEPNP_IPPE;
    {class} property SOLVEPNP_IPPE_SQUARE: Integer read _GetSOLVEPNP_IPPE_SQUARE;
    {class} property SOLVEPNP_ITERATIVE: Integer read _GetSOLVEPNP_ITERATIVE;
    {class} property SOLVEPNP_MAX_COUNT: Integer read _GetSOLVEPNP_MAX_COUNT;
    {class} property SOLVEPNP_P3P: Integer read _GetSOLVEPNP_P3P;
    {class} property SOLVEPNP_UPNP: Integer read _GetSOLVEPNP_UPNP;
    {class} property fisheye_CALIB_CHECK_COND: Integer read _Getfisheye_CALIB_CHECK_COND;
    {class} property fisheye_CALIB_FIX_INTRINSIC: Integer read _Getfisheye_CALIB_FIX_INTRINSIC;
    {class} property fisheye_CALIB_FIX_K1: Integer read _Getfisheye_CALIB_FIX_K1;
    {class} property fisheye_CALIB_FIX_K2: Integer read _Getfisheye_CALIB_FIX_K2;
    {class} property fisheye_CALIB_FIX_K3: Integer read _Getfisheye_CALIB_FIX_K3;
    {class} property fisheye_CALIB_FIX_K4: Integer read _Getfisheye_CALIB_FIX_K4;
    {class} property fisheye_CALIB_FIX_PRINCIPAL_POINT: Integer read _Getfisheye_CALIB_FIX_PRINCIPAL_POINT;
    {class} property fisheye_CALIB_FIX_SKEW: Integer read _Getfisheye_CALIB_FIX_SKEW;
    {class} property fisheye_CALIB_RECOMPUTE_EXTRINSIC: Integer read _Getfisheye_CALIB_RECOMPUTE_EXTRINSIC;
    {class} property fisheye_CALIB_USE_INTRINSIC_GUESS: Integer read _Getfisheye_CALIB_USE_INTRINSIC_GUESS;
  end;

  [JavaSignature('org/opencv/calib3d/Calib3d')]
  JCalib3d = interface(JObject)
    ['{CB0427B5-2349-4056-AAEF-789193168255}']
  end;
  TJCalib3d = class(TJavaGenericImport<JCalib3dClass, JCalib3d>) end;

  JAlgorithmClass = interface(JObjectClass)
    ['{611E3CD0-4871-412B-84A0-807927223314}']
    {class} function __fromPtr__(addr: Int64): JAlgorithm; cdecl;
    {class} function getDefaultName: JString; cdecl;//Deprecated
    {class} function getNativeObjAddr: Int64; cdecl;//Deprecated
  end;

  [JavaSignature('org/opencv/core/Algorithm')]
  JAlgorithm = interface(JObject)
    ['{BC30378E-0FDF-4545-9FDB-719C155A584B}']
    procedure clear; cdecl;
    function empty: Boolean; cdecl;
    procedure save(filename: JString); cdecl;//Deprecated
  end;
  TJAlgorithm = class(TJavaGenericImport<JAlgorithmClass, JAlgorithm>) end;

  JStereoMatcherClass = interface(JAlgorithmClass)
    ['{1D13C1CA-859D-4ECB-BBE5-7A1353FBB246}']
    {class} function _GetDISP_SCALE: Integer; cdecl;
    {class} function _GetDISP_SHIFT: Integer; cdecl;
    {class} function __fromPtr__(addr: Int64): JStereoMatcher; cdecl;//Deprecated
    {class} procedure compute(left: JMat; right: JMat; disparity: JMat); cdecl;//Deprecated
    {class} function getBlockSize: Integer; cdecl;//Deprecated
    {class} function getMinDisparity: Integer; cdecl;//Deprecated
    {class} procedure setBlockSize(blockSize: Integer); cdecl;//Deprecated
    {class} procedure setMinDisparity(minDisparity: Integer); cdecl;//Deprecated
    {class} procedure setSpeckleRange(speckleRange: Integer); cdecl;//Deprecated
    {class} property DISP_SCALE: Integer read _GetDISP_SCALE;
    {class} property DISP_SHIFT: Integer read _GetDISP_SHIFT;
  end;

  [JavaSignature('org/opencv/calib3d/StereoMatcher')]
  JStereoMatcher = interface(JAlgorithm)
    ['{0F0525C0-FAAA-44EF-9D27-BF1184367056}']
    function getDisp12MaxDiff: Integer; cdecl;//Deprecated
    function getNumDisparities: Integer; cdecl;//Deprecated
    function getSpeckleRange: Integer; cdecl;//Deprecated
    function getSpeckleWindowSize: Integer; cdecl;//Deprecated
    procedure setDisp12MaxDiff(disp12MaxDiff: Integer); cdecl;
    procedure setNumDisparities(numDisparities: Integer); cdecl;
    procedure setSpeckleWindowSize(speckleWindowSize: Integer); cdecl;//Deprecated
  end;
  TJStereoMatcher = class(TJavaGenericImport<JStereoMatcherClass, JStereoMatcher>) end;

  JStereoBMClass = interface(JStereoMatcherClass)
    ['{F47C462D-980E-43DD-A2D6-8BF5365C8ACF}']
    {class} function _GetPREFILTER_NORMALIZED_RESPONSE: Integer; cdecl;
    {class} function _GetPREFILTER_XSOBEL: Integer; cdecl;
    {class} function __fromPtr__(addr: Int64): JStereoBM; cdecl;
    {class} function create(numDisparities: Integer; blockSize: Integer): JStereoBM; cdecl; overload;
    {class} function create(numDisparities: Integer): JStereoBM; cdecl; overload;
    {class} function create: JStereoBM; cdecl; overload;
    {class} function getPreFilterSize: Integer; cdecl;
    {class} function getTextureThreshold: Integer; cdecl;
    {class} function getUniquenessRatio: Integer; cdecl;
    {class} procedure setPreFilterSize(preFilterSize: Integer); cdecl;
    {class} procedure setROI1(roi1: Jcore_Rect); cdecl;
    {class} procedure setSmallerBlockSize(blockSize: Integer); cdecl;//Deprecated
    {class} procedure setTextureThreshold(textureThreshold: Integer); cdecl;//Deprecated
    {class} procedure setUniquenessRatio(uniquenessRatio: Integer); cdecl;//Deprecated
    {class} property PREFILTER_NORMALIZED_RESPONSE: Integer read _GetPREFILTER_NORMALIZED_RESPONSE;
    {class} property PREFILTER_XSOBEL: Integer read _GetPREFILTER_XSOBEL;
  end;

  [JavaSignature('org/opencv/calib3d/StereoBM')]
  JStereoBM = interface(JStereoMatcher)
    ['{A8BF0E25-89AF-4940-8C69-ADB222ABD882}']
    function getPreFilterCap: Integer; cdecl;
    function getPreFilterType: Integer; cdecl;
    function getROI1: Jcore_Rect; cdecl;
    function getROI2: Jcore_Rect; cdecl;
    function getSmallerBlockSize: Integer; cdecl;
    procedure setPreFilterCap(preFilterCap: Integer); cdecl;
    procedure setPreFilterType(preFilterType: Integer); cdecl;
    procedure setROI2(roi2: Jcore_Rect); cdecl;
  end;
  TJStereoBM = class(TJavaGenericImport<JStereoBMClass, JStereoBM>) end;

  JStereoSGBMClass = interface(JStereoMatcherClass)
    ['{315C5AD9-5945-4CF5-8B71-FDA7C85F2714}']
    {class} function _GetMODE_HH: Integer; cdecl;
    {class} function _GetMODE_HH4: Integer; cdecl;
    {class} function _GetMODE_SGBM: Integer; cdecl;
    {class} function _GetMODE_SGBM_3WAY: Integer; cdecl;
    {class} function __fromPtr__(addr: Int64): JStereoSGBM; cdecl;
    {class} function create(minDisparity: Integer; numDisparities: Integer; blockSize: Integer; P1: Integer; P2: Integer; disp12MaxDiff: Integer; preFilterCap: Integer; uniquenessRatio: Integer; speckleWindowSize: Integer; speckleRange: Integer; mode: Integer): JStereoSGBM; cdecl; overload;
    {class} function create(minDisparity: Integer; numDisparities: Integer; blockSize: Integer; P1: Integer; P2: Integer; disp12MaxDiff: Integer; preFilterCap: Integer; uniquenessRatio: Integer; speckleWindowSize: Integer; speckleRange: Integer): JStereoSGBM; cdecl; overload;
    {class} function create(minDisparity: Integer; numDisparities: Integer; blockSize: Integer; P1: Integer; P2: Integer; disp12MaxDiff: Integer; preFilterCap: Integer; uniquenessRatio: Integer; speckleWindowSize: Integer): JStereoSGBM; cdecl; overload;
    {class} function create(minDisparity: Integer; numDisparities: Integer; blockSize: Integer; P1: Integer; P2: Integer; disp12MaxDiff: Integer; preFilterCap: Integer; uniquenessRatio: Integer): JStereoSGBM; cdecl; overload;
    {class} function create(minDisparity: Integer; numDisparities: Integer; blockSize: Integer; P1: Integer; P2: Integer; disp12MaxDiff: Integer; preFilterCap: Integer): JStereoSGBM; cdecl; overload;
    {class} function create(minDisparity: Integer; numDisparities: Integer; blockSize: Integer; P1: Integer; P2: Integer; disp12MaxDiff: Integer): JStereoSGBM; cdecl; overload;//Deprecated
    {class} function create(minDisparity: Integer; numDisparities: Integer; blockSize: Integer; P1: Integer; P2: Integer): JStereoSGBM; cdecl; overload;
    {class} function create(minDisparity: Integer; numDisparities: Integer; blockSize: Integer; P1: Integer): JStereoSGBM; cdecl; overload;
    {class} function create(minDisparity: Integer; numDisparities: Integer; blockSize: Integer): JStereoSGBM; cdecl; overload;//Deprecated
    {class} function create(minDisparity: Integer; numDisparities: Integer): JStereoSGBM; cdecl; overload;
    {class} function create(minDisparity: Integer): JStereoSGBM; cdecl; overload;
    {class} function create: JStereoSGBM; cdecl; overload;
    {class} function getMode: Integer; cdecl;//Deprecated
    {class} function getP2: Integer; cdecl;//Deprecated
    {class} procedure setP1(P1: Integer); cdecl;//Deprecated
    {class} procedure setPreFilterCap(preFilterCap: Integer); cdecl;//Deprecated
    {class} procedure setUniquenessRatio(uniquenessRatio: Integer); cdecl;//Deprecated
    {class} property MODE_HH: Integer read _GetMODE_HH;
    {class} property MODE_HH4: Integer read _GetMODE_HH4;
    {class} property MODE_SGBM: Integer read _GetMODE_SGBM;
    {class} property MODE_SGBM_3WAY: Integer read _GetMODE_SGBM_3WAY;
  end;

  [JavaSignature('org/opencv/calib3d/StereoSGBM')]
  JStereoSGBM = interface(JStereoMatcher)
    ['{98C7569C-254C-40F6-B833-1F8AFEC792C5}']
    function getP1: Integer; cdecl;//Deprecated
    function getPreFilterCap: Integer; cdecl;//Deprecated
    function getUniquenessRatio: Integer; cdecl;//Deprecated
    procedure setMode(mode: Integer); cdecl;//Deprecated
    procedure setP2(P2: Integer); cdecl;//Deprecated
  end;
  TJStereoSGBM = class(TJavaGenericImport<JStereoSGBMClass, JStereoSGBM>) end;

  JCoreClass = interface(JObjectClass)
    ['{989C07BB-C9DF-44C2-B06E-4D03216D0FB0}']
    {class} function _GetBORDER_CONSTANT: Integer; cdecl;
    {class} function _GetBORDER_DEFAULT: Integer; cdecl;
    {class} function _GetBORDER_ISOLATED: Integer; cdecl;
    {class} function _GetBORDER_REFLECT: Integer; cdecl;
    {class} function _GetBORDER_REFLECT101: Integer; cdecl;
    {class} function _GetBORDER_REFLECT_101: Integer; cdecl;
    {class} function _GetBORDER_REPLICATE: Integer; cdecl;
    {class} function _GetBORDER_TRANSPARENT: Integer; cdecl;
    {class} function _GetBORDER_WRAP: Integer; cdecl;
    {class} function _GetBadAlign: Integer; cdecl;
    {class} function _GetBadAlphaChannel: Integer; cdecl;
    {class} function _GetBadCOI: Integer; cdecl;
    {class} function _GetBadCallBack: Integer; cdecl;
    {class} function _GetBadDataPtr: Integer; cdecl;
    {class} function _GetBadDepth: Integer; cdecl;
    {class} function _GetBadImageSize: Integer; cdecl;
    {class} function _GetBadModelOrChSeq: Integer; cdecl;
    {class} function _GetBadNumChannel1U: Integer; cdecl;
    {class} function _GetBadNumChannels: Integer; cdecl;
    {class} function _GetBadOffset: Integer; cdecl;
    {class} function _GetBadOrder: Integer; cdecl;
    {class} function _GetBadOrigin: Integer; cdecl;
    {class} function _GetBadROISize: Integer; cdecl;
    {class} function _GetBadStep: Integer; cdecl;
    {class} function _GetBadTileSize: Integer; cdecl;
    {class} function _GetCMP_EQ: Integer; cdecl;
    {class} function _GetCMP_GE: Integer; cdecl;
    {class} function _GetCMP_GT: Integer; cdecl;
    {class} function _GetCMP_LE: Integer; cdecl;
    {class} function _GetCMP_LT: Integer; cdecl;
    {class} function _GetCMP_NE: Integer; cdecl;
    {class} function _GetCOVAR_COLS: Integer; cdecl;
    {class} function _GetCOVAR_NORMAL: Integer; cdecl;
    {class} function _GetCOVAR_ROWS: Integer; cdecl;
    {class} function _GetCOVAR_SCALE: Integer; cdecl;
    {class} function _GetCOVAR_SCRAMBLED: Integer; cdecl;
    {class} function _GetCOVAR_USE_AVG: Integer; cdecl;
    {class} function _GetDCT_INVERSE: Integer; cdecl;
    {class} function _GetDCT_ROWS: Integer; cdecl;
    {class} function _GetDECOMP_CHOLESKY: Integer; cdecl;
    {class} function _GetDECOMP_EIG: Integer; cdecl;
    {class} function _GetDECOMP_LU: Integer; cdecl;
    {class} function _GetDECOMP_NORMAL: Integer; cdecl;
    {class} function _GetDECOMP_QR: Integer; cdecl;
    {class} function _GetDECOMP_SVD: Integer; cdecl;
    {class} function _GetDFT_COMPLEX_INPUT: Integer; cdecl;
    {class} function _GetDFT_COMPLEX_OUTPUT: Integer; cdecl;
    {class} function _GetDFT_INVERSE: Integer; cdecl;
    {class} function _GetDFT_REAL_OUTPUT: Integer; cdecl;
    {class} function _GetDFT_ROWS: Integer; cdecl;
    {class} function _GetDFT_SCALE: Integer; cdecl;
    {class} function _GetFILLED: Integer; cdecl;
    {class} function _GetFormatter_FMT_C: Integer; cdecl;
    {class} function _GetFormatter_FMT_CSV: Integer; cdecl;
    {class} function _GetFormatter_FMT_DEFAULT: Integer; cdecl;
    {class} function _GetFormatter_FMT_MATLAB: Integer; cdecl;
    {class} function _GetFormatter_FMT_NUMPY: Integer; cdecl;
    {class} function _GetFormatter_FMT_PYTHON: Integer; cdecl;
    {class} function _GetGEMM_1_T: Integer; cdecl;
    {class} function _GetGEMM_2_T: Integer; cdecl;
    {class} function _GetGEMM_3_T: Integer; cdecl;
    {class} function _GetGpuApiCallError: Integer; cdecl;
    {class} function _GetGpuNotSupported: Integer; cdecl;
    {class} function _GetHeaderIsNull: Integer; cdecl;
    {class} function _GetKMEANS_PP_CENTERS: Integer; cdecl;
    {class} function _GetKMEANS_RANDOM_CENTERS: Integer; cdecl;
    {class} function _GetKMEANS_USE_INITIAL_LABELS: Integer; cdecl;
    {class} function _GetMaskIsTiled: Integer; cdecl;
    {class} function _GetNATIVE_LIBRARY_NAME: JString; cdecl;
    {class} function _GetNORM_HAMMING: Integer; cdecl;
    {class} function _GetNORM_HAMMING2: Integer; cdecl;
    {class} function _GetNORM_INF: Integer; cdecl;
    {class} function _GetNORM_L1: Integer; cdecl;
    {class} function _GetNORM_L2: Integer; cdecl;
    {class} function _GetNORM_L2SQR: Integer; cdecl;
    {class} function _GetNORM_MINMAX: Integer; cdecl;
    {class} function _GetNORM_RELATIVE: Integer; cdecl;
    {class} function _GetNORM_TYPE_MASK: Integer; cdecl;
    {class} function _GetOpenCLApiCallError: Integer; cdecl;
    {class} function _GetOpenCLDoubleNotSupported: Integer; cdecl;
    {class} function _GetOpenCLInitError: Integer; cdecl;
    {class} function _GetOpenCLNoAMDBlasFft: Integer; cdecl;
    {class} function _GetOpenGlApiCallError: Integer; cdecl;
    {class} function _GetOpenGlNotSupported: Integer; cdecl;
    {class} function _GetPCA_DATA_AS_COL: Integer; cdecl;
    {class} function _GetPCA_DATA_AS_ROW: Integer; cdecl;
    {class} function _GetPCA_USE_AVG: Integer; cdecl;
    {class} function _GetParam_ALGORITHM: Integer; cdecl;
    {class} function _GetParam_BOOLEAN: Integer; cdecl;
    {class} function _GetParam_FLOAT: Integer; cdecl;
    {class} function _GetParam_INT: Integer; cdecl;
    {class} function _GetParam_MAT: Integer; cdecl;
    {class} function _GetParam_MAT_VECTOR: Integer; cdecl;
    {class} function _GetParam_REAL: Integer; cdecl;
    {class} function _GetParam_SCALAR: Integer; cdecl;
    {class} function _GetParam_STRING: Integer; cdecl;
    {class} function _GetParam_UCHAR: Integer; cdecl;
    {class} function _GetParam_UINT64: Integer; cdecl;
    {class} function _GetParam_UNSIGNED_INT: Integer; cdecl;
    {class} function _GetREDUCE_AVG: Integer; cdecl;
    {class} function _GetREDUCE_MAX: Integer; cdecl;
    {class} function _GetREDUCE_MIN: Integer; cdecl;
    {class} function _GetREDUCE_SUM: Integer; cdecl;
    {class} function _GetRNG_NORMAL: Integer; cdecl;
    {class} function _GetRNG_UNIFORM: Integer; cdecl;
    {class} function _GetROTATE_180: Integer; cdecl;
    {class} function _GetROTATE_90_CLOCKWISE: Integer; cdecl;
    {class} function _GetROTATE_90_COUNTERCLOCKWISE: Integer; cdecl;
    {class} function _GetSORT_ASCENDING: Integer; cdecl;
    {class} function _GetSORT_DESCENDING: Integer; cdecl;
    {class} function _GetSORT_EVERY_COLUMN: Integer; cdecl;
    {class} function _GetSORT_EVERY_ROW: Integer; cdecl;
    {class} function _GetSVD_FULL_UV: Integer; cdecl;
    {class} function _GetSVD_MODIFY_A: Integer; cdecl;
    {class} function _GetSVD_NO_UV: Integer; cdecl;
    {class} function _GetStsAssert: Integer; cdecl;
    {class} function _GetStsAutoTrace: Integer; cdecl;
    {class} function _GetStsBackTrace: Integer; cdecl;
    {class} function _GetStsBadArg: Integer; cdecl;
    {class} function _GetStsBadFlag: Integer; cdecl;
    {class} function _GetStsBadFunc: Integer; cdecl;
    {class} function _GetStsBadMask: Integer; cdecl;
    {class} function _GetStsBadMemBlock: Integer; cdecl;
    {class} function _GetStsBadPoint: Integer; cdecl;
    {class} function _GetStsBadSize: Integer; cdecl;
    {class} function _GetStsDivByZero: Integer; cdecl;
    {class} function _GetStsError: Integer; cdecl;
    {class} function _GetStsFilterOffsetErr: Integer; cdecl;
    {class} function _GetStsFilterStructContentErr: Integer; cdecl;
    {class} function _GetStsInplaceNotSupported: Integer; cdecl;
    {class} function _GetStsInternal: Integer; cdecl;
    {class} function _GetStsKernelStructContentErr: Integer; cdecl;
    {class} function _GetStsNoConv: Integer; cdecl;
    {class} function _GetStsNoMem: Integer; cdecl;
    {class} function _GetStsNotImplemented: Integer; cdecl;
    {class} function _GetStsNullPtr: Integer; cdecl;
    {class} function _GetStsObjectNotFound: Integer; cdecl;
    {class} function _GetStsOk: Integer; cdecl;
    {class} function _GetStsOutOfRange: Integer; cdecl;
    {class} function _GetStsParseError: Integer; cdecl;
    {class} function _GetStsUnmatchedFormats: Integer; cdecl;
    {class} function _GetStsUnmatchedSizes: Integer; cdecl;
    {class} function _GetStsUnsupportedFormat: Integer; cdecl;
    {class} function _GetStsVecLengthErr: Integer; cdecl;
    {class} function _GetVERSION: JString; cdecl;
    {class} function _GetVERSION_MAJOR: Integer; cdecl;
    {class} function _GetVERSION_MINOR: Integer; cdecl;
    {class} function _GetVERSION_REVISION: Integer; cdecl;
    {class} function _GetVERSION_STATUS: JString; cdecl;
    {class} function init: JCore; cdecl;
    {class} procedure LUT(src: JMat; lut: JMat; dst: JMat); cdecl;//Deprecated
    {class} function Mahalanobis(v1: JMat; v2: JMat; icovar: JMat): Double; cdecl;//Deprecated
    {class} procedure PCABackProject(data: JMat; mean: JMat; eigenvectors: JMat; result: JMat); cdecl;//Deprecated
    {class} procedure PCACompute(data: JMat; mean: JMat; eigenvectors: JMat; retainedVariance: Double); cdecl; overload;//Deprecated
    {class} procedure PCACompute(data: JMat; mean: JMat; eigenvectors: JMat; maxComponents: Integer); cdecl; overload;//Deprecated
    {class} procedure PCACompute(data: JMat; mean: JMat; eigenvectors: JMat); cdecl; overload;//Deprecated
    {class} procedure PCACompute2(data: JMat; mean: JMat; eigenvectors: JMat; eigenvalues: JMat; retainedVariance: Double); cdecl; overload;//Deprecated
    {class} procedure PCACompute2(data: JMat; mean: JMat; eigenvectors: JMat; eigenvalues: JMat; maxComponents: Integer); cdecl; overload;//Deprecated
    {class} procedure PCACompute2(data: JMat; mean: JMat; eigenvectors: JMat; eigenvalues: JMat); cdecl; overload;//Deprecated
    {class} procedure PCAProject(data: JMat; mean: JMat; eigenvectors: JMat; result: JMat); cdecl;//Deprecated
    {class} function PSNR(src1: JMat; src2: JMat; R: Double): Double; cdecl; overload;//Deprecated
    {class} function PSNR(src1: JMat; src2: JMat): Double; cdecl; overload;//Deprecated
    {class} procedure SVBackSubst(w: JMat; u: JMat; vt: JMat; rhs: JMat; dst: JMat); cdecl;//Deprecated
    {class} procedure SVDecomp(src: JMat; w: JMat; u: JMat; vt: JMat; flags: Integer); cdecl; overload;//Deprecated
    {class} procedure SVDecomp(src: JMat; w: JMat; u: JMat; vt: JMat); cdecl; overload;//Deprecated
    {class} procedure absdiff(src1: JMat; src2: JMat; dst: JMat); cdecl; overload;//Deprecated
    {class} procedure absdiff(src1: JMat; src2: JScalar; dst: JMat); cdecl; overload;//Deprecated
    {class} procedure add(src1: JMat; src2: JMat; dst: JMat; mask: JMat; dtype: Integer); cdecl; overload;
    {class} procedure add(src1: JMat; src2: JMat; dst: JMat; mask: JMat); cdecl; overload;
    {class} procedure add(src1: JMat; src2: JMat; dst: JMat); cdecl; overload;
    {class} procedure add(src1: JMat; src2: JScalar; dst: JMat; mask: JMat; dtype: Integer); cdecl; overload;
    {class} procedure add(src1: JMat; src2: JScalar; dst: JMat; mask: JMat); cdecl; overload;
    {class} procedure add(src1: JMat; src2: JScalar; dst: JMat); cdecl; overload;
    {class} procedure addSamplesDataSearchPath(path: JString); cdecl;
    {class} procedure addSamplesDataSearchSubDirectory(subdir: JString); cdecl;
    {class} procedure addWeighted(src1: JMat; alpha: Double; src2: JMat; beta: Double; gamma: Double; dst: JMat; dtype: Integer); cdecl; overload;
    {class} procedure addWeighted(src1: JMat; alpha: Double; src2: JMat; beta: Double; gamma: Double; dst: JMat); cdecl; overload;
    {class} procedure batchDistance(src1: JMat; src2: JMat; dist: JMat; dtype: Integer; nidx: JMat; normType: Integer; K: Integer; mask: JMat; update: Integer; crosscheck: Boolean); cdecl; overload;
    {class} procedure batchDistance(src1: JMat; src2: JMat; dist: JMat; dtype: Integer; nidx: JMat; normType: Integer; K: Integer; mask: JMat; update: Integer); cdecl; overload;
    {class} procedure batchDistance(src1: JMat; src2: JMat; dist: JMat; dtype: Integer; nidx: JMat; normType: Integer; K: Integer; mask: JMat); cdecl; overload;
    {class} procedure batchDistance(src1: JMat; src2: JMat; dist: JMat; dtype: Integer; nidx: JMat; normType: Integer; K: Integer); cdecl; overload;
    {class} procedure batchDistance(src1: JMat; src2: JMat; dist: JMat; dtype: Integer; nidx: JMat; normType: Integer); cdecl; overload;
    {class} procedure batchDistance(src1: JMat; src2: JMat; dist: JMat; dtype: Integer; nidx: JMat); cdecl; overload;
    {class} procedure bitwise_and(src1: JMat; src2: JMat; dst: JMat; mask: JMat); cdecl; overload;
    {class} procedure bitwise_and(src1: JMat; src2: JMat; dst: JMat); cdecl; overload;
    {class} procedure bitwise_not(src: JMat; dst: JMat; mask: JMat); cdecl; overload;
    {class} procedure bitwise_not(src: JMat; dst: JMat); cdecl; overload;
    {class} procedure bitwise_or(src1: JMat; src2: JMat; dst: JMat; mask: JMat); cdecl; overload;
    {class} procedure bitwise_or(src1: JMat; src2: JMat; dst: JMat); cdecl; overload;
    {class} procedure bitwise_xor(src1: JMat; src2: JMat; dst: JMat; mask: JMat); cdecl; overload;
    {class} procedure bitwise_xor(src1: JMat; src2: JMat; dst: JMat); cdecl; overload;//Deprecated
    {class} function borderInterpolate(p: Integer; len: Integer; borderType: Integer): Integer; cdecl;//Deprecated
    {class} procedure calcCovarMatrix(samples: JMat; covar: JMat; mean: JMat; flags: Integer; ctype: Integer); cdecl; overload;//Deprecated
    {class} procedure calcCovarMatrix(samples: JMat; covar: JMat; mean: JMat; flags: Integer); cdecl; overload;//Deprecated
    {class} procedure cartToPolar(x: JMat; y: JMat; magnitude: JMat; angle: JMat; angleInDegrees: Boolean); cdecl; overload;//Deprecated
    {class} procedure cartToPolar(x: JMat; y: JMat; magnitude: JMat; angle: JMat); cdecl; overload;//Deprecated
    {class} function checkRange(a: JMat; quiet: Boolean; minVal: Double; maxVal: Double): Boolean; cdecl; overload;//Deprecated
    {class} function checkRange(a: JMat; quiet: Boolean; minVal: Double): Boolean; cdecl; overload;//Deprecated
    {class} function checkRange(a: JMat; quiet: Boolean): Boolean; cdecl; overload;//Deprecated
    {class} function checkRange(a: JMat): Boolean; cdecl; overload;//Deprecated
    {class} procedure compare(src1: JMat; src2: JMat; dst: JMat; cmpop: Integer); cdecl; overload;//Deprecated
    {class} procedure compare(src1: JMat; src2: JScalar; dst: JMat; cmpop: Integer); cdecl; overload;//Deprecated
    {class} procedure completeSymm(m: JMat; lowerToUpper: Boolean); cdecl; overload;//Deprecated
    {class} procedure completeSymm(m: JMat); cdecl; overload;//Deprecated
    {class} procedure convertFp16(src: JMat; dst: JMat); cdecl;//Deprecated
    {class} procedure convertScaleAbs(src: JMat; dst: JMat; alpha: Double; beta: Double); cdecl; overload;//Deprecated
    {class} procedure convertScaleAbs(src: JMat; dst: JMat; alpha: Double); cdecl; overload;//Deprecated
    {class} procedure convertScaleAbs(src: JMat; dst: JMat); cdecl; overload;//Deprecated
    {class} procedure copyMakeBorder(src: JMat; dst: JMat; top: Integer; bottom: Integer; left: Integer; right: Integer; borderType: Integer; value: JScalar); cdecl; overload;//Deprecated
    {class} procedure copyMakeBorder(src: JMat; dst: JMat; top: Integer; bottom: Integer; left: Integer; right: Integer; borderType: Integer); cdecl; overload;//Deprecated
    {class} procedure copyTo(src: JMat; dst: JMat; mask: JMat); cdecl;//Deprecated
    {class} function countNonZero(src: JMat): Integer; cdecl;//Deprecated
    {class} function cubeRoot(val: Single): Single; cdecl;//Deprecated
    {class} procedure dct(src: JMat; dst: JMat; flags: Integer); cdecl; overload;
    {class} procedure dct(src: JMat; dst: JMat); cdecl; overload;
    {class} function determinant(mtx: JMat): Double; cdecl;
    {class} procedure dft(src: JMat; dst: JMat; flags: Integer; nonzeroRows: Integer); cdecl; overload;
    {class} procedure dft(src: JMat; dst: JMat; flags: Integer); cdecl; overload;
    {class} procedure dft(src: JMat; dst: JMat); cdecl; overload;
    {class} procedure divide(src1: JMat; src2: JMat; dst: JMat; scale: Double; dtype: Integer); cdecl; overload;
    {class} procedure divide(src1: JMat; src2: JMat; dst: JMat; scale: Double); cdecl; overload;
    {class} procedure divide(src1: JMat; src2: JMat; dst: JMat); cdecl; overload;
    {class} procedure divide(src1: JMat; src2: JScalar; dst: JMat; scale: Double; dtype: Integer); cdecl; overload;
    {class} procedure divide(src1: JMat; src2: JScalar; dst: JMat; scale: Double); cdecl; overload;
    {class} procedure divide(src1: JMat; src2: JScalar; dst: JMat); cdecl; overload;
    {class} procedure divide(scale: Double; src2: JMat; dst: JMat; dtype: Integer); cdecl; overload;
    {class} procedure divide(scale: Double; src2: JMat; dst: JMat); cdecl; overload;
    {class} function eigen(src: JMat; eigenvalues: JMat; eigenvectors: JMat): Boolean; cdecl; overload;
    {class} function eigen(src: JMat; eigenvalues: JMat): Boolean; cdecl; overload;
    {class} procedure eigenNonSymmetric(src: JMat; eigenvalues: JMat; eigenvectors: JMat); cdecl;
    {class} procedure exp(src: JMat; dst: JMat); cdecl;
    {class} procedure extractChannel(src: JMat; dst: JMat; coi: Integer); cdecl;
    {class} function fastAtan2(y: Single; x: Single): Single; cdecl;
    {class} function findFile(relative_path: JString; required: Boolean; silentMode: Boolean): JString; cdecl; overload;
    {class} function findFile(relative_path: JString; required: Boolean): JString; cdecl; overload;
    {class} function findFile(relative_path: JString): JString; cdecl; overload;
    {class} function findFileOrKeep(relative_path: JString; silentMode: Boolean): JString; cdecl; overload;
    {class} function findFileOrKeep(relative_path: JString): JString; cdecl; overload;//Deprecated
    {class} procedure findNonZero(src: JMat; idx: JMat); cdecl;//Deprecated
    {class} procedure flip(src: JMat; dst: JMat; flipCode: Integer); cdecl;//Deprecated
    {class} procedure gemm(src1: JMat; src2: JMat; alpha: Double; src3: JMat; beta: Double; dst: JMat; flags: Integer); cdecl; overload;//Deprecated
    {class} procedure gemm(src1: JMat; src2: JMat; alpha: Double; src3: JMat; beta: Double; dst: JMat); cdecl; overload;//Deprecated
    {class} function getBuildInformation: JString; cdecl;//Deprecated
    {class} function getCPUTickCount: Int64; cdecl;//Deprecated
    {class} function getHardwareFeatureName(feature: Integer): JString; cdecl;//Deprecated
    {class} function getIppVersion: JString; cdecl;//Deprecated
    {class} function getNumThreads: Integer; cdecl;//Deprecated
    {class} function getNumberOfCPUs: Integer; cdecl;//Deprecated
    {class} function getOptimalDFTSize(vecsize: Integer): Integer; cdecl;//Deprecated
    {class} function getThreadNum: Integer; cdecl;//Deprecated
    {class} function getTickCount: Int64; cdecl;//Deprecated
    {class} function getTickFrequency: Double; cdecl;//Deprecated
    {class} function getVersionMajor: Integer; cdecl;//Deprecated
    {class} function getVersionMinor: Integer; cdecl;//Deprecated
    {class} function getVersionRevision: Integer; cdecl;//Deprecated
    {class} function getVersionString: JString; cdecl;//Deprecated
    {class} procedure hconcat(src: JList; dst: JMat); cdecl;//Deprecated
    {class} procedure idct(src: JMat; dst: JMat; flags: Integer); cdecl; overload;//Deprecated
    {class} procedure idct(src: JMat; dst: JMat); cdecl; overload;//Deprecated
    {class} procedure idft(src: JMat; dst: JMat; flags: Integer; nonzeroRows: Integer); cdecl; overload;
    {class} procedure idft(src: JMat; dst: JMat; flags: Integer); cdecl; overload;
    {class} procedure idft(src: JMat; dst: JMat); cdecl; overload;
    {class} procedure inRange(src: JMat; lowerb: JScalar; upperb: JScalar; dst: JMat); cdecl;
    {class} procedure insertChannel(src: JMat; dst: JMat; coi: Integer); cdecl;
    {class} function invert(src: JMat; dst: JMat; flags: Integer): Double; cdecl; overload;
    {class} function invert(src: JMat; dst: JMat): Double; cdecl; overload;
    {class} function kmeans(data: JMat; K: Integer; bestLabels: JMat; criteria: JTermCriteria; attempts: Integer; flags: Integer; centers: JMat): Double; cdecl; overload;
    {class} function kmeans(data: JMat; K: Integer; bestLabels: JMat; criteria: JTermCriteria; attempts: Integer; flags: Integer): Double; cdecl; overload;
    {class} procedure log(src: JMat; dst: JMat); cdecl;
    {class} procedure magnitude(x: JMat; y: JMat; magnitude: JMat); cdecl;
    {class} procedure max(src1: JMat; src2: JMat; dst: JMat); cdecl; overload;
    {class} procedure max(src1: JMat; src2: JScalar; dst: JMat); cdecl; overload;
    {class} function mean(src: JMat; mask: JMat): JScalar; cdecl; overload;
    {class} function mean(src: JMat): JScalar; cdecl; overload;
    {class} procedure meanStdDev(src: JMat; mean: JMatOfDouble; stddev: JMatOfDouble; mask: JMat); cdecl; overload;
    {class} procedure meanStdDev(src: JMat; mean: JMatOfDouble; stddev: JMatOfDouble); cdecl; overload;
    {class} procedure merge(mv: JList; dst: JMat); cdecl;
    {class} procedure min(src1: JMat; src2: JMat; dst: JMat); cdecl; overload;
    {class} procedure min(src1: JMat; src2: JScalar; dst: JMat); cdecl; overload;
    {class} function minMaxLoc(src: JMat; mask: JMat): JCore_MinMaxLocResult; cdecl; overload;
    {class} function minMaxLoc(src: JMat): JCore_MinMaxLocResult; cdecl; overload;
    {class} procedure mixChannels(src: JList; dst: JList; fromTo: JMatOfInt); cdecl;
    {class} procedure mulSpectrums(a: JMat; b: JMat; c: JMat; flags: Integer; conjB: Boolean); cdecl; overload;//Deprecated
    {class} procedure mulSpectrums(a: JMat; b: JMat; c: JMat; flags: Integer); cdecl; overload;//Deprecated
    {class} procedure mulTransposed(src: JMat; dst: JMat; aTa: Boolean; delta: JMat; scale: Double; dtype: Integer); cdecl; overload;//Deprecated
    {class} procedure mulTransposed(src: JMat; dst: JMat; aTa: Boolean; delta: JMat; scale: Double); cdecl; overload;//Deprecated
    {class} procedure mulTransposed(src: JMat; dst: JMat; aTa: Boolean; delta: JMat); cdecl; overload;//Deprecated
    {class} procedure mulTransposed(src: JMat; dst: JMat; aTa: Boolean); cdecl; overload;//Deprecated
    {class} procedure multiply(src1: JMat; src2: JMat; dst: JMat; scale: Double; dtype: Integer); cdecl; overload;//Deprecated
    {class} procedure multiply(src1: JMat; src2: JMat; dst: JMat; scale: Double); cdecl; overload;//Deprecated
    {class} procedure multiply(src1: JMat; src2: JMat; dst: JMat); cdecl; overload;//Deprecated
    {class} procedure multiply(src1: JMat; src2: JScalar; dst: JMat; scale: Double; dtype: Integer); cdecl; overload;//Deprecated
    {class} procedure multiply(src1: JMat; src2: JScalar; dst: JMat; scale: Double); cdecl; overload;//Deprecated
    {class} procedure multiply(src1: JMat; src2: JScalar; dst: JMat); cdecl; overload;//Deprecated
    {class} function norm(src1: JMat; src2: JMat; normType: Integer; mask: JMat): Double; cdecl; overload;//Deprecated
    {class} function norm(src1: JMat; src2: JMat; normType: Integer): Double; cdecl; overload;//Deprecated
    {class} function norm(src1: JMat; src2: JMat): Double; cdecl; overload;//Deprecated
    {class} function norm(src1: JMat; normType: Integer; mask: JMat): Double; cdecl; overload;//Deprecated
    {class} function norm(src1: JMat; normType: Integer): Double; cdecl; overload;//Deprecated
    {class} function norm(src1: JMat): Double; cdecl; overload;//Deprecated
    {class} procedure normalize(src: JMat; dst: JMat; alpha: Double; beta: Double; norm_type: Integer; dtype: Integer; mask: JMat); cdecl; overload;//Deprecated
    {class} procedure normalize(src: JMat; dst: JMat; alpha: Double; beta: Double; norm_type: Integer; dtype: Integer); cdecl; overload;//Deprecated
    {class} procedure normalize(src: JMat; dst: JMat; alpha: Double; beta: Double; norm_type: Integer); cdecl; overload;//Deprecated
    {class} procedure normalize(src: JMat; dst: JMat; alpha: Double; beta: Double); cdecl; overload;//Deprecated
    {class} procedure normalize(src: JMat; dst: JMat; alpha: Double); cdecl; overload;//Deprecated
    {class} procedure normalize(src: JMat; dst: JMat); cdecl; overload;
    {class} procedure patchNaNs(a: JMat; val: Double); cdecl; overload;
    {class} procedure patchNaNs(a: JMat); cdecl; overload;
    {class} procedure perspectiveTransform(src: JMat; dst: JMat; m: JMat); cdecl;
    {class} procedure phase(x: JMat; y: JMat; angle: JMat; angleInDegrees: Boolean); cdecl; overload;
    {class} procedure phase(x: JMat; y: JMat; angle: JMat); cdecl; overload;
    {class} procedure polarToCart(magnitude: JMat; angle: JMat; x: JMat; y: JMat; angleInDegrees: Boolean); cdecl; overload;
    {class} procedure polarToCart(magnitude: JMat; angle: JMat; x: JMat; y: JMat); cdecl; overload;
    {class} procedure pow(src: JMat; power: Double; dst: JMat); cdecl;
    {class} procedure randShuffle(dst: JMat; iterFactor: Double); cdecl; overload;
    {class} procedure randShuffle(dst: JMat); cdecl; overload;
    {class} procedure randn(dst: JMat; mean: Double; stddev: Double); cdecl;
    {class} procedure randu(dst: JMat; low: Double; high: Double); cdecl;
    {class} procedure reduce(src: JMat; dst: JMat; dim: Integer; rtype: Integer; dtype: Integer); cdecl; overload;
    {class} procedure reduce(src: JMat; dst: JMat; dim: Integer; rtype: Integer); cdecl; overload;
    {class} procedure &repeat(src: JMat; ny: Integer; nx: Integer; dst: JMat); cdecl;
    {class} procedure rotate(src: JMat; dst: JMat; rotateCode: Integer); cdecl;
    {class} procedure scaleAdd(src1: JMat; alpha: Double; src2: JMat; dst: JMat); cdecl;
    {class} procedure setErrorVerbosity(verbose: Boolean); cdecl;
    {class} procedure setIdentity(mtx: JMat; s: JScalar); cdecl; overload;
    {class} procedure setIdentity(mtx: JMat); cdecl; overload;
    {class} procedure setNumThreads(nthreads: Integer); cdecl;
    {class} procedure setRNGSeed(seed: Integer); cdecl;
    {class} procedure setUseIPP(flag: Boolean); cdecl;
    {class} procedure setUseIPP_NotExact(flag: Boolean); cdecl;//Deprecated
    {class} function solve(src1: JMat; src2: JMat; dst: JMat; flags: Integer): Boolean; cdecl; overload;//Deprecated
    {class} function solve(src1: JMat; src2: JMat; dst: JMat): Boolean; cdecl; overload;//Deprecated
    {class} function solveCubic(coeffs: JMat; roots: JMat): Integer; cdecl;//Deprecated
    {class} function solvePoly(coeffs: JMat; roots: JMat; maxIters: Integer): Double; cdecl; overload;//Deprecated
    {class} function solvePoly(coeffs: JMat; roots: JMat): Double; cdecl; overload;//Deprecated
    {class} procedure sort(src: JMat; dst: JMat; flags: Integer); cdecl;//Deprecated
    {class} procedure sortIdx(src: JMat; dst: JMat; flags: Integer); cdecl;//Deprecated
    {class} procedure split(m: JMat; mv: JList); cdecl;//Deprecated
    {class} procedure sqrt(src: JMat; dst: JMat); cdecl;//Deprecated
    {class} procedure subtract(src1: JMat; src2: JMat; dst: JMat; mask: JMat; dtype: Integer); cdecl; overload;//Deprecated
    {class} procedure subtract(src1: JMat; src2: JMat; dst: JMat; mask: JMat); cdecl; overload;//Deprecated
    {class} procedure subtract(src1: JMat; src2: JMat; dst: JMat); cdecl; overload;//Deprecated
    {class} procedure subtract(src1: JMat; src2: JScalar; dst: JMat; mask: JMat; dtype: Integer); cdecl; overload;//Deprecated
    {class} procedure subtract(src1: JMat; src2: JScalar; dst: JMat; mask: JMat); cdecl; overload;//Deprecated
    {class} procedure subtract(src1: JMat; src2: JScalar; dst: JMat); cdecl; overload;//Deprecated
    {class} function sumElems(src: JMat): JScalar; cdecl;//Deprecated
    {class} function trace(mtx: JMat): JScalar; cdecl;//Deprecated
    {class} procedure transform(src: JMat; dst: JMat; m: JMat); cdecl;//Deprecated
    {class} procedure transpose(src: JMat; dst: JMat); cdecl;//Deprecated
    {class} function useIPP: Boolean; cdecl;//Deprecated
    {class} function useIPP_NotExact: Boolean; cdecl;//Deprecated
    {class} procedure vconcat(src: JList; dst: JMat); cdecl;//Deprecated
    {class} property BORDER_CONSTANT: Integer read _GetBORDER_CONSTANT;
    {class} property BORDER_DEFAULT: Integer read _GetBORDER_DEFAULT;
    {class} property BORDER_ISOLATED: Integer read _GetBORDER_ISOLATED;
    {class} property BORDER_REFLECT: Integer read _GetBORDER_REFLECT;
    {class} property BORDER_REFLECT101: Integer read _GetBORDER_REFLECT101;
    {class} property BORDER_REFLECT_101: Integer read _GetBORDER_REFLECT_101;
    {class} property BORDER_REPLICATE: Integer read _GetBORDER_REPLICATE;
    {class} property BORDER_TRANSPARENT: Integer read _GetBORDER_TRANSPARENT;
    {class} property BORDER_WRAP: Integer read _GetBORDER_WRAP;
    {class} property BadAlign: Integer read _GetBadAlign;
    {class} property BadAlphaChannel: Integer read _GetBadAlphaChannel;
    {class} property BadCOI: Integer read _GetBadCOI;
    {class} property BadCallBack: Integer read _GetBadCallBack;
    {class} property BadDataPtr: Integer read _GetBadDataPtr;
    {class} property BadDepth: Integer read _GetBadDepth;
    {class} property BadImageSize: Integer read _GetBadImageSize;
    {class} property BadModelOrChSeq: Integer read _GetBadModelOrChSeq;
    {class} property BadNumChannel1U: Integer read _GetBadNumChannel1U;
    {class} property BadNumChannels: Integer read _GetBadNumChannels;
    {class} property BadOffset: Integer read _GetBadOffset;
    {class} property BadOrder: Integer read _GetBadOrder;
    {class} property BadOrigin: Integer read _GetBadOrigin;
    {class} property BadROISize: Integer read _GetBadROISize;
    {class} property BadStep: Integer read _GetBadStep;
    {class} property BadTileSize: Integer read _GetBadTileSize;
    {class} property CMP_EQ: Integer read _GetCMP_EQ;
    {class} property CMP_GE: Integer read _GetCMP_GE;
    {class} property CMP_GT: Integer read _GetCMP_GT;
    {class} property CMP_LE: Integer read _GetCMP_LE;
    {class} property CMP_LT: Integer read _GetCMP_LT;
    {class} property CMP_NE: Integer read _GetCMP_NE;
    {class} property COVAR_COLS: Integer read _GetCOVAR_COLS;
    {class} property COVAR_NORMAL: Integer read _GetCOVAR_NORMAL;
    {class} property COVAR_ROWS: Integer read _GetCOVAR_ROWS;
    {class} property COVAR_SCALE: Integer read _GetCOVAR_SCALE;
    {class} property COVAR_SCRAMBLED: Integer read _GetCOVAR_SCRAMBLED;
    {class} property COVAR_USE_AVG: Integer read _GetCOVAR_USE_AVG;
    {class} property DCT_INVERSE: Integer read _GetDCT_INVERSE;
    {class} property DCT_ROWS: Integer read _GetDCT_ROWS;
    {class} property DECOMP_CHOLESKY: Integer read _GetDECOMP_CHOLESKY;
    {class} property DECOMP_EIG: Integer read _GetDECOMP_EIG;
    {class} property DECOMP_LU: Integer read _GetDECOMP_LU;
    {class} property DECOMP_NORMAL: Integer read _GetDECOMP_NORMAL;
    {class} property DECOMP_QR: Integer read _GetDECOMP_QR;
    {class} property DECOMP_SVD: Integer read _GetDECOMP_SVD;
    {class} property DFT_COMPLEX_INPUT: Integer read _GetDFT_COMPLEX_INPUT;
    {class} property DFT_COMPLEX_OUTPUT: Integer read _GetDFT_COMPLEX_OUTPUT;
    {class} property DFT_INVERSE: Integer read _GetDFT_INVERSE;
    {class} property DFT_REAL_OUTPUT: Integer read _GetDFT_REAL_OUTPUT;
    {class} property DFT_ROWS: Integer read _GetDFT_ROWS;
    {class} property DFT_SCALE: Integer read _GetDFT_SCALE;
    {class} property FILLED: Integer read _GetFILLED;
    {class} property Formatter_FMT_C: Integer read _GetFormatter_FMT_C;
    {class} property Formatter_FMT_CSV: Integer read _GetFormatter_FMT_CSV;
    {class} property Formatter_FMT_DEFAULT: Integer read _GetFormatter_FMT_DEFAULT;
    {class} property Formatter_FMT_MATLAB: Integer read _GetFormatter_FMT_MATLAB;
    {class} property Formatter_FMT_NUMPY: Integer read _GetFormatter_FMT_NUMPY;
    {class} property Formatter_FMT_PYTHON: Integer read _GetFormatter_FMT_PYTHON;
    {class} property GEMM_1_T: Integer read _GetGEMM_1_T;
    {class} property GEMM_2_T: Integer read _GetGEMM_2_T;
    {class} property GEMM_3_T: Integer read _GetGEMM_3_T;
    {class} property GpuApiCallError: Integer read _GetGpuApiCallError;
    {class} property GpuNotSupported: Integer read _GetGpuNotSupported;
    {class} property HeaderIsNull: Integer read _GetHeaderIsNull;
    {class} property KMEANS_PP_CENTERS: Integer read _GetKMEANS_PP_CENTERS;
    {class} property KMEANS_RANDOM_CENTERS: Integer read _GetKMEANS_RANDOM_CENTERS;
    {class} property KMEANS_USE_INITIAL_LABELS: Integer read _GetKMEANS_USE_INITIAL_LABELS;
    {class} property MaskIsTiled: Integer read _GetMaskIsTiled;
    {class} property NATIVE_LIBRARY_NAME: JString read _GetNATIVE_LIBRARY_NAME;
    {class} property NORM_HAMMING: Integer read _GetNORM_HAMMING;
    {class} property NORM_HAMMING2: Integer read _GetNORM_HAMMING2;
    {class} property NORM_INF: Integer read _GetNORM_INF;
    {class} property NORM_L1: Integer read _GetNORM_L1;
    {class} property NORM_L2: Integer read _GetNORM_L2;
    {class} property NORM_L2SQR: Integer read _GetNORM_L2SQR;
    {class} property NORM_MINMAX: Integer read _GetNORM_MINMAX;
    {class} property NORM_RELATIVE: Integer read _GetNORM_RELATIVE;
    {class} property NORM_TYPE_MASK: Integer read _GetNORM_TYPE_MASK;
    {class} property OpenCLApiCallError: Integer read _GetOpenCLApiCallError;
    {class} property OpenCLDoubleNotSupported: Integer read _GetOpenCLDoubleNotSupported;
    {class} property OpenCLInitError: Integer read _GetOpenCLInitError;
    {class} property OpenCLNoAMDBlasFft: Integer read _GetOpenCLNoAMDBlasFft;
    {class} property OpenGlApiCallError: Integer read _GetOpenGlApiCallError;
    {class} property OpenGlNotSupported: Integer read _GetOpenGlNotSupported;
    {class} property PCA_DATA_AS_COL: Integer read _GetPCA_DATA_AS_COL;
    {class} property PCA_DATA_AS_ROW: Integer read _GetPCA_DATA_AS_ROW;
    {class} property PCA_USE_AVG: Integer read _GetPCA_USE_AVG;
    {class} property Param_ALGORITHM: Integer read _GetParam_ALGORITHM;
    {class} property Param_BOOLEAN: Integer read _GetParam_BOOLEAN;
    {class} property Param_FLOAT: Integer read _GetParam_FLOAT;
    {class} property Param_INT: Integer read _GetParam_INT;
    {class} property Param_MAT: Integer read _GetParam_MAT;
    {class} property Param_MAT_VECTOR: Integer read _GetParam_MAT_VECTOR;
    {class} property Param_REAL: Integer read _GetParam_REAL;
    {class} property Param_SCALAR: Integer read _GetParam_SCALAR;
    {class} property Param_STRING: Integer read _GetParam_STRING;
    {class} property Param_UCHAR: Integer read _GetParam_UCHAR;
    {class} property Param_UINT64: Integer read _GetParam_UINT64;
    {class} property Param_UNSIGNED_INT: Integer read _GetParam_UNSIGNED_INT;
    {class} property REDUCE_AVG: Integer read _GetREDUCE_AVG;
    {class} property REDUCE_MAX: Integer read _GetREDUCE_MAX;
    {class} property REDUCE_MIN: Integer read _GetREDUCE_MIN;
    {class} property REDUCE_SUM: Integer read _GetREDUCE_SUM;
    {class} property RNG_NORMAL: Integer read _GetRNG_NORMAL;
    {class} property RNG_UNIFORM: Integer read _GetRNG_UNIFORM;
    {class} property ROTATE_180: Integer read _GetROTATE_180;
    {class} property ROTATE_90_CLOCKWISE: Integer read _GetROTATE_90_CLOCKWISE;
    {class} property ROTATE_90_COUNTERCLOCKWISE: Integer read _GetROTATE_90_COUNTERCLOCKWISE;
    {class} property SORT_ASCENDING: Integer read _GetSORT_ASCENDING;
    {class} property SORT_DESCENDING: Integer read _GetSORT_DESCENDING;
    {class} property SORT_EVERY_COLUMN: Integer read _GetSORT_EVERY_COLUMN;
    {class} property SORT_EVERY_ROW: Integer read _GetSORT_EVERY_ROW;
    {class} property SVD_FULL_UV: Integer read _GetSVD_FULL_UV;
    {class} property SVD_MODIFY_A: Integer read _GetSVD_MODIFY_A;
    {class} property SVD_NO_UV: Integer read _GetSVD_NO_UV;
    {class} property StsAssert: Integer read _GetStsAssert;
    {class} property StsAutoTrace: Integer read _GetStsAutoTrace;
    {class} property StsBackTrace: Integer read _GetStsBackTrace;
    {class} property StsBadArg: Integer read _GetStsBadArg;
    {class} property StsBadFlag: Integer read _GetStsBadFlag;
    {class} property StsBadFunc: Integer read _GetStsBadFunc;
    {class} property StsBadMask: Integer read _GetStsBadMask;
    {class} property StsBadMemBlock: Integer read _GetStsBadMemBlock;
    {class} property StsBadPoint: Integer read _GetStsBadPoint;
    {class} property StsBadSize: Integer read _GetStsBadSize;
    {class} property StsDivByZero: Integer read _GetStsDivByZero;
    {class} property StsError: Integer read _GetStsError;
    {class} property StsFilterOffsetErr: Integer read _GetStsFilterOffsetErr;
    {class} property StsFilterStructContentErr: Integer read _GetStsFilterStructContentErr;
    {class} property StsInplaceNotSupported: Integer read _GetStsInplaceNotSupported;
    {class} property StsInternal: Integer read _GetStsInternal;
    {class} property StsKernelStructContentErr: Integer read _GetStsKernelStructContentErr;
    {class} property StsNoConv: Integer read _GetStsNoConv;
    {class} property StsNoMem: Integer read _GetStsNoMem;
    {class} property StsNotImplemented: Integer read _GetStsNotImplemented;
    {class} property StsNullPtr: Integer read _GetStsNullPtr;
    {class} property StsObjectNotFound: Integer read _GetStsObjectNotFound;
    {class} property StsOk: Integer read _GetStsOk;
    {class} property StsOutOfRange: Integer read _GetStsOutOfRange;
    {class} property StsParseError: Integer read _GetStsParseError;
    {class} property StsUnmatchedFormats: Integer read _GetStsUnmatchedFormats;
    {class} property StsUnmatchedSizes: Integer read _GetStsUnmatchedSizes;
    {class} property StsUnsupportedFormat: Integer read _GetStsUnsupportedFormat;
    {class} property StsVecLengthErr: Integer read _GetStsVecLengthErr;
    {class} property VERSION: JString read _GetVERSION;
    {class} property VERSION_MAJOR: Integer read _GetVERSION_MAJOR;
    {class} property VERSION_MINOR: Integer read _GetVERSION_MINOR;
    {class} property VERSION_REVISION: Integer read _GetVERSION_REVISION;
    {class} property VERSION_STATUS: JString read _GetVERSION_STATUS;
  end;

  [JavaSignature('org/opencv/core/Core')]
  JCore = interface(JObject)
    ['{0856B870-5E51-4303-99DD-D4CDF49B7B33}']
  end;
  TJCore = class(TJavaGenericImport<JCoreClass, JCore>) end;

  JCore_MinMaxLocResultClass = interface(JObjectClass)
    ['{9223DB15-0A88-4DFE-9DD9-C7A099D978AA}']
    {class} function _GetmaxLoc: Jcore_Point; cdecl;
    {class} procedure _SetmaxLoc(Value: Jcore_Point); cdecl;
    {class} function init: JCore_MinMaxLocResult; cdecl;
    {class} property maxLoc: Jcore_Point read _GetmaxLoc write _SetmaxLoc;
  end;

  [JavaSignature('org/opencv/core/Core$MinMaxLocResult')]
  JCore_MinMaxLocResult = interface(JObject)
    ['{F7C487A7-ECFE-40AB-AB12-D4858ADC187A}']
    function _GetmaxVal: Double; cdecl;
    function _GetminLoc: Jcore_Point; cdecl;
    procedure _SetminLoc(Value: Jcore_Point); cdecl;
    function _GetminVal: Double; cdecl;
    procedure _SetminVal(Value: Double); cdecl;
    property maxVal: Double read _GetmaxVal;
    property minLoc: Jcore_Point read _GetminLoc write _SetminLoc;
    property minVal: Double read _GetminVal write _SetminVal;
  end;
  TJCore_MinMaxLocResult = class(TJavaGenericImport<JCore_MinMaxLocResultClass, JCore_MinMaxLocResult>) end;

  JCvExceptionClass = interface(JRuntimeExceptionClass)
    ['{558A44E5-8172-43C0-A76D-227E6FF45D84}']
    {class} function init(msg: JString): JCvException; cdecl;
    {class} function toString: JString; cdecl;//Deprecated
  end;

  [JavaSignature('org/opencv/core/CvException')]
  JCvException = interface(JRuntimeException)
    ['{ACB0C3C0-CC44-4407-9DCF-B152E1374E64}']
  end;
  TJCvException = class(TJavaGenericImport<JCvExceptionClass, JCvException>) end;

  JCvTypeClass = interface(JObjectClass)
    ['{6CEE4D19-9A99-45F1-98F0-FB6603D7BD1A}']
    {class} function _GetCV_16F: Integer; cdecl;
    {class} function _GetCV_16FC1: Integer; cdecl;
    {class} function _GetCV_16FC2: Integer; cdecl;
    {class} function _GetCV_16FC3: Integer; cdecl;
    {class} function _GetCV_16FC4: Integer; cdecl;
    {class} function _GetCV_16S: Integer; cdecl;
    {class} function _GetCV_16SC1: Integer; cdecl;
    {class} function _GetCV_16SC2: Integer; cdecl;
    {class} function _GetCV_16SC3: Integer; cdecl;
    {class} function _GetCV_16SC4: Integer; cdecl;
    {class} function _GetCV_16U: Integer; cdecl;
    {class} function _GetCV_16UC1: Integer; cdecl;
    {class} function _GetCV_16UC2: Integer; cdecl;
    {class} function _GetCV_16UC3: Integer; cdecl;
    {class} function _GetCV_16UC4: Integer; cdecl;
    {class} function _GetCV_32F: Integer; cdecl;
    {class} function _GetCV_32FC1: Integer; cdecl;
    {class} function _GetCV_32FC2: Integer; cdecl;
    {class} function _GetCV_32FC3: Integer; cdecl;
    {class} function _GetCV_32FC4: Integer; cdecl;
    {class} function _GetCV_32S: Integer; cdecl;
    {class} function _GetCV_32SC1: Integer; cdecl;
    {class} function _GetCV_32SC2: Integer; cdecl;
    {class} function _GetCV_32SC3: Integer; cdecl;
    {class} function _GetCV_32SC4: Integer; cdecl;
    {class} function _GetCV_64F: Integer; cdecl;
    {class} function _GetCV_64FC1: Integer; cdecl;
    {class} function _GetCV_64FC2: Integer; cdecl;
    {class} function _GetCV_64FC3: Integer; cdecl;
    {class} function _GetCV_64FC4: Integer; cdecl;
    {class} function _GetCV_8S: Integer; cdecl;
    {class} function _GetCV_8SC1: Integer; cdecl;
    {class} function _GetCV_8SC2: Integer; cdecl;
    {class} function _GetCV_8SC3: Integer; cdecl;
    {class} function _GetCV_8SC4: Integer; cdecl;
    {class} function _GetCV_8U: Integer; cdecl;
    {class} function _GetCV_8UC1: Integer; cdecl;
    {class} function _GetCV_8UC2: Integer; cdecl;
    {class} function _GetCV_8UC3: Integer; cdecl;
    {class} function _GetCV_8UC4: Integer; cdecl;
    {class} function _GetCV_USRTYPE1: Integer; cdecl;
    {class} function init: JCvType; cdecl;
    {class} function CV_16FC(ch: Integer): Integer; cdecl;//Deprecated
    {class} function CV_16SC(ch: Integer): Integer; cdecl;//Deprecated
    {class} function CV_16UC(ch: Integer): Integer; cdecl;//Deprecated
    {class} function CV_32FC(ch: Integer): Integer; cdecl;//Deprecated
    {class} function CV_32SC(ch: Integer): Integer; cdecl;//Deprecated
    {class} function CV_64FC(ch: Integer): Integer; cdecl;//Deprecated
    {class} function CV_8SC(ch: Integer): Integer; cdecl;//Deprecated
    {class} function CV_8UC(ch: Integer): Integer; cdecl;//Deprecated
    {class} function ELEM_SIZE(type_: Integer): Integer; cdecl;
    {class} function channels(type_: Integer): Integer; cdecl;
    {class} function depth(type_: Integer): Integer; cdecl;
    {class} function isInteger(type_: Integer): Boolean; cdecl;//Deprecated
    {class} function makeType(depth: Integer; channels: Integer): Integer; cdecl;
    {class} function typeToString(type_: Integer): JString; cdecl;//Deprecated
    {class} property CV_16F: Integer read _GetCV_16F;
    {class} property CV_16FC1: Integer read _GetCV_16FC1;
    {class} property CV_16FC2: Integer read _GetCV_16FC2;
    {class} property CV_16FC3: Integer read _GetCV_16FC3;
    {class} property CV_16FC4: Integer read _GetCV_16FC4;
    {class} property CV_16S: Integer read _GetCV_16S;
    {class} property CV_16SC1: Integer read _GetCV_16SC1;
    {class} property CV_16SC2: Integer read _GetCV_16SC2;
    {class} property CV_16SC3: Integer read _GetCV_16SC3;
    {class} property CV_16SC4: Integer read _GetCV_16SC4;
    {class} property CV_16U: Integer read _GetCV_16U;
    {class} property CV_16UC1: Integer read _GetCV_16UC1;
    {class} property CV_16UC2: Integer read _GetCV_16UC2;
    {class} property CV_16UC3: Integer read _GetCV_16UC3;
    {class} property CV_16UC4: Integer read _GetCV_16UC4;
    {class} property CV_32F: Integer read _GetCV_32F;
    {class} property CV_32FC1: Integer read _GetCV_32FC1;
    {class} property CV_32FC2: Integer read _GetCV_32FC2;
    {class} property CV_32FC3: Integer read _GetCV_32FC3;
    {class} property CV_32FC4: Integer read _GetCV_32FC4;
    {class} property CV_32S: Integer read _GetCV_32S;
    {class} property CV_32SC1: Integer read _GetCV_32SC1;
    {class} property CV_32SC2: Integer read _GetCV_32SC2;
    {class} property CV_32SC3: Integer read _GetCV_32SC3;
    {class} property CV_32SC4: Integer read _GetCV_32SC4;
    {class} property CV_64F: Integer read _GetCV_64F;
    {class} property CV_64FC1: Integer read _GetCV_64FC1;
    {class} property CV_64FC2: Integer read _GetCV_64FC2;
    {class} property CV_64FC3: Integer read _GetCV_64FC3;
    {class} property CV_64FC4: Integer read _GetCV_64FC4;
    {class} property CV_8S: Integer read _GetCV_8S;
    {class} property CV_8SC1: Integer read _GetCV_8SC1;
    {class} property CV_8SC2: Integer read _GetCV_8SC2;
    {class} property CV_8SC3: Integer read _GetCV_8SC3;
    {class} property CV_8SC4: Integer read _GetCV_8SC4;
    {class} property CV_8U: Integer read _GetCV_8U;
    {class} property CV_8UC1: Integer read _GetCV_8UC1;
    {class} property CV_8UC2: Integer read _GetCV_8UC2;
    {class} property CV_8UC3: Integer read _GetCV_8UC3;
    {class} property CV_8UC4: Integer read _GetCV_8UC4;
    {class} property CV_USRTYPE1: Integer read _GetCV_USRTYPE1;
  end;

  [JavaSignature('org/opencv/core/CvType')]
  JCvType = interface(JObject)
    ['{09650BC3-A890-4EC4-A98F-574662B74D1E}']
  end;
  TJCvType = class(TJavaGenericImport<JCvTypeClass, JCvType>) end;

  JDMatchClass = interface(JObjectClass)
    ['{9FF82F09-2DD1-4B21-963F-8761A66E913A}']
    {class} function _GetimgIdx: Integer; cdecl;
    {class} procedure _SetimgIdx(Value: Integer); cdecl;
    {class} function _GettrainIdx: Integer; cdecl;
    {class} function init: JDMatch; cdecl; overload;
    {class} function init(_queryIdx: Integer; _trainIdx: Integer; _distance: Single): JDMatch; cdecl; overload;
    {class} function init(_queryIdx: Integer; _trainIdx: Integer; _imgIdx: Integer; _distance: Single): JDMatch; cdecl; overload;
    {class} function toString: JString; cdecl;
    {class} property imgIdx: Integer read _GetimgIdx write _SetimgIdx;
    {class} property trainIdx: Integer read _GettrainIdx;
  end;

  [JavaSignature('org/opencv/core/DMatch')]
  JDMatch = interface(JObject)
    ['{E6918194-20BD-403A-9781-31706615D3AD}']
    function _Getdistance: Single; cdecl;
    function _GetqueryIdx: Integer; cdecl;
    function lessThan(it: JDMatch): Boolean; cdecl;
    property distance: Single read _Getdistance;
    property queryIdx: Integer read _GetqueryIdx;
  end;
  TJDMatch = class(TJavaGenericImport<JDMatchClass, JDMatch>) end;

  JKeyPointClass = interface(JObjectClass)
    ['{EEFBEC2B-64F4-40CA-A7AA-FC5224418545}']
    {class} function _Getangle: Single; cdecl;
    {class} procedure _Setangle(Value: Single); cdecl;
    {class} function _Getpt: Jcore_Point; cdecl;
    {class} function init(x: Single; y: Single; _size: Single; _angle: Single; _response: Single; _octave: Integer; _class_id: Integer): JKeyPoint; cdecl; overload;
    {class} function init: JKeyPoint; cdecl; overload;
    {class} function init(x: Single; y: Single; _size: Single; _angle: Single; _response: Single; _octave: Integer): JKeyPoint; cdecl; overload;
    {class} function init(x: Single; y: Single; _size: Single; _angle: Single; _response: Single): JKeyPoint; cdecl; overload;
    {class} function init(x: Single; y: Single; _size: Single; _angle: Single): JKeyPoint; cdecl; overload;
    {class} function init(x: Single; y: Single; _size: Single): JKeyPoint; cdecl; overload;
    {class} property angle: Single read _Getangle write _Setangle;
    {class} property pt: Jcore_Point read _Getpt;
  end;

  [JavaSignature('org/opencv/core/KeyPoint')]
  JKeyPoint = interface(JObject)
    ['{54731913-802F-4590-8007-9255FF4D2B57}']
    function _Getclass_id: Integer; cdecl;
    procedure _Setclass_id(Value: Integer); cdecl;
    function _Getoctave: Integer; cdecl;
    function _Getresponse: Single; cdecl;
    function _Getsize: Single; cdecl;
    procedure _Setsize(Value: Single); cdecl;
    function toString: JString; cdecl;//Deprecated
    property class_id: Integer read _Getclass_id write _Setclass_id;
    property octave: Integer read _Getoctave;
    property response: Single read _Getresponse;
    property size: Single read _Getsize write _Setsize;
  end;
  TJKeyPoint = class(TJavaGenericImport<JKeyPointClass, JKeyPoint>) end;

  JMatClass = interface(JObjectClass)
    ['{A4F41268-0C9D-48C2-AFDF-177C5BBC2BA1}']
    {class} function init(addr: Int64): JMat; cdecl; overload;
    {class} function init: JMat; cdecl; overload;
    {class} function init(rows: Integer; cols: Integer; type_: Integer): JMat; cdecl; overload;
    {class} function init(rows: Integer; cols: Integer; type_: Integer; data: JByteBuffer): JMat; cdecl; overload;
    {class} function init(rows: Integer; cols: Integer; type_: Integer; data: JByteBuffer; step: Int64): JMat; cdecl; overload;
    {class} function init(size: Jcore_Size; type_: Integer): JMat; cdecl; overload;
    {class} function init(sizes: TJavaArray<Integer>; type_: Integer): JMat; cdecl; overload;
    {class} function init(rows: Integer; cols: Integer; type_: Integer; s: JScalar): JMat; cdecl; overload;
    {class} function init(size: Jcore_Size; type_: Integer; s: JScalar): JMat; cdecl; overload;
    {class} function init(sizes: TJavaArray<Integer>; type_: Integer; s: JScalar): JMat; cdecl; overload;
    {class} function init(m: JMat; rowRange: Jcore_Range; colRange: Jcore_Range): JMat; cdecl; overload;
    {class} function init(m: JMat; rowRange: Jcore_Range): JMat; cdecl; overload;
    {class} function init(m: JMat; ranges: TJavaObjectArray<Jcore_Range>): JMat; cdecl; overload;
    {class} function init(m: JMat; roi: Jcore_Rect): JMat; cdecl; overload;
    {class} function adjustROI(dtop: Integer; dbottom: Integer; dleft: Integer; dright: Integer): JMat; cdecl;//Deprecated
    {class} procedure assignTo(m: JMat; type_: Integer); cdecl; overload;//Deprecated
    {class} function checkVector(elemChannels: Integer; depth: Integer): Integer; cdecl; overload;//Deprecated
    {class} function checkVector(elemChannels: Integer): Integer; cdecl; overload;//Deprecated
    {class} function clone: JMat; cdecl;
    {class} function col(x: Integer): JMat; cdecl;//Deprecated
    {class} function colRange(startcol: Integer; endcol: Integer): JMat; cdecl; overload;
    {class} procedure convertTo(m: JMat; rtype: Integer; alpha: Double; beta: Double); cdecl; overload;//Deprecated
    {class} procedure copyTo(m: JMat); cdecl; overload;
    {class} procedure copyTo(m: JMat; mask: JMat); cdecl; overload;
    {class} procedure create(rows: Integer; cols: Integer; type_: Integer); cdecl; overload;
    {class} procedure create(size: Jcore_Size; type_: Integer); cdecl; overload;
    {class} procedure create(sizes: TJavaArray<Integer>; type_: Integer); cdecl; overload;
    {class} function cross(m: JMat): JMat; cdecl;
    {class} function diag(d: JMat): JMat; cdecl; overload;
    {class} function dot(m: JMat): Double; cdecl;
    {class} function dump: JString; cdecl;
    {class} function elemSize: Int64; cdecl;//Deprecated
    {class} function elemSize1: Int64; cdecl;
    {class} function empty: Boolean; cdecl;//Deprecated
    {class} function eye(rows: Integer; cols: Integer; type_: Integer): JMat; cdecl; overload;
    {class} function eye(size: Jcore_Size; type_: Integer): JMat; cdecl; overload;//Deprecated
    {class} function &get(idx: TJavaArray<Integer>; data: TJavaArray<Integer>): Integer; cdecl; overload;
    {class} function &get(row: Integer; col: Integer; data: TJavaArray<Single>): Integer; cdecl; overload;//Deprecated
    {class} function &get(idx: TJavaArray<Integer>; data: TJavaArray<Single>): Integer; cdecl; overload;//Deprecated
    {class} function &get(row: Integer; col: Integer; data: TJavaArray<Double>): Integer; cdecl; overload;//Deprecated
    {class} function &get(row: Integer; col: Integer): TJavaArray<Double>; cdecl; overload;//Deprecated
    {class} function height: Integer; cdecl;//Deprecated
    {class} function inv(method: Integer): JMat; cdecl; overload;//Deprecated
    {class} procedure locateROI(wholeSize: Jcore_Size; ofs: Jcore_Point); cdecl;//Deprecated
    {class} function mul(m: JMat; scale: Double): JMat; cdecl; overload;//Deprecated
    {class} function mul(m: JMat): JMat; cdecl; overload;//Deprecated
    {class} function ones(rows: Integer; cols: Integer; type_: Integer): JMat; cdecl; overload;//Deprecated
    {class} function ones(size: Jcore_Size; type_: Integer): JMat; cdecl; overload;//Deprecated
    {class} function ones(sizes: TJavaArray<Integer>; type_: Integer): JMat; cdecl; overload;//Deprecated
    {class} function put(idx: TJavaArray<Integer>; data: TJavaArray<Single>): Integer; cdecl; overload;//Deprecated
    {class} function put(row: Integer; col: Integer; data: TJavaArray<Byte>): Integer; cdecl; overload;//Deprecated
    {class} function put(idx: TJavaArray<Integer>; data: TJavaArray<Byte>): Integer; cdecl; overload;
    {class} function put(row: Integer; col: Integer; data: TJavaArray<Byte>; offset: Integer; length: Integer): Integer; cdecl; overload;
    {class} function put(idx: TJavaArray<Integer>; data: TJavaArray<Byte>; offset: Integer; length: Integer): Integer; cdecl; overload;
    {class} procedure release; cdecl;//Deprecated
    {class} function reshape(cn: Integer; newshape: TJavaArray<Integer>): JMat; cdecl; overload;//Deprecated
    {class} function rowRange(startrow: Integer; endrow: Integer): JMat; cdecl; overload;
    {class} function rowRange(r: Jcore_Range): JMat; cdecl; overload;
    {class} function setTo(s: JScalar): JMat; cdecl; overload;
    {class} function size(i: Integer): Integer; cdecl; overload;
    {class} function step1: Int64; cdecl; overload;
    {class} function submat(rowStart: Integer; rowEnd: Integer; colStart: Integer; colEnd: Integer): JMat; cdecl; overload;
    {class} function submat(rowRange: Jcore_Range; colRange: Jcore_Range): JMat; cdecl; overload;
    {class} function t: JMat; cdecl;
    {class} function toString: JString; cdecl;
    {class} function total: Int64; cdecl;
    {class} function &type: Integer; cdecl;
    {class} function zeros(rows: Integer; cols: Integer; type_: Integer): JMat; cdecl; overload;
    {class} function zeros(size: Jcore_Size; type_: Integer): JMat; cdecl; overload;
    {class} function zeros(sizes: TJavaArray<Integer>; type_: Integer): JMat; cdecl; overload;
  end;

  [JavaSignature('org/opencv/core/Mat')]
  JMat = interface(JObject)
    ['{19AA6E6D-DBCA-44A7-940E-5FF2CD9A325D}']
    function _GetnativeObj: Int64; cdecl;
    procedure assignTo(m: JMat); cdecl; overload;//Deprecated
    function channels: Integer; cdecl;//Deprecated
    function checkVector(elemChannels: Integer; depth: Integer; requireContinuous: Boolean): Integer; cdecl; overload;//Deprecated
    function colRange(r: Jcore_Range): JMat; cdecl; overload;
    function cols: Integer; cdecl;
    procedure convertTo(m: JMat; rtype: Integer; alpha: Double); cdecl; overload;//Deprecated
    procedure convertTo(m: JMat; rtype: Integer); cdecl; overload;
    procedure copySize(m: JMat); cdecl;//Deprecated
    function dataAddr: Int64; cdecl;
    function depth: Integer; cdecl;
    function diag(d: Integer): JMat; cdecl; overload;
    function diag: JMat; cdecl; overload;
    function dims: Integer; cdecl;
    function &get(row: Integer; col: Integer; data: TJavaArray<Byte>): Integer; cdecl; overload;//Deprecated
    function &get(idx: TJavaArray<Integer>; data: TJavaArray<Byte>): Integer; cdecl; overload;//Deprecated
    function &get(row: Integer; col: Integer; data: TJavaArray<SmallInt>): Integer; cdecl; overload;
    function &get(idx: TJavaArray<Integer>; data: TJavaArray<SmallInt>): Integer; cdecl; overload;
    function &get(row: Integer; col: Integer; data: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    function &get(idx: TJavaArray<Integer>; data: TJavaArray<Double>): Integer; cdecl; overload;//Deprecated
    function &get(idx: TJavaArray<Integer>): TJavaArray<Double>; cdecl; overload;//Deprecated
    function getNativeObjAddr: Int64; cdecl;//Deprecated
    function inv: JMat; cdecl; overload;//Deprecated
    function isContinuous: Boolean; cdecl;//Deprecated
    function isSubmatrix: Boolean; cdecl;//Deprecated
    procedure push_back(m: JMat); cdecl;//Deprecated
    function put(row: Integer; col: Integer; data: TJavaArray<Single>): Integer; cdecl; overload;//Deprecated
    function put(row: Integer; col: Integer; data: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    function put(idx: TJavaArray<Integer>; data: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    function put(row: Integer; col: Integer; data: TJavaArray<SmallInt>): Integer; cdecl; overload;//Deprecated
    function put(idx: TJavaArray<Integer>; data: TJavaArray<SmallInt>): Integer; cdecl; overload;//Deprecated
    function reshape(cn: Integer; rows: Integer): JMat; cdecl; overload;
    function reshape(cn: Integer): JMat; cdecl; overload;
    function row(y: Integer): JMat; cdecl;
    function rows: Integer; cdecl;//Deprecated
    function setTo(value: JScalar; mask: JMat): JMat; cdecl; overload;
    function setTo(value: JMat; mask: JMat): JMat; cdecl; overload;//Deprecated
    function setTo(value: JMat): JMat; cdecl; overload;
    function size: Jcore_Size; cdecl; overload;
    function step1(i: Integer): Int64; cdecl; overload;//Deprecated
    function submat(ranges: TJavaObjectArray<Jcore_Range>): JMat; cdecl; overload;
    function submat(roi: Jcore_Rect): JMat; cdecl; overload;
    function width: Integer; cdecl;
    property nativeObj: Int64 read _GetnativeObj;
  end;
  TJMat = class(TJavaGenericImport<JMatClass, JMat>) end;

  JMatOfByteClass = interface(JMatClass)
    ['{2120EBFF-6687-4700-9D83-8F97B9D0FE37}']
    {class} function init: JMatOfByte; cdecl; overload;
    {class} function init(m: JMat): JMatOfByte; cdecl; overload;
    {class} procedure fromList(lb: JList); cdecl;//Deprecated
    {class} function fromNativeAddr(addr: Int64): JMatOfByte; cdecl;//Deprecated
    {class} function toList: JList; cdecl;
  end;

  [JavaSignature('org/opencv/core/MatOfByte')]
  JMatOfByte = interface(JMat)
    ['{51BE5DA7-6D1D-445D-9161-8DD43709B368}']
    procedure alloc(elemNumber: Integer); cdecl;//Deprecated
    function toArray: TJavaArray<Byte>; cdecl;//Deprecated
  end;
  TJMatOfByte = class(TJavaGenericImport<JMatOfByteClass, JMatOfByte>) end;

  JMatOfDMatchClass = interface(JMatClass)
    ['{5FEEF0EA-BD24-4D6C-BBE9-BC926219AC93}']
    {class} function init: JMatOfDMatch; cdecl; overload;
    {class} function init(m: JMat): JMatOfDMatch; cdecl; overload;
    {class} procedure alloc(elemNumber: Integer); cdecl;//Deprecated
    {class} function fromNativeAddr(addr: Int64): JMatOfDMatch; cdecl;//Deprecated
    {class} function toArray: TJavaObjectArray<JDMatch>; cdecl;//Deprecated
    {class} function toList: JList; cdecl;//Deprecated
  end;

  [JavaSignature('org/opencv/core/MatOfDMatch')]
  JMatOfDMatch = interface(JMat)
    ['{37BE7E55-1FBC-4646-B029-C5D0AFF69151}']
    procedure fromList(ldm: JList); cdecl;//Deprecated
  end;
  TJMatOfDMatch = class(TJavaGenericImport<JMatOfDMatchClass, JMatOfDMatch>) end;

  JMatOfDoubleClass = interface(JMatClass)
    ['{9EA7C79B-245A-4203-8A94-959B9A6BDB2D}']
    {class} function init: JMatOfDouble; cdecl; overload;
    {class} function init(m: JMat): JMatOfDouble; cdecl; overload;
    {class} procedure fromList(lb: JList); cdecl;
    {class} function fromNativeAddr(addr: Int64): JMatOfDouble; cdecl;
  end;

  [JavaSignature('org/opencv/core/MatOfDouble')]
  JMatOfDouble = interface(JMat)
    ['{2830FDBB-3411-45C7-8124-B2A9DC41E9F0}']
    procedure alloc(elemNumber: Integer); cdecl;//Deprecated
    function toArray: TJavaArray<Double>; cdecl;
    function toList: JList; cdecl;
  end;
  TJMatOfDouble = class(TJavaGenericImport<JMatOfDoubleClass, JMatOfDouble>) end;

  JMatOfFloatClass = interface(JMatClass)
    ['{BA1A1128-36ED-4372-AF71-CA403F2A2DD1}']
    {class} function init: JMatOfFloat; cdecl; overload;
    {class} function init(m: JMat): JMatOfFloat; cdecl; overload;
    {class} procedure alloc(elemNumber: Integer); cdecl;
    {class} function fromNativeAddr(addr: Int64): JMatOfFloat; cdecl;
    {class} function toArray: TJavaArray<Single>; cdecl;
    {class} function toList: JList; cdecl;
  end;

  [JavaSignature('org/opencv/core/MatOfFloat')]
  JMatOfFloat = interface(JMat)
    ['{D0470F63-A83A-4526-800E-5608BB1E8BE0}']
    procedure fromList(lb: JList); cdecl;
  end;
  TJMatOfFloat = class(TJavaGenericImport<JMatOfFloatClass, JMatOfFloat>) end;

  JMatOfFloat4Class = interface(JMatClass)
    ['{8D8FE680-18C3-42D0-967E-95B56D269810}']
    {class} function init: JMatOfFloat4; cdecl; overload;
    {class} function init(m: JMat): JMatOfFloat4; cdecl; overload;
    {class} procedure alloc(elemNumber: Integer); cdecl;//Deprecated
    {class} procedure fromList(lb: JList); cdecl;//Deprecated
    {class} function fromNativeAddr(addr: Int64): JMatOfFloat4; cdecl;//Deprecated
  end;

  [JavaSignature('org/opencv/core/MatOfFloat4')]
  JMatOfFloat4 = interface(JMat)
    ['{2A800FD4-13C2-443D-A492-C07C443376E3}']
    function toArray: TJavaArray<Single>; cdecl;//Deprecated
    function toList: JList; cdecl;//Deprecated
  end;
  TJMatOfFloat4 = class(TJavaGenericImport<JMatOfFloat4Class, JMatOfFloat4>) end;

  JMatOfFloat6Class = interface(JMatClass)
    ['{4F449E28-804B-4521-8A35-7E5E4D7B0135}']
    {class} function init: JMatOfFloat6; cdecl; overload;
    {class} function init(m: JMat): JMatOfFloat6; cdecl; overload;
    {class} function fromNativeAddr(addr: Int64): JMatOfFloat6; cdecl;//Deprecated
    {class} function toArray: TJavaArray<Single>; cdecl;
    {class} function toList: JList; cdecl;
  end;

  [JavaSignature('org/opencv/core/MatOfFloat6')]
  JMatOfFloat6 = interface(JMat)
    ['{2FD371BC-FEA1-440B-B194-3853C1FFCF60}']
    procedure alloc(elemNumber: Integer); cdecl;
    procedure fromList(lb: JList); cdecl;//Deprecated
  end;
  TJMatOfFloat6 = class(TJavaGenericImport<JMatOfFloat6Class, JMatOfFloat6>) end;

  JMatOfIntClass = interface(JMatClass)
    ['{2F3835AC-7832-4447-B355-6C8816D5C8A4}']
    {class} function init: JMatOfInt; cdecl; overload;
    {class} function init(m: JMat): JMatOfInt; cdecl; overload;
    {class} procedure alloc(elemNumber: Integer); cdecl;
    {class} function fromNativeAddr(addr: Int64): JMatOfInt; cdecl;
    {class} function toArray: TJavaArray<Integer>; cdecl;
    {class} function toList: JList; cdecl;
  end;

  [JavaSignature('org/opencv/core/MatOfInt')]
  JMatOfInt = interface(JMat)
    ['{196CACDB-D734-4D60-B94D-FE01B40203F3}']
    procedure fromList(lb: JList); cdecl;
  end;
  TJMatOfInt = class(TJavaGenericImport<JMatOfIntClass, JMatOfInt>) end;

  JMatOfInt4Class = interface(JMatClass)
    ['{0B571216-69ED-4ED8-AE07-EB1D1E7BA0E3}']
    {class} function init: JMatOfInt4; cdecl; overload;
    {class} function init(m: JMat): JMatOfInt4; cdecl; overload;
    {class} function fromNativeAddr(addr: Int64): JMatOfInt4; cdecl;
    {class} function toArray: TJavaArray<Integer>; cdecl;
    {class} function toList: JList; cdecl;
  end;

  [JavaSignature('org/opencv/core/MatOfInt4')]
  JMatOfInt4 = interface(JMat)
    ['{83C8C3A7-DEAE-4391-A560-354BBEF18815}']
    procedure alloc(elemNumber: Integer); cdecl;//Deprecated
    procedure fromList(lb: JList); cdecl;//Deprecated
  end;
  TJMatOfInt4 = class(TJavaGenericImport<JMatOfInt4Class, JMatOfInt4>) end;

  JMatOfKeyPointClass = interface(JMatClass)
    ['{F1F6FC0B-E34D-42B5-B222-2C093777F65B}']
    {class} function init: JMatOfKeyPoint; cdecl; overload;
    {class} function init(m: JMat): JMatOfKeyPoint; cdecl; overload;
    {class} procedure alloc(elemNumber: Integer); cdecl;
    {class} function fromNativeAddr(addr: Int64): JMatOfKeyPoint; cdecl;//Deprecated
    {class} function toList: JList; cdecl;
  end;

  [JavaSignature('org/opencv/core/MatOfKeyPoint')]
  JMatOfKeyPoint = interface(JMat)
    ['{7F01A023-AFED-4D62-95B5-E8B8F1C581E2}']
    procedure fromList(lkp: JList); cdecl;//Deprecated
    function toArray: TJavaObjectArray<JKeyPoint>; cdecl;//Deprecated
  end;
  TJMatOfKeyPoint = class(TJavaGenericImport<JMatOfKeyPointClass, JMatOfKeyPoint>) end;

  JMatOfPointClass = interface(JMatClass)
    ['{23AFC2ED-9440-4AB8-8620-2E7F645C2C39}']
    {class} function init: JMatOfPoint; cdecl; overload;
    {class} function init(m: JMat): JMatOfPoint; cdecl; overload;
    {class} procedure alloc(elemNumber: Integer); cdecl;
    {class} function fromNativeAddr(addr: Int64): JMatOfPoint; cdecl;
    {class} function toList: JList; cdecl;
  end;

  [JavaSignature('org/opencv/core/MatOfPoint')]
  JMatOfPoint = interface(JMat)
    ['{38B21FD0-41A0-46A5-9700-E9C69E482BA0}']
    procedure fromList(lp: JList); cdecl;
    function toArray: TJavaObjectArray<Jcore_Point>; cdecl;
  end;
  TJMatOfPoint = class(TJavaGenericImport<JMatOfPointClass, JMatOfPoint>) end;

  JMatOfPoint2fClass = interface(JMatClass)
    ['{254A7028-77DD-45FE-B202-7AB28EFE590C}']
    {class} function init: JMatOfPoint2f; cdecl; overload;
    {class} function init(m: JMat): JMatOfPoint2f; cdecl; overload;
    {class} procedure fromList(lp: JList); cdecl;//Deprecated
    {class} function fromNativeAddr(addr: Int64): JMatOfPoint2f; cdecl;//Deprecated
    {class} function toArray: TJavaObjectArray<Jcore_Point>; cdecl;//Deprecated
  end;

  [JavaSignature('org/opencv/core/MatOfPoint2f')]
  JMatOfPoint2f = interface(JMat)
    ['{E1270BE5-FEB8-46BB-8F87-B12D1B821C5F}']
    procedure alloc(elemNumber: Integer); cdecl;//Deprecated
    function toList: JList; cdecl;//Deprecated
  end;
  TJMatOfPoint2f = class(TJavaGenericImport<JMatOfPoint2fClass, JMatOfPoint2f>) end;

  JMatOfPoint3Class = interface(JMatClass)
    ['{CDB71F64-2CCC-45A1-82FB-554622932075}']
    {class} function init: JMatOfPoint3; cdecl; overload;
    {class} function init(m: JMat): JMatOfPoint3; cdecl; overload;
    {class} procedure fromList(lp: JList); cdecl;//Deprecated
    {class} function fromNativeAddr(addr: Int64): JMatOfPoint3; cdecl;//Deprecated
    {class} function toArray: TJavaObjectArray<JPoint3>; cdecl;//Deprecated
  end;

  [JavaSignature('org/opencv/core/MatOfPoint3')]
  JMatOfPoint3 = interface(JMat)
    ['{B29A8AFE-F2C0-42EE-B6B6-B0F5E897781C}']
    procedure alloc(elemNumber: Integer); cdecl;
    function toList: JList; cdecl;//Deprecated
  end;
  TJMatOfPoint3 = class(TJavaGenericImport<JMatOfPoint3Class, JMatOfPoint3>) end;

  JMatOfPoint3fClass = interface(JMatClass)
    ['{1AEC1F35-B8A1-4BDA-A3D5-80028FB9778A}']
    {class} function init: JMatOfPoint3f; cdecl; overload;
    {class} function init(m: JMat): JMatOfPoint3f; cdecl; overload;
    {class} procedure alloc(elemNumber: Integer); cdecl;//Deprecated
    {class} procedure fromList(lp: JList); cdecl;//Deprecated
    {class} function fromNativeAddr(addr: Int64): JMatOfPoint3f; cdecl;//Deprecated
    {class} function toList: JList; cdecl;
  end;

  [JavaSignature('org/opencv/core/MatOfPoint3f')]
  JMatOfPoint3f = interface(JMat)
    ['{C31DDCA3-434E-425E-9CF1-AECD04673176}']
    function toArray: TJavaObjectArray<JPoint3>; cdecl;//Deprecated
  end;
  TJMatOfPoint3f = class(TJavaGenericImport<JMatOfPoint3fClass, JMatOfPoint3f>) end;

  JMatOfRectClass = interface(JMatClass)
    ['{54FCC23B-0134-4443-B182-14D942BB2FFD}']
    {class} function init: JMatOfRect; cdecl; overload;
    {class} function init(m: JMat): JMatOfRect; cdecl; overload;
    {class} function fromNativeAddr(addr: Int64): JMatOfRect; cdecl;
    {class} function toList: JList; cdecl;
  end;

  [JavaSignature('org/opencv/core/MatOfRect')]
  JMatOfRect = interface(JMat)
    ['{7F57C662-846E-41E1-AF21-6C6139A5327E}']
    procedure alloc(elemNumber: Integer); cdecl;
    procedure fromList(lr: JList); cdecl;//Deprecated
    function toArray: TJavaObjectArray<Jcore_Rect>; cdecl;//Deprecated
  end;
  TJMatOfRect = class(TJavaGenericImport<JMatOfRectClass, JMatOfRect>) end;

  JMatOfRect2dClass = interface(JMatClass)
    ['{DB623D4C-65A4-48AA-9BC1-B478F780CEA2}']
    {class} function init: JMatOfRect2d; cdecl; overload;
    {class} function init(m: JMat): JMatOfRect2d; cdecl; overload;
    {class} procedure alloc(elemNumber: Integer); cdecl;//Deprecated
    {class} function fromNativeAddr(addr: Int64): JMatOfRect2d; cdecl;
    {class} function toArray: TJavaObjectArray<JRect2d>; cdecl;
  end;

  [JavaSignature('org/opencv/core/MatOfRect2d')]
  JMatOfRect2d = interface(JMat)
    ['{8EDB8C67-1AD7-4577-9830-8B9992422887}']
    procedure fromList(lr: JList); cdecl;
    function toList: JList; cdecl;
  end;
  TJMatOfRect2d = class(TJavaGenericImport<JMatOfRect2dClass, JMatOfRect2d>) end;

  JMatOfRotatedRectClass = interface(JMatClass)
    ['{52D1304A-959F-4CE2-B5FC-D9403231EF67}']
    {class} function init: JMatOfRotatedRect; cdecl; overload;
    {class} function init(m: JMat): JMatOfRotatedRect; cdecl; overload;
    {class} procedure alloc(elemNumber: Integer); cdecl;//Deprecated
    {class} procedure fromList(lr: JList); cdecl;
    {class} function fromNativeAddr(addr: Int64): JMatOfRotatedRect; cdecl;//Deprecated
  end;

  [JavaSignature('org/opencv/core/MatOfRotatedRect')]
  JMatOfRotatedRect = interface(JMat)
    ['{740B1869-3ADD-423D-8601-5A9CBA73CF41}']
    function toArray: TJavaObjectArray<JRotatedRect>; cdecl;//Deprecated
    function toList: JList; cdecl;//Deprecated
  end;
  TJMatOfRotatedRect = class(TJavaGenericImport<JMatOfRotatedRectClass, JMatOfRotatedRect>) end;

  Jcore_PointClass = interface(JObjectClass)
    ['{0803D3EA-384D-4D8B-8535-899868DEC960}']
    {class} function _Getx: Double; cdecl;
    {class} procedure _Setx(Value: Double); cdecl;
    {class} function _Gety: Double; cdecl;
    {class} function init(x: Double; y: Double): Jcore_Point; cdecl; overload;
    {class} function init: Jcore_Point; cdecl; overload;
    {class} function init(vals: TJavaArray<Double>): Jcore_Point; cdecl; overload;
    {class} function clone: Jcore_Point; cdecl;
    {class} function dot(p: Jcore_Point): Double; cdecl;
    {class} function equals(obj: JObject): Boolean; cdecl;
    {class} function toString: JString; cdecl;//Deprecated
    {class} property x: Double read _Getx write _Setx;
    {class} property y: Double read _Gety;
  end;

  [JavaSignature('org/opencv/core/Point')]
  Jcore_Point = interface(JObject)
    ['{E9CDE871-D6C2-4AA1-9AF1-7E3FE6E080DF}']
    function hashCode: Integer; cdecl;
    function inside(r: Jcore_Rect): Boolean; cdecl;
    procedure &set(vals: TJavaArray<Double>); cdecl;
  end;
  TJcore_Point = class(TJavaGenericImport<Jcore_PointClass, Jcore_Point>) end;

  JPoint3Class = interface(JObjectClass)
    ['{CF899781-DAEC-48E8-BEE6-C89B73A59273}']
    {class} function _Gety: Double; cdecl;
    {class} function init(x: Double; y: Double; z: Double): JPoint3; cdecl; overload;
    {class} function init: JPoint3; cdecl; overload;
    {class} function init(p: Jcore_Point): JPoint3; cdecl; overload;
    {class} function init(vals: TJavaArray<Double>): JPoint3; cdecl; overload;
    {class} function clone: JPoint3; cdecl;//Deprecated
    {class} function hashCode: Integer; cdecl;//Deprecated
    {class} procedure &set(vals: TJavaArray<Double>); cdecl;//Deprecated
    {class} function toString: JString; cdecl;//Deprecated
    {class} property y: Double read _Gety;
  end;

  [JavaSignature('org/opencv/core/Point3')]
  JPoint3 = interface(JObject)
    ['{A340AF07-EC08-4A8C-8013-2236D9C73198}']
    function _Getx: Double; cdecl;
    function _Getz: Double; cdecl;
    procedure _Setz(Value: Double); cdecl;
    function cross(p: JPoint3): JPoint3; cdecl;//Deprecated
    function dot(p: JPoint3): Double; cdecl;//Deprecated
    function equals(obj: JObject): Boolean; cdecl;//Deprecated
    property x: Double read _Getx;
    property z: Double read _Getz write _Setz;
  end;
  TJPoint3 = class(TJavaGenericImport<JPoint3Class, JPoint3>) end;

  Jcore_RangeClass = interface(JObjectClass)
    ['{B32AFC19-CE13-4826-9E6B-1AF26F949C7C}']
    {class} function _Getend: Integer; cdecl;
    {class} function init(s: Integer; e: Integer): Jcore_Range; cdecl; overload;
    {class} function init: Jcore_Range; cdecl; overload;
    {class} function init(vals: TJavaArray<Double>): Jcore_Range; cdecl; overload;
    {class} function all: Jcore_Range; cdecl;
    {class} function clone: Jcore_Range; cdecl;
    {class} function empty: Boolean; cdecl;
    {class} function shift(delta: Integer): Jcore_Range; cdecl;
    {class} function toString: JString; cdecl;
    {class} property &end: Integer read _Getend;
  end;

  [JavaSignature('org/opencv/core/Range')]
  Jcore_Range = interface(JObject)
    ['{3950FD46-A12A-4DFD-ADBA-0A21F92CDA9B}']
    function _Getstart: Integer; cdecl;
    procedure _Setstart(Value: Integer); cdecl;
    function equals(obj: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;
    function intersection(r1: Jcore_Range): Jcore_Range; cdecl;
    procedure &set(vals: TJavaArray<Double>); cdecl;
    function size: Integer; cdecl;
    property start: Integer read _Getstart write _Setstart;
  end;
  TJcore_Range = class(TJavaGenericImport<Jcore_RangeClass, Jcore_Range>) end;

  Jcore_RectClass = interface(JObjectClass)
    ['{67D42D9D-C980-4458-A35F-3FED187FCE5F}']
    {class} function _Getheight: Integer; cdecl;
    {class} function _Getwidth: Integer; cdecl;
    {class} function _Gety: Integer; cdecl;
    {class} procedure _Sety(Value: Integer); cdecl;
    {class} function init(x: Integer; y: Integer; width: Integer; height: Integer): Jcore_Rect; cdecl; overload;
    {class} function init: Jcore_Rect; cdecl; overload;
    {class} function init(p1: Jcore_Point; p2: Jcore_Point): Jcore_Rect; cdecl; overload;
    {class} function init(p: Jcore_Point; s: Jcore_Size): Jcore_Rect; cdecl; overload;
    {class} function init(vals: TJavaArray<Double>): Jcore_Rect; cdecl; overload;
    {class} function clone: Jcore_Rect; cdecl;//Deprecated
    {class} function &contains(p: Jcore_Point): Boolean; cdecl;//Deprecated
    {class} function empty: Boolean; cdecl;//Deprecated
    {class} procedure &set(vals: TJavaArray<Double>); cdecl;//Deprecated
    {class} function tl: Jcore_Point; cdecl;//Deprecated
    {class} function toString: JString; cdecl;
    {class} property height: Integer read _Getheight;
    {class} property width: Integer read _Getwidth;
    {class} property y: Integer read _Gety write _Sety;
  end;

  [JavaSignature('org/opencv/core/Rect')]
  Jcore_Rect = interface(JObject)
    ['{FF716378-B1A5-4E7F-A240-FB4F7461D805}']
    function _Getx: Integer; cdecl;
    procedure _Setx(Value: Integer); cdecl;
    function area: Double; cdecl;//Deprecated
    function br: Jcore_Point; cdecl;//Deprecated
    function equals(obj: JObject): Boolean; cdecl;//Deprecated
    function hashCode: Integer; cdecl;//Deprecated
    function size: Jcore_Size; cdecl;//Deprecated
    property x: Integer read _Getx write _Setx;
  end;
  TJcore_Rect = class(TJavaGenericImport<Jcore_RectClass, Jcore_Rect>) end;

  JRect2dClass = interface(JObjectClass)
    ['{00F9FA33-709F-4DD8-9B6B-5CFD88D40D11}']
    {class} function _Getx: Double; cdecl;
    {class} procedure _Setx(Value: Double); cdecl;
    {class} function _Gety: Double; cdecl;
    {class} function init(x: Double; y: Double; width: Double; height: Double): JRect2d; cdecl; overload;
    {class} function init: JRect2d; cdecl; overload;
    {class} function init(p1: Jcore_Point; p2: Jcore_Point): JRect2d; cdecl; overload;
    {class} function init(p: Jcore_Point; s: Jcore_Size): JRect2d; cdecl; overload;
    {class} function init(vals: TJavaArray<Double>): JRect2d; cdecl; overload;
    {class} function br: Jcore_Point; cdecl;//Deprecated
    {class} function clone: JRect2d; cdecl;//Deprecated
    {class} function &contains(p: Jcore_Point): Boolean; cdecl;//Deprecated
    {class} procedure &set(vals: TJavaArray<Double>); cdecl;//Deprecated
    {class} function size: Jcore_Size; cdecl;//Deprecated
    {class} function tl: Jcore_Point; cdecl;//Deprecated
    {class} property x: Double read _Getx write _Setx;
    {class} property y: Double read _Gety;
  end;

  [JavaSignature('org/opencv/core/Rect2d')]
  JRect2d = interface(JObject)
    ['{D2B9EAB0-EAF8-4945-B5D9-4D0FFBBB3ED8}']
    function _Getheight: Double; cdecl;
    function _Getwidth: Double; cdecl;
    function area: Double; cdecl;
    function empty: Boolean; cdecl;//Deprecated
    function equals(obj: JObject): Boolean; cdecl;//Deprecated
    function hashCode: Integer; cdecl;//Deprecated
    function toString: JString; cdecl;//Deprecated
    property height: Double read _Getheight;
    property width: Double read _Getwidth;
  end;
  TJRect2d = class(TJavaGenericImport<JRect2dClass, JRect2d>) end;

  JRotatedRectClass = interface(JObjectClass)
    ['{B2C89005-BEBF-41BC-8CFA-3001AD95D3B3}']
    {class} function _Getangle: Double; cdecl;
    {class} procedure _Setangle(Value: Double); cdecl;
    {class} function _Getcenter: Jcore_Point; cdecl;
    {class} function init: JRotatedRect; cdecl; overload;
    {class} function init(c: Jcore_Point; s: Jcore_Size; a: Double): JRotatedRect; cdecl; overload;
    {class} function init(vals: TJavaArray<Double>): JRotatedRect; cdecl; overload;
    {class} function boundingRect: Jcore_Rect; cdecl;
    {class} function clone: JRotatedRect; cdecl;
    {class} function equals(obj: JObject): Boolean; cdecl;
    {class} function toString: JString; cdecl;
    {class} property angle: Double read _Getangle write _Setangle;
    {class} property center: Jcore_Point read _Getcenter;
  end;

  [JavaSignature('org/opencv/core/RotatedRect')]
  JRotatedRect = interface(JObject)
    ['{C7C56788-4BF9-4431-8C2D-1E420602599A}']
    function _Getsize: Jcore_Size; cdecl;
    procedure _Setsize(Value: Jcore_Size); cdecl;
    function hashCode: Integer; cdecl;
    procedure points(pt: TJavaObjectArray<Jcore_Point>); cdecl;
    procedure &set(vals: TJavaArray<Double>); cdecl;
    property size: Jcore_Size read _Getsize write _Setsize;
  end;
  TJRotatedRect = class(TJavaGenericImport<JRotatedRectClass, JRotatedRect>) end;

  JScalarClass = interface(JObjectClass)
    ['{5FF2CDA7-EBDC-4515-A84B-EB4671659186}']
    {class} function _Getval: TJavaArray<Double>; cdecl;
    {class} function init(v0: Double; v1: Double; v2: Double; v3: Double): JScalar; cdecl; overload;
    {class} function init(v0: Double; v1: Double; v2: Double): JScalar; cdecl; overload;
    {class} function init(v0: Double; v1: Double): JScalar; cdecl; overload;
    {class} function init(v0: Double): JScalar; cdecl; overload;
    {class} function init(vals: TJavaArray<Double>): JScalar; cdecl; overload;
    {class} function all(v: Double): JScalar; cdecl;//Deprecated
    {class} function conj: JScalar; cdecl;//Deprecated
    {class} function equals(obj: JObject): Boolean; cdecl;//Deprecated
    {class} function hashCode: Integer; cdecl;//Deprecated
    {class} function mul(it: JScalar; scale: Double): JScalar; cdecl; overload;//Deprecated
    {class} function mul(it: JScalar): JScalar; cdecl; overload;//Deprecated
    {class} function toString: JString; cdecl;//Deprecated
    {class} property val: TJavaArray<Double> read _Getval;
  end;

  [JavaSignature('org/opencv/core/Scalar')]
  JScalar = interface(JObject)
    ['{39E4356D-B4B2-418E-8706-342529441791}']
    function clone: JScalar; cdecl;//Deprecated
    function isReal: Boolean; cdecl;//Deprecated
    procedure &set(vals: TJavaArray<Double>); cdecl;//Deprecated
  end;
  TJScalar = class(TJavaGenericImport<JScalarClass, JScalar>) end;

  Jcore_SizeClass = interface(JObjectClass)
    ['{0F76AFDE-CBFA-49F4-ABB0-B642A4DE9BCF}']
    {class} function _Getheight: Double; cdecl;
    {class} function _Getwidth: Double; cdecl;
    {class} procedure _Setwidth(Value: Double); cdecl;
    {class} function init(width: Double; height: Double): Jcore_Size; cdecl; overload;
    {class} function init: Jcore_Size; cdecl; overload;
    {class} function init(p: Jcore_Point): Jcore_Size; cdecl; overload;
    {class} function init(vals: TJavaArray<Double>): Jcore_Size; cdecl; overload;
    {class} function empty: Boolean; cdecl;
    {class} function equals(obj: JObject): Boolean; cdecl;
    {class} property height: Double read _Getheight;
    {class} property width: Double read _Getwidth write _Setwidth;
  end;

  [JavaSignature('org/opencv/core/Size')]
  Jcore_Size = interface(JObject)
    ['{41A2CE39-921F-4451-B124-F29EF80C92B0}']
    function area: Double; cdecl;
    function clone: Jcore_Size; cdecl;
    function hashCode: Integer; cdecl;
    procedure &set(vals: TJavaArray<Double>); cdecl;
    function toString: JString; cdecl;
  end;
  TJcore_Size = class(TJavaGenericImport<Jcore_SizeClass, Jcore_Size>) end;

  JTermCriteriaClass = interface(JObjectClass)
    ['{56AB0FF6-5AF1-436A-96B9-4CCFA9490273}']
    {class} function _GetCOUNT: Integer; cdecl;
    {class} function _GetEPS: Integer; cdecl;
    {class} function _GetMAX_ITER: Integer; cdecl;
    {class} function _Getepsilon: Double; cdecl;
    {class} procedure _Setepsilon(Value: Double); cdecl;
    {class} function _GetmaxCount: Integer; cdecl;
    {class} function _Gettype: Integer; cdecl;
    {class} function init(type_: Integer; maxCount: Integer; epsilon: Double): JTermCriteria; cdecl; overload;
    {class} function init: JTermCriteria; cdecl; overload;
    {class} function init(vals: TJavaArray<Double>): JTermCriteria; cdecl; overload;
    {class} function hashCode: Integer; cdecl;//Deprecated
    {class} procedure &set(vals: TJavaArray<Double>); cdecl;//Deprecated
    {class} function toString: JString; cdecl;//Deprecated
    {class} property COUNT: Integer read _GetCOUNT;
    {class} property EPS: Integer read _GetEPS;
    {class} property MAX_ITER: Integer read _GetMAX_ITER;
    {class} property epsilon: Double read _Getepsilon write _Setepsilon;
    {class} property maxCount: Integer read _GetmaxCount;
    {class} property &type: Integer read _Gettype;
  end;

  [JavaSignature('org/opencv/core/TermCriteria')]
  JTermCriteria = interface(JObject)
    ['{37B77EFF-F8A7-486D-84F8-8629B461F6AD}']
    function clone: JTermCriteria; cdecl;//Deprecated
    function equals(obj: JObject): Boolean; cdecl;//Deprecated
  end;
  TJTermCriteria = class(TJavaGenericImport<JTermCriteriaClass, JTermCriteria>) end;

  JTickMeterClass = interface(JObjectClass)
    ['{C1D8F958-1203-47ED-A583-55EEDCEB4E7B}']
    {class} function init: JTickMeter; cdecl;
    {class} function __fromPtr__(addr: Int64): JTickMeter; cdecl;
    {class} function getCounter: Int64; cdecl;
    {class} function getTimeSec: Double; cdecl;
    {class} function getTimeTicks: Int64; cdecl;
    {class} procedure reset; cdecl;//Deprecated
    {class} procedure start; cdecl;
  end;

  [JavaSignature('org/opencv/core/TickMeter')]
  JTickMeter = interface(JObject)
    ['{FAA9B768-DAC1-4D1D-83B2-2BE7E0D98F06}']
    function getNativeObjAddr: Int64; cdecl;//Deprecated
    function getTimeMicro: Double; cdecl;
    function getTimeMilli: Double; cdecl;
    procedure stop; cdecl;
  end;
  TJTickMeter = class(TJavaGenericImport<JTickMeterClass, JTickMeter>) end;

  JNetClass = interface(JObjectClass)
    ['{9E22E1C6-644E-4CAE-A443-DC86B4E7C18A}']
    {class} function init: JNet; cdecl;
    {class} function __fromPtr__(addr: Int64): JNet; cdecl;//Deprecated
    {class} procedure connect(outPin: JString; inpPin: JString); cdecl;//Deprecated
    {class} procedure enableFusion(fusion: Boolean); cdecl;//Deprecated
    {class} function forward(outputName: JString): JMat; cdecl; overload;//Deprecated
    {class} function forward: JMat; cdecl; overload;//Deprecated
    {class} function getFLOPS(netInputShape: JMatOfInt): Int64; cdecl; overload;//Deprecated
    {class} function getFLOPS(layerId: Integer; netInputShape: JMatOfInt): Int64; cdecl; overload;//Deprecated
    {class} function getLayerId(layer: JString): Integer; cdecl;
    {class} function getLayerNames: JList; cdecl;
    {class} procedure getLayerTypes(layersTypes: JList); cdecl;
    {class} procedure getMemoryConsumption(layerId: Integer; netInputShapes: JList; weights: TJavaArray<Int64>; blobs: TJavaArray<Int64>); cdecl; overload;
    {class} function getNativeObjAddr: Int64; cdecl;
    {class} function getParam(layer: JDictValue): JMat; cdecl; overload;
    {class} function getUnconnectedOutLayersNames: JList; cdecl;
    {class} function readFromModelOptimizer(xml: JString; bin: JString): JNet; cdecl; overload;
    {class} function readFromModelOptimizer(bufferModelConfig: JMatOfByte; bufferWeights: JMatOfByte): JNet; cdecl; overload;
    {class} procedure setInput(blob: JMat; name: JString); cdecl; overload;
    {class} procedure setInput(blob: JMat); cdecl; overload;
    {class} procedure setPreferableTarget(targetId: Integer); cdecl;//Deprecated
  end;

  [JavaSignature('org/opencv/dnn/Net')]
  JNet = interface(JObject)
    ['{25D1E340-A3FE-4F40-8BB2-9C2C296B7B02}']
    function dump: JString; cdecl;//Deprecated
    procedure dumpToFile(path: JString); cdecl;//Deprecated
    function empty: Boolean; cdecl;//Deprecated
    procedure forward(outputBlobs: JList; outputName: JString); cdecl; overload;//Deprecated
    procedure forward(outputBlobs: JList); cdecl; overload;//Deprecated
    procedure forward(outputBlobs: JList; outBlobNames: JList); cdecl; overload;
    function getFLOPS(layerId: Integer; netInputShapes: JList): Int64; cdecl; overload;//Deprecated
    function getFLOPS(netInputShapes: JList): Int64; cdecl; overload;//Deprecated
    function getLayer(layerId: JDictValue): JLayer; cdecl;//Deprecated
    function getLayersCount(layerType: JString): Integer; cdecl;
    procedure getMemoryConsumption(netInputShape: JMatOfInt; weights: TJavaArray<Int64>; blobs: TJavaArray<Int64>); cdecl; overload;
    procedure getMemoryConsumption(layerId: Integer; netInputShape: JMatOfInt; weights: TJavaArray<Int64>; blobs: TJavaArray<Int64>); cdecl; overload;
    function getParam(layer: JDictValue; numParam: Integer): JMat; cdecl; overload;
    function getPerfProfile(timings: JMatOfDouble): Int64; cdecl;
    function getUnconnectedOutLayers: JMatOfInt; cdecl;
    procedure setHalideScheduler(scheduler: JString); cdecl;
    procedure setInput(blob: JMat; name: JString; scalefactor: Double; mean: JScalar); cdecl; overload;
    procedure setInput(blob: JMat; name: JString; scalefactor: Double); cdecl; overload;
    procedure setInputsNames(inputBlobNames: JList); cdecl;
    procedure setParam(layer: JDictValue; numParam: Integer; blob: JMat); cdecl;
    procedure setPreferableBackend(backendId: Integer); cdecl;
  end;
  TJNet = class(TJavaGenericImport<JNetClass, JNet>) end;

  JModelClass = interface(JNetClass)
    ['{0B799729-C96D-44F4-A8DF-240F64770248}']
    {class} function init(network: JNet): JModel; cdecl; overload;
    {class} function init(model: JString; config: JString): JModel; cdecl; overload;
    {class} function init(model: JString): JModel; cdecl; overload;
    {class} function __fromPtr__(addr: Int64): JModel; cdecl;//Deprecated
    {class} procedure predict(frame: JMat; outs: JList); cdecl;//Deprecated
    {class} procedure setInputParams(scale: Double; size: Jcore_Size; mean: JScalar; swapRB: Boolean); cdecl; overload;//Deprecated
    {class} procedure setInputParams(scale: Double; size: Jcore_Size; mean: JScalar); cdecl; overload;//Deprecated
    {class} procedure setInputParams(scale: Double; size: Jcore_Size); cdecl; overload;//Deprecated
    {class} function setInputSize(size: Jcore_Size): JModel; cdecl; overload;//Deprecated
    {class} function setInputSize(width: Integer; height: Integer): JModel; cdecl; overload;//Deprecated
  end;

  [JavaSignature('org/opencv/dnn/Model')]
  JModel = interface(JNet)
    ['{75D8BF12-DA3B-420F-9E57-40371B39577B}']
    function setInputCrop(crop: Boolean): JModel; cdecl;//Deprecated
    function setInputMean(mean: JScalar): JModel; cdecl;//Deprecated
    procedure setInputParams(scale: Double; size: Jcore_Size; mean: JScalar; swapRB: Boolean; crop: Boolean); cdecl; overload;//Deprecated
    procedure setInputParams(scale: Double); cdecl; overload;//Deprecated
    procedure setInputParams; cdecl; overload;//Deprecated
    function setInputScale(scale: Double): JModel; cdecl;//Deprecated
    function setInputSwapRB(swapRB: Boolean): JModel; cdecl;//Deprecated
  end;
  TJModel = class(TJavaGenericImport<JModelClass, JModel>) end;

  JClassificationModelClass = interface(JModelClass)
    ['{3CAD2DEA-4823-4177-BCE5-F0CADBEA00D4}']
    {class} function init(network: JNet): JClassificationModel; cdecl; overload;
    {class} function init(model: JString; config: JString): JClassificationModel; cdecl; overload;
    {class} function init(model: JString): JClassificationModel; cdecl; overload;
    {class} function __fromPtr__(addr: Int64): JClassificationModel; cdecl;
  end;

  [JavaSignature('org/opencv/dnn/ClassificationModel')]
  JClassificationModel = interface(JModel)
    ['{6B33214C-2F30-4AF9-A91F-CF376B5934A8}']
    procedure classify(frame: JMat; classId: TJavaArray<Integer>; conf: TJavaArray<Single>); cdecl;
  end;
  TJClassificationModel = class(TJavaGenericImport<JClassificationModelClass, JClassificationModel>) end;

  JDetectionModelClass = interface(JModelClass)
    ['{5392186A-06BA-415C-9599-0013FD3D9257}']
    {class} function init(network: JNet): JDetectionModel; cdecl; overload;
    {class} function init(model: JString; config: JString): JDetectionModel; cdecl; overload;
    {class} function init(model: JString): JDetectionModel; cdecl; overload;
    {class} function __fromPtr__(addr: Int64): JDetectionModel; cdecl;//Deprecated
    {class} procedure detect(frame: JMat; classIds: JMatOfInt; confidences: JMatOfFloat; boxes: JMatOfRect; confThreshold: Single; nmsThreshold: Single); cdecl; overload;//Deprecated
    {class} procedure detect(frame: JMat; classIds: JMatOfInt; confidences: JMatOfFloat; boxes: JMatOfRect; confThreshold: Single); cdecl; overload;//Deprecated
  end;

  [JavaSignature('org/opencv/dnn/DetectionModel')]
  JDetectionModel = interface(JModel)
    ['{A2A20AF7-AFD7-432E-A916-1FD83EB8720D}']
    procedure detect(frame: JMat; classIds: JMatOfInt; confidences: JMatOfFloat; boxes: JMatOfRect); cdecl; overload;//Deprecated
  end;
  TJDetectionModel = class(TJavaGenericImport<JDetectionModelClass, JDetectionModel>) end;

  JDictValueClass = interface(JObjectClass)
    ['{AAC90214-D06F-4989-85B5-CFBB91ABD84D}']
    {class} function init(s: JString): JDictValue; cdecl; overload;
    {class} function init(p: Double): JDictValue; cdecl; overload;
    {class} function init(i: Integer): JDictValue; cdecl; overload;
    {class} function __fromPtr__(addr: Int64): JDictValue; cdecl;
    {class} function getNativeObjAddr: Int64; cdecl;
    {class} function getRealValue(idx: Integer): Double; cdecl; overload;
    {class} function getRealValue: Double; cdecl; overload;
    {class} function isInt: Boolean; cdecl;//Deprecated
    {class} function isReal: Boolean; cdecl;//Deprecated
    {class} function isString: Boolean; cdecl;//Deprecated
  end;

  [JavaSignature('org/opencv/dnn/DictValue')]
  JDictValue = interface(JObject)
    ['{0314315C-B5A7-42D0-862A-DFCC3BC5D5CF}']
    function getIntValue(idx: Integer): Integer; cdecl; overload;
    function getIntValue: Integer; cdecl; overload;
    function getStringValue(idx: Integer): JString; cdecl; overload;
    function getStringValue: JString; cdecl; overload;
  end;
  TJDictValue = class(TJavaGenericImport<JDictValueClass, JDictValue>) end;

  JDnnClass = interface(JObjectClass)
    ['{7B12D0F0-927F-4835-8D48-C2F3B6D7EDED}']
    {class} function _GetDNN_BACKEND_CUDA: Integer; cdecl;
    {class} function _GetDNN_BACKEND_DEFAULT: Integer; cdecl;
    {class} function _GetDNN_BACKEND_HALIDE: Integer; cdecl;
    {class} function _GetDNN_BACKEND_INFERENCE_ENGINE: Integer; cdecl;
    {class} function _GetDNN_BACKEND_OPENCV: Integer; cdecl;
    {class} function _GetDNN_BACKEND_VKCOM: Integer; cdecl;
    {class} function _GetDNN_TARGET_CPU: Integer; cdecl;
    {class} function _GetDNN_TARGET_CUDA: Integer; cdecl;
    {class} function _GetDNN_TARGET_CUDA_FP16: Integer; cdecl;
    {class} function _GetDNN_TARGET_FPGA: Integer; cdecl;
    {class} function _GetDNN_TARGET_MYRIAD: Integer; cdecl;
    {class} function _GetDNN_TARGET_OPENCL: Integer; cdecl;
    {class} function _GetDNN_TARGET_OPENCL_FP16: Integer; cdecl;
    {class} function _GetDNN_TARGET_VULKAN: Integer; cdecl;
    {class} function init: JDnn; cdecl;
    {class} procedure NMSBoxes(bboxes: JMatOfRect; scores: JMatOfFloat; score_threshold: Single; nms_threshold: Single; indices: JMatOfInt; eta: Single; top_k: Integer); cdecl; overload;//Deprecated
    {class} procedure NMSBoxes(bboxes: JMatOfRect; scores: JMatOfFloat; score_threshold: Single; nms_threshold: Single; indices: JMatOfInt; eta: Single); cdecl; overload;//Deprecated
    {class} procedure NMSBoxes(bboxes: JMatOfRect; scores: JMatOfFloat; score_threshold: Single; nms_threshold: Single; indices: JMatOfInt); cdecl; overload;//Deprecated
    {class} procedure NMSBoxes(bboxes: JMatOfRect2d; scores: JMatOfFloat; score_threshold: Single; nms_threshold: Single; indices: JMatOfInt; eta: Single; top_k: Integer); cdecl; overload;//Deprecated
    {class} procedure NMSBoxes(bboxes: JMatOfRect2d; scores: JMatOfFloat; score_threshold: Single; nms_threshold: Single; indices: JMatOfInt; eta: Single); cdecl; overload;//Deprecated
    {class} procedure NMSBoxes(bboxes: JMatOfRect2d; scores: JMatOfFloat; score_threshold: Single; nms_threshold: Single; indices: JMatOfInt); cdecl; overload;//Deprecated
    {class} procedure NMSBoxesRotated(bboxes: JMatOfRotatedRect; scores: JMatOfFloat; score_threshold: Single; nms_threshold: Single; indices: JMatOfInt; eta: Single; top_k: Integer); cdecl; overload;//Deprecated
    {class} procedure NMSBoxesRotated(bboxes: JMatOfRotatedRect; scores: JMatOfFloat; score_threshold: Single; nms_threshold: Single; indices: JMatOfInt; eta: Single); cdecl; overload;//Deprecated
    {class} procedure NMSBoxesRotated(bboxes: JMatOfRotatedRect; scores: JMatOfFloat; score_threshold: Single; nms_threshold: Single; indices: JMatOfInt); cdecl; overload;//Deprecated
    {class} function blobFromImage(image: JMat; scalefactor: Double; size: Jcore_Size; mean: JScalar; swapRB: Boolean; crop: Boolean; ddepth: Integer): JMat; cdecl; overload;//Deprecated
    {class} function blobFromImage(image: JMat; scalefactor: Double; size: Jcore_Size; mean: JScalar; swapRB: Boolean; crop: Boolean): JMat; cdecl; overload;//Deprecated
    {class} function blobFromImage(image: JMat; scalefactor: Double; size: Jcore_Size; mean: JScalar; swapRB: Boolean): JMat; cdecl; overload;//Deprecated
    {class} function blobFromImage(image: JMat; scalefactor: Double; size: Jcore_Size; mean: JScalar): JMat; cdecl; overload;
    {class} function blobFromImage(image: JMat; scalefactor: Double; size: Jcore_Size): JMat; cdecl; overload;
    {class} function blobFromImage(image: JMat; scalefactor: Double): JMat; cdecl; overload;
    {class} function blobFromImage(image: JMat): JMat; cdecl; overload;
    {class} function blobFromImages(images: JList; scalefactor: Double; size: Jcore_Size; mean: JScalar; swapRB: Boolean; crop: Boolean; ddepth: Integer): JMat; cdecl; overload;
    {class} function blobFromImages(images: JList; scalefactor: Double; size: Jcore_Size; mean: JScalar; swapRB: Boolean; crop: Boolean): JMat; cdecl; overload;
    {class} function blobFromImages(images: JList; scalefactor: Double; size: Jcore_Size; mean: JScalar; swapRB: Boolean): JMat; cdecl; overload;
    {class} function blobFromImages(images: JList; scalefactor: Double; size: Jcore_Size; mean: JScalar): JMat; cdecl; overload;
    {class} function blobFromImages(images: JList; scalefactor: Double; size: Jcore_Size): JMat; cdecl; overload;
    {class} function blobFromImages(images: JList; scalefactor: Double): JMat; cdecl; overload;
    {class} function blobFromImages(images: JList): JMat; cdecl; overload;
    {class} function getInferenceEngineBackendType: JString; cdecl;
    {class} function getInferenceEngineVPUType: JString; cdecl;
    {class} procedure imagesFromBlob(blob_: JMat; images_: JList); cdecl;
    {class} function readNet(framework: JString; bufferModel: JMatOfByte; bufferConfig: JMatOfByte): JNet; cdecl; overload;
    {class} function readNet(framework: JString; bufferModel: JMatOfByte): JNet; cdecl; overload;
    {class} function readNet(model: JString; config: JString; framework: JString): JNet; cdecl; overload;
    {class} function readNet(model: JString; config: JString): JNet; cdecl; overload;
    {class} function readNet(model: JString): JNet; cdecl; overload;
    {class} function readNetFromCaffe(prototxt: JString; caffeModel: JString): JNet; cdecl; overload;
    {class} function readNetFromCaffe(prototxt: JString): JNet; cdecl; overload;
    {class} function readNetFromCaffe(bufferProto: JMatOfByte; bufferModel: JMatOfByte): JNet; cdecl; overload;
    {class} function readNetFromCaffe(bufferProto: JMatOfByte): JNet; cdecl; overload;
    {class} function readNetFromDarknet(cfgFile: JString; darknetModel: JString): JNet; cdecl; overload;//Deprecated
    {class} function readNetFromDarknet(cfgFile: JString): JNet; cdecl; overload;//Deprecated
    {class} function readNetFromDarknet(bufferCfg: JMatOfByte; bufferModel: JMatOfByte): JNet; cdecl; overload;//Deprecated
    {class} function readNetFromDarknet(bufferCfg: JMatOfByte): JNet; cdecl; overload;//Deprecated
    {class} function readNetFromModelOptimizer(xml: JString; bin: JString): JNet; cdecl; overload;//Deprecated
    {class} function readNetFromModelOptimizer(bufferModelConfig: JMatOfByte; bufferWeights: JMatOfByte): JNet; cdecl; overload;//Deprecated
    {class} function readNetFromONNX(onnxFile: JString): JNet; cdecl; overload;//Deprecated
    {class} function readNetFromONNX(buffer: JMatOfByte): JNet; cdecl; overload;//Deprecated
    {class} function readNetFromTensorflow(model: JString; config: JString): JNet; cdecl; overload;//Deprecated
    {class} function readNetFromTensorflow(model: JString): JNet; cdecl; overload;//Deprecated
    {class} function readNetFromTensorflow(bufferModel: JMatOfByte; bufferConfig: JMatOfByte): JNet; cdecl; overload;//Deprecated
    {class} function readNetFromTensorflow(bufferModel: JMatOfByte): JNet; cdecl; overload;//Deprecated
    {class} function readNetFromTorch(model: JString; isBinary: Boolean; evaluate: Boolean): JNet; cdecl; overload;//Deprecated
    {class} function readNetFromTorch(model: JString; isBinary: Boolean): JNet; cdecl; overload;//Deprecated
    {class} function readNetFromTorch(model: JString): JNet; cdecl; overload;//Deprecated
    {class} function readTensorFromONNX(path: JString): JMat; cdecl;//Deprecated
    {class} function readTorchBlob(filename: JString; isBinary: Boolean): JMat; cdecl; overload;//Deprecated
    {class} function readTorchBlob(filename: JString): JMat; cdecl; overload;//Deprecated
    {class} procedure resetMyriadDevice; cdecl;//Deprecated
    {class} function setInferenceEngineBackendType(newBackendType: JString): JString; cdecl;//Deprecated
    {class} procedure shrinkCaffeModel(src: JString; dst: JString; layersTypes: JList); cdecl; overload;//Deprecated
    {class} procedure shrinkCaffeModel(src: JString; dst: JString); cdecl; overload;//Deprecated
    {class} procedure writeTextGraph(model: JString; output: JString); cdecl;//Deprecated
    {class} property DNN_BACKEND_CUDA: Integer read _GetDNN_BACKEND_CUDA;
    {class} property DNN_BACKEND_DEFAULT: Integer read _GetDNN_BACKEND_DEFAULT;
    {class} property DNN_BACKEND_HALIDE: Integer read _GetDNN_BACKEND_HALIDE;
    {class} property DNN_BACKEND_INFERENCE_ENGINE: Integer read _GetDNN_BACKEND_INFERENCE_ENGINE;
    {class} property DNN_BACKEND_OPENCV: Integer read _GetDNN_BACKEND_OPENCV;
    {class} property DNN_BACKEND_VKCOM: Integer read _GetDNN_BACKEND_VKCOM;
    {class} property DNN_TARGET_CPU: Integer read _GetDNN_TARGET_CPU;
    {class} property DNN_TARGET_CUDA: Integer read _GetDNN_TARGET_CUDA;
    {class} property DNN_TARGET_CUDA_FP16: Integer read _GetDNN_TARGET_CUDA_FP16;
    {class} property DNN_TARGET_FPGA: Integer read _GetDNN_TARGET_FPGA;
    {class} property DNN_TARGET_MYRIAD: Integer read _GetDNN_TARGET_MYRIAD;
    {class} property DNN_TARGET_OPENCL: Integer read _GetDNN_TARGET_OPENCL;
    {class} property DNN_TARGET_OPENCL_FP16: Integer read _GetDNN_TARGET_OPENCL_FP16;
    {class} property DNN_TARGET_VULKAN: Integer read _GetDNN_TARGET_VULKAN;
  end;

  [JavaSignature('org/opencv/dnn/Dnn')]
  JDnn = interface(JObject)
    ['{E5E29C95-DB42-4333-9E5D-3C031E6B579C}']
  end;
  TJDnn = class(TJavaGenericImport<JDnnClass, JDnn>) end;

  JKeypointsModelClass = interface(JModelClass)
    ['{CA8DD51B-C077-48B3-8E5D-DABA0A1F3DC4}']
    {class} function init(network: JNet): JKeypointsModel; cdecl; overload;
    {class} function init(model: JString; config: JString): JKeypointsModel; cdecl; overload;
    {class} function init(model: JString): JKeypointsModel; cdecl; overload;
    {class} function __fromPtr__(addr: Int64): JKeypointsModel; cdecl;//Deprecated
    {class} function estimate(frame: JMat; thresh: Single): JMatOfPoint2f; cdecl; overload;
    {class} function estimate(frame: JMat): JMatOfPoint2f; cdecl; overload;
  end;

  [JavaSignature('org/opencv/dnn/KeypointsModel')]
  JKeypointsModel = interface(JModel)
    ['{CFF92AB1-0C7F-4F8B-A070-CC51217C730E}']
  end;
  TJKeypointsModel = class(TJavaGenericImport<JKeypointsModelClass, JKeypointsModel>) end;

  JLayerClass = interface(JAlgorithmClass)
    ['{90167852-F351-4AF7-B381-71546C7219B9}']
    {class} function __fromPtr__(addr: Int64): JLayer; cdecl;
    {class} function get_blobs: JList; cdecl;
    {class} function get_name: JString; cdecl;
    {class} function get_preferableTarget: Integer; cdecl;
    {class} procedure set_blobs(blobs: JList); cdecl;
  end;

  [JavaSignature('org/opencv/dnn/Layer')]
  JLayer = interface(JAlgorithm)
    ['{5A485262-D8AE-4D24-8E62-3391FA795F5F}']
    procedure finalize(inputs: JList; outputs: JList); cdecl;
    function get_type: JString; cdecl;
    function outputNameToIndex(outputName: JString): Integer; cdecl;
    procedure run(inputs: JList; outputs: JList; internals: JList); cdecl;//Deprecated
  end;
  TJLayer = class(TJavaGenericImport<JLayerClass, JLayer>) end;

  JSegmentationModelClass = interface(JModelClass)
    ['{8C0A700D-D268-4C42-977E-D547780F3229}']
    {class} function init(network: JNet): JSegmentationModel; cdecl; overload;
    {class} function init(model: JString; config: JString): JSegmentationModel; cdecl; overload;
    {class} function init(model: JString): JSegmentationModel; cdecl; overload;
    {class} function __fromPtr__(addr: Int64): JSegmentationModel; cdecl;//Deprecated
  end;

  [JavaSignature('org/opencv/dnn/SegmentationModel')]
  JSegmentationModel = interface(JModel)
    ['{B2531478-BEE5-4DD0-9CBA-2F66D3A78C80}']
    procedure segment(frame: JMat; mask: JMat); cdecl;
  end;
  TJSegmentationModel = class(TJavaGenericImport<JSegmentationModelClass, JSegmentationModel>) end;

  JFeature2DClass = interface(JAlgorithmClass)
    ['{06CD5513-9FF8-42CC-AB55-8D6DD25C34BE}']
    {class} function __fromPtr__(addr: Int64): JFeature2D; cdecl;//Deprecated
    {class} procedure compute(images: JList; keypoints: JList; descriptors: JList); cdecl; overload;//Deprecated
    {class} function defaultNorm: Integer; cdecl;//Deprecated
    {class} function descriptorSize: Integer; cdecl;//Deprecated
    {class} procedure detect(image: JMat; keypoints: JMatOfKeyPoint); cdecl; overload;
    {class} procedure detect(images: JList; keypoints: JList; masks: JList); cdecl; overload;
    {class} procedure detect(images: JList; keypoints: JList); cdecl; overload;
    {class} function getDefaultName: JString; cdecl;
    {class} procedure read(fileName: JString); cdecl;
    {class} procedure write(fileName: JString); cdecl;
  end;

  [JavaSignature('org/opencv/features2d/Feature2D')]
  JFeature2D = interface(JAlgorithm)
    ['{0E6B21C1-7DD7-4AC7-AFEA-89EE21F4D523}']
    procedure compute(image: JMat; keypoints: JMatOfKeyPoint; descriptors: JMat); cdecl; overload;//Deprecated
    function descriptorType: Integer; cdecl;//Deprecated
    procedure detect(image: JMat; keypoints: JMatOfKeyPoint; mask: JMat); cdecl; overload;//Deprecated
    procedure detectAndCompute(image: JMat; mask: JMat; keypoints: JMatOfKeyPoint; descriptors: JMat; useProvidedKeypoints: Boolean); cdecl; overload;
    procedure detectAndCompute(image: JMat; mask: JMat; keypoints: JMatOfKeyPoint; descriptors: JMat); cdecl; overload;
    function empty: Boolean; cdecl;
  end;
  TJFeature2D = class(TJavaGenericImport<JFeature2DClass, JFeature2D>) end;

  JAKAZEClass = interface(JFeature2DClass)
    ['{A5CB7B26-76DA-454C-82AA-6EDEAC969175}']
    {class} function _GetDESCRIPTOR_KAZE: Integer; cdecl;
    {class} function _GetDESCRIPTOR_KAZE_UPRIGHT: Integer; cdecl;
    {class} function _GetDESCRIPTOR_MLDB: Integer; cdecl;
    {class} function _GetDESCRIPTOR_MLDB_UPRIGHT: Integer; cdecl;
    {class} function __fromPtr__(addr: Int64): JAKAZE; cdecl;//Deprecated
    {class} function create(descriptor_type: Integer; descriptor_size: Integer; descriptor_channels: Integer; threshold: Single; nOctaves: Integer; nOctaveLayers: Integer; diffusivity: Integer): JAKAZE; cdecl; overload;//Deprecated
    {class} function create(descriptor_type: Integer; descriptor_size: Integer; descriptor_channels: Integer; threshold: Single; nOctaves: Integer; nOctaveLayers: Integer): JAKAZE; cdecl; overload;//Deprecated
    {class} function create(descriptor_type: Integer; descriptor_size: Integer; descriptor_channels: Integer; threshold: Single; nOctaves: Integer): JAKAZE; cdecl; overload;
    {class} function create(descriptor_type: Integer; descriptor_size: Integer; descriptor_channels: Integer; threshold: Single): JAKAZE; cdecl; overload;
    {class} function create(descriptor_type: Integer; descriptor_size: Integer; descriptor_channels: Integer): JAKAZE; cdecl; overload;
    {class} function create(descriptor_type: Integer; descriptor_size: Integer): JAKAZE; cdecl; overload;//Deprecated
    {class} function create(descriptor_type: Integer): JAKAZE; cdecl; overload;//Deprecated
    {class} function create: JAKAZE; cdecl; overload;//Deprecated
    {class} function getDefaultName: JString; cdecl;//Deprecated
    {class} function getDescriptorChannels: Integer; cdecl;//Deprecated
    {class} function getNOctaveLayers: Integer; cdecl;//Deprecated
    {class} function getNOctaves: Integer; cdecl;//Deprecated
    {class} function getThreshold: Double; cdecl;//Deprecated
    {class} procedure setDescriptorType(dtype: Integer); cdecl;//Deprecated
    {class} procedure setDiffusivity(diff: Integer); cdecl;//Deprecated
    {class} procedure setNOctaveLayers(octaveLayers: Integer); cdecl;//Deprecated
    {class} property DESCRIPTOR_KAZE: Integer read _GetDESCRIPTOR_KAZE;
    {class} property DESCRIPTOR_KAZE_UPRIGHT: Integer read _GetDESCRIPTOR_KAZE_UPRIGHT;
    {class} property DESCRIPTOR_MLDB: Integer read _GetDESCRIPTOR_MLDB;
    {class} property DESCRIPTOR_MLDB_UPRIGHT: Integer read _GetDESCRIPTOR_MLDB_UPRIGHT;
  end;

  [JavaSignature('org/opencv/features2d/AKAZE')]
  JAKAZE = interface(JFeature2D)
    ['{44A4AA70-9F27-41ED-8E98-F132EF5C8F4E}']
    function getDescriptorSize: Integer; cdecl;//Deprecated
    function getDescriptorType: Integer; cdecl;//Deprecated
    function getDiffusivity: Integer; cdecl;//Deprecated
    procedure setDescriptorChannels(dch: Integer); cdecl;//Deprecated
    procedure setDescriptorSize(dsize: Integer); cdecl;//Deprecated
    procedure setNOctaves(octaves: Integer); cdecl;//Deprecated
    procedure setThreshold(threshold: Double); cdecl;//Deprecated
  end;
  TJAKAZE = class(TJavaGenericImport<JAKAZEClass, JAKAZE>) end;

  JAgastFeatureDetectorClass = interface(JFeature2DClass)
    ['{E30B335D-1B1B-4D71-A444-7AEBF5C10C38}']
    {class} function _GetAGAST_5_8: Integer; cdecl;
    {class} function _GetAGAST_7_12d: Integer; cdecl;
    {class} function _GetAGAST_7_12s: Integer; cdecl;
    {class} function _GetNONMAX_SUPPRESSION: Integer; cdecl;
    {class} function _GetOAST_9_16: Integer; cdecl;
    {class} function _GetTHRESHOLD: Integer; cdecl;
    {class} function __fromPtr__(addr: Int64): JAgastFeatureDetector; cdecl;//Deprecated
    {class} function create(threshold: Integer; nonmaxSuppression: Boolean; type_: Integer): JAgastFeatureDetector; cdecl; overload;//Deprecated
    {class} function create(threshold: Integer; nonmaxSuppression: Boolean): JAgastFeatureDetector; cdecl; overload;//Deprecated
    {class} function create(threshold: Integer): JAgastFeatureDetector; cdecl; overload;//Deprecated
    {class} function create: JAgastFeatureDetector; cdecl; overload;//Deprecated
    {class} function getThreshold: Integer; cdecl;
    {class} function getType: Integer; cdecl;
    {class} procedure setNonmaxSuppression(f: Boolean); cdecl;
    {class} property AGAST_5_8: Integer read _GetAGAST_5_8;
    {class} property AGAST_7_12d: Integer read _GetAGAST_7_12d;
    {class} property AGAST_7_12s: Integer read _GetAGAST_7_12s;
    {class} property NONMAX_SUPPRESSION: Integer read _GetNONMAX_SUPPRESSION;
    {class} property OAST_9_16: Integer read _GetOAST_9_16;
    {class} property THRESHOLD: Integer read _GetTHRESHOLD;
  end;

  [JavaSignature('org/opencv/features2d/AgastFeatureDetector')]
  JAgastFeatureDetector = interface(JFeature2D)
    ['{096E294A-EB94-480A-9BE7-185A08BDF443}']
    function getDefaultName: JString; cdecl;//Deprecated
    function getNonmaxSuppression: Boolean; cdecl;//Deprecated
    procedure setThreshold(threshold: Integer); cdecl;
    procedure setType(type_: Integer); cdecl;
  end;
  TJAgastFeatureDetector = class(TJavaGenericImport<JAgastFeatureDetectorClass, JAgastFeatureDetector>) end;

  JDescriptorMatcherClass = interface(JAlgorithmClass)
    ['{19D1E2E1-3576-489F-80DA-41146CA72A2E}']
    {class} function _GetBRUTEFORCE: Integer; cdecl;
    {class} function _GetBRUTEFORCE_HAMMING: Integer; cdecl;
    {class} function _GetBRUTEFORCE_HAMMINGLUT: Integer; cdecl;
    {class} function _GetBRUTEFORCE_L1: Integer; cdecl;
    {class} function _GetBRUTEFORCE_SL2: Integer; cdecl;
    {class} function _GetFLANNBASED: Integer; cdecl;
    {class} function __fromPtr__(addr: Int64): JDescriptorMatcher; cdecl;//Deprecated
    {class} function clone: JDescriptorMatcher; cdecl; overload;
    {class} function create(matcherType: Integer): JDescriptorMatcher; cdecl; overload;
    {class} function create(descriptorMatcherType: JString): JDescriptorMatcher; cdecl; overload;
    {class} procedure knnMatch(queryDescriptors: JMat; trainDescriptors: JMat; matches: JList; k: Integer; mask: JMat; compactResult: Boolean); cdecl; overload;
    {class} procedure knnMatch(queryDescriptors: JMat; trainDescriptors: JMat; matches: JList; k: Integer; mask: JMat); cdecl; overload;
    {class} procedure knnMatch(queryDescriptors: JMat; trainDescriptors: JMat; matches: JList; k: Integer); cdecl; overload;
    {class} procedure knnMatch(queryDescriptors: JMat; matches: JList; k: Integer); cdecl; overload;
    {class} procedure match(queryDescriptors: JMat; trainDescriptors: JMat; matches: JMatOfDMatch; mask: JMat); cdecl; overload;
    {class} procedure match(queryDescriptors: JMat; trainDescriptors: JMat; matches: JMatOfDMatch); cdecl; overload;
    {class} procedure radiusMatch(queryDescriptors: JMat; trainDescriptors: JMat; matches: JList; maxDistance: Single; mask: JMat); cdecl; overload;
    {class} procedure radiusMatch(queryDescriptors: JMat; trainDescriptors: JMat; matches: JList; maxDistance: Single); cdecl; overload;
    {class} procedure radiusMatch(queryDescriptors: JMat; matches: JList; maxDistance: Single; masks: JList; compactResult: Boolean); cdecl; overload;
    {class} procedure train; cdecl;//Deprecated
    {class} procedure write(fileName: JString); cdecl;//Deprecated
    {class} property BRUTEFORCE: Integer read _GetBRUTEFORCE;
    {class} property BRUTEFORCE_HAMMING: Integer read _GetBRUTEFORCE_HAMMING;
    {class} property BRUTEFORCE_HAMMINGLUT: Integer read _GetBRUTEFORCE_HAMMINGLUT;
    {class} property BRUTEFORCE_L1: Integer read _GetBRUTEFORCE_L1;
    {class} property BRUTEFORCE_SL2: Integer read _GetBRUTEFORCE_SL2;
    {class} property FLANNBASED: Integer read _GetFLANNBASED;
  end;

  [JavaSignature('org/opencv/features2d/DescriptorMatcher')]
  JDescriptorMatcher = interface(JAlgorithm)
    ['{624242DC-1247-49DF-A8D5-52BC79A4314F}']
    procedure add(descriptors: JList); cdecl;//Deprecated
    procedure clear; cdecl;//Deprecated
    function clone(emptyTrainData: Boolean): JDescriptorMatcher; cdecl; overload;//Deprecated
    function empty: Boolean; cdecl;
    function getTrainDescriptors: JList; cdecl;
    function isMaskSupported: Boolean; cdecl;
    procedure knnMatch(queryDescriptors: JMat; matches: JList; k: Integer; masks: JList; compactResult: Boolean); cdecl; overload;
    procedure knnMatch(queryDescriptors: JMat; matches: JList; k: Integer; masks: JList); cdecl; overload;
    procedure match(queryDescriptors: JMat; matches: JMatOfDMatch; masks: JList); cdecl; overload;
    procedure match(queryDescriptors: JMat; matches: JMatOfDMatch); cdecl; overload;
    procedure radiusMatch(queryDescriptors: JMat; trainDescriptors: JMat; matches: JList; maxDistance: Single; mask: JMat; compactResult: Boolean); cdecl; overload;
    procedure radiusMatch(queryDescriptors: JMat; matches: JList; maxDistance: Single; masks: JList); cdecl; overload;
    procedure radiusMatch(queryDescriptors: JMat; matches: JList; maxDistance: Single); cdecl; overload;
    procedure read(fileName: JString); cdecl;
  end;
  TJDescriptorMatcher = class(TJavaGenericImport<JDescriptorMatcherClass, JDescriptorMatcher>) end;

  JBFMatcherClass = interface(JDescriptorMatcherClass)
    ['{9B78BBC6-545E-42BA-B248-A82652841F85}']
    {class} function init(normType: Integer; crossCheck: Boolean): JBFMatcher; cdecl; overload;
    {class} function init(normType: Integer): JBFMatcher; cdecl; overload;
    {class} function init: JBFMatcher; cdecl; overload;
    {class} function __fromPtr__(addr: Int64): JBFMatcher; cdecl;//Deprecated
    {class} function create(normType: Integer; crossCheck: Boolean): JBFMatcher; cdecl; overload;//Deprecated
    {class} function create(normType: Integer): JBFMatcher; cdecl; overload;//Deprecated
    {class} function create: JBFMatcher; cdecl; overload;//Deprecated
  end;

  [JavaSignature('org/opencv/features2d/BFMatcher')]
  JBFMatcher = interface(JDescriptorMatcher)
    ['{91A26E21-2131-4C43-BC98-B4FD8F0ADE6E}']
  end;
  TJBFMatcher = class(TJavaGenericImport<JBFMatcherClass, JBFMatcher>) end;

  JBOWImgDescriptorExtractorClass = interface(JObjectClass)
    ['{CA4DF1C2-BCF7-4ED8-B674-26ADA1FA9392}']
    {class} function __fromPtr__(addr: Int64): JBOWImgDescriptorExtractor; cdecl;//Deprecated
    {class} procedure compute(image: JMat; keypoints: JMatOfKeyPoint; imgDescriptor: JMat); cdecl;//Deprecated
    {class} function descriptorSize: Integer; cdecl;//Deprecated
  end;

  [JavaSignature('org/opencv/features2d/BOWImgDescriptorExtractor')]
  JBOWImgDescriptorExtractor = interface(JObject)
    ['{CBC1E978-E561-4782-8DEB-A8FF8ED765F5}']
    function descriptorType: Integer; cdecl;//Deprecated
    function getNativeObjAddr: Int64; cdecl;
    function getVocabulary: JMat; cdecl;
    procedure setVocabulary(vocabulary: JMat); cdecl;
  end;
  TJBOWImgDescriptorExtractor = class(TJavaGenericImport<JBOWImgDescriptorExtractorClass, JBOWImgDescriptorExtractor>) end;

  JBOWTrainerClass = interface(JObjectClass)
    ['{93D37922-76D4-488E-892F-19CDCE266AC6}']
    {class} function __fromPtr__(addr: Int64): JBOWTrainer; cdecl;//Deprecated
    {class} function cluster(descriptors: JMat): JMat; cdecl; overload;
    {class} function cluster: JMat; cdecl; overload;
    {class} function descriptorsCount: Integer; cdecl;
    {class} function getNativeObjAddr: Int64; cdecl;//Deprecated
  end;

  [JavaSignature('org/opencv/features2d/BOWTrainer')]
  JBOWTrainer = interface(JObject)
    ['{5240D78C-6055-4155-AC2F-D13E37E4066B}']
    procedure add(descriptors: JMat); cdecl;//Deprecated
    procedure clear; cdecl;//Deprecated
    function getDescriptors: JList; cdecl;//Deprecated
  end;
  TJBOWTrainer = class(TJavaGenericImport<JBOWTrainerClass, JBOWTrainer>) end;

  JBOWKMeansTrainerClass = interface(JBOWTrainerClass)
    ['{FC393328-69D7-416F-9D23-6C312DACC386}']
    {class} function init(clusterCount: Integer; termcrit: JTermCriteria; attempts: Integer; flags: Integer): JBOWKMeansTrainer; cdecl; overload;
    {class} function init(clusterCount: Integer; termcrit: JTermCriteria; attempts: Integer): JBOWKMeansTrainer; cdecl; overload;
    {class} function init(clusterCount: Integer; termcrit: JTermCriteria): JBOWKMeansTrainer; cdecl; overload;
    {class} function init(clusterCount: Integer): JBOWKMeansTrainer; cdecl; overload;
    {class} function __fromPtr__(addr: Int64): JBOWKMeansTrainer; cdecl;
    {class} function cluster: JMat; cdecl; overload;
  end;

  [JavaSignature('org/opencv/features2d/BOWKMeansTrainer')]
  JBOWKMeansTrainer = interface(JBOWTrainer)
    ['{C52BC588-72B4-49F3-BD8D-C2158BEB1EF0}']
    function cluster(descriptors: JMat): JMat; cdecl; overload;
  end;
  TJBOWKMeansTrainer = class(TJavaGenericImport<JBOWKMeansTrainerClass, JBOWKMeansTrainer>) end;

  JBRISKClass = interface(JFeature2DClass)
    ['{AA009B65-FF4F-4569-BB0B-48B2F2DC4DDF}']
    {class} function __fromPtr__(addr: Int64): JBRISK; cdecl;//Deprecated
    {class} function create(thresh: Integer; octaves: Integer; radiusList: JMatOfFloat; numberList: JMatOfInt; dMax: Single; dMin: Single; indexChange: JMatOfInt): JBRISK; cdecl; overload;//Deprecated
    {class} function create(thresh: Integer; octaves: Integer; radiusList: JMatOfFloat; numberList: JMatOfInt; dMax: Single; dMin: Single): JBRISK; cdecl; overload;//Deprecated
    {class} function create(thresh: Integer; octaves: Integer; radiusList: JMatOfFloat; numberList: JMatOfInt; dMax: Single): JBRISK; cdecl; overload;//Deprecated
    {class} function create(thresh: Integer; octaves: Integer; radiusList: JMatOfFloat; numberList: JMatOfInt): JBRISK; cdecl; overload;//Deprecated
    {class} function create(thresh: Integer; octaves: Integer; patternScale: Single): JBRISK; cdecl; overload;//Deprecated
    {class} function create(thresh: Integer; octaves: Integer): JBRISK; cdecl; overload;//Deprecated
    {class} function create(thresh: Integer): JBRISK; cdecl; overload;//Deprecated
    {class} function create: JBRISK; cdecl; overload;//Deprecated
    {class} function create(radiusList: JMatOfFloat; numberList: JMatOfInt; dMax: Single; dMin: Single; indexChange: JMatOfInt): JBRISK; cdecl; overload;//Deprecated
    {class} function create(radiusList: JMatOfFloat; numberList: JMatOfInt; dMax: Single; dMin: Single): JBRISK; cdecl; overload;//Deprecated
    {class} function create(radiusList: JMatOfFloat; numberList: JMatOfInt; dMax: Single): JBRISK; cdecl; overload;
    {class} function create(radiusList: JMatOfFloat; numberList: JMatOfInt): JBRISK; cdecl; overload;
    {class} function getDefaultName: JString; cdecl;
    {class} procedure setThreshold(threshold: Integer); cdecl;
  end;

  [JavaSignature('org/opencv/features2d/BRISK')]
  JBRISK = interface(JFeature2D)
    ['{FFFAD80C-69BC-4EC7-A474-DF00FE1FFD55}']
    function getOctaves: Integer; cdecl;
    function getThreshold: Integer; cdecl;
    procedure setOctaves(octaves: Integer); cdecl;
  end;
  TJBRISK = class(TJavaGenericImport<JBRISKClass, JBRISK>) end;

  JFastFeatureDetectorClass = interface(JFeature2DClass)
    ['{3B3DCD05-23FA-4D4B-8E4E-76878C1F9394}']
    {class} function _GetFAST_N: Integer; cdecl;
    {class} function _GetNONMAX_SUPPRESSION: Integer; cdecl;
    {class} function _GetTHRESHOLD: Integer; cdecl;
    {class} function _GetTYPE_5_8: Integer; cdecl;
    {class} function _GetTYPE_7_12: Integer; cdecl;
    {class} function _GetTYPE_9_16: Integer; cdecl;
    {class} function __fromPtr__(addr: Int64): JFastFeatureDetector; cdecl;
    {class} function create(threshold: Integer; nonmaxSuppression: Boolean; type_: Integer): JFastFeatureDetector; cdecl; overload;
    {class} function create(threshold: Integer; nonmaxSuppression: Boolean): JFastFeatureDetector; cdecl; overload;
    {class} function create(threshold: Integer): JFastFeatureDetector; cdecl; overload;
    {class} function create: JFastFeatureDetector; cdecl; overload;
    {class} function getNonmaxSuppression: Boolean; cdecl;
    {class} function getThreshold: Integer; cdecl;
    {class} function getType: Integer; cdecl;
    {class} property FAST_N: Integer read _GetFAST_N;
    {class} property NONMAX_SUPPRESSION: Integer read _GetNONMAX_SUPPRESSION;
    {class} property THRESHOLD: Integer read _GetTHRESHOLD;
    {class} property TYPE_5_8: Integer read _GetTYPE_5_8;
    {class} property TYPE_7_12: Integer read _GetTYPE_7_12;
    {class} property TYPE_9_16: Integer read _GetTYPE_9_16;
  end;

  [JavaSignature('org/opencv/features2d/FastFeatureDetector')]
  JFastFeatureDetector = interface(JFeature2D)
    ['{71344AC6-F6BD-4AC4-9499-3FC5E895643F}']
    function getDefaultName: JString; cdecl;
    procedure setNonmaxSuppression(f: Boolean); cdecl;
    procedure setThreshold(threshold: Integer); cdecl;
    procedure setType(type_: Integer); cdecl;
  end;
  TJFastFeatureDetector = class(TJavaGenericImport<JFastFeatureDetectorClass, JFastFeatureDetector>) end;

  JFeatures2dClass = interface(JObjectClass)
    ['{CE8155B3-D8B1-4FFA-B1A5-45017F2161C6}']
    {class} function _GetDrawMatchesFlags_DEFAULT: Integer; cdecl;
    {class} function _GetDrawMatchesFlags_DRAW_OVER_OUTIMG: Integer; cdecl;
    {class} function _GetDrawMatchesFlags_DRAW_RICH_KEYPOINTS: Integer; cdecl;
    {class} function _GetDrawMatchesFlags_NOT_DRAW_SINGLE_POINTS: Integer; cdecl;
    {class} function init: JFeatures2d; cdecl;
    {class} procedure drawKeypoints(image: JMat; keypoints: JMatOfKeyPoint; outImage: JMat; color: JScalar; flags: Integer); cdecl; overload;//Deprecated
    {class} procedure drawKeypoints(image: JMat; keypoints: JMatOfKeyPoint; outImage: JMat; color: JScalar); cdecl; overload;//Deprecated
    {class} procedure drawKeypoints(image: JMat; keypoints: JMatOfKeyPoint; outImage: JMat); cdecl; overload;//Deprecated
    {class} procedure drawMatches(img1: JMat; keypoints1: JMatOfKeyPoint; img2: JMat; keypoints2: JMatOfKeyPoint; matches1to2: JMatOfDMatch; outImg: JMat; matchColor: JScalar; singlePointColor: JScalar; matchesMask: JMatOfByte; flags: Integer); cdecl; overload;//Deprecated
    {class} procedure drawMatches(img1: JMat; keypoints1: JMatOfKeyPoint; img2: JMat; keypoints2: JMatOfKeyPoint; matches1to2: JMatOfDMatch; outImg: JMat; matchColor: JScalar; singlePointColor: JScalar; matchesMask: JMatOfByte); cdecl; overload;//Deprecated
    {class} procedure drawMatches(img1: JMat; keypoints1: JMatOfKeyPoint; img2: JMat; keypoints2: JMatOfKeyPoint; matches1to2: JMatOfDMatch; outImg: JMat; matchColor: JScalar; singlePointColor: JScalar); cdecl; overload;//Deprecated
    {class} procedure drawMatches(img1: JMat; keypoints1: JMatOfKeyPoint; img2: JMat; keypoints2: JMatOfKeyPoint; matches1to2: JMatOfDMatch; outImg: JMat; matchColor: JScalar); cdecl; overload;//Deprecated
    {class} procedure drawMatches(img1: JMat; keypoints1: JMatOfKeyPoint; img2: JMat; keypoints2: JMatOfKeyPoint; matches1to2: JMatOfDMatch; outImg: JMat); cdecl; overload;//Deprecated
    {class} procedure drawMatchesKnn(img1: JMat; keypoints1: JMatOfKeyPoint; img2: JMat; keypoints2: JMatOfKeyPoint; matches1to2: JList; outImg: JMat; matchColor: JScalar; singlePointColor: JScalar; matchesMask: JList; flags: Integer); cdecl; overload;//Deprecated
    {class} procedure drawMatchesKnn(img1: JMat; keypoints1: JMatOfKeyPoint; img2: JMat; keypoints2: JMatOfKeyPoint; matches1to2: JList; outImg: JMat; matchColor: JScalar; singlePointColor: JScalar; matchesMask: JList); cdecl; overload;//Deprecated
    {class} procedure drawMatchesKnn(img1: JMat; keypoints1: JMatOfKeyPoint; img2: JMat; keypoints2: JMatOfKeyPoint; matches1to2: JList; outImg: JMat; matchColor: JScalar; singlePointColor: JScalar); cdecl; overload;//Deprecated
    {class} procedure drawMatchesKnn(img1: JMat; keypoints1: JMatOfKeyPoint; img2: JMat; keypoints2: JMatOfKeyPoint; matches1to2: JList; outImg: JMat; matchColor: JScalar); cdecl; overload;//Deprecated
    {class} procedure drawMatchesKnn(img1: JMat; keypoints1: JMatOfKeyPoint; img2: JMat; keypoints2: JMatOfKeyPoint; matches1to2: JList; outImg: JMat); cdecl; overload;//Deprecated
    {class} property DrawMatchesFlags_DEFAULT: Integer read _GetDrawMatchesFlags_DEFAULT;
    {class} property DrawMatchesFlags_DRAW_OVER_OUTIMG: Integer read _GetDrawMatchesFlags_DRAW_OVER_OUTIMG;
    {class} property DrawMatchesFlags_DRAW_RICH_KEYPOINTS: Integer read _GetDrawMatchesFlags_DRAW_RICH_KEYPOINTS;
    {class} property DrawMatchesFlags_NOT_DRAW_SINGLE_POINTS: Integer read _GetDrawMatchesFlags_NOT_DRAW_SINGLE_POINTS;
  end;

  [JavaSignature('org/opencv/features2d/Features2d')]
  JFeatures2d = interface(JObject)
    ['{C9491DC5-EB8C-4F38-BFF1-09F3CF807C3A}']
  end;
  TJFeatures2d = class(TJavaGenericImport<JFeatures2dClass, JFeatures2d>) end;

  JFlannBasedMatcherClass = interface(JDescriptorMatcherClass)
    ['{981EE52A-B841-4590-9623-7A28805F319F}']
    {class} function init: JFlannBasedMatcher; cdecl;
    {class} function __fromPtr__(addr: Int64): JFlannBasedMatcher; cdecl;//Deprecated
    {class} function create: JFlannBasedMatcher; cdecl;//Deprecated
  end;

  [JavaSignature('org/opencv/features2d/FlannBasedMatcher')]
  JFlannBasedMatcher = interface(JDescriptorMatcher)
    ['{8931712B-E978-4B7E-98A0-219E99D66E60}']
  end;
  TJFlannBasedMatcher = class(TJavaGenericImport<JFlannBasedMatcherClass, JFlannBasedMatcher>) end;

  JGFTTDetectorClass = interface(JFeature2DClass)
    ['{40ECA74A-6506-4B81-9896-99B0C9D7FDC1}']
    {class} function __fromPtr__(addr: Int64): JGFTTDetector; cdecl;//Deprecated
    {class} function create(maxCorners: Integer; qualityLevel: Double; minDistance: Double; blockSize: Integer; gradiantSize: Integer; useHarrisDetector: Boolean; k: Double): JGFTTDetector; cdecl; overload;//Deprecated
    {class} function create(maxCorners: Integer; qualityLevel: Double; minDistance: Double; blockSize: Integer; gradiantSize: Integer; useHarrisDetector: Boolean): JGFTTDetector; cdecl; overload;//Deprecated
    {class} function create(maxCorners: Integer; qualityLevel: Double; minDistance: Double; blockSize: Integer; gradiantSize: Integer): JGFTTDetector; cdecl; overload;
    {class} function create(maxCorners: Integer; qualityLevel: Double; minDistance: Double; blockSize: Integer; useHarrisDetector: Boolean; k: Double): JGFTTDetector; cdecl; overload;//Deprecated
    {class} function create(maxCorners: Integer; qualityLevel: Double; minDistance: Double; blockSize: Integer; useHarrisDetector: Boolean): JGFTTDetector; cdecl; overload;//Deprecated
    {class} function create(maxCorners: Integer; qualityLevel: Double; minDistance: Double; blockSize: Integer): JGFTTDetector; cdecl; overload;
    {class} function create(maxCorners: Integer; qualityLevel: Double; minDistance: Double): JGFTTDetector; cdecl; overload;
    {class} function create(maxCorners: Integer; qualityLevel: Double): JGFTTDetector; cdecl; overload;
    {class} function create(maxCorners: Integer): JGFTTDetector; cdecl; overload;
    {class} function create: JGFTTDetector; cdecl; overload;
    {class} function getHarrisDetector: Boolean; cdecl;//Deprecated
    {class} function getK: Double; cdecl;//Deprecated
    {class} procedure setBlockSize(blockSize: Integer); cdecl;//Deprecated
    {class} procedure setHarrisDetector(val: Boolean); cdecl;//Deprecated
    {class} procedure setK(k: Double); cdecl;//Deprecated
  end;

  [JavaSignature('org/opencv/features2d/GFTTDetector')]
  JGFTTDetector = interface(JFeature2D)
    ['{8A78C842-022D-4AF7-8B9E-195C03B7B649}']
    function getBlockSize: Integer; cdecl;
    function getDefaultName: JString; cdecl;
    function getMaxFeatures: Integer; cdecl;//Deprecated
    function getMinDistance: Double; cdecl;//Deprecated
    function getQualityLevel: Double; cdecl;//Deprecated
    procedure setMaxFeatures(maxFeatures: Integer); cdecl;//Deprecated
    procedure setMinDistance(minDistance: Double); cdecl;//Deprecated
    procedure setQualityLevel(qlevel: Double); cdecl;//Deprecated
  end;
  TJGFTTDetector = class(TJavaGenericImport<JGFTTDetectorClass, JGFTTDetector>) end;

  JKAZEClass = interface(JFeature2DClass)
    ['{02076736-D3FA-4EF8-81D7-3EF2E973B22B}']
    {class} function _GetDIFF_CHARBONNIER: Integer; cdecl;
    {class} function _GetDIFF_PM_G1: Integer; cdecl;
    {class} function _GetDIFF_PM_G2: Integer; cdecl;
    {class} function _GetDIFF_WEICKERT: Integer; cdecl;
    {class} function __fromPtr__(addr: Int64): JKAZE; cdecl;//Deprecated
    {class} function create(extended: Boolean; upright: Boolean; threshold: Single; nOctaves: Integer; nOctaveLayers: Integer; diffusivity: Integer): JKAZE; cdecl; overload;//Deprecated
    {class} function create(extended: Boolean; upright: Boolean; threshold: Single; nOctaves: Integer; nOctaveLayers: Integer): JKAZE; cdecl; overload;//Deprecated
    {class} function create(extended: Boolean; upright: Boolean; threshold: Single; nOctaves: Integer): JKAZE; cdecl; overload;//Deprecated
    {class} function create(extended: Boolean; upright: Boolean; threshold: Single): JKAZE; cdecl; overload;//Deprecated
    {class} function create(extended: Boolean; upright: Boolean): JKAZE; cdecl; overload;//Deprecated
    {class} function create(extended: Boolean): JKAZE; cdecl; overload;//Deprecated
    {class} function create: JKAZE; cdecl; overload;//Deprecated
    {class} function getNOctaveLayers: Integer; cdecl;//Deprecated
    {class} function getNOctaves: Integer; cdecl;//Deprecated
    {class} procedure setExtended(extended: Boolean); cdecl;//Deprecated
    {class} procedure setNOctaveLayers(octaveLayers: Integer); cdecl;//Deprecated
    {class} procedure setNOctaves(octaves: Integer); cdecl;//Deprecated
    {class} property DIFF_CHARBONNIER: Integer read _GetDIFF_CHARBONNIER;
    {class} property DIFF_PM_G1: Integer read _GetDIFF_PM_G1;
    {class} property DIFF_PM_G2: Integer read _GetDIFF_PM_G2;
    {class} property DIFF_WEICKERT: Integer read _GetDIFF_WEICKERT;
  end;

  [JavaSignature('org/opencv/features2d/KAZE')]
  JKAZE = interface(JFeature2D)
    ['{0F439D25-7055-461F-BD00-23F08557D6D7}']
    function getDefaultName: JString; cdecl;//Deprecated
    function getDiffusivity: Integer; cdecl;//Deprecated
    function getExtended: Boolean; cdecl;//Deprecated
    function getThreshold: Double; cdecl;//Deprecated
    function getUpright: Boolean; cdecl;//Deprecated
    procedure setDiffusivity(diff: Integer); cdecl;//Deprecated
    procedure setThreshold(threshold: Double); cdecl;//Deprecated
    procedure setUpright(upright: Boolean); cdecl;//Deprecated
  end;
  TJKAZE = class(TJavaGenericImport<JKAZEClass, JKAZE>) end;

  JMSERClass = interface(JFeature2DClass)
    ['{E5E20509-F222-4957-8CF9-ECF9E37C53EF}']
    {class} function __fromPtr__(addr: Int64): JMSER; cdecl;//Deprecated
    {class} function create(_delta: Integer; _min_area: Integer; _max_area: Integer; _max_variation: Double; _min_diversity: Double; _max_evolution: Integer; _area_threshold: Double; _min_margin: Double; _edge_blur_size: Integer): JMSER; cdecl; overload;//Deprecated
    {class} function create(_delta: Integer; _min_area: Integer; _max_area: Integer; _max_variation: Double; _min_diversity: Double; _max_evolution: Integer; _area_threshold: Double; _min_margin: Double): JMSER; cdecl; overload;//Deprecated
    {class} function create(_delta: Integer; _min_area: Integer; _max_area: Integer; _max_variation: Double; _min_diversity: Double; _max_evolution: Integer; _area_threshold: Double): JMSER; cdecl; overload;//Deprecated
    {class} function create(_delta: Integer; _min_area: Integer; _max_area: Integer; _max_variation: Double; _min_diversity: Double; _max_evolution: Integer): JMSER; cdecl; overload;//Deprecated
    {class} function create(_delta: Integer; _min_area: Integer; _max_area: Integer; _max_variation: Double; _min_diversity: Double): JMSER; cdecl; overload;//Deprecated
    {class} function create(_delta: Integer; _min_area: Integer; _max_area: Integer; _max_variation: Double): JMSER; cdecl; overload;//Deprecated
    {class} function create(_delta: Integer; _min_area: Integer; _max_area: Integer): JMSER; cdecl; overload;//Deprecated
    {class} function create(_delta: Integer; _min_area: Integer): JMSER; cdecl; overload;//Deprecated
    {class} function create(_delta: Integer): JMSER; cdecl; overload;//Deprecated
    {class} function create: JMSER; cdecl; overload;//Deprecated
    {class} procedure detectRegions(image: JMat; msers: JList; bboxes: JMatOfRect); cdecl;//Deprecated
    {class} function getDefaultName: JString; cdecl;//Deprecated
    {class} function getPass2Only: Boolean; cdecl;
    {class} procedure setDelta(delta: Integer); cdecl;
    {class} procedure setMaxArea(maxArea: Integer); cdecl;
  end;

  [JavaSignature('org/opencv/features2d/MSER')]
  JMSER = interface(JFeature2D)
    ['{A6298CE2-5D1B-4DB8-AF25-91FE3D9809E7}']
    function getDelta: Integer; cdecl;//Deprecated
    function getMaxArea: Integer; cdecl;//Deprecated
    function getMinArea: Integer; cdecl;//Deprecated
    procedure setMinArea(minArea: Integer); cdecl;
    procedure setPass2Only(f: Boolean); cdecl;
  end;
  TJMSER = class(TJavaGenericImport<JMSERClass, JMSER>) end;

  JORBClass = interface(JFeature2DClass)
    ['{CDCDDFA5-0530-4AA3-A721-1D5E1924E1B9}']
    {class} function _GetFAST_SCORE: Integer; cdecl;
    {class} function _GetHARRIS_SCORE: Integer; cdecl;
    {class} function __fromPtr__(addr: Int64): JORB; cdecl;
    {class} function create(nfeatures: Integer; scaleFactor: Single; nlevels: Integer; edgeThreshold: Integer; firstLevel: Integer; WTA_K: Integer; scoreType: Integer; patchSize: Integer; fastThreshold: Integer): JORB; cdecl; overload;
    {class} function create(nfeatures: Integer; scaleFactor: Single; nlevels: Integer; edgeThreshold: Integer; firstLevel: Integer; WTA_K: Integer; scoreType: Integer; patchSize: Integer): JORB; cdecl; overload;
    {class} function create(nfeatures: Integer; scaleFactor: Single; nlevels: Integer; edgeThreshold: Integer; firstLevel: Integer; WTA_K: Integer; scoreType: Integer): JORB; cdecl; overload;
    {class} function create(nfeatures: Integer; scaleFactor: Single; nlevels: Integer; edgeThreshold: Integer; firstLevel: Integer; WTA_K: Integer): JORB; cdecl; overload;
    {class} function create(nfeatures: Integer; scaleFactor: Single; nlevels: Integer; edgeThreshold: Integer; firstLevel: Integer): JORB; cdecl; overload;
    {class} function create(nfeatures: Integer; scaleFactor: Single; nlevels: Integer; edgeThreshold: Integer): JORB; cdecl; overload;
    {class} function create(nfeatures: Integer; scaleFactor: Single; nlevels: Integer): JORB; cdecl; overload;
    {class} function create(nfeatures: Integer; scaleFactor: Single): JORB; cdecl; overload;
    {class} function create(nfeatures: Integer): JORB; cdecl; overload;
    {class} function create: JORB; cdecl; overload;
    {class} function getEdgeThreshold: Integer; cdecl;//Deprecated
    {class} function getFastThreshold: Integer; cdecl;//Deprecated
    {class} function getPatchSize: Integer; cdecl;//Deprecated
    {class} function getScaleFactor: Double; cdecl;//Deprecated
    {class} function getScoreType: Integer; cdecl;//Deprecated
    {class} procedure setFirstLevel(firstLevel: Integer); cdecl;//Deprecated
    {class} procedure setMaxFeatures(maxFeatures: Integer); cdecl;//Deprecated
    {class} procedure setNLevels(nlevels: Integer); cdecl;//Deprecated
    {class} procedure setWTA_K(wta_k: Integer); cdecl;//Deprecated
    {class} property FAST_SCORE: Integer read _GetFAST_SCORE;
    {class} property HARRIS_SCORE: Integer read _GetHARRIS_SCORE;
  end;

  [JavaSignature('org/opencv/features2d/ORB')]
  JORB = interface(JFeature2D)
    ['{6C182F0A-1D53-4D61-AEFE-BE9B4AD6BD61}']
    function getDefaultName: JString; cdecl;
    function getFirstLevel: Integer; cdecl;//Deprecated
    function getMaxFeatures: Integer; cdecl;//Deprecated
    function getNLevels: Integer; cdecl;//Deprecated
    function getWTA_K: Integer; cdecl;//Deprecated
    procedure setEdgeThreshold(edgeThreshold: Integer); cdecl;//Deprecated
    procedure setFastThreshold(fastThreshold: Integer); cdecl;//Deprecated
    procedure setPatchSize(patchSize: Integer); cdecl;//Deprecated
    procedure setScaleFactor(scaleFactor: Double); cdecl;//Deprecated
    procedure setScoreType(scoreType: Integer); cdecl;//Deprecated
  end;
  TJORB = class(TJavaGenericImport<JORBClass, JORB>) end;

  JParamsClass = interface(JObjectClass)
    ['{71E3A07D-9E89-4982-87F2-8D89F758A388}']
    {class} function init: JParams; cdecl;
    {class} function __fromPtr__(addr: Int64): JParams; cdecl;
    {class} function getNativeObjAddr: Int64; cdecl;
    {class} function get_filterByConvexity: Boolean; cdecl;
    {class} function get_filterByInertia: Boolean; cdecl;
    {class} function get_maxArea: Single; cdecl;
    {class} function get_maxThreshold: Single; cdecl;
    {class} function get_minArea: Single; cdecl;
    {class} function get_minCircularity: Single; cdecl;
    {class} function get_minRepeatability: Int64; cdecl;//Deprecated
    {class} function get_minThreshold: Single; cdecl;//Deprecated
    {class} function get_thresholdStep: Single; cdecl;//Deprecated
    {class} procedure set_filterByColor(filterByColor: Boolean); cdecl;//Deprecated
    {class} procedure set_filterByConvexity(filterByConvexity: Boolean); cdecl;//Deprecated
    {class} procedure set_filterByInertia(filterByInertia: Boolean); cdecl;//Deprecated
    {class} procedure set_maxInertiaRatio(maxInertiaRatio: Single); cdecl;//Deprecated
    {class} procedure set_maxThreshold(maxThreshold: Single); cdecl;//Deprecated
    {class} procedure set_minArea(minArea: Single); cdecl;//Deprecated
    {class} procedure set_minInertiaRatio(minInertiaRatio: Single); cdecl;//Deprecated
    {class} procedure set_minRepeatability(minRepeatability: Int64); cdecl;//Deprecated
    {class} procedure set_minThreshold(minThreshold: Single); cdecl;//Deprecated
  end;

  [JavaSignature('org/opencv/features2d/Params')]
  JParams = interface(JObject)
    ['{0D41AA7F-0DB6-448E-8C19-3587EB17CF9A}']
    function get_filterByArea: Boolean; cdecl;
    function get_filterByCircularity: Boolean; cdecl;
    function get_filterByColor: Boolean; cdecl;
    function get_maxCircularity: Single; cdecl;
    function get_maxConvexity: Single; cdecl;
    function get_maxInertiaRatio: Single; cdecl;
    function get_minConvexity: Single; cdecl;
    function get_minDistBetweenBlobs: Single; cdecl;
    function get_minInertiaRatio: Single; cdecl;
    procedure set_filterByArea(filterByArea: Boolean); cdecl;//Deprecated
    procedure set_filterByCircularity(filterByCircularity: Boolean); cdecl;//Deprecated
    procedure set_maxArea(maxArea: Single); cdecl;//Deprecated
    procedure set_maxCircularity(maxCircularity: Single); cdecl;//Deprecated
    procedure set_maxConvexity(maxConvexity: Single); cdecl;//Deprecated
    procedure set_minCircularity(minCircularity: Single); cdecl;//Deprecated
    procedure set_minConvexity(minConvexity: Single); cdecl;//Deprecated
    procedure set_minDistBetweenBlobs(minDistBetweenBlobs: Single); cdecl;//Deprecated
    procedure set_thresholdStep(thresholdStep: Single); cdecl;//Deprecated
  end;
  TJParams = class(TJavaGenericImport<JParamsClass, JParams>) end;

  JSimpleBlobDetectorClass = interface(JFeature2DClass)
    ['{DCD8C7B5-A9B4-44B2-BA41-E675A2BE0214}']
    {class} function __fromPtr__(addr: Int64): JSimpleBlobDetector; cdecl;
    {class} function create: JSimpleBlobDetector; cdecl;
  end;

  [JavaSignature('org/opencv/features2d/SimpleBlobDetector')]
  JSimpleBlobDetector = interface(JFeature2D)
    ['{D8C25914-DB3C-4349-8AAB-21E0A5CD24E5}']
    function getDefaultName: JString; cdecl;
  end;
  TJSimpleBlobDetector = class(TJavaGenericImport<JSimpleBlobDetectorClass, JSimpleBlobDetector>) end;

  JImgcodecsClass = interface(JObjectClass)
    ['{9865A8AE-BD9F-49D8-A70F-33FE771CBE70}']
    {class} function _GetIMREAD_ANYCOLOR: Integer; cdecl;
    {class} function _GetIMREAD_ANYDEPTH: Integer; cdecl;
    {class} function _GetIMREAD_COLOR: Integer; cdecl;
    {class} function _GetIMREAD_GRAYSCALE: Integer; cdecl;
    {class} function _GetIMREAD_IGNORE_ORIENTATION: Integer; cdecl;
    {class} function _GetIMREAD_LOAD_GDAL: Integer; cdecl;
    {class} function _GetIMREAD_REDUCED_COLOR_2: Integer; cdecl;
    {class} function _GetIMREAD_REDUCED_COLOR_4: Integer; cdecl;
    {class} function _GetIMREAD_REDUCED_COLOR_8: Integer; cdecl;
    {class} function _GetIMREAD_REDUCED_GRAYSCALE_2: Integer; cdecl;
    {class} function _GetIMREAD_REDUCED_GRAYSCALE_4: Integer; cdecl;
    {class} function _GetIMREAD_REDUCED_GRAYSCALE_8: Integer; cdecl;
    {class} function _GetIMREAD_UNCHANGED: Integer; cdecl;
    {class} function _GetIMWRITE_EXR_TYPE: Integer; cdecl;
    {class} function _GetIMWRITE_EXR_TYPE_FLOAT: Integer; cdecl;
    {class} function _GetIMWRITE_EXR_TYPE_HALF: Integer; cdecl;
    {class} function _GetIMWRITE_JPEG2000_COMPRESSION_X1000: Integer; cdecl;
    {class} function _GetIMWRITE_JPEG_CHROMA_QUALITY: Integer; cdecl;
    {class} function _GetIMWRITE_JPEG_LUMA_QUALITY: Integer; cdecl;
    {class} function _GetIMWRITE_JPEG_OPTIMIZE: Integer; cdecl;
    {class} function _GetIMWRITE_JPEG_PROGRESSIVE: Integer; cdecl;
    {class} function _GetIMWRITE_JPEG_QUALITY: Integer; cdecl;
    {class} function _GetIMWRITE_JPEG_RST_INTERVAL: Integer; cdecl;
    {class} function _GetIMWRITE_PAM_FORMAT_BLACKANDWHITE: Integer; cdecl;
    {class} function _GetIMWRITE_PAM_FORMAT_GRAYSCALE: Integer; cdecl;
    {class} function _GetIMWRITE_PAM_FORMAT_GRAYSCALE_ALPHA: Integer; cdecl;
    {class} function _GetIMWRITE_PAM_FORMAT_NULL: Integer; cdecl;
    {class} function _GetIMWRITE_PAM_FORMAT_RGB: Integer; cdecl;
    {class} function _GetIMWRITE_PAM_FORMAT_RGB_ALPHA: Integer; cdecl;
    {class} function _GetIMWRITE_PAM_TUPLETYPE: Integer; cdecl;
    {class} function _GetIMWRITE_PNG_BILEVEL: Integer; cdecl;
    {class} function _GetIMWRITE_PNG_COMPRESSION: Integer; cdecl;
    {class} function _GetIMWRITE_PNG_STRATEGY: Integer; cdecl;
    {class} function _GetIMWRITE_PNG_STRATEGY_DEFAULT: Integer; cdecl;
    {class} function _GetIMWRITE_PNG_STRATEGY_FILTERED: Integer; cdecl;
    {class} function _GetIMWRITE_PNG_STRATEGY_FIXED: Integer; cdecl;
    {class} function _GetIMWRITE_PNG_STRATEGY_HUFFMAN_ONLY: Integer; cdecl;
    {class} function _GetIMWRITE_PNG_STRATEGY_RLE: Integer; cdecl;
    {class} function _GetIMWRITE_PXM_BINARY: Integer; cdecl;
    {class} function _GetIMWRITE_TIFF_COMPRESSION: Integer; cdecl;
    {class} function _GetIMWRITE_TIFF_RESUNIT: Integer; cdecl;
    {class} function _GetIMWRITE_TIFF_XDPI: Integer; cdecl;
    {class} function _GetIMWRITE_TIFF_YDPI: Integer; cdecl;
    {class} function _GetIMWRITE_WEBP_QUALITY: Integer; cdecl;
    {class} function init: JImgcodecs; cdecl;
    {class} function haveImageReader(filename: JString): Boolean; cdecl;
    {class} function haveImageWriter(filename: JString): Boolean; cdecl;
    {class} function imdecode(buf: JMat; flags: Integer): JMat; cdecl;
    {class} function imencode(ext: JString; img: JMat; buf: JMatOfByte; params: JMatOfInt): Boolean; cdecl; overload;//Deprecated
    {class} function imencode(ext: JString; img: JMat; buf: JMatOfByte): Boolean; cdecl; overload;//Deprecated
    {class} function imread(filename: JString; flags: Integer): JMat; cdecl; overload;//Deprecated
    {class} function imread(filename: JString): JMat; cdecl; overload;//Deprecated
    {class} function imreadmulti(filename: JString; mats: JList; flags: Integer): Boolean; cdecl; overload;//Deprecated
    {class} function imreadmulti(filename: JString; mats: JList): Boolean; cdecl; overload;//Deprecated
    {class} function imwrite(filename: JString; img: JMat; params: JMatOfInt): Boolean; cdecl; overload;//Deprecated
    {class} function imwrite(filename: JString; img: JMat): Boolean; cdecl; overload;//Deprecated
    {class} property IMREAD_ANYCOLOR: Integer read _GetIMREAD_ANYCOLOR;
    {class} property IMREAD_ANYDEPTH: Integer read _GetIMREAD_ANYDEPTH;
    {class} property IMREAD_COLOR: Integer read _GetIMREAD_COLOR;
    {class} property IMREAD_GRAYSCALE: Integer read _GetIMREAD_GRAYSCALE;
    {class} property IMREAD_IGNORE_ORIENTATION: Integer read _GetIMREAD_IGNORE_ORIENTATION;
    {class} property IMREAD_LOAD_GDAL: Integer read _GetIMREAD_LOAD_GDAL;
    {class} property IMREAD_REDUCED_COLOR_2: Integer read _GetIMREAD_REDUCED_COLOR_2;
    {class} property IMREAD_REDUCED_COLOR_4: Integer read _GetIMREAD_REDUCED_COLOR_4;
    {class} property IMREAD_REDUCED_COLOR_8: Integer read _GetIMREAD_REDUCED_COLOR_8;
    {class} property IMREAD_REDUCED_GRAYSCALE_2: Integer read _GetIMREAD_REDUCED_GRAYSCALE_2;
    {class} property IMREAD_REDUCED_GRAYSCALE_4: Integer read _GetIMREAD_REDUCED_GRAYSCALE_4;
    {class} property IMREAD_REDUCED_GRAYSCALE_8: Integer read _GetIMREAD_REDUCED_GRAYSCALE_8;
    {class} property IMREAD_UNCHANGED: Integer read _GetIMREAD_UNCHANGED;
    {class} property IMWRITE_EXR_TYPE: Integer read _GetIMWRITE_EXR_TYPE;
    {class} property IMWRITE_EXR_TYPE_FLOAT: Integer read _GetIMWRITE_EXR_TYPE_FLOAT;
    {class} property IMWRITE_EXR_TYPE_HALF: Integer read _GetIMWRITE_EXR_TYPE_HALF;
    {class} property IMWRITE_JPEG2000_COMPRESSION_X1000: Integer read _GetIMWRITE_JPEG2000_COMPRESSION_X1000;
    {class} property IMWRITE_JPEG_CHROMA_QUALITY: Integer read _GetIMWRITE_JPEG_CHROMA_QUALITY;
    {class} property IMWRITE_JPEG_LUMA_QUALITY: Integer read _GetIMWRITE_JPEG_LUMA_QUALITY;
    {class} property IMWRITE_JPEG_OPTIMIZE: Integer read _GetIMWRITE_JPEG_OPTIMIZE;
    {class} property IMWRITE_JPEG_PROGRESSIVE: Integer read _GetIMWRITE_JPEG_PROGRESSIVE;
    {class} property IMWRITE_JPEG_QUALITY: Integer read _GetIMWRITE_JPEG_QUALITY;
    {class} property IMWRITE_JPEG_RST_INTERVAL: Integer read _GetIMWRITE_JPEG_RST_INTERVAL;
    {class} property IMWRITE_PAM_FORMAT_BLACKANDWHITE: Integer read _GetIMWRITE_PAM_FORMAT_BLACKANDWHITE;
    {class} property IMWRITE_PAM_FORMAT_GRAYSCALE: Integer read _GetIMWRITE_PAM_FORMAT_GRAYSCALE;
    {class} property IMWRITE_PAM_FORMAT_GRAYSCALE_ALPHA: Integer read _GetIMWRITE_PAM_FORMAT_GRAYSCALE_ALPHA;
    {class} property IMWRITE_PAM_FORMAT_NULL: Integer read _GetIMWRITE_PAM_FORMAT_NULL;
    {class} property IMWRITE_PAM_FORMAT_RGB: Integer read _GetIMWRITE_PAM_FORMAT_RGB;
    {class} property IMWRITE_PAM_FORMAT_RGB_ALPHA: Integer read _GetIMWRITE_PAM_FORMAT_RGB_ALPHA;
    {class} property IMWRITE_PAM_TUPLETYPE: Integer read _GetIMWRITE_PAM_TUPLETYPE;
    {class} property IMWRITE_PNG_BILEVEL: Integer read _GetIMWRITE_PNG_BILEVEL;
    {class} property IMWRITE_PNG_COMPRESSION: Integer read _GetIMWRITE_PNG_COMPRESSION;
    {class} property IMWRITE_PNG_STRATEGY: Integer read _GetIMWRITE_PNG_STRATEGY;
    {class} property IMWRITE_PNG_STRATEGY_DEFAULT: Integer read _GetIMWRITE_PNG_STRATEGY_DEFAULT;
    {class} property IMWRITE_PNG_STRATEGY_FILTERED: Integer read _GetIMWRITE_PNG_STRATEGY_FILTERED;
    {class} property IMWRITE_PNG_STRATEGY_FIXED: Integer read _GetIMWRITE_PNG_STRATEGY_FIXED;
    {class} property IMWRITE_PNG_STRATEGY_HUFFMAN_ONLY: Integer read _GetIMWRITE_PNG_STRATEGY_HUFFMAN_ONLY;
    {class} property IMWRITE_PNG_STRATEGY_RLE: Integer read _GetIMWRITE_PNG_STRATEGY_RLE;
    {class} property IMWRITE_PXM_BINARY: Integer read _GetIMWRITE_PXM_BINARY;
    {class} property IMWRITE_TIFF_COMPRESSION: Integer read _GetIMWRITE_TIFF_COMPRESSION;
    {class} property IMWRITE_TIFF_RESUNIT: Integer read _GetIMWRITE_TIFF_RESUNIT;
    {class} property IMWRITE_TIFF_XDPI: Integer read _GetIMWRITE_TIFF_XDPI;
    {class} property IMWRITE_TIFF_YDPI: Integer read _GetIMWRITE_TIFF_YDPI;
    {class} property IMWRITE_WEBP_QUALITY: Integer read _GetIMWRITE_WEBP_QUALITY;
  end;

  [JavaSignature('org/opencv/imgcodecs/Imgcodecs')]
  JImgcodecs = interface(JObject)
    ['{6ED4F051-EF75-4EC5-8EA6-C1D178315D3F}']
  end;
  TJImgcodecs = class(TJavaGenericImport<JImgcodecsClass, JImgcodecs>) end;

  JCLAHEClass = interface(JAlgorithmClass)
    ['{DC72A5EE-1626-424F-BC27-6AB34C6DEC39}']
    {class} function __fromPtr__(addr: Int64): JCLAHE; cdecl;//Deprecated
    {class} procedure apply(src: JMat; dst: JMat); cdecl;//Deprecated
    {class} procedure setClipLimit(clipLimit: Double); cdecl;//Deprecated
    {class} procedure setTilesGridSize(tileGridSize: Jcore_Size); cdecl;//Deprecated
  end;

  [JavaSignature('org/opencv/imgproc/CLAHE')]
  JCLAHE = interface(JAlgorithm)
    ['{467BA663-81FF-4E99-8B8F-903F393F69B6}']
    procedure collectGarbage; cdecl;//Deprecated
    function getClipLimit: Double; cdecl;//Deprecated
    function getTilesGridSize: Jcore_Size; cdecl;//Deprecated
  end;
  TJCLAHE = class(TJavaGenericImport<JCLAHEClass, JCLAHE>) end;

  JGeneralizedHoughClass = interface(JAlgorithmClass)
    ['{29CC3386-FD5B-48C2-89EB-DFFF8AC248EB}']
    {class} function __fromPtr__(addr: Int64): JGeneralizedHough; cdecl;
    {class} procedure detect(image: JMat; positions: JMat; votes: JMat); cdecl; overload;
    {class} procedure detect(image: JMat; positions: JMat); cdecl; overload;
    {class} function getCannyHighThresh: Integer; cdecl;
    {class} function getMinDist: Double; cdecl;
    {class} procedure setCannyHighThresh(cannyHighThresh: Integer); cdecl;
    {class} procedure setCannyLowThresh(cannyLowThresh: Integer); cdecl;
    {class} procedure setTemplate(edges: JMat; dx: JMat; dy: JMat; templCenter: Jcore_Point); cdecl; overload;
    {class} procedure setTemplate(edges: JMat; dx: JMat; dy: JMat); cdecl; overload;
  end;

  [JavaSignature('org/opencv/imgproc/GeneralizedHough')]
  JGeneralizedHough = interface(JAlgorithm)
    ['{283B79C3-4E8B-42D4-BC39-DE28DD89358A}']
    procedure detect(edges: JMat; dx: JMat; dy: JMat; positions: JMat; votes: JMat); cdecl; overload;
    procedure detect(edges: JMat; dx: JMat; dy: JMat; positions: JMat); cdecl; overload;
    function getCannyLowThresh: Integer; cdecl;
    function getDp: Double; cdecl;
    function getMaxBufferSize: Integer; cdecl;
    procedure setDp(dp: Double); cdecl;
    procedure setMaxBufferSize(maxBufferSize: Integer); cdecl;
    procedure setMinDist(minDist: Double); cdecl;
    procedure setTemplate(templ: JMat; templCenter: Jcore_Point); cdecl; overload;
    procedure setTemplate(templ: JMat); cdecl; overload;
  end;
  TJGeneralizedHough = class(TJavaGenericImport<JGeneralizedHoughClass, JGeneralizedHough>) end;

  JGeneralizedHoughBallardClass = interface(JGeneralizedHoughClass)
    ['{A046A4AF-EDA8-4E62-9AE4-66AB05D73EDB}']
    {class} function __fromPtr__(addr: Int64): JGeneralizedHoughBallard; cdecl;
    {class} function getLevels: Integer; cdecl;
  end;

  [JavaSignature('org/opencv/imgproc/GeneralizedHoughBallard')]
  JGeneralizedHoughBallard = interface(JGeneralizedHough)
    ['{6B621E45-2638-4173-B6C5-78C710F71D96}']
    function getVotesThreshold: Integer; cdecl;
    procedure setLevels(levels: Integer); cdecl;
    procedure setVotesThreshold(votesThreshold: Integer); cdecl;
  end;
  TJGeneralizedHoughBallard = class(TJavaGenericImport<JGeneralizedHoughBallardClass, JGeneralizedHoughBallard>) end;

  JGeneralizedHoughGuilClass = interface(JGeneralizedHoughClass)
    ['{720923C0-8C33-4ABE-A029-9D0E87F91509}']
    {class} function __fromPtr__(addr: Int64): JGeneralizedHoughGuil; cdecl;
    {class} function getAngleStep: Double; cdecl;
    {class} function getAngleThresh: Integer; cdecl;
    {class} function getLevels: Integer; cdecl;
    {class} function getMinScale: Double; cdecl;//Deprecated
    {class} function getPosThresh: Integer; cdecl;//Deprecated
    {class} function getScaleStep: Double; cdecl;//Deprecated
    {class} procedure setAngleStep(angleStep: Double); cdecl;//Deprecated
    {class} procedure setAngleThresh(angleThresh: Integer); cdecl;//Deprecated
    {class} procedure setLevels(levels: Integer); cdecl;//Deprecated
    {class} procedure setMinScale(minScale: Double); cdecl;//Deprecated
    {class} procedure setPosThresh(posThresh: Integer); cdecl;//Deprecated
  end;

  [JavaSignature('org/opencv/imgproc/GeneralizedHoughGuil')]
  JGeneralizedHoughGuil = interface(JGeneralizedHough)
    ['{874FAB41-4976-4779-BE95-6836278AB93F}']
    function getAngleEpsilon: Double; cdecl;
    function getMaxAngle: Double; cdecl;
    function getMaxScale: Double; cdecl;
    function getMinAngle: Double; cdecl;
    function getScaleThresh: Integer; cdecl;//Deprecated
    function getXi: Double; cdecl;//Deprecated
    procedure setAngleEpsilon(angleEpsilon: Double); cdecl;//Deprecated
    procedure setMaxAngle(maxAngle: Double); cdecl;//Deprecated
    procedure setMaxScale(maxScale: Double); cdecl;//Deprecated
    procedure setMinAngle(minAngle: Double); cdecl;//Deprecated
    procedure setScaleStep(scaleStep: Double); cdecl;//Deprecated
    procedure setScaleThresh(scaleThresh: Integer); cdecl;//Deprecated
    procedure setXi(xi: Double); cdecl;//Deprecated
  end;
  TJGeneralizedHoughGuil = class(TJavaGenericImport<JGeneralizedHoughGuilClass, JGeneralizedHoughGuil>) end;

  JImgprocClass = interface(JObjectClass)
    ['{542AE6CC-D67E-450D-B400-E11C92BC3863}']
    {class} function _GetADAPTIVE_THRESH_GAUSSIAN_C: Integer; cdecl;
    {class} function _GetADAPTIVE_THRESH_MEAN_C: Integer; cdecl;
    {class} function _GetCCL_DEFAULT: Integer; cdecl;
    {class} function _GetCCL_GRANA: Integer; cdecl;
    {class} function _GetCCL_WU: Integer; cdecl;
    {class} function _GetCC_STAT_AREA: Integer; cdecl;
    {class} function _GetCC_STAT_HEIGHT: Integer; cdecl;
    {class} function _GetCC_STAT_LEFT: Integer; cdecl;
    {class} function _GetCC_STAT_MAX: Integer; cdecl;
    {class} function _GetCC_STAT_TOP: Integer; cdecl;
    {class} function _GetCC_STAT_WIDTH: Integer; cdecl;
    {class} function _GetCHAIN_APPROX_NONE: Integer; cdecl;
    {class} function _GetCHAIN_APPROX_SIMPLE: Integer; cdecl;
    {class} function _GetCHAIN_APPROX_TC89_KCOS: Integer; cdecl;
    {class} function _GetCHAIN_APPROX_TC89_L1: Integer; cdecl;
    {class} function _GetCOLORMAP_AUTUMN: Integer; cdecl;
    {class} function _GetCOLORMAP_BONE: Integer; cdecl;
    {class} function _GetCOLORMAP_CIVIDIS: Integer; cdecl;
    {class} function _GetCOLORMAP_COOL: Integer; cdecl;
    {class} function _GetCOLORMAP_HOT: Integer; cdecl;
    {class} function _GetCOLORMAP_HSV: Integer; cdecl;
    {class} function _GetCOLORMAP_INFERNO: Integer; cdecl;
    {class} function _GetCOLORMAP_JET: Integer; cdecl;
    {class} function _GetCOLORMAP_MAGMA: Integer; cdecl;
    {class} function _GetCOLORMAP_OCEAN: Integer; cdecl;
    {class} function _GetCOLORMAP_PARULA: Integer; cdecl;
    {class} function _GetCOLORMAP_PINK: Integer; cdecl;
    {class} function _GetCOLORMAP_PLASMA: Integer; cdecl;
    {class} function _GetCOLORMAP_RAINBOW: Integer; cdecl;
    {class} function _GetCOLORMAP_SPRING: Integer; cdecl;
    {class} function _GetCOLORMAP_SUMMER: Integer; cdecl;
    {class} function _GetCOLORMAP_TURBO: Integer; cdecl;
    {class} function _GetCOLORMAP_TWILIGHT: Integer; cdecl;
    {class} function _GetCOLORMAP_TWILIGHT_SHIFTED: Integer; cdecl;
    {class} function _GetCOLORMAP_VIRIDIS: Integer; cdecl;
    {class} function _GetCOLORMAP_WINTER: Integer; cdecl;
    {class} function _GetCOLOR_BGR2BGR555: Integer; cdecl;
    {class} function _GetCOLOR_BGR2BGR565: Integer; cdecl;
    {class} function _GetCOLOR_BGR2BGRA: Integer; cdecl;
    {class} function _GetCOLOR_BGR2GRAY: Integer; cdecl;
    {class} function _GetCOLOR_BGR2HLS: Integer; cdecl;
    {class} function _GetCOLOR_BGR2HLS_FULL: Integer; cdecl;
    {class} function _GetCOLOR_BGR2HSV: Integer; cdecl;
    {class} function _GetCOLOR_BGR2HSV_FULL: Integer; cdecl;
    {class} function _GetCOLOR_BGR2Lab: Integer; cdecl;
    {class} function _GetCOLOR_BGR2Luv: Integer; cdecl;
    {class} function _GetCOLOR_BGR2RGB: Integer; cdecl;
    {class} function _GetCOLOR_BGR2RGBA: Integer; cdecl;
    {class} function _GetCOLOR_BGR2XYZ: Integer; cdecl;
    {class} function _GetCOLOR_BGR2YCrCb: Integer; cdecl;
    {class} function _GetCOLOR_BGR2YUV: Integer; cdecl;
    {class} function _GetCOLOR_BGR2YUV_I420: Integer; cdecl;
    {class} function _GetCOLOR_BGR2YUV_IYUV: Integer; cdecl;
    {class} function _GetCOLOR_BGR2YUV_YV12: Integer; cdecl;
    {class} function _GetCOLOR_BGR5552BGR: Integer; cdecl;
    {class} function _GetCOLOR_BGR5552BGRA: Integer; cdecl;
    {class} function _GetCOLOR_BGR5552GRAY: Integer; cdecl;
    {class} function _GetCOLOR_BGR5552RGB: Integer; cdecl;
    {class} function _GetCOLOR_BGR5552RGBA: Integer; cdecl;
    {class} function _GetCOLOR_BGR5652BGR: Integer; cdecl;
    {class} function _GetCOLOR_BGR5652BGRA: Integer; cdecl;
    {class} function _GetCOLOR_BGR5652GRAY: Integer; cdecl;
    {class} function _GetCOLOR_BGR5652RGB: Integer; cdecl;
    {class} function _GetCOLOR_BGR5652RGBA: Integer; cdecl;
    {class} function _GetCOLOR_BGRA2BGR: Integer; cdecl;
    {class} function _GetCOLOR_BGRA2BGR555: Integer; cdecl;
    {class} function _GetCOLOR_BGRA2BGR565: Integer; cdecl;
    {class} function _GetCOLOR_BGRA2GRAY: Integer; cdecl;
    {class} function _GetCOLOR_BGRA2RGB: Integer; cdecl;
    {class} function _GetCOLOR_BGRA2RGBA: Integer; cdecl;
    {class} function _GetCOLOR_BGRA2YUV_I420: Integer; cdecl;
    {class} function _GetCOLOR_BGRA2YUV_IYUV: Integer; cdecl;
    {class} function _GetCOLOR_BGRA2YUV_YV12: Integer; cdecl;
    {class} function _GetCOLOR_BayerBG2BGR: Integer; cdecl;
    {class} function _GetCOLOR_BayerBG2BGRA: Integer; cdecl;
    {class} function _GetCOLOR_BayerBG2BGR_EA: Integer; cdecl;
    {class} function _GetCOLOR_BayerBG2BGR_VNG: Integer; cdecl;
    {class} function _GetCOLOR_BayerBG2GRAY: Integer; cdecl;
    {class} function _GetCOLOR_BayerBG2RGB: Integer; cdecl;
    {class} function _GetCOLOR_BayerBG2RGBA: Integer; cdecl;
    {class} function _GetCOLOR_BayerBG2RGB_EA: Integer; cdecl;
    {class} function _GetCOLOR_BayerBG2RGB_VNG: Integer; cdecl;
    {class} function _GetCOLOR_BayerGB2BGR: Integer; cdecl;
    {class} function _GetCOLOR_BayerGB2BGRA: Integer; cdecl;
    {class} function _GetCOLOR_BayerGB2BGR_EA: Integer; cdecl;
    {class} function _GetCOLOR_BayerGB2BGR_VNG: Integer; cdecl;
    {class} function _GetCOLOR_BayerGB2GRAY: Integer; cdecl;
    {class} function _GetCOLOR_BayerGB2RGB: Integer; cdecl;
    {class} function _GetCOLOR_BayerGB2RGBA: Integer; cdecl;
    {class} function _GetCOLOR_BayerGB2RGB_EA: Integer; cdecl;
    {class} function _GetCOLOR_BayerGB2RGB_VNG: Integer; cdecl;
    {class} function _GetCOLOR_BayerGR2BGR: Integer; cdecl;
    {class} function _GetCOLOR_BayerGR2BGRA: Integer; cdecl;
    {class} function _GetCOLOR_BayerGR2BGR_EA: Integer; cdecl;
    {class} function _GetCOLOR_BayerGR2BGR_VNG: Integer; cdecl;
    {class} function _GetCOLOR_BayerGR2GRAY: Integer; cdecl;
    {class} function _GetCOLOR_BayerGR2RGB: Integer; cdecl;
    {class} function _GetCOLOR_BayerGR2RGBA: Integer; cdecl;
    {class} function _GetCOLOR_BayerGR2RGB_EA: Integer; cdecl;
    {class} function _GetCOLOR_BayerGR2RGB_VNG: Integer; cdecl;
    {class} function _GetCOLOR_BayerRG2BGR: Integer; cdecl;
    {class} function _GetCOLOR_BayerRG2BGRA: Integer; cdecl;
    {class} function _GetCOLOR_BayerRG2BGR_EA: Integer; cdecl;
    {class} function _GetCOLOR_BayerRG2BGR_VNG: Integer; cdecl;
    {class} function _GetCOLOR_BayerRG2GRAY: Integer; cdecl;
    {class} function _GetCOLOR_BayerRG2RGB: Integer; cdecl;
    {class} function _GetCOLOR_BayerRG2RGBA: Integer; cdecl;
    {class} function _GetCOLOR_BayerRG2RGB_EA: Integer; cdecl;
    {class} function _GetCOLOR_BayerRG2RGB_VNG: Integer; cdecl;
    {class} function _GetCOLOR_COLORCVT_MAX: Integer; cdecl;
    {class} function _GetCOLOR_GRAY2BGR: Integer; cdecl;
    {class} function _GetCOLOR_GRAY2BGR555: Integer; cdecl;
    {class} function _GetCOLOR_GRAY2BGR565: Integer; cdecl;
    {class} function _GetCOLOR_GRAY2BGRA: Integer; cdecl;
    {class} function _GetCOLOR_GRAY2RGB: Integer; cdecl;
    {class} function _GetCOLOR_GRAY2RGBA: Integer; cdecl;
    {class} function _GetCOLOR_HLS2BGR: Integer; cdecl;
    {class} function _GetCOLOR_HLS2BGR_FULL: Integer; cdecl;
    {class} function _GetCOLOR_HLS2RGB: Integer; cdecl;
    {class} function _GetCOLOR_HLS2RGB_FULL: Integer; cdecl;
    {class} function _GetCOLOR_HSV2BGR: Integer; cdecl;
    {class} function _GetCOLOR_HSV2BGR_FULL: Integer; cdecl;
    {class} function _GetCOLOR_HSV2RGB: Integer; cdecl;
    {class} function _GetCOLOR_HSV2RGB_FULL: Integer; cdecl;
    {class} function _GetCOLOR_LBGR2Lab: Integer; cdecl;
    {class} function _GetCOLOR_LBGR2Luv: Integer; cdecl;
    {class} function _GetCOLOR_LRGB2Lab: Integer; cdecl;
    {class} function _GetCOLOR_LRGB2Luv: Integer; cdecl;
    {class} function _GetCOLOR_Lab2BGR: Integer; cdecl;
    {class} function _GetCOLOR_Lab2LBGR: Integer; cdecl;
    {class} function _GetCOLOR_Lab2LRGB: Integer; cdecl;
    {class} function _GetCOLOR_Lab2RGB: Integer; cdecl;
    {class} function _GetCOLOR_Luv2BGR: Integer; cdecl;
    {class} function _GetCOLOR_Luv2LBGR: Integer; cdecl;
    {class} function _GetCOLOR_Luv2LRGB: Integer; cdecl;
    {class} function _GetCOLOR_Luv2RGB: Integer; cdecl;
    {class} function _GetCOLOR_RGB2BGR: Integer; cdecl;
    {class} function _GetCOLOR_RGB2BGR555: Integer; cdecl;
    {class} function _GetCOLOR_RGB2BGR565: Integer; cdecl;
    {class} function _GetCOLOR_RGB2BGRA: Integer; cdecl;
    {class} function _GetCOLOR_RGB2GRAY: Integer; cdecl;
    {class} function _GetCOLOR_RGB2HLS: Integer; cdecl;
    {class} function _GetCOLOR_RGB2HLS_FULL: Integer; cdecl;
    {class} function _GetCOLOR_RGB2HSV: Integer; cdecl;
    {class} function _GetCOLOR_RGB2HSV_FULL: Integer; cdecl;
    {class} function _GetCOLOR_RGB2Lab: Integer; cdecl;
    {class} function _GetCOLOR_RGB2Luv: Integer; cdecl;
    {class} function _GetCOLOR_RGB2RGBA: Integer; cdecl;
    {class} function _GetCOLOR_RGB2XYZ: Integer; cdecl;
    {class} function _GetCOLOR_RGB2YCrCb: Integer; cdecl;
    {class} function _GetCOLOR_RGB2YUV: Integer; cdecl;
    {class} function _GetCOLOR_RGB2YUV_I420: Integer; cdecl;
    {class} function _GetCOLOR_RGB2YUV_IYUV: Integer; cdecl;
    {class} function _GetCOLOR_RGB2YUV_YV12: Integer; cdecl;
    {class} function _GetCOLOR_RGBA2BGR: Integer; cdecl;
    {class} function _GetCOLOR_RGBA2BGR555: Integer; cdecl;
    {class} function _GetCOLOR_RGBA2BGR565: Integer; cdecl;
    {class} function _GetCOLOR_RGBA2BGRA: Integer; cdecl;
    {class} function _GetCOLOR_RGBA2GRAY: Integer; cdecl;
    {class} function _GetCOLOR_RGBA2RGB: Integer; cdecl;
    {class} function _GetCOLOR_RGBA2YUV_I420: Integer; cdecl;
    {class} function _GetCOLOR_RGBA2YUV_IYUV: Integer; cdecl;
    {class} function _GetCOLOR_RGBA2YUV_YV12: Integer; cdecl;
    {class} function _GetCOLOR_RGBA2mRGBA: Integer; cdecl;
    {class} function _GetCOLOR_XYZ2BGR: Integer; cdecl;
    {class} function _GetCOLOR_XYZ2RGB: Integer; cdecl;
    {class} function _GetCOLOR_YCrCb2BGR: Integer; cdecl;
    {class} function _GetCOLOR_YCrCb2RGB: Integer; cdecl;
    {class} function _GetCOLOR_YUV2BGR: Integer; cdecl;
    {class} function _GetCOLOR_YUV2BGRA_I420: Integer; cdecl;
    {class} function _GetCOLOR_YUV2BGRA_IYUV: Integer; cdecl;
    {class} function _GetCOLOR_YUV2BGRA_NV12: Integer; cdecl;
    {class} function _GetCOLOR_YUV2BGRA_NV21: Integer; cdecl;
    {class} function _GetCOLOR_YUV2BGRA_UYNV: Integer; cdecl;
    {class} function _GetCOLOR_YUV2BGRA_UYVY: Integer; cdecl;
    {class} function _GetCOLOR_YUV2BGRA_Y422: Integer; cdecl;
    {class} function _GetCOLOR_YUV2BGRA_YUNV: Integer; cdecl;
    {class} function _GetCOLOR_YUV2BGRA_YUY2: Integer; cdecl;
    {class} function _GetCOLOR_YUV2BGRA_YUYV: Integer; cdecl;
    {class} function _GetCOLOR_YUV2BGRA_YV12: Integer; cdecl;
    {class} function _GetCOLOR_YUV2BGRA_YVYU: Integer; cdecl;
    {class} function _GetCOLOR_YUV2BGR_I420: Integer; cdecl;
    {class} function _GetCOLOR_YUV2BGR_IYUV: Integer; cdecl;
    {class} function _GetCOLOR_YUV2BGR_NV12: Integer; cdecl;
    {class} function _GetCOLOR_YUV2BGR_NV21: Integer; cdecl;
    {class} function _GetCOLOR_YUV2BGR_UYNV: Integer; cdecl;
    {class} function _GetCOLOR_YUV2BGR_UYVY: Integer; cdecl;
    {class} function _GetCOLOR_YUV2BGR_Y422: Integer; cdecl;
    {class} function _GetCOLOR_YUV2BGR_YUNV: Integer; cdecl;
    {class} function _GetCOLOR_YUV2BGR_YUY2: Integer; cdecl;
    {class} function _GetCOLOR_YUV2BGR_YUYV: Integer; cdecl;
    {class} function _GetCOLOR_YUV2BGR_YV12: Integer; cdecl;
    {class} function _GetCOLOR_YUV2BGR_YVYU: Integer; cdecl;
    {class} function _GetCOLOR_YUV2GRAY_420: Integer; cdecl;
    {class} function _GetCOLOR_YUV2GRAY_I420: Integer; cdecl;
    {class} function _GetCOLOR_YUV2GRAY_IYUV: Integer; cdecl;
    {class} function _GetCOLOR_YUV2GRAY_NV12: Integer; cdecl;
    {class} function _GetCOLOR_YUV2GRAY_NV21: Integer; cdecl;
    {class} function _GetCOLOR_YUV2GRAY_UYNV: Integer; cdecl;
    {class} function _GetCOLOR_YUV2GRAY_UYVY: Integer; cdecl;
    {class} function _GetCOLOR_YUV2GRAY_Y422: Integer; cdecl;
    {class} function _GetCOLOR_YUV2GRAY_YUNV: Integer; cdecl;
    {class} function _GetCOLOR_YUV2GRAY_YUY2: Integer; cdecl;
    {class} function _GetCOLOR_YUV2GRAY_YUYV: Integer; cdecl;
    {class} function _GetCOLOR_YUV2GRAY_YV12: Integer; cdecl;
    {class} function _GetCOLOR_YUV2GRAY_YVYU: Integer; cdecl;
    {class} function _GetCOLOR_YUV2RGB: Integer; cdecl;
    {class} function _GetCOLOR_YUV2RGBA_I420: Integer; cdecl;
    {class} function _GetCOLOR_YUV2RGBA_IYUV: Integer; cdecl;
    {class} function _GetCOLOR_YUV2RGBA_NV12: Integer; cdecl;
    {class} function _GetCOLOR_YUV2RGBA_NV21: Integer; cdecl;
    {class} function _GetCOLOR_YUV2RGBA_UYNV: Integer; cdecl;
    {class} function _GetCOLOR_YUV2RGBA_UYVY: Integer; cdecl;
    {class} function _GetCOLOR_YUV2RGBA_Y422: Integer; cdecl;
    {class} function _GetCOLOR_YUV2RGBA_YUNV: Integer; cdecl;
    {class} function _GetCOLOR_YUV2RGBA_YUY2: Integer; cdecl;
    {class} function _GetCOLOR_YUV2RGBA_YUYV: Integer; cdecl;
    {class} function _GetCOLOR_YUV2RGBA_YV12: Integer; cdecl;
    {class} function _GetCOLOR_YUV2RGBA_YVYU: Integer; cdecl;
    {class} function _GetCOLOR_YUV2RGB_I420: Integer; cdecl;
    {class} function _GetCOLOR_YUV2RGB_IYUV: Integer; cdecl;
    {class} function _GetCOLOR_YUV2RGB_NV12: Integer; cdecl;
    {class} function _GetCOLOR_YUV2RGB_NV21: Integer; cdecl;
    {class} function _GetCOLOR_YUV2RGB_UYNV: Integer; cdecl;
    {class} function _GetCOLOR_YUV2RGB_UYVY: Integer; cdecl;
    {class} function _GetCOLOR_YUV2RGB_Y422: Integer; cdecl;
    {class} function _GetCOLOR_YUV2RGB_YUNV: Integer; cdecl;
    {class} function _GetCOLOR_YUV2RGB_YUY2: Integer; cdecl;
    {class} function _GetCOLOR_YUV2RGB_YUYV: Integer; cdecl;
    {class} function _GetCOLOR_YUV2RGB_YV12: Integer; cdecl;
    {class} function _GetCOLOR_YUV2RGB_YVYU: Integer; cdecl;
    {class} function _GetCOLOR_YUV420p2BGR: Integer; cdecl;
    {class} function _GetCOLOR_YUV420p2BGRA: Integer; cdecl;
    {class} function _GetCOLOR_YUV420p2GRAY: Integer; cdecl;
    {class} function _GetCOLOR_YUV420p2RGB: Integer; cdecl;
    {class} function _GetCOLOR_YUV420p2RGBA: Integer; cdecl;
    {class} function _GetCOLOR_YUV420sp2BGR: Integer; cdecl;
    {class} function _GetCOLOR_YUV420sp2BGRA: Integer; cdecl;
    {class} function _GetCOLOR_YUV420sp2GRAY: Integer; cdecl;
    {class} function _GetCOLOR_YUV420sp2RGB: Integer; cdecl;
    {class} function _GetCOLOR_YUV420sp2RGBA: Integer; cdecl;
    {class} function _GetCOLOR_mRGBA2RGBA: Integer; cdecl;
    {class} function _GetCONTOURS_MATCH_I1: Integer; cdecl;
    {class} function _GetCONTOURS_MATCH_I2: Integer; cdecl;
    {class} function _GetCONTOURS_MATCH_I3: Integer; cdecl;
    {class} function _GetCV_BILATERAL: Integer; cdecl;
    {class} function _GetCV_BLUR: Integer; cdecl;
    {class} function _GetCV_BLUR_NO_SCALE: Integer; cdecl;
    {class} function _GetCV_CANNY_L2_GRADIENT: Integer; cdecl;
    {class} function _GetCV_CHAIN_CODE: Integer; cdecl;
    {class} function _GetCV_CLOCKWISE: Integer; cdecl;
    {class} function _GetCV_COMP_BHATTACHARYYA: Integer; cdecl;
    {class} function _GetCV_COMP_CHISQR: Integer; cdecl;
    {class} function _GetCV_COMP_CHISQR_ALT: Integer; cdecl;
    {class} function _GetCV_COMP_CORREL: Integer; cdecl;
    {class} function _GetCV_COMP_HELLINGER: Integer; cdecl;
    {class} function _GetCV_COMP_INTERSECT: Integer; cdecl;
    {class} function _GetCV_COMP_KL_DIV: Integer; cdecl;
    {class} function _GetCV_CONTOURS_MATCH_I1: Integer; cdecl;
    {class} function _GetCV_CONTOURS_MATCH_I2: Integer; cdecl;
    {class} function _GetCV_CONTOURS_MATCH_I3: Integer; cdecl;
    {class} function _GetCV_COUNTER_CLOCKWISE: Integer; cdecl;
    {class} function _GetCV_DIST_C: Integer; cdecl;
    {class} function _GetCV_DIST_FAIR: Integer; cdecl;
    {class} function _GetCV_DIST_HUBER: Integer; cdecl;
    {class} function _GetCV_DIST_L1: Integer; cdecl;
    {class} function _GetCV_DIST_L12: Integer; cdecl;
    {class} function _GetCV_DIST_L2: Integer; cdecl;
    {class} function _GetCV_DIST_LABEL_CCOMP: Integer; cdecl;
    {class} function _GetCV_DIST_LABEL_PIXEL: Integer; cdecl;
    {class} function _GetCV_DIST_MASK_3: Integer; cdecl;
    {class} function _GetCV_DIST_MASK_5: Integer; cdecl;
    {class} function _GetCV_DIST_MASK_PRECISE: Integer; cdecl;
    {class} function _GetCV_DIST_USER: Integer; cdecl;
    {class} function _GetCV_DIST_WELSCH: Integer; cdecl;
    {class} function _GetCV_GAUSSIAN: Integer; cdecl;
    {class} function _GetCV_GAUSSIAN_5x5: Integer; cdecl;
    {class} function _GetCV_HOUGH_GRADIENT: Integer; cdecl;
    {class} function _GetCV_HOUGH_MULTI_SCALE: Integer; cdecl;
    {class} function _GetCV_HOUGH_PROBABILISTIC: Integer; cdecl;
    {class} function _GetCV_HOUGH_STANDARD: Integer; cdecl;
    {class} function _GetCV_LINK_RUNS: Integer; cdecl;
    {class} function _GetCV_MAX_SOBEL_KSIZE: Integer; cdecl;
    {class} function _GetCV_MEDIAN: Integer; cdecl;
    {class} function _GetCV_POLY_APPROX_DP: Integer; cdecl;
    {class} function _GetCV_RGBA2mRGBA: Integer; cdecl;
    {class} function _GetCV_SCHARR: Integer; cdecl;
    {class} function _GetCV_SHAPE_CROSS: Integer; cdecl;
    {class} function _GetCV_SHAPE_CUSTOM: Integer; cdecl;
    {class} function _GetCV_SHAPE_ELLIPSE: Integer; cdecl;
    {class} function _GetCV_SHAPE_RECT: Integer; cdecl;
    {class} function _GetCV_WARP_FILL_OUTLIERS: Integer; cdecl;
    {class} function _GetCV_WARP_INVERSE_MAP: Integer; cdecl;
    {class} function _GetCV_mRGBA2RGBA: Integer; cdecl;
    {class} function _GetDIST_C: Integer; cdecl;
    {class} function _GetDIST_FAIR: Integer; cdecl;
    {class} function _GetDIST_HUBER: Integer; cdecl;
    {class} function _GetDIST_L1: Integer; cdecl;
    {class} function _GetDIST_L12: Integer; cdecl;
    {class} function _GetDIST_L2: Integer; cdecl;
    {class} function _GetDIST_LABEL_CCOMP: Integer; cdecl;
    {class} function _GetDIST_LABEL_PIXEL: Integer; cdecl;
    {class} function _GetDIST_MASK_3: Integer; cdecl;
    {class} function _GetDIST_MASK_5: Integer; cdecl;
    {class} function _GetDIST_MASK_PRECISE: Integer; cdecl;
    {class} function _GetDIST_USER: Integer; cdecl;
    {class} function _GetDIST_WELSCH: Integer; cdecl;
    {class} function _GetFILLED: Integer; cdecl;
    {class} function _GetFILTER_SCHARR: Integer; cdecl;
    {class} function _GetFLOODFILL_FIXED_RANGE: Integer; cdecl;
    {class} function _GetFLOODFILL_MASK_ONLY: Integer; cdecl;
    {class} function _GetFONT_HERSHEY_COMPLEX: Integer; cdecl;
    {class} function _GetFONT_HERSHEY_COMPLEX_SMALL: Integer; cdecl;
    {class} function _GetFONT_HERSHEY_DUPLEX: Integer; cdecl;
    {class} function _GetFONT_HERSHEY_PLAIN: Integer; cdecl;
    {class} function _GetFONT_HERSHEY_SCRIPT_COMPLEX: Integer; cdecl;
    {class} function _GetFONT_HERSHEY_SCRIPT_SIMPLEX: Integer; cdecl;
    {class} function _GetFONT_HERSHEY_SIMPLEX: Integer; cdecl;
    {class} function _GetFONT_HERSHEY_TRIPLEX: Integer; cdecl;
    {class} function _GetFONT_ITALIC: Integer; cdecl;
    {class} function _GetGC_BGD: Integer; cdecl;
    {class} function _GetGC_EVAL: Integer; cdecl;
    {class} function _GetGC_EVAL_FREEZE_MODEL: Integer; cdecl;
    {class} function _GetGC_FGD: Integer; cdecl;
    {class} function _GetGC_INIT_WITH_MASK: Integer; cdecl;
    {class} function _GetGC_INIT_WITH_RECT: Integer; cdecl;
    {class} function _GetGC_PR_BGD: Integer; cdecl;
    {class} function _GetGC_PR_FGD: Integer; cdecl;
    {class} function _GetHISTCMP_BHATTACHARYYA: Integer; cdecl;
    {class} function _GetHISTCMP_CHISQR: Integer; cdecl;
    {class} function _GetHISTCMP_CHISQR_ALT: Integer; cdecl;
    {class} function _GetHISTCMP_CORREL: Integer; cdecl;
    {class} function _GetHISTCMP_HELLINGER: Integer; cdecl;
    {class} function _GetHISTCMP_INTERSECT: Integer; cdecl;
    {class} function _GetHISTCMP_KL_DIV: Integer; cdecl;
    {class} function _GetHOUGH_GRADIENT: Integer; cdecl;
    {class} function _GetHOUGH_MULTI_SCALE: Integer; cdecl;
    {class} function _GetHOUGH_PROBABILISTIC: Integer; cdecl;
    {class} function _GetHOUGH_STANDARD: Integer; cdecl;
    {class} function _GetINTERSECT_FULL: Integer; cdecl;
    {class} function _GetINTERSECT_NONE: Integer; cdecl;
    {class} function _GetINTERSECT_PARTIAL: Integer; cdecl;
    {class} function _GetINTER_AREA: Integer; cdecl;
    {class} function _GetINTER_BITS: Integer; cdecl;
    {class} function _GetINTER_BITS2: Integer; cdecl;
    {class} function _GetINTER_CUBIC: Integer; cdecl;
    {class} function _GetINTER_LANCZOS4: Integer; cdecl;
    {class} function _GetINTER_LINEAR: Integer; cdecl;
    {class} function _GetINTER_LINEAR_EXACT: Integer; cdecl;
    {class} function _GetINTER_MAX: Integer; cdecl;
    {class} function _GetINTER_NEAREST: Integer; cdecl;
    {class} function _GetINTER_TAB_SIZE: Integer; cdecl;
    {class} function _GetINTER_TAB_SIZE2: Integer; cdecl;
    {class} function _GetLINE_4: Integer; cdecl;
    {class} function _GetLINE_8: Integer; cdecl;
    {class} function _GetLINE_AA: Integer; cdecl;
    {class} function _GetLSD_REFINE_ADV: Integer; cdecl;
    {class} function _GetLSD_REFINE_NONE: Integer; cdecl;
    {class} function _GetLSD_REFINE_STD: Integer; cdecl;
    {class} function _GetMARKER_CROSS: Integer; cdecl;
    {class} function _GetMARKER_DIAMOND: Integer; cdecl;
    {class} function _GetMARKER_SQUARE: Integer; cdecl;
    {class} function _GetMARKER_STAR: Integer; cdecl;
    {class} function _GetMARKER_TILTED_CROSS: Integer; cdecl;
    {class} function _GetMARKER_TRIANGLE_DOWN: Integer; cdecl;
    {class} function _GetMARKER_TRIANGLE_UP: Integer; cdecl;
    {class} function _GetMORPH_BLACKHAT: Integer; cdecl;
    {class} function _GetMORPH_CLOSE: Integer; cdecl;
    {class} function _GetMORPH_CROSS: Integer; cdecl;
    {class} function _GetMORPH_DILATE: Integer; cdecl;
    {class} function _GetMORPH_ELLIPSE: Integer; cdecl;
    {class} function _GetMORPH_ERODE: Integer; cdecl;
    {class} function _GetMORPH_GRADIENT: Integer; cdecl;
    {class} function _GetMORPH_HITMISS: Integer; cdecl;
    {class} function _GetMORPH_OPEN: Integer; cdecl;
    {class} function _GetMORPH_RECT: Integer; cdecl;
    {class} function _GetMORPH_TOPHAT: Integer; cdecl;
    {class} function _GetRETR_CCOMP: Integer; cdecl;
    {class} function _GetRETR_EXTERNAL: Integer; cdecl;
    {class} function _GetRETR_FLOODFILL: Integer; cdecl;
    {class} function _GetRETR_LIST: Integer; cdecl;
    {class} function _GetRETR_TREE: Integer; cdecl;
    {class} function _GetTHRESH_BINARY: Integer; cdecl;
    {class} function _GetTHRESH_BINARY_INV: Integer; cdecl;
    {class} function _GetTHRESH_MASK: Integer; cdecl;
    {class} function _GetTHRESH_OTSU: Integer; cdecl;
    {class} function _GetTHRESH_TOZERO: Integer; cdecl;
    {class} function _GetTHRESH_TOZERO_INV: Integer; cdecl;
    {class} function _GetTHRESH_TRIANGLE: Integer; cdecl;
    {class} function _GetTHRESH_TRUNC: Integer; cdecl;
    {class} function _GetTM_CCOEFF: Integer; cdecl;
    {class} function _GetTM_CCOEFF_NORMED: Integer; cdecl;
    {class} function _GetTM_CCORR: Integer; cdecl;
    {class} function _GetTM_CCORR_NORMED: Integer; cdecl;
    {class} function _GetTM_SQDIFF: Integer; cdecl;
    {class} function _GetTM_SQDIFF_NORMED: Integer; cdecl;
    {class} function _GetWARP_FILL_OUTLIERS: Integer; cdecl;
    {class} function _GetWARP_INVERSE_MAP: Integer; cdecl;
    {class} function _GetWARP_POLAR_LINEAR: Integer; cdecl;
    {class} function _GetWARP_POLAR_LOG: Integer; cdecl;
    {class} function init: JImgproc; cdecl;
    {class} procedure Canny(dx: JMat; dy: JMat; edges: JMat; threshold1: Double; threshold2: Double; L2gradient: Boolean); cdecl; overload;
    {class} procedure Canny(dx: JMat; dy: JMat; edges: JMat; threshold1: Double; threshold2: Double); cdecl; overload;
    {class} procedure Canny(image: JMat; edges: JMat; threshold1: Double; threshold2: Double; apertureSize: Integer; L2gradient: Boolean); cdecl; overload;
    {class} procedure Canny(image: JMat; edges: JMat; threshold1: Double; threshold2: Double; apertureSize: Integer); cdecl; overload;
    {class} procedure Canny(image: JMat; edges: JMat; threshold1: Double; threshold2: Double); cdecl; overload;
    {class} function EMD(signature1: JMat; signature2: JMat; distType: Integer; cost: JMat; flow: JMat): Single; cdecl; overload;
    {class} function EMD(signature1: JMat; signature2: JMat; distType: Integer; cost: JMat): Single; cdecl; overload;
    {class} function EMD(signature1: JMat; signature2: JMat; distType: Integer): Single; cdecl; overload;
    {class} procedure GaussianBlur(src: JMat; dst: JMat; ksize: Jcore_Size; sigmaX: Double; sigmaY: Double; borderType: Integer); cdecl; overload;
    {class} procedure GaussianBlur(src: JMat; dst: JMat; ksize: Jcore_Size; sigmaX: Double; sigmaY: Double); cdecl; overload;
    {class} procedure GaussianBlur(src: JMat; dst: JMat; ksize: Jcore_Size; sigmaX: Double); cdecl; overload;
    {class} procedure HoughCircles(image: JMat; circles: JMat; method: Integer; dp: Double; minDist: Double; param1: Double; param2: Double; minRadius: Integer; maxRadius: Integer); cdecl; overload;
    {class} procedure HoughCircles(image: JMat; circles: JMat; method: Integer; dp: Double; minDist: Double; param1: Double; param2: Double; minRadius: Integer); cdecl; overload;
    {class} procedure HoughCircles(image: JMat; circles: JMat; method: Integer; dp: Double; minDist: Double; param1: Double; param2: Double); cdecl; overload;
    {class} procedure HoughCircles(image: JMat; circles: JMat; method: Integer; dp: Double; minDist: Double; param1: Double); cdecl; overload;//Deprecated
    {class} procedure HoughCircles(image: JMat; circles: JMat; method: Integer; dp: Double; minDist: Double); cdecl; overload;//Deprecated
    {class} procedure HoughLines(image: JMat; lines: JMat; rho: Double; theta: Double; threshold: Integer; srn: Double; stn: Double; min_theta: Double; max_theta: Double); cdecl; overload;//Deprecated
    {class} procedure HoughLines(image: JMat; lines: JMat; rho: Double; theta: Double; threshold: Integer; srn: Double; stn: Double; min_theta: Double); cdecl; overload;//Deprecated
    {class} procedure HoughLines(image: JMat; lines: JMat; rho: Double; theta: Double; threshold: Integer; srn: Double; stn: Double); cdecl; overload;//Deprecated
    {class} procedure HoughLines(image: JMat; lines: JMat; rho: Double; theta: Double; threshold: Integer; srn: Double); cdecl; overload;//Deprecated
    {class} procedure HoughLines(image: JMat; lines: JMat; rho: Double; theta: Double; threshold: Integer); cdecl; overload;//Deprecated
    {class} procedure HoughLinesP(image: JMat; lines: JMat; rho: Double; theta: Double; threshold: Integer; minLineLength: Double; maxLineGap: Double); cdecl; overload;//Deprecated
    {class} procedure HoughLinesP(image: JMat; lines: JMat; rho: Double; theta: Double; threshold: Integer; minLineLength: Double); cdecl; overload;//Deprecated
    {class} procedure HoughLinesP(image: JMat; lines: JMat; rho: Double; theta: Double; threshold: Integer); cdecl; overload;//Deprecated
    {class} procedure HoughLinesPointSet(_point: JMat; _lines: JMat; lines_max: Integer; threshold: Integer; min_rho: Double; max_rho: Double; rho_step: Double; min_theta: Double; max_theta: Double; theta_step: Double); cdecl;//Deprecated
    {class} procedure HuMoments(m: Jimgproc_Moments; hu: JMat); cdecl;//Deprecated
    {class} procedure Laplacian(src: JMat; dst: JMat; ddepth: Integer; ksize: Integer; scale: Double; delta: Double; borderType: Integer); cdecl; overload;//Deprecated
    {class} procedure Laplacian(src: JMat; dst: JMat; ddepth: Integer; ksize: Integer; scale: Double; delta: Double); cdecl; overload;//Deprecated
    {class} procedure Laplacian(src: JMat; dst: JMat; ddepth: Integer; ksize: Integer; scale: Double); cdecl; overload;//Deprecated
    {class} procedure Laplacian(src: JMat; dst: JMat; ddepth: Integer; ksize: Integer); cdecl; overload;//Deprecated
    {class} procedure Laplacian(src: JMat; dst: JMat; ddepth: Integer); cdecl; overload;//Deprecated
    {class} procedure Scharr(src: JMat; dst: JMat; ddepth: Integer; dx: Integer; dy: Integer; scale: Double; delta: Double; borderType: Integer); cdecl; overload;//Deprecated
    {class} procedure Scharr(src: JMat; dst: JMat; ddepth: Integer; dx: Integer; dy: Integer; scale: Double; delta: Double); cdecl; overload;//Deprecated
    {class} procedure Scharr(src: JMat; dst: JMat; ddepth: Integer; dx: Integer; dy: Integer; scale: Double); cdecl; overload;//Deprecated
    {class} procedure Scharr(src: JMat; dst: JMat; ddepth: Integer; dx: Integer; dy: Integer); cdecl; overload;//Deprecated
    {class} procedure Sobel(src: JMat; dst: JMat; ddepth: Integer; dx: Integer; dy: Integer; ksize: Integer; scale: Double; delta: Double; borderType: Integer); cdecl; overload;//Deprecated
    {class} procedure Sobel(src: JMat; dst: JMat; ddepth: Integer; dx: Integer; dy: Integer; ksize: Integer; scale: Double; delta: Double); cdecl; overload;//Deprecated
    {class} procedure Sobel(src: JMat; dst: JMat; ddepth: Integer; dx: Integer; dy: Integer; ksize: Integer; scale: Double); cdecl; overload;//Deprecated
    {class} procedure Sobel(src: JMat; dst: JMat; ddepth: Integer; dx: Integer; dy: Integer; ksize: Integer); cdecl; overload;
    {class} procedure Sobel(src: JMat; dst: JMat; ddepth: Integer; dx: Integer; dy: Integer); cdecl; overload;
    {class} procedure accumulate(src: JMat; dst: JMat; mask: JMat); cdecl; overload;
    {class} procedure accumulate(src: JMat; dst: JMat); cdecl; overload;
    {class} procedure accumulateProduct(src1: JMat; src2: JMat; dst: JMat; mask: JMat); cdecl; overload;
    {class} procedure accumulateProduct(src1: JMat; src2: JMat; dst: JMat); cdecl; overload;
    {class} procedure accumulateSquare(src: JMat; dst: JMat; mask: JMat); cdecl; overload;
    {class} procedure accumulateSquare(src: JMat; dst: JMat); cdecl; overload;
    {class} procedure accumulateWeighted(src: JMat; dst: JMat; alpha: Double; mask: JMat); cdecl; overload;
    {class} procedure accumulateWeighted(src: JMat; dst: JMat; alpha: Double); cdecl; overload;
    {class} procedure adaptiveThreshold(src: JMat; dst: JMat; maxValue: Double; adaptiveMethod: Integer; thresholdType: Integer; blockSize: Integer; C: Double); cdecl;
    {class} procedure applyColorMap(src: JMat; dst: JMat; userColor: JMat); cdecl; overload;
    {class} procedure applyColorMap(src: JMat; dst: JMat; colormap: Integer); cdecl; overload;
    {class} procedure approxPolyDP(curve: JMatOfPoint2f; approxCurve: JMatOfPoint2f; epsilon: Double; closed: Boolean); cdecl;
    {class} function arcLength(curve: JMatOfPoint2f; closed: Boolean): Double; cdecl;
    {class} procedure arrowedLine(img: JMat; pt1: Jcore_Point; pt2: Jcore_Point; color: JScalar; thickness: Integer; line_type: Integer; shift: Integer; tipLength: Double); cdecl; overload;
    {class} procedure arrowedLine(img: JMat; pt1: Jcore_Point; pt2: Jcore_Point; color: JScalar; thickness: Integer; line_type: Integer; shift: Integer); cdecl; overload;
    {class} procedure arrowedLine(img: JMat; pt1: Jcore_Point; pt2: Jcore_Point; color: JScalar; thickness: Integer; line_type: Integer); cdecl; overload;
    {class} procedure arrowedLine(img: JMat; pt1: Jcore_Point; pt2: Jcore_Point; color: JScalar; thickness: Integer); cdecl; overload;
    {class} procedure arrowedLine(img: JMat; pt1: Jcore_Point; pt2: Jcore_Point; color: JScalar); cdecl; overload;
    {class} procedure bilateralFilter(src: JMat; dst: JMat; d: Integer; sigmaColor: Double; sigmaSpace: Double; borderType: Integer); cdecl; overload;
    {class} procedure bilateralFilter(src: JMat; dst: JMat; d: Integer; sigmaColor: Double; sigmaSpace: Double); cdecl; overload;
    {class} procedure blur(src: JMat; dst: JMat; ksize: Jcore_Size; anchor: Jcore_Point; borderType: Integer); cdecl; overload;//Deprecated
    {class} procedure blur(src: JMat; dst: JMat; ksize: Jcore_Size; anchor: Jcore_Point); cdecl; overload;//Deprecated
    {class} procedure blur(src: JMat; dst: JMat; ksize: Jcore_Size); cdecl; overload;//Deprecated
    {class} function boundingRect(array_: JMat): Jcore_Rect; cdecl;//Deprecated
    {class} procedure boxFilter(src: JMat; dst: JMat; ddepth: Integer; ksize: Jcore_Size; anchor: Jcore_Point; normalize: Boolean; borderType: Integer); cdecl; overload;//Deprecated
    {class} procedure boxFilter(src: JMat; dst: JMat; ddepth: Integer; ksize: Jcore_Size; anchor: Jcore_Point; normalize: Boolean); cdecl; overload;//Deprecated
    {class} procedure boxFilter(src: JMat; dst: JMat; ddepth: Integer; ksize: Jcore_Size; anchor: Jcore_Point); cdecl; overload;//Deprecated
    {class} procedure boxFilter(src: JMat; dst: JMat; ddepth: Integer; ksize: Jcore_Size); cdecl; overload;//Deprecated
    {class} procedure boxPoints(box: JRotatedRect; points: JMat); cdecl;//Deprecated
    {class} procedure calcBackProject(images: JList; channels: JMatOfInt; hist: JMat; dst: JMat; ranges: JMatOfFloat; scale: Double); cdecl;//Deprecated
    {class} procedure calcHist(images: JList; channels: JMatOfInt; mask: JMat; hist: JMat; histSize: JMatOfInt; ranges: JMatOfFloat; accumulate: Boolean); cdecl; overload;//Deprecated
    {class} procedure calcHist(images: JList; channels: JMatOfInt; mask: JMat; hist: JMat; histSize: JMatOfInt; ranges: JMatOfFloat); cdecl; overload;//Deprecated
    {class} procedure circle(img: JMat; center: Jcore_Point; radius: Integer; color: JScalar; thickness: Integer; lineType: Integer; shift: Integer); cdecl; overload;//Deprecated
    {class} procedure circle(img: JMat; center: Jcore_Point; radius: Integer; color: JScalar; thickness: Integer; lineType: Integer); cdecl; overload;//Deprecated
    {class} procedure circle(img: JMat; center: Jcore_Point; radius: Integer; color: JScalar; thickness: Integer); cdecl; overload;//Deprecated
    {class} procedure circle(img: JMat; center: Jcore_Point; radius: Integer; color: JScalar); cdecl; overload;//Deprecated
    {class} function clipLine(imgRect: Jcore_Rect; pt1: Jcore_Point; pt2: Jcore_Point): Boolean; cdecl;//Deprecated
    {class} function compareHist(H1: JMat; H2: JMat; method: Integer): Double; cdecl;//Deprecated
    {class} function connectedComponents(image: JMat; labels: JMat; connectivity: Integer; ltype: Integer): Integer; cdecl; overload;//Deprecated
    {class} function connectedComponents(image: JMat; labels: JMat; connectivity: Integer): Integer; cdecl; overload;//Deprecated
    {class} function connectedComponents(image: JMat; labels: JMat): Integer; cdecl; overload;//Deprecated
    {class} function connectedComponentsWithAlgorithm(image: JMat; labels: JMat; connectivity: Integer; ltype: Integer; ccltype: Integer): Integer; cdecl;//Deprecated
    {class} function connectedComponentsWithStats(image: JMat; labels: JMat; stats: JMat; centroids: JMat; connectivity: Integer; ltype: Integer): Integer; cdecl; overload;//Deprecated
    {class} function connectedComponentsWithStats(image: JMat; labels: JMat; stats: JMat; centroids: JMat; connectivity: Integer): Integer; cdecl; overload;
    {class} function connectedComponentsWithStats(image: JMat; labels: JMat; stats: JMat; centroids: JMat): Integer; cdecl; overload;
    {class} function connectedComponentsWithStatsWithAlgorithm(image: JMat; labels: JMat; stats: JMat; centroids: JMat; connectivity: Integer; ltype: Integer; ccltype: Integer): Integer; cdecl;
    {class} function contourArea(contour: JMat; oriented: Boolean): Double; cdecl; overload;
    {class} function contourArea(contour: JMat): Double; cdecl; overload;
    {class} procedure convertMaps(map1: JMat; map2: JMat; dstmap1: JMat; dstmap2: JMat; dstmap1type: Integer; nninterpolation: Boolean); cdecl; overload;
    {class} procedure convertMaps(map1: JMat; map2: JMat; dstmap1: JMat; dstmap2: JMat; dstmap1type: Integer); cdecl; overload;
    {class} procedure convexHull(points: JMatOfPoint; hull: JMatOfInt; clockwise: Boolean); cdecl; overload;
    {class} procedure convexHull(points: JMatOfPoint; hull: JMatOfInt); cdecl; overload;
    {class} procedure convexityDefects(contour: JMatOfPoint; convexhull: JMatOfInt; convexityDefects: JMatOfInt4); cdecl;
    {class} procedure cornerEigenValsAndVecs(src: JMat; dst: JMat; blockSize: Integer; ksize: Integer; borderType: Integer); cdecl; overload;
    {class} procedure cornerEigenValsAndVecs(src: JMat; dst: JMat; blockSize: Integer; ksize: Integer); cdecl; overload;
    {class} procedure cornerHarris(src: JMat; dst: JMat; blockSize: Integer; ksize: Integer; k: Double; borderType: Integer); cdecl; overload;
    {class} procedure cornerHarris(src: JMat; dst: JMat; blockSize: Integer; ksize: Integer; k: Double); cdecl; overload;
    {class} procedure cornerMinEigenVal(src: JMat; dst: JMat; blockSize: Integer; ksize: Integer; borderType: Integer); cdecl; overload;
    {class} procedure cornerMinEigenVal(src: JMat; dst: JMat; blockSize: Integer; ksize: Integer); cdecl; overload;
    {class} procedure cornerMinEigenVal(src: JMat; dst: JMat; blockSize: Integer); cdecl; overload;
    {class} procedure cornerSubPix(image: JMat; corners: JMat; winSize: Jcore_Size; zeroZone: Jcore_Size; criteria: JTermCriteria); cdecl;
    {class} function createCLAHE(clipLimit: Double; tileGridSize: Jcore_Size): JCLAHE; cdecl; overload;
    {class} function createCLAHE(clipLimit: Double): JCLAHE; cdecl; overload;//Deprecated
    {class} function createCLAHE: JCLAHE; cdecl; overload;//Deprecated
    {class} function createGeneralizedHoughBallard: JGeneralizedHoughBallard; cdecl;//Deprecated
    {class} function createGeneralizedHoughGuil: JGeneralizedHoughGuil; cdecl;//Deprecated
    {class} procedure createHanningWindow(dst: JMat; winSize: Jcore_Size; type_: Integer); cdecl;//Deprecated
    {class} function createLineSegmentDetector(_refine: Integer; _scale: Double; _sigma_scale: Double; _quant: Double; _ang_th: Double; _log_eps: Double; _density_th: Double; _n_bins: Integer): JLineSegmentDetector; cdecl; overload;//Deprecated
    {class} function createLineSegmentDetector(_refine: Integer; _scale: Double; _sigma_scale: Double; _quant: Double; _ang_th: Double; _log_eps: Double; _density_th: Double): JLineSegmentDetector; cdecl; overload;//Deprecated
    {class} function createLineSegmentDetector(_refine: Integer; _scale: Double; _sigma_scale: Double; _quant: Double; _ang_th: Double; _log_eps: Double): JLineSegmentDetector; cdecl; overload;//Deprecated
    {class} function createLineSegmentDetector(_refine: Integer; _scale: Double; _sigma_scale: Double; _quant: Double; _ang_th: Double): JLineSegmentDetector; cdecl; overload;//Deprecated
    {class} function createLineSegmentDetector(_refine: Integer; _scale: Double; _sigma_scale: Double; _quant: Double): JLineSegmentDetector; cdecl; overload;//Deprecated
    {class} function createLineSegmentDetector(_refine: Integer; _scale: Double; _sigma_scale: Double): JLineSegmentDetector; cdecl; overload;//Deprecated
    {class} function createLineSegmentDetector(_refine: Integer; _scale: Double): JLineSegmentDetector; cdecl; overload;
    {class} function createLineSegmentDetector(_refine: Integer): JLineSegmentDetector; cdecl; overload;
    {class} function createLineSegmentDetector: JLineSegmentDetector; cdecl; overload;
    {class} procedure cvtColor(src: JMat; dst: JMat; code: Integer; dstCn: Integer); cdecl; overload;
    {class} procedure cvtColor(src: JMat; dst: JMat; code: Integer); cdecl; overload;
    {class} procedure cvtColorTwoPlane(src1: JMat; src2: JMat; dst: JMat; code: Integer); cdecl;
    {class} procedure demosaicing(src: JMat; dst: JMat; code: Integer; dstCn: Integer); cdecl; overload;
    {class} procedure demosaicing(src: JMat; dst: JMat; code: Integer); cdecl; overload;
    {class} procedure dilate(src: JMat; dst: JMat; kernel: JMat; anchor: Jcore_Point; iterations: Integer; borderType: Integer; borderValue: JScalar); cdecl; overload;
    {class} procedure dilate(src: JMat; dst: JMat; kernel: JMat; anchor: Jcore_Point; iterations: Integer; borderType: Integer); cdecl; overload;
    {class} procedure dilate(src: JMat; dst: JMat; kernel: JMat; anchor: Jcore_Point; iterations: Integer); cdecl; overload;
    {class} procedure dilate(src: JMat; dst: JMat; kernel: JMat; anchor: Jcore_Point); cdecl; overload;
    {class} procedure dilate(src: JMat; dst: JMat; kernel: JMat); cdecl; overload;
    {class} procedure distanceTransform(src: JMat; dst: JMat; distanceType: Integer; maskSize: Integer; dstType: Integer); cdecl; overload;
    {class} procedure distanceTransform(src: JMat; dst: JMat; distanceType: Integer; maskSize: Integer); cdecl; overload;
    {class} procedure distanceTransformWithLabels(src: JMat; dst: JMat; labels: JMat; distanceType: Integer; maskSize: Integer; labelType: Integer); cdecl; overload;
    {class} procedure distanceTransformWithLabels(src: JMat; dst: JMat; labels: JMat; distanceType: Integer; maskSize: Integer); cdecl; overload;
    {class} procedure drawContours(image: JMat; contours: JList; contourIdx: Integer; color: JScalar; thickness: Integer; lineType: Integer; hierarchy: JMat; maxLevel: Integer; offset: Jcore_Point); cdecl; overload;
    {class} procedure drawContours(image: JMat; contours: JList; contourIdx: Integer; color: JScalar; thickness: Integer; lineType: Integer; hierarchy: JMat; maxLevel: Integer); cdecl; overload;
    {class} procedure drawContours(image: JMat; contours: JList; contourIdx: Integer; color: JScalar; thickness: Integer; lineType: Integer; hierarchy: JMat); cdecl; overload;
    {class} procedure drawContours(image: JMat; contours: JList; contourIdx: Integer; color: JScalar; thickness: Integer; lineType: Integer); cdecl; overload;
    {class} procedure drawContours(image: JMat; contours: JList; contourIdx: Integer; color: JScalar; thickness: Integer); cdecl; overload;
    {class} procedure drawContours(image: JMat; contours: JList; contourIdx: Integer; color: JScalar); cdecl; overload;
    {class} procedure drawMarker(img: JMat; position: Jcore_Point; color: JScalar; markerType: Integer; markerSize: Integer; thickness: Integer; line_type: Integer); cdecl; overload;//Deprecated
    {class} procedure drawMarker(img: JMat; position: Jcore_Point; color: JScalar; markerType: Integer; markerSize: Integer; thickness: Integer); cdecl; overload;//Deprecated
    {class} procedure drawMarker(img: JMat; position: Jcore_Point; color: JScalar; markerType: Integer; markerSize: Integer); cdecl; overload;//Deprecated
    {class} procedure drawMarker(img: JMat; position: Jcore_Point; color: JScalar; markerType: Integer); cdecl; overload;//Deprecated
    {class} procedure drawMarker(img: JMat; position: Jcore_Point; color: JScalar); cdecl; overload;//Deprecated
    {class} procedure ellipse(img: JMat; center: Jcore_Point; axes: Jcore_Size; angle: Double; startAngle: Double; endAngle: Double; color: JScalar; thickness: Integer; lineType: Integer; shift: Integer); cdecl; overload;//Deprecated
    {class} procedure ellipse(img: JMat; center: Jcore_Point; axes: Jcore_Size; angle: Double; startAngle: Double; endAngle: Double; color: JScalar; thickness: Integer; lineType: Integer); cdecl; overload;//Deprecated
    {class} procedure ellipse(img: JMat; center: Jcore_Point; axes: Jcore_Size; angle: Double; startAngle: Double; endAngle: Double; color: JScalar; thickness: Integer); cdecl; overload;//Deprecated
    {class} procedure ellipse(img: JMat; center: Jcore_Point; axes: Jcore_Size; angle: Double; startAngle: Double; endAngle: Double; color: JScalar); cdecl; overload;//Deprecated
    {class} procedure ellipse(img: JMat; box: JRotatedRect; color: JScalar; thickness: Integer; lineType: Integer); cdecl; overload;//Deprecated
    {class} procedure ellipse(img: JMat; box: JRotatedRect; color: JScalar; thickness: Integer); cdecl; overload;//Deprecated
    {class} procedure ellipse(img: JMat; box: JRotatedRect; color: JScalar); cdecl; overload;//Deprecated
    {class} procedure ellipse2Poly(center: Jcore_Point; axes: Jcore_Size; angle: Integer; arcStart: Integer; arcEnd: Integer; delta: Integer; pts: JMatOfPoint); cdecl;//Deprecated
    {class} procedure equalizeHist(src: JMat; dst: JMat); cdecl;//Deprecated
    {class} procedure erode(src: JMat; dst: JMat; kernel: JMat; anchor: Jcore_Point; iterations: Integer; borderType: Integer; borderValue: JScalar); cdecl; overload;//Deprecated
    {class} procedure erode(src: JMat; dst: JMat; kernel: JMat; anchor: Jcore_Point; iterations: Integer; borderType: Integer); cdecl; overload;//Deprecated
    {class} procedure erode(src: JMat; dst: JMat; kernel: JMat; anchor: Jcore_Point; iterations: Integer); cdecl; overload;//Deprecated
    {class} procedure erode(src: JMat; dst: JMat; kernel: JMat; anchor: Jcore_Point); cdecl; overload;//Deprecated
    {class} procedure erode(src: JMat; dst: JMat; kernel: JMat); cdecl; overload;//Deprecated
    {class} procedure fillConvexPoly(img: JMat; points: JMatOfPoint; color: JScalar; lineType: Integer; shift: Integer); cdecl; overload;//Deprecated
    {class} procedure fillConvexPoly(img: JMat; points: JMatOfPoint; color: JScalar; lineType: Integer); cdecl; overload;//Deprecated
    {class} procedure fillConvexPoly(img: JMat; points: JMatOfPoint; color: JScalar); cdecl; overload;//Deprecated
    {class} procedure fillPoly(img: JMat; pts: JList; color: JScalar; lineType: Integer; shift: Integer; offset: Jcore_Point); cdecl; overload;//Deprecated
    {class} procedure fillPoly(img: JMat; pts: JList; color: JScalar; lineType: Integer; shift: Integer); cdecl; overload;//Deprecated
    {class} procedure fillPoly(img: JMat; pts: JList; color: JScalar; lineType: Integer); cdecl; overload;
    {class} procedure fillPoly(img: JMat; pts: JList; color: JScalar); cdecl; overload;
    {class} procedure filter2D(src: JMat; dst: JMat; ddepth: Integer; kernel: JMat; anchor: Jcore_Point; delta: Double; borderType: Integer); cdecl; overload;
    {class} procedure filter2D(src: JMat; dst: JMat; ddepth: Integer; kernel: JMat; anchor: Jcore_Point; delta: Double); cdecl; overload;
    {class} procedure filter2D(src: JMat; dst: JMat; ddepth: Integer; kernel: JMat; anchor: Jcore_Point); cdecl; overload;
    {class} procedure filter2D(src: JMat; dst: JMat; ddepth: Integer; kernel: JMat); cdecl; overload;
    {class} procedure findContours(image: JMat; contours: JList; hierarchy: JMat; mode: Integer; method: Integer; offset: Jcore_Point); cdecl; overload;
    {class} procedure findContours(image: JMat; contours: JList; hierarchy: JMat; mode: Integer; method: Integer); cdecl; overload;
    {class} function fitEllipse(points: JMatOfPoint2f): JRotatedRect; cdecl;
    {class} function fitEllipseAMS(points: JMat): JRotatedRect; cdecl;
    {class} function fitEllipseDirect(points: JMat): JRotatedRect; cdecl;
    {class} procedure fitLine(points: JMat; line: JMat; distType: Integer; param: Double; reps: Double; aeps: Double); cdecl;
    {class} function floodFill(image: JMat; mask: JMat; seedPoint: Jcore_Point; newVal: JScalar; rect: Jcore_Rect; loDiff: JScalar; upDiff: JScalar; flags: Integer): Integer; cdecl; overload;
    {class} function floodFill(image: JMat; mask: JMat; seedPoint: Jcore_Point; newVal: JScalar; rect: Jcore_Rect; loDiff: JScalar; upDiff: JScalar): Integer; cdecl; overload;
    {class} function floodFill(image: JMat; mask: JMat; seedPoint: Jcore_Point; newVal: JScalar; rect: Jcore_Rect; loDiff: JScalar): Integer; cdecl; overload;
    {class} function floodFill(image: JMat; mask: JMat; seedPoint: Jcore_Point; newVal: JScalar; rect: Jcore_Rect): Integer; cdecl; overload;
    {class} function floodFill(image: JMat; mask: JMat; seedPoint: Jcore_Point; newVal: JScalar): Integer; cdecl; overload;
    {class} function getAffineTransform(src: JMatOfPoint2f; dst: JMatOfPoint2f): JMat; cdecl;
    {class} procedure getDerivKernels(kx: JMat; ky: JMat; dx: Integer; dy: Integer; ksize: Integer; normalize: Boolean; ktype: Integer); cdecl; overload;
    {class} procedure getDerivKernels(kx: JMat; ky: JMat; dx: Integer; dy: Integer; ksize: Integer; normalize: Boolean); cdecl; overload;
    {class} procedure getDerivKernels(kx: JMat; ky: JMat; dx: Integer; dy: Integer; ksize: Integer); cdecl; overload;
    {class} function getFontScaleFromHeight(fontFace: Integer; pixelHeight: Integer; thickness: Integer): Double; cdecl; overload;
    {class} function getFontScaleFromHeight(fontFace: Integer; pixelHeight: Integer): Double; cdecl; overload;
    {class} function getGaborKernel(ksize: Jcore_Size; sigma: Double; theta: Double; lambd: Double; gamma: Double; psi: Double; ktype: Integer): JMat; cdecl; overload;//Deprecated
    {class} function getGaborKernel(ksize: Jcore_Size; sigma: Double; theta: Double; lambd: Double; gamma: Double; psi: Double): JMat; cdecl; overload;//Deprecated
    {class} function getGaborKernel(ksize: Jcore_Size; sigma: Double; theta: Double; lambd: Double; gamma: Double): JMat; cdecl; overload;//Deprecated
    {class} function getGaussianKernel(ksize: Integer; sigma: Double; ktype: Integer): JMat; cdecl; overload;//Deprecated
    {class} function getGaussianKernel(ksize: Integer; sigma: Double): JMat; cdecl; overload;//Deprecated
    {class} function getPerspectiveTransform(src: JMat; dst: JMat; solveMethod: Integer): JMat; cdecl; overload;//Deprecated
    {class} function getPerspectiveTransform(src: JMat; dst: JMat): JMat; cdecl; overload;//Deprecated
    {class} procedure getRectSubPix(image: JMat; patchSize: Jcore_Size; center: Jcore_Point; patch: JMat; patchType: Integer); cdecl; overload;//Deprecated
    {class} procedure getRectSubPix(image: JMat; patchSize: Jcore_Size; center: Jcore_Point; patch: JMat); cdecl; overload;//Deprecated
    {class} function getRotationMatrix2D(center: Jcore_Point; angle: Double; scale: Double): JMat; cdecl;//Deprecated
    {class} function getStructuringElement(shape: Integer; ksize: Jcore_Size; anchor: Jcore_Point): JMat; cdecl; overload;//Deprecated
    {class} function getStructuringElement(shape: Integer; ksize: Jcore_Size): JMat; cdecl; overload;//Deprecated
    {class} function getTextSize(text: JString; fontFace: Integer; fontScale: Double; thickness: Integer; baseLine: TJavaArray<Integer>): Jcore_Size; cdecl;//Deprecated
    {class} procedure goodFeaturesToTrack(image: JMat; corners: JMatOfPoint; maxCorners: Integer; qualityLevel: Double; minDistance: Double; mask: JMat; blockSize: Integer; gradientSize: Integer; useHarrisDetector: Boolean; k: Double); cdecl; overload;//Deprecated
    {class} procedure goodFeaturesToTrack(image: JMat; corners: JMatOfPoint; maxCorners: Integer; qualityLevel: Double; minDistance: Double; mask: JMat; blockSize: Integer; gradientSize: Integer; useHarrisDetector: Boolean); cdecl; overload;//Deprecated
    {class} procedure goodFeaturesToTrack(image: JMat; corners: JMatOfPoint; maxCorners: Integer; qualityLevel: Double; minDistance: Double; mask: JMat; blockSize: Integer; gradientSize: Integer); cdecl; overload;//Deprecated
    {class} procedure goodFeaturesToTrack(image: JMat; corners: JMatOfPoint; maxCorners: Integer; qualityLevel: Double; minDistance: Double; mask: JMat; blockSize: Integer; useHarrisDetector: Boolean; k: Double); cdecl; overload;//Deprecated
    {class} procedure goodFeaturesToTrack(image: JMat; corners: JMatOfPoint; maxCorners: Integer; qualityLevel: Double; minDistance: Double; mask: JMat; blockSize: Integer; useHarrisDetector: Boolean); cdecl; overload;//Deprecated
    {class} procedure goodFeaturesToTrack(image: JMat; corners: JMatOfPoint; maxCorners: Integer; qualityLevel: Double; minDistance: Double; mask: JMat; blockSize: Integer); cdecl; overload;//Deprecated
    {class} procedure goodFeaturesToTrack(image: JMat; corners: JMatOfPoint; maxCorners: Integer; qualityLevel: Double; minDistance: Double; mask: JMat); cdecl; overload;//Deprecated
    {class} procedure goodFeaturesToTrack(image: JMat; corners: JMatOfPoint; maxCorners: Integer; qualityLevel: Double; minDistance: Double); cdecl; overload;//Deprecated
    {class} procedure grabCut(img: JMat; mask: JMat; rect: Jcore_Rect; bgdModel: JMat; fgdModel: JMat; iterCount: Integer; mode: Integer); cdecl; overload;//Deprecated
    {class} procedure grabCut(img: JMat; mask: JMat; rect: Jcore_Rect; bgdModel: JMat; fgdModel: JMat; iterCount: Integer); cdecl; overload;//Deprecated
    {class} procedure integral(src: JMat; sum: JMat; sdepth: Integer); cdecl; overload;
    {class} procedure integral(src: JMat; sum: JMat); cdecl; overload;
    {class} procedure integral2(src: JMat; sum: JMat; sqsum: JMat; sdepth: Integer; sqdepth: Integer); cdecl; overload;
    {class} procedure integral2(src: JMat; sum: JMat; sqsum: JMat; sdepth: Integer); cdecl; overload;
    {class} procedure integral2(src: JMat; sum: JMat; sqsum: JMat); cdecl; overload;
    {class} procedure integral3(src: JMat; sum: JMat; sqsum: JMat; tilted: JMat; sdepth: Integer; sqdepth: Integer); cdecl; overload;
    {class} procedure integral3(src: JMat; sum: JMat; sqsum: JMat; tilted: JMat; sdepth: Integer); cdecl; overload;
    {class} procedure integral3(src: JMat; sum: JMat; sqsum: JMat; tilted: JMat); cdecl; overload;
    {class} function intersectConvexConvex(_p1: JMat; _p2: JMat; _p12: JMat; handleNested: Boolean): Single; cdecl; overload;
    {class} function intersectConvexConvex(_p1: JMat; _p2: JMat; _p12: JMat): Single; cdecl; overload;
    {class} procedure invertAffineTransform(M: JMat; iM: JMat); cdecl;
    {class} function isContourConvex(contour: JMatOfPoint): Boolean; cdecl;
    {class} procedure line(img: JMat; pt1: Jcore_Point; pt2: Jcore_Point; color: JScalar; thickness: Integer; lineType: Integer; shift: Integer); cdecl; overload;
    {class} procedure line(img: JMat; pt1: Jcore_Point; pt2: Jcore_Point; color: JScalar; thickness: Integer; lineType: Integer); cdecl; overload;
    {class} procedure line(img: JMat; pt1: Jcore_Point; pt2: Jcore_Point; color: JScalar; thickness: Integer); cdecl; overload;
    {class} procedure line(img: JMat; pt1: Jcore_Point; pt2: Jcore_Point; color: JScalar); cdecl; overload;
    {class} procedure linearPolar(src: JMat; dst: JMat; center: Jcore_Point; maxRadius: Double; flags: Integer); cdecl;//Deprecated
    {class} procedure logPolar(src: JMat; dst: JMat; center: Jcore_Point; M: Double; flags: Integer); cdecl;//Deprecated
    {class} function matchShapes(contour1: JMat; contour2: JMat; method: Integer; parameter: Double): Double; cdecl;
    {class} procedure matchTemplate(image: JMat; templ: JMat; result: JMat; method: Integer; mask: JMat); cdecl; overload;
    {class} procedure matchTemplate(image: JMat; templ: JMat; result: JMat; method: Integer); cdecl; overload;
    {class} procedure medianBlur(src: JMat; dst: JMat; ksize: Integer); cdecl;
    {class} function minAreaRect(points: JMatOfPoint2f): JRotatedRect; cdecl;
    {class} procedure minEnclosingCircle(points: JMatOfPoint2f; center: Jcore_Point; radius: TJavaArray<Single>); cdecl;//Deprecated
    {class} function minEnclosingTriangle(points: JMat; triangle: JMat): Double; cdecl;//Deprecated
    {class} function moments(array_: JMat; binaryImage: Boolean): Jimgproc_Moments; cdecl; overload;//Deprecated
    {class} function moments(array_: JMat): Jimgproc_Moments; cdecl; overload;//Deprecated
    {class} procedure morphologyEx(src: JMat; dst: JMat; op: Integer; kernel: JMat; anchor: Jcore_Point; iterations: Integer; borderType: Integer; borderValue: JScalar); cdecl; overload;//Deprecated
    {class} procedure morphologyEx(src: JMat; dst: JMat; op: Integer; kernel: JMat; anchor: Jcore_Point; iterations: Integer; borderType: Integer); cdecl; overload;//Deprecated
    {class} procedure morphologyEx(src: JMat; dst: JMat; op: Integer; kernel: JMat; anchor: Jcore_Point; iterations: Integer); cdecl; overload;//Deprecated
    {class} procedure morphologyEx(src: JMat; dst: JMat; op: Integer; kernel: JMat; anchor: Jcore_Point); cdecl; overload;//Deprecated
    {class} procedure morphologyEx(src: JMat; dst: JMat; op: Integer; kernel: JMat); cdecl; overload;//Deprecated
    {class} function phaseCorrelate(src1: JMat; src2: JMat; window: JMat; response: TJavaArray<Double>): Jcore_Point; cdecl; overload;//Deprecated
    {class} function phaseCorrelate(src1: JMat; src2: JMat; window: JMat): Jcore_Point; cdecl; overload;//Deprecated
    {class} function phaseCorrelate(src1: JMat; src2: JMat): Jcore_Point; cdecl; overload;//Deprecated
    {class} function pointPolygonTest(contour: JMatOfPoint2f; pt: Jcore_Point; measureDist: Boolean): Double; cdecl;//Deprecated
    {class} procedure polylines(img: JMat; pts: JList; isClosed: Boolean; color: JScalar; thickness: Integer; lineType: Integer; shift: Integer); cdecl; overload;//Deprecated
    {class} procedure polylines(img: JMat; pts: JList; isClosed: Boolean; color: JScalar; thickness: Integer; lineType: Integer); cdecl; overload;//Deprecated
    {class} procedure polylines(img: JMat; pts: JList; isClosed: Boolean; color: JScalar; thickness: Integer); cdecl; overload;//Deprecated
    {class} procedure polylines(img: JMat; pts: JList; isClosed: Boolean; color: JScalar); cdecl; overload;//Deprecated
    {class} procedure preCornerDetect(src: JMat; dst: JMat; ksize: Integer; borderType: Integer); cdecl; overload;//Deprecated
    {class} procedure preCornerDetect(src: JMat; dst: JMat; ksize: Integer); cdecl; overload;//Deprecated
    {class} procedure putText(img: JMat; text: JString; org: Jcore_Point; fontFace: Integer; fontScale: Double; color: JScalar; thickness: Integer; lineType: Integer; bottomLeftOrigin: Boolean); cdecl; overload;//Deprecated
    {class} procedure putText(img: JMat; text: JString; org: Jcore_Point; fontFace: Integer; fontScale: Double; color: JScalar; thickness: Integer; lineType: Integer); cdecl; overload;//Deprecated
    {class} procedure putText(img: JMat; text: JString; org: Jcore_Point; fontFace: Integer; fontScale: Double; color: JScalar; thickness: Integer); cdecl; overload;//Deprecated
    {class} procedure putText(img: JMat; text: JString; org: Jcore_Point; fontFace: Integer; fontScale: Double; color: JScalar); cdecl; overload;//Deprecated
    {class} procedure pyrDown(src: JMat; dst: JMat; dstsize: Jcore_Size; borderType: Integer); cdecl; overload;//Deprecated
    {class} procedure pyrDown(src: JMat; dst: JMat; dstsize: Jcore_Size); cdecl; overload;
    {class} procedure pyrDown(src: JMat; dst: JMat); cdecl; overload;
    {class} procedure pyrMeanShiftFiltering(src: JMat; dst: JMat; sp: Double; sr: Double; maxLevel: Integer; termcrit: JTermCriteria); cdecl; overload;
    {class} procedure pyrMeanShiftFiltering(src: JMat; dst: JMat; sp: Double; sr: Double; maxLevel: Integer); cdecl; overload;
    {class} procedure pyrMeanShiftFiltering(src: JMat; dst: JMat; sp: Double; sr: Double); cdecl; overload;
    {class} procedure pyrUp(src: JMat; dst: JMat; dstsize: Jcore_Size; borderType: Integer); cdecl; overload;
    {class} procedure pyrUp(src: JMat; dst: JMat; dstsize: Jcore_Size); cdecl; overload;
    {class} procedure pyrUp(src: JMat; dst: JMat); cdecl; overload;
    {class} procedure rectangle(img: JMat; pt1: Jcore_Point; pt2: Jcore_Point; color: JScalar; thickness: Integer; lineType: Integer; shift: Integer); cdecl; overload;
    {class} procedure rectangle(img: JMat; pt1: Jcore_Point; pt2: Jcore_Point; color: JScalar; thickness: Integer; lineType: Integer); cdecl; overload;
    {class} procedure rectangle(img: JMat; pt1: Jcore_Point; pt2: Jcore_Point; color: JScalar; thickness: Integer); cdecl; overload;
    {class} procedure rectangle(img: JMat; pt1: Jcore_Point; pt2: Jcore_Point; color: JScalar); cdecl; overload;
    {class} procedure rectangle(img: JMat; rec: Jcore_Rect; color: JScalar; thickness: Integer; lineType: Integer; shift: Integer); cdecl; overload;
    {class} procedure rectangle(img: JMat; rec: Jcore_Rect; color: JScalar; thickness: Integer; lineType: Integer); cdecl; overload;
    {class} procedure rectangle(img: JMat; rec: Jcore_Rect; color: JScalar; thickness: Integer); cdecl; overload;
    {class} procedure rectangle(img: JMat; rec: Jcore_Rect; color: JScalar); cdecl; overload;
    {class} procedure remap(src: JMat; dst: JMat; map1: JMat; map2: JMat; interpolation: Integer; borderMode: Integer; borderValue: JScalar); cdecl; overload;//Deprecated
    {class} procedure remap(src: JMat; dst: JMat; map1: JMat; map2: JMat; interpolation: Integer; borderMode: Integer); cdecl; overload;//Deprecated
    {class} procedure remap(src: JMat; dst: JMat; map1: JMat; map2: JMat; interpolation: Integer); cdecl; overload;//Deprecated
    {class} procedure resize(src: JMat; dst: JMat; dsize: Jcore_Size; fx: Double; fy: Double; interpolation: Integer); cdecl; overload;//Deprecated
    {class} procedure resize(src: JMat; dst: JMat; dsize: Jcore_Size; fx: Double; fy: Double); cdecl; overload;//Deprecated
    {class} procedure resize(src: JMat; dst: JMat; dsize: Jcore_Size; fx: Double); cdecl; overload;//Deprecated
    {class} procedure resize(src: JMat; dst: JMat; dsize: Jcore_Size); cdecl; overload;//Deprecated
    {class} function rotatedRectangleIntersection(rect1: JRotatedRect; rect2: JRotatedRect; intersectingRegion: JMat): Integer; cdecl;//Deprecated
    {class} procedure sepFilter2D(src: JMat; dst: JMat; ddepth: Integer; kernelX: JMat; kernelY: JMat; anchor: Jcore_Point; delta: Double; borderType: Integer); cdecl; overload;//Deprecated
    {class} procedure sepFilter2D(src: JMat; dst: JMat; ddepth: Integer; kernelX: JMat; kernelY: JMat; anchor: Jcore_Point; delta: Double); cdecl; overload;//Deprecated
    {class} procedure sepFilter2D(src: JMat; dst: JMat; ddepth: Integer; kernelX: JMat; kernelY: JMat; anchor: Jcore_Point); cdecl; overload;//Deprecated
    {class} procedure sepFilter2D(src: JMat; dst: JMat; ddepth: Integer; kernelX: JMat; kernelY: JMat); cdecl; overload;//Deprecated
    {class} procedure spatialGradient(src: JMat; dx: JMat; dy: JMat; ksize: Integer; borderType: Integer); cdecl; overload;//Deprecated
    {class} procedure spatialGradient(src: JMat; dx: JMat; dy: JMat; ksize: Integer); cdecl; overload;//Deprecated
    {class} procedure spatialGradient(src: JMat; dx: JMat; dy: JMat); cdecl; overload;//Deprecated
    {class} procedure sqrBoxFilter(src: JMat; dst: JMat; ddepth: Integer; ksize: Jcore_Size; anchor: Jcore_Point; normalize: Boolean; borderType: Integer); cdecl; overload;//Deprecated
    {class} procedure sqrBoxFilter(src: JMat; dst: JMat; ddepth: Integer; ksize: Jcore_Size; anchor: Jcore_Point; normalize: Boolean); cdecl; overload;//Deprecated
    {class} procedure sqrBoxFilter(src: JMat; dst: JMat; ddepth: Integer; ksize: Jcore_Size; anchor: Jcore_Point); cdecl; overload;//Deprecated
    {class} procedure sqrBoxFilter(src: JMat; dst: JMat; ddepth: Integer; ksize: Jcore_Size); cdecl; overload;//Deprecated
    {class} function threshold(src: JMat; dst: JMat; thresh: Double; maxval: Double; type_: Integer): Double; cdecl;//Deprecated
    {class} procedure warpAffine(src: JMat; dst: JMat; M: JMat; dsize: Jcore_Size; flags: Integer; borderMode: Integer; borderValue: JScalar); cdecl; overload;//Deprecated
    {class} procedure warpAffine(src: JMat; dst: JMat; M: JMat; dsize: Jcore_Size; flags: Integer; borderMode: Integer); cdecl; overload;//Deprecated
    {class} procedure warpAffine(src: JMat; dst: JMat; M: JMat; dsize: Jcore_Size; flags: Integer); cdecl; overload;//Deprecated
    {class} procedure warpAffine(src: JMat; dst: JMat; M: JMat; dsize: Jcore_Size); cdecl; overload;
    {class} procedure warpPerspective(src: JMat; dst: JMat; M: JMat; dsize: Jcore_Size; flags: Integer; borderMode: Integer; borderValue: JScalar); cdecl; overload;
    {class} procedure warpPerspective(src: JMat; dst: JMat; M: JMat; dsize: Jcore_Size; flags: Integer; borderMode: Integer); cdecl; overload;
    {class} procedure warpPerspective(src: JMat; dst: JMat; M: JMat; dsize: Jcore_Size; flags: Integer); cdecl; overload;
    {class} procedure warpPerspective(src: JMat; dst: JMat; M: JMat; dsize: Jcore_Size); cdecl; overload;
    {class} procedure warpPolar(src: JMat; dst: JMat; dsize: Jcore_Size; center: Jcore_Point; maxRadius: Double; flags: Integer); cdecl;
    {class} procedure watershed(image: JMat; markers: JMat); cdecl;
    {class} property ADAPTIVE_THRESH_GAUSSIAN_C: Integer read _GetADAPTIVE_THRESH_GAUSSIAN_C;
    {class} property ADAPTIVE_THRESH_MEAN_C: Integer read _GetADAPTIVE_THRESH_MEAN_C;
    {class} property CCL_DEFAULT: Integer read _GetCCL_DEFAULT;
    {class} property CCL_GRANA: Integer read _GetCCL_GRANA;
    {class} property CCL_WU: Integer read _GetCCL_WU;
    {class} property CC_STAT_AREA: Integer read _GetCC_STAT_AREA;
    {class} property CC_STAT_HEIGHT: Integer read _GetCC_STAT_HEIGHT;
    {class} property CC_STAT_LEFT: Integer read _GetCC_STAT_LEFT;
    {class} property CC_STAT_MAX: Integer read _GetCC_STAT_MAX;
    {class} property CC_STAT_TOP: Integer read _GetCC_STAT_TOP;
    {class} property CC_STAT_WIDTH: Integer read _GetCC_STAT_WIDTH;
    {class} property CHAIN_APPROX_NONE: Integer read _GetCHAIN_APPROX_NONE;
    {class} property CHAIN_APPROX_SIMPLE: Integer read _GetCHAIN_APPROX_SIMPLE;
    {class} property CHAIN_APPROX_TC89_KCOS: Integer read _GetCHAIN_APPROX_TC89_KCOS;
    {class} property CHAIN_APPROX_TC89_L1: Integer read _GetCHAIN_APPROX_TC89_L1;
    {class} property COLORMAP_AUTUMN: Integer read _GetCOLORMAP_AUTUMN;
    {class} property COLORMAP_BONE: Integer read _GetCOLORMAP_BONE;
    {class} property COLORMAP_CIVIDIS: Integer read _GetCOLORMAP_CIVIDIS;
    {class} property COLORMAP_COOL: Integer read _GetCOLORMAP_COOL;
    {class} property COLORMAP_HOT: Integer read _GetCOLORMAP_HOT;
    {class} property COLORMAP_HSV: Integer read _GetCOLORMAP_HSV;
    {class} property COLORMAP_INFERNO: Integer read _GetCOLORMAP_INFERNO;
    {class} property COLORMAP_JET: Integer read _GetCOLORMAP_JET;
    {class} property COLORMAP_MAGMA: Integer read _GetCOLORMAP_MAGMA;
    {class} property COLORMAP_OCEAN: Integer read _GetCOLORMAP_OCEAN;
    {class} property COLORMAP_PARULA: Integer read _GetCOLORMAP_PARULA;
    {class} property COLORMAP_PINK: Integer read _GetCOLORMAP_PINK;
    {class} property COLORMAP_PLASMA: Integer read _GetCOLORMAP_PLASMA;
    {class} property COLORMAP_RAINBOW: Integer read _GetCOLORMAP_RAINBOW;
    {class} property COLORMAP_SPRING: Integer read _GetCOLORMAP_SPRING;
    {class} property COLORMAP_SUMMER: Integer read _GetCOLORMAP_SUMMER;
    {class} property COLORMAP_TURBO: Integer read _GetCOLORMAP_TURBO;
    {class} property COLORMAP_TWILIGHT: Integer read _GetCOLORMAP_TWILIGHT;
    {class} property COLORMAP_TWILIGHT_SHIFTED: Integer read _GetCOLORMAP_TWILIGHT_SHIFTED;
    {class} property COLORMAP_VIRIDIS: Integer read _GetCOLORMAP_VIRIDIS;
    {class} property COLORMAP_WINTER: Integer read _GetCOLORMAP_WINTER;
    {class} property COLOR_BGR2BGR555: Integer read _GetCOLOR_BGR2BGR555;
    {class} property COLOR_BGR2BGR565: Integer read _GetCOLOR_BGR2BGR565;
    {class} property COLOR_BGR2BGRA: Integer read _GetCOLOR_BGR2BGRA;
    {class} property COLOR_BGR2GRAY: Integer read _GetCOLOR_BGR2GRAY;
    {class} property COLOR_BGR2HLS: Integer read _GetCOLOR_BGR2HLS;
    {class} property COLOR_BGR2HLS_FULL: Integer read _GetCOLOR_BGR2HLS_FULL;
    {class} property COLOR_BGR2HSV: Integer read _GetCOLOR_BGR2HSV;
    {class} property COLOR_BGR2HSV_FULL: Integer read _GetCOLOR_BGR2HSV_FULL;
    {class} property COLOR_BGR2Lab: Integer read _GetCOLOR_BGR2Lab;
    {class} property COLOR_BGR2Luv: Integer read _GetCOLOR_BGR2Luv;
    {class} property COLOR_BGR2RGB: Integer read _GetCOLOR_BGR2RGB;
    {class} property COLOR_BGR2RGBA: Integer read _GetCOLOR_BGR2RGBA;
    {class} property COLOR_BGR2XYZ: Integer read _GetCOLOR_BGR2XYZ;
    {class} property COLOR_BGR2YCrCb: Integer read _GetCOLOR_BGR2YCrCb;
    {class} property COLOR_BGR2YUV: Integer read _GetCOLOR_BGR2YUV;
    {class} property COLOR_BGR2YUV_I420: Integer read _GetCOLOR_BGR2YUV_I420;
    {class} property COLOR_BGR2YUV_IYUV: Integer read _GetCOLOR_BGR2YUV_IYUV;
    {class} property COLOR_BGR2YUV_YV12: Integer read _GetCOLOR_BGR2YUV_YV12;
    {class} property COLOR_BGR5552BGR: Integer read _GetCOLOR_BGR5552BGR;
    {class} property COLOR_BGR5552BGRA: Integer read _GetCOLOR_BGR5552BGRA;
    {class} property COLOR_BGR5552GRAY: Integer read _GetCOLOR_BGR5552GRAY;
    {class} property COLOR_BGR5552RGB: Integer read _GetCOLOR_BGR5552RGB;
    {class} property COLOR_BGR5552RGBA: Integer read _GetCOLOR_BGR5552RGBA;
    {class} property COLOR_BGR5652BGR: Integer read _GetCOLOR_BGR5652BGR;
    {class} property COLOR_BGR5652BGRA: Integer read _GetCOLOR_BGR5652BGRA;
    {class} property COLOR_BGR5652GRAY: Integer read _GetCOLOR_BGR5652GRAY;
    {class} property COLOR_BGR5652RGB: Integer read _GetCOLOR_BGR5652RGB;
    {class} property COLOR_BGR5652RGBA: Integer read _GetCOLOR_BGR5652RGBA;
    {class} property COLOR_BGRA2BGR: Integer read _GetCOLOR_BGRA2BGR;
    {class} property COLOR_BGRA2BGR555: Integer read _GetCOLOR_BGRA2BGR555;
    {class} property COLOR_BGRA2BGR565: Integer read _GetCOLOR_BGRA2BGR565;
    {class} property COLOR_BGRA2GRAY: Integer read _GetCOLOR_BGRA2GRAY;
    {class} property COLOR_BGRA2RGB: Integer read _GetCOLOR_BGRA2RGB;
    {class} property COLOR_BGRA2RGBA: Integer read _GetCOLOR_BGRA2RGBA;
    {class} property COLOR_BGRA2YUV_I420: Integer read _GetCOLOR_BGRA2YUV_I420;
    {class} property COLOR_BGRA2YUV_IYUV: Integer read _GetCOLOR_BGRA2YUV_IYUV;
    {class} property COLOR_BGRA2YUV_YV12: Integer read _GetCOLOR_BGRA2YUV_YV12;
    {class} property COLOR_BayerBG2BGR: Integer read _GetCOLOR_BayerBG2BGR;
    {class} property COLOR_BayerBG2BGRA: Integer read _GetCOLOR_BayerBG2BGRA;
    {class} property COLOR_BayerBG2BGR_EA: Integer read _GetCOLOR_BayerBG2BGR_EA;
    {class} property COLOR_BayerBG2BGR_VNG: Integer read _GetCOLOR_BayerBG2BGR_VNG;
    {class} property COLOR_BayerBG2GRAY: Integer read _GetCOLOR_BayerBG2GRAY;
    {class} property COLOR_BayerBG2RGB: Integer read _GetCOLOR_BayerBG2RGB;
    {class} property COLOR_BayerBG2RGBA: Integer read _GetCOLOR_BayerBG2RGBA;
    {class} property COLOR_BayerBG2RGB_EA: Integer read _GetCOLOR_BayerBG2RGB_EA;
    {class} property COLOR_BayerBG2RGB_VNG: Integer read _GetCOLOR_BayerBG2RGB_VNG;
    {class} property COLOR_BayerGB2BGR: Integer read _GetCOLOR_BayerGB2BGR;
    {class} property COLOR_BayerGB2BGRA: Integer read _GetCOLOR_BayerGB2BGRA;
    {class} property COLOR_BayerGB2BGR_EA: Integer read _GetCOLOR_BayerGB2BGR_EA;
    {class} property COLOR_BayerGB2BGR_VNG: Integer read _GetCOLOR_BayerGB2BGR_VNG;
    {class} property COLOR_BayerGB2GRAY: Integer read _GetCOLOR_BayerGB2GRAY;
    {class} property COLOR_BayerGB2RGB: Integer read _GetCOLOR_BayerGB2RGB;
    {class} property COLOR_BayerGB2RGBA: Integer read _GetCOLOR_BayerGB2RGBA;
    {class} property COLOR_BayerGB2RGB_EA: Integer read _GetCOLOR_BayerGB2RGB_EA;
    {class} property COLOR_BayerGB2RGB_VNG: Integer read _GetCOLOR_BayerGB2RGB_VNG;
    {class} property COLOR_BayerGR2BGR: Integer read _GetCOLOR_BayerGR2BGR;
    {class} property COLOR_BayerGR2BGRA: Integer read _GetCOLOR_BayerGR2BGRA;
    {class} property COLOR_BayerGR2BGR_EA: Integer read _GetCOLOR_BayerGR2BGR_EA;
    {class} property COLOR_BayerGR2BGR_VNG: Integer read _GetCOLOR_BayerGR2BGR_VNG;
    {class} property COLOR_BayerGR2GRAY: Integer read _GetCOLOR_BayerGR2GRAY;
    {class} property COLOR_BayerGR2RGB: Integer read _GetCOLOR_BayerGR2RGB;
    {class} property COLOR_BayerGR2RGBA: Integer read _GetCOLOR_BayerGR2RGBA;
    {class} property COLOR_BayerGR2RGB_EA: Integer read _GetCOLOR_BayerGR2RGB_EA;
    {class} property COLOR_BayerGR2RGB_VNG: Integer read _GetCOLOR_BayerGR2RGB_VNG;
    {class} property COLOR_BayerRG2BGR: Integer read _GetCOLOR_BayerRG2BGR;
    {class} property COLOR_BayerRG2BGRA: Integer read _GetCOLOR_BayerRG2BGRA;
    {class} property COLOR_BayerRG2BGR_EA: Integer read _GetCOLOR_BayerRG2BGR_EA;
    {class} property COLOR_BayerRG2BGR_VNG: Integer read _GetCOLOR_BayerRG2BGR_VNG;
    {class} property COLOR_BayerRG2GRAY: Integer read _GetCOLOR_BayerRG2GRAY;
    {class} property COLOR_BayerRG2RGB: Integer read _GetCOLOR_BayerRG2RGB;
    {class} property COLOR_BayerRG2RGBA: Integer read _GetCOLOR_BayerRG2RGBA;
    {class} property COLOR_BayerRG2RGB_EA: Integer read _GetCOLOR_BayerRG2RGB_EA;
    {class} property COLOR_BayerRG2RGB_VNG: Integer read _GetCOLOR_BayerRG2RGB_VNG;
    {class} property COLOR_COLORCVT_MAX: Integer read _GetCOLOR_COLORCVT_MAX;
    {class} property COLOR_GRAY2BGR: Integer read _GetCOLOR_GRAY2BGR;
    {class} property COLOR_GRAY2BGR555: Integer read _GetCOLOR_GRAY2BGR555;
    {class} property COLOR_GRAY2BGR565: Integer read _GetCOLOR_GRAY2BGR565;
    {class} property COLOR_GRAY2BGRA: Integer read _GetCOLOR_GRAY2BGRA;
    {class} property COLOR_GRAY2RGB: Integer read _GetCOLOR_GRAY2RGB;
    {class} property COLOR_GRAY2RGBA: Integer read _GetCOLOR_GRAY2RGBA;
    {class} property COLOR_HLS2BGR: Integer read _GetCOLOR_HLS2BGR;
    {class} property COLOR_HLS2BGR_FULL: Integer read _GetCOLOR_HLS2BGR_FULL;
    {class} property COLOR_HLS2RGB: Integer read _GetCOLOR_HLS2RGB;
    {class} property COLOR_HLS2RGB_FULL: Integer read _GetCOLOR_HLS2RGB_FULL;
    {class} property COLOR_HSV2BGR: Integer read _GetCOLOR_HSV2BGR;
    {class} property COLOR_HSV2BGR_FULL: Integer read _GetCOLOR_HSV2BGR_FULL;
    {class} property COLOR_HSV2RGB: Integer read _GetCOLOR_HSV2RGB;
    {class} property COLOR_HSV2RGB_FULL: Integer read _GetCOLOR_HSV2RGB_FULL;
    {class} property COLOR_LBGR2Lab: Integer read _GetCOLOR_LBGR2Lab;
    {class} property COLOR_LBGR2Luv: Integer read _GetCOLOR_LBGR2Luv;
    {class} property COLOR_LRGB2Lab: Integer read _GetCOLOR_LRGB2Lab;
    {class} property COLOR_LRGB2Luv: Integer read _GetCOLOR_LRGB2Luv;
    {class} property COLOR_Lab2BGR: Integer read _GetCOLOR_Lab2BGR;
    {class} property COLOR_Lab2LBGR: Integer read _GetCOLOR_Lab2LBGR;
    {class} property COLOR_Lab2LRGB: Integer read _GetCOLOR_Lab2LRGB;
    {class} property COLOR_Lab2RGB: Integer read _GetCOLOR_Lab2RGB;
    {class} property COLOR_Luv2BGR: Integer read _GetCOLOR_Luv2BGR;
    {class} property COLOR_Luv2LBGR: Integer read _GetCOLOR_Luv2LBGR;
    {class} property COLOR_Luv2LRGB: Integer read _GetCOLOR_Luv2LRGB;
    {class} property COLOR_Luv2RGB: Integer read _GetCOLOR_Luv2RGB;
    {class} property COLOR_RGB2BGR: Integer read _GetCOLOR_RGB2BGR;
    {class} property COLOR_RGB2BGR555: Integer read _GetCOLOR_RGB2BGR555;
    {class} property COLOR_RGB2BGR565: Integer read _GetCOLOR_RGB2BGR565;
    {class} property COLOR_RGB2BGRA: Integer read _GetCOLOR_RGB2BGRA;
    {class} property COLOR_RGB2GRAY: Integer read _GetCOLOR_RGB2GRAY;
    {class} property COLOR_RGB2HLS: Integer read _GetCOLOR_RGB2HLS;
    {class} property COLOR_RGB2HLS_FULL: Integer read _GetCOLOR_RGB2HLS_FULL;
    {class} property COLOR_RGB2HSV: Integer read _GetCOLOR_RGB2HSV;
    {class} property COLOR_RGB2HSV_FULL: Integer read _GetCOLOR_RGB2HSV_FULL;
    {class} property COLOR_RGB2Lab: Integer read _GetCOLOR_RGB2Lab;
    {class} property COLOR_RGB2Luv: Integer read _GetCOLOR_RGB2Luv;
    {class} property COLOR_RGB2RGBA: Integer read _GetCOLOR_RGB2RGBA;
    {class} property COLOR_RGB2XYZ: Integer read _GetCOLOR_RGB2XYZ;
    {class} property COLOR_RGB2YCrCb: Integer read _GetCOLOR_RGB2YCrCb;
    {class} property COLOR_RGB2YUV: Integer read _GetCOLOR_RGB2YUV;
    {class} property COLOR_RGB2YUV_I420: Integer read _GetCOLOR_RGB2YUV_I420;
    {class} property COLOR_RGB2YUV_IYUV: Integer read _GetCOLOR_RGB2YUV_IYUV;
    {class} property COLOR_RGB2YUV_YV12: Integer read _GetCOLOR_RGB2YUV_YV12;
    {class} property COLOR_RGBA2BGR: Integer read _GetCOLOR_RGBA2BGR;
    {class} property COLOR_RGBA2BGR555: Integer read _GetCOLOR_RGBA2BGR555;
    {class} property COLOR_RGBA2BGR565: Integer read _GetCOLOR_RGBA2BGR565;
    {class} property COLOR_RGBA2BGRA: Integer read _GetCOLOR_RGBA2BGRA;
    {class} property COLOR_RGBA2GRAY: Integer read _GetCOLOR_RGBA2GRAY;
    {class} property COLOR_RGBA2RGB: Integer read _GetCOLOR_RGBA2RGB;
    {class} property COLOR_RGBA2YUV_I420: Integer read _GetCOLOR_RGBA2YUV_I420;
    {class} property COLOR_RGBA2YUV_IYUV: Integer read _GetCOLOR_RGBA2YUV_IYUV;
    {class} property COLOR_RGBA2YUV_YV12: Integer read _GetCOLOR_RGBA2YUV_YV12;
    {class} property COLOR_RGBA2mRGBA: Integer read _GetCOLOR_RGBA2mRGBA;
    {class} property COLOR_XYZ2BGR: Integer read _GetCOLOR_XYZ2BGR;
    {class} property COLOR_XYZ2RGB: Integer read _GetCOLOR_XYZ2RGB;
    {class} property COLOR_YCrCb2BGR: Integer read _GetCOLOR_YCrCb2BGR;
    {class} property COLOR_YCrCb2RGB: Integer read _GetCOLOR_YCrCb2RGB;
    {class} property COLOR_YUV2BGR: Integer read _GetCOLOR_YUV2BGR;
    {class} property COLOR_YUV2BGRA_I420: Integer read _GetCOLOR_YUV2BGRA_I420;
    {class} property COLOR_YUV2BGRA_IYUV: Integer read _GetCOLOR_YUV2BGRA_IYUV;
    {class} property COLOR_YUV2BGRA_NV12: Integer read _GetCOLOR_YUV2BGRA_NV12;
    {class} property COLOR_YUV2BGRA_NV21: Integer read _GetCOLOR_YUV2BGRA_NV21;
    {class} property COLOR_YUV2BGRA_UYNV: Integer read _GetCOLOR_YUV2BGRA_UYNV;
    {class} property COLOR_YUV2BGRA_UYVY: Integer read _GetCOLOR_YUV2BGRA_UYVY;
    {class} property COLOR_YUV2BGRA_Y422: Integer read _GetCOLOR_YUV2BGRA_Y422;
    {class} property COLOR_YUV2BGRA_YUNV: Integer read _GetCOLOR_YUV2BGRA_YUNV;
    {class} property COLOR_YUV2BGRA_YUY2: Integer read _GetCOLOR_YUV2BGRA_YUY2;
    {class} property COLOR_YUV2BGRA_YUYV: Integer read _GetCOLOR_YUV2BGRA_YUYV;
    {class} property COLOR_YUV2BGRA_YV12: Integer read _GetCOLOR_YUV2BGRA_YV12;
    {class} property COLOR_YUV2BGRA_YVYU: Integer read _GetCOLOR_YUV2BGRA_YVYU;
    {class} property COLOR_YUV2BGR_I420: Integer read _GetCOLOR_YUV2BGR_I420;
    {class} property COLOR_YUV2BGR_IYUV: Integer read _GetCOLOR_YUV2BGR_IYUV;
    {class} property COLOR_YUV2BGR_NV12: Integer read _GetCOLOR_YUV2BGR_NV12;
    {class} property COLOR_YUV2BGR_NV21: Integer read _GetCOLOR_YUV2BGR_NV21;
    {class} property COLOR_YUV2BGR_UYNV: Integer read _GetCOLOR_YUV2BGR_UYNV;
    {class} property COLOR_YUV2BGR_UYVY: Integer read _GetCOLOR_YUV2BGR_UYVY;
    {class} property COLOR_YUV2BGR_Y422: Integer read _GetCOLOR_YUV2BGR_Y422;
    {class} property COLOR_YUV2BGR_YUNV: Integer read _GetCOLOR_YUV2BGR_YUNV;
    {class} property COLOR_YUV2BGR_YUY2: Integer read _GetCOLOR_YUV2BGR_YUY2;
    {class} property COLOR_YUV2BGR_YUYV: Integer read _GetCOLOR_YUV2BGR_YUYV;
    {class} property COLOR_YUV2BGR_YV12: Integer read _GetCOLOR_YUV2BGR_YV12;
    {class} property COLOR_YUV2BGR_YVYU: Integer read _GetCOLOR_YUV2BGR_YVYU;
    {class} property COLOR_YUV2GRAY_420: Integer read _GetCOLOR_YUV2GRAY_420;
    {class} property COLOR_YUV2GRAY_I420: Integer read _GetCOLOR_YUV2GRAY_I420;
    {class} property COLOR_YUV2GRAY_IYUV: Integer read _GetCOLOR_YUV2GRAY_IYUV;
    {class} property COLOR_YUV2GRAY_NV12: Integer read _GetCOLOR_YUV2GRAY_NV12;
    {class} property COLOR_YUV2GRAY_NV21: Integer read _GetCOLOR_YUV2GRAY_NV21;
    {class} property COLOR_YUV2GRAY_UYNV: Integer read _GetCOLOR_YUV2GRAY_UYNV;
    {class} property COLOR_YUV2GRAY_UYVY: Integer read _GetCOLOR_YUV2GRAY_UYVY;
    {class} property COLOR_YUV2GRAY_Y422: Integer read _GetCOLOR_YUV2GRAY_Y422;
    {class} property COLOR_YUV2GRAY_YUNV: Integer read _GetCOLOR_YUV2GRAY_YUNV;
    {class} property COLOR_YUV2GRAY_YUY2: Integer read _GetCOLOR_YUV2GRAY_YUY2;
    {class} property COLOR_YUV2GRAY_YUYV: Integer read _GetCOLOR_YUV2GRAY_YUYV;
    {class} property COLOR_YUV2GRAY_YV12: Integer read _GetCOLOR_YUV2GRAY_YV12;
    {class} property COLOR_YUV2GRAY_YVYU: Integer read _GetCOLOR_YUV2GRAY_YVYU;
    {class} property COLOR_YUV2RGB: Integer read _GetCOLOR_YUV2RGB;
    {class} property COLOR_YUV2RGBA_I420: Integer read _GetCOLOR_YUV2RGBA_I420;
    {class} property COLOR_YUV2RGBA_IYUV: Integer read _GetCOLOR_YUV2RGBA_IYUV;
    {class} property COLOR_YUV2RGBA_NV12: Integer read _GetCOLOR_YUV2RGBA_NV12;
    {class} property COLOR_YUV2RGBA_NV21: Integer read _GetCOLOR_YUV2RGBA_NV21;
    {class} property COLOR_YUV2RGBA_UYNV: Integer read _GetCOLOR_YUV2RGBA_UYNV;
    {class} property COLOR_YUV2RGBA_UYVY: Integer read _GetCOLOR_YUV2RGBA_UYVY;
    {class} property COLOR_YUV2RGBA_Y422: Integer read _GetCOLOR_YUV2RGBA_Y422;
    {class} property COLOR_YUV2RGBA_YUNV: Integer read _GetCOLOR_YUV2RGBA_YUNV;
    {class} property COLOR_YUV2RGBA_YUY2: Integer read _GetCOLOR_YUV2RGBA_YUY2;
    {class} property COLOR_YUV2RGBA_YUYV: Integer read _GetCOLOR_YUV2RGBA_YUYV;
    {class} property COLOR_YUV2RGBA_YV12: Integer read _GetCOLOR_YUV2RGBA_YV12;
    {class} property COLOR_YUV2RGBA_YVYU: Integer read _GetCOLOR_YUV2RGBA_YVYU;
    {class} property COLOR_YUV2RGB_I420: Integer read _GetCOLOR_YUV2RGB_I420;
    {class} property COLOR_YUV2RGB_IYUV: Integer read _GetCOLOR_YUV2RGB_IYUV;
    {class} property COLOR_YUV2RGB_NV12: Integer read _GetCOLOR_YUV2RGB_NV12;
    {class} property COLOR_YUV2RGB_NV21: Integer read _GetCOLOR_YUV2RGB_NV21;
    {class} property COLOR_YUV2RGB_UYNV: Integer read _GetCOLOR_YUV2RGB_UYNV;
    {class} property COLOR_YUV2RGB_UYVY: Integer read _GetCOLOR_YUV2RGB_UYVY;
    {class} property COLOR_YUV2RGB_Y422: Integer read _GetCOLOR_YUV2RGB_Y422;
    {class} property COLOR_YUV2RGB_YUNV: Integer read _GetCOLOR_YUV2RGB_YUNV;
    {class} property COLOR_YUV2RGB_YUY2: Integer read _GetCOLOR_YUV2RGB_YUY2;
    {class} property COLOR_YUV2RGB_YUYV: Integer read _GetCOLOR_YUV2RGB_YUYV;
    {class} property COLOR_YUV2RGB_YV12: Integer read _GetCOLOR_YUV2RGB_YV12;
    {class} property COLOR_YUV2RGB_YVYU: Integer read _GetCOLOR_YUV2RGB_YVYU;
    {class} property COLOR_YUV420p2BGR: Integer read _GetCOLOR_YUV420p2BGR;
    {class} property COLOR_YUV420p2BGRA: Integer read _GetCOLOR_YUV420p2BGRA;
    {class} property COLOR_YUV420p2GRAY: Integer read _GetCOLOR_YUV420p2GRAY;
    {class} property COLOR_YUV420p2RGB: Integer read _GetCOLOR_YUV420p2RGB;
    {class} property COLOR_YUV420p2RGBA: Integer read _GetCOLOR_YUV420p2RGBA;
    {class} property COLOR_YUV420sp2BGR: Integer read _GetCOLOR_YUV420sp2BGR;
    {class} property COLOR_YUV420sp2BGRA: Integer read _GetCOLOR_YUV420sp2BGRA;
    {class} property COLOR_YUV420sp2GRAY: Integer read _GetCOLOR_YUV420sp2GRAY;
    {class} property COLOR_YUV420sp2RGB: Integer read _GetCOLOR_YUV420sp2RGB;
    {class} property COLOR_YUV420sp2RGBA: Integer read _GetCOLOR_YUV420sp2RGBA;
    {class} property COLOR_mRGBA2RGBA: Integer read _GetCOLOR_mRGBA2RGBA;
    {class} property CONTOURS_MATCH_I1: Integer read _GetCONTOURS_MATCH_I1;
    {class} property CONTOURS_MATCH_I2: Integer read _GetCONTOURS_MATCH_I2;
    {class} property CONTOURS_MATCH_I3: Integer read _GetCONTOURS_MATCH_I3;
    {class} property CV_BILATERAL: Integer read _GetCV_BILATERAL;
    {class} property CV_BLUR: Integer read _GetCV_BLUR;
    {class} property CV_BLUR_NO_SCALE: Integer read _GetCV_BLUR_NO_SCALE;
    {class} property CV_CANNY_L2_GRADIENT: Integer read _GetCV_CANNY_L2_GRADIENT;
    {class} property CV_CHAIN_CODE: Integer read _GetCV_CHAIN_CODE;
    {class} property CV_CLOCKWISE: Integer read _GetCV_CLOCKWISE;
    {class} property CV_COMP_BHATTACHARYYA: Integer read _GetCV_COMP_BHATTACHARYYA;
    {class} property CV_COMP_CHISQR: Integer read _GetCV_COMP_CHISQR;
    {class} property CV_COMP_CHISQR_ALT: Integer read _GetCV_COMP_CHISQR_ALT;
    {class} property CV_COMP_CORREL: Integer read _GetCV_COMP_CORREL;
    {class} property CV_COMP_HELLINGER: Integer read _GetCV_COMP_HELLINGER;
    {class} property CV_COMP_INTERSECT: Integer read _GetCV_COMP_INTERSECT;
    {class} property CV_COMP_KL_DIV: Integer read _GetCV_COMP_KL_DIV;
    {class} property CV_CONTOURS_MATCH_I1: Integer read _GetCV_CONTOURS_MATCH_I1;
    {class} property CV_CONTOURS_MATCH_I2: Integer read _GetCV_CONTOURS_MATCH_I2;
    {class} property CV_CONTOURS_MATCH_I3: Integer read _GetCV_CONTOURS_MATCH_I3;
    {class} property CV_COUNTER_CLOCKWISE: Integer read _GetCV_COUNTER_CLOCKWISE;
    {class} property CV_DIST_C: Integer read _GetCV_DIST_C;
    {class} property CV_DIST_FAIR: Integer read _GetCV_DIST_FAIR;
    {class} property CV_DIST_HUBER: Integer read _GetCV_DIST_HUBER;
    {class} property CV_DIST_L1: Integer read _GetCV_DIST_L1;
    {class} property CV_DIST_L12: Integer read _GetCV_DIST_L12;
    {class} property CV_DIST_L2: Integer read _GetCV_DIST_L2;
    {class} property CV_DIST_LABEL_CCOMP: Integer read _GetCV_DIST_LABEL_CCOMP;
    {class} property CV_DIST_LABEL_PIXEL: Integer read _GetCV_DIST_LABEL_PIXEL;
    {class} property CV_DIST_MASK_3: Integer read _GetCV_DIST_MASK_3;
    {class} property CV_DIST_MASK_5: Integer read _GetCV_DIST_MASK_5;
    {class} property CV_DIST_MASK_PRECISE: Integer read _GetCV_DIST_MASK_PRECISE;
    {class} property CV_DIST_USER: Integer read _GetCV_DIST_USER;
    {class} property CV_DIST_WELSCH: Integer read _GetCV_DIST_WELSCH;
    {class} property CV_GAUSSIAN: Integer read _GetCV_GAUSSIAN;
    {class} property CV_GAUSSIAN_5x5: Integer read _GetCV_GAUSSIAN_5x5;
    {class} property CV_HOUGH_GRADIENT: Integer read _GetCV_HOUGH_GRADIENT;
    {class} property CV_HOUGH_MULTI_SCALE: Integer read _GetCV_HOUGH_MULTI_SCALE;
    {class} property CV_HOUGH_PROBABILISTIC: Integer read _GetCV_HOUGH_PROBABILISTIC;
    {class} property CV_HOUGH_STANDARD: Integer read _GetCV_HOUGH_STANDARD;
    {class} property CV_LINK_RUNS: Integer read _GetCV_LINK_RUNS;
    {class} property CV_MAX_SOBEL_KSIZE: Integer read _GetCV_MAX_SOBEL_KSIZE;
    {class} property CV_MEDIAN: Integer read _GetCV_MEDIAN;
    {class} property CV_POLY_APPROX_DP: Integer read _GetCV_POLY_APPROX_DP;
    {class} property CV_RGBA2mRGBA: Integer read _GetCV_RGBA2mRGBA;
    {class} property CV_SCHARR: Integer read _GetCV_SCHARR;
    {class} property CV_SHAPE_CROSS: Integer read _GetCV_SHAPE_CROSS;
    {class} property CV_SHAPE_CUSTOM: Integer read _GetCV_SHAPE_CUSTOM;
    {class} property CV_SHAPE_ELLIPSE: Integer read _GetCV_SHAPE_ELLIPSE;
    {class} property CV_SHAPE_RECT: Integer read _GetCV_SHAPE_RECT;
    {class} property CV_WARP_FILL_OUTLIERS: Integer read _GetCV_WARP_FILL_OUTLIERS;
    {class} property CV_WARP_INVERSE_MAP: Integer read _GetCV_WARP_INVERSE_MAP;
    {class} property CV_mRGBA2RGBA: Integer read _GetCV_mRGBA2RGBA;
    {class} property DIST_C: Integer read _GetDIST_C;
    {class} property DIST_FAIR: Integer read _GetDIST_FAIR;
    {class} property DIST_HUBER: Integer read _GetDIST_HUBER;
    {class} property DIST_L1: Integer read _GetDIST_L1;
    {class} property DIST_L12: Integer read _GetDIST_L12;
    {class} property DIST_L2: Integer read _GetDIST_L2;
    {class} property DIST_LABEL_CCOMP: Integer read _GetDIST_LABEL_CCOMP;
    {class} property DIST_LABEL_PIXEL: Integer read _GetDIST_LABEL_PIXEL;
    {class} property DIST_MASK_3: Integer read _GetDIST_MASK_3;
    {class} property DIST_MASK_5: Integer read _GetDIST_MASK_5;
    {class} property DIST_MASK_PRECISE: Integer read _GetDIST_MASK_PRECISE;
    {class} property DIST_USER: Integer read _GetDIST_USER;
    {class} property DIST_WELSCH: Integer read _GetDIST_WELSCH;
    {class} property FILLED: Integer read _GetFILLED;
    {class} property FILTER_SCHARR: Integer read _GetFILTER_SCHARR;
    {class} property FLOODFILL_FIXED_RANGE: Integer read _GetFLOODFILL_FIXED_RANGE;
    {class} property FLOODFILL_MASK_ONLY: Integer read _GetFLOODFILL_MASK_ONLY;
    {class} property FONT_HERSHEY_COMPLEX: Integer read _GetFONT_HERSHEY_COMPLEX;
    {class} property FONT_HERSHEY_COMPLEX_SMALL: Integer read _GetFONT_HERSHEY_COMPLEX_SMALL;
    {class} property FONT_HERSHEY_DUPLEX: Integer read _GetFONT_HERSHEY_DUPLEX;
    {class} property FONT_HERSHEY_PLAIN: Integer read _GetFONT_HERSHEY_PLAIN;
    {class} property FONT_HERSHEY_SCRIPT_COMPLEX: Integer read _GetFONT_HERSHEY_SCRIPT_COMPLEX;
    {class} property FONT_HERSHEY_SCRIPT_SIMPLEX: Integer read _GetFONT_HERSHEY_SCRIPT_SIMPLEX;
    {class} property FONT_HERSHEY_SIMPLEX: Integer read _GetFONT_HERSHEY_SIMPLEX;
    {class} property FONT_HERSHEY_TRIPLEX: Integer read _GetFONT_HERSHEY_TRIPLEX;
    {class} property FONT_ITALIC: Integer read _GetFONT_ITALIC;
    {class} property GC_BGD: Integer read _GetGC_BGD;
    {class} property GC_EVAL: Integer read _GetGC_EVAL;
    {class} property GC_EVAL_FREEZE_MODEL: Integer read _GetGC_EVAL_FREEZE_MODEL;
    {class} property GC_FGD: Integer read _GetGC_FGD;
    {class} property GC_INIT_WITH_MASK: Integer read _GetGC_INIT_WITH_MASK;
    {class} property GC_INIT_WITH_RECT: Integer read _GetGC_INIT_WITH_RECT;
    {class} property GC_PR_BGD: Integer read _GetGC_PR_BGD;
    {class} property GC_PR_FGD: Integer read _GetGC_PR_FGD;
    {class} property HISTCMP_BHATTACHARYYA: Integer read _GetHISTCMP_BHATTACHARYYA;
    {class} property HISTCMP_CHISQR: Integer read _GetHISTCMP_CHISQR;
    {class} property HISTCMP_CHISQR_ALT: Integer read _GetHISTCMP_CHISQR_ALT;
    {class} property HISTCMP_CORREL: Integer read _GetHISTCMP_CORREL;
    {class} property HISTCMP_HELLINGER: Integer read _GetHISTCMP_HELLINGER;
    {class} property HISTCMP_INTERSECT: Integer read _GetHISTCMP_INTERSECT;
    {class} property HISTCMP_KL_DIV: Integer read _GetHISTCMP_KL_DIV;
    {class} property HOUGH_GRADIENT: Integer read _GetHOUGH_GRADIENT;
    {class} property HOUGH_MULTI_SCALE: Integer read _GetHOUGH_MULTI_SCALE;
    {class} property HOUGH_PROBABILISTIC: Integer read _GetHOUGH_PROBABILISTIC;
    {class} property HOUGH_STANDARD: Integer read _GetHOUGH_STANDARD;
    {class} property INTERSECT_FULL: Integer read _GetINTERSECT_FULL;
    {class} property INTERSECT_NONE: Integer read _GetINTERSECT_NONE;
    {class} property INTERSECT_PARTIAL: Integer read _GetINTERSECT_PARTIAL;
    {class} property INTER_AREA: Integer read _GetINTER_AREA;
    {class} property INTER_BITS: Integer read _GetINTER_BITS;
    {class} property INTER_BITS2: Integer read _GetINTER_BITS2;
    {class} property INTER_CUBIC: Integer read _GetINTER_CUBIC;
    {class} property INTER_LANCZOS4: Integer read _GetINTER_LANCZOS4;
    {class} property INTER_LINEAR: Integer read _GetINTER_LINEAR;
    {class} property INTER_LINEAR_EXACT: Integer read _GetINTER_LINEAR_EXACT;
    {class} property INTER_MAX: Integer read _GetINTER_MAX;
    {class} property INTER_NEAREST: Integer read _GetINTER_NEAREST;
    {class} property INTER_TAB_SIZE: Integer read _GetINTER_TAB_SIZE;
    {class} property INTER_TAB_SIZE2: Integer read _GetINTER_TAB_SIZE2;
    {class} property LINE_4: Integer read _GetLINE_4;
    {class} property LINE_8: Integer read _GetLINE_8;
    {class} property LINE_AA: Integer read _GetLINE_AA;
    {class} property LSD_REFINE_ADV: Integer read _GetLSD_REFINE_ADV;
    {class} property LSD_REFINE_NONE: Integer read _GetLSD_REFINE_NONE;
    {class} property LSD_REFINE_STD: Integer read _GetLSD_REFINE_STD;
    {class} property MARKER_CROSS: Integer read _GetMARKER_CROSS;
    {class} property MARKER_DIAMOND: Integer read _GetMARKER_DIAMOND;
    {class} property MARKER_SQUARE: Integer read _GetMARKER_SQUARE;
    {class} property MARKER_STAR: Integer read _GetMARKER_STAR;
    {class} property MARKER_TILTED_CROSS: Integer read _GetMARKER_TILTED_CROSS;
    {class} property MARKER_TRIANGLE_DOWN: Integer read _GetMARKER_TRIANGLE_DOWN;
    {class} property MARKER_TRIANGLE_UP: Integer read _GetMARKER_TRIANGLE_UP;
    {class} property MORPH_BLACKHAT: Integer read _GetMORPH_BLACKHAT;
    {class} property MORPH_CLOSE: Integer read _GetMORPH_CLOSE;
    {class} property MORPH_CROSS: Integer read _GetMORPH_CROSS;
    {class} property MORPH_DILATE: Integer read _GetMORPH_DILATE;
    {class} property MORPH_ELLIPSE: Integer read _GetMORPH_ELLIPSE;
    {class} property MORPH_ERODE: Integer read _GetMORPH_ERODE;
    {class} property MORPH_GRADIENT: Integer read _GetMORPH_GRADIENT;
    {class} property MORPH_HITMISS: Integer read _GetMORPH_HITMISS;
    {class} property MORPH_OPEN: Integer read _GetMORPH_OPEN;
    {class} property MORPH_RECT: Integer read _GetMORPH_RECT;
    {class} property MORPH_TOPHAT: Integer read _GetMORPH_TOPHAT;
    {class} property RETR_CCOMP: Integer read _GetRETR_CCOMP;
    {class} property RETR_EXTERNAL: Integer read _GetRETR_EXTERNAL;
    {class} property RETR_FLOODFILL: Integer read _GetRETR_FLOODFILL;
    {class} property RETR_LIST: Integer read _GetRETR_LIST;
    {class} property RETR_TREE: Integer read _GetRETR_TREE;
    {class} property THRESH_BINARY: Integer read _GetTHRESH_BINARY;
    {class} property THRESH_BINARY_INV: Integer read _GetTHRESH_BINARY_INV;
    {class} property THRESH_MASK: Integer read _GetTHRESH_MASK;
    {class} property THRESH_OTSU: Integer read _GetTHRESH_OTSU;
    {class} property THRESH_TOZERO: Integer read _GetTHRESH_TOZERO;
    {class} property THRESH_TOZERO_INV: Integer read _GetTHRESH_TOZERO_INV;
    {class} property THRESH_TRIANGLE: Integer read _GetTHRESH_TRIANGLE;
    {class} property THRESH_TRUNC: Integer read _GetTHRESH_TRUNC;
    {class} property TM_CCOEFF: Integer read _GetTM_CCOEFF;
    {class} property TM_CCOEFF_NORMED: Integer read _GetTM_CCOEFF_NORMED;
    {class} property TM_CCORR: Integer read _GetTM_CCORR;
    {class} property TM_CCORR_NORMED: Integer read _GetTM_CCORR_NORMED;
    {class} property TM_SQDIFF: Integer read _GetTM_SQDIFF;
    {class} property TM_SQDIFF_NORMED: Integer read _GetTM_SQDIFF_NORMED;
    {class} property WARP_FILL_OUTLIERS: Integer read _GetWARP_FILL_OUTLIERS;
    {class} property WARP_INVERSE_MAP: Integer read _GetWARP_INVERSE_MAP;
    {class} property WARP_POLAR_LINEAR: Integer read _GetWARP_POLAR_LINEAR;
    {class} property WARP_POLAR_LOG: Integer read _GetWARP_POLAR_LOG;
  end;

  [JavaSignature('org/opencv/imgproc/Imgproc')]
  JImgproc = interface(JObject)
    ['{EF1ADC0F-50EB-403A-BB17-ED1C674F5379}']
  end;
  TJImgproc = class(TJavaGenericImport<JImgprocClass, JImgproc>) end;

  JLineSegmentDetectorClass = interface(JAlgorithmClass)
    ['{5E559A92-AEBA-406C-B209-3080EAF2CF74}']
    {class} function __fromPtr__(addr: Int64): JLineSegmentDetector; cdecl;
    {class} function compareSegments(size: Jcore_Size; lines1: JMat; lines2: JMat; _image: JMat): Integer; cdecl; overload;
    {class} procedure detect(_image: JMat; _lines: JMat; width: JMat); cdecl; overload;//Deprecated
    {class} procedure detect(_image: JMat; _lines: JMat); cdecl; overload;//Deprecated
    {class} procedure drawSegments(_image: JMat; lines: JMat); cdecl;//Deprecated
  end;

  [JavaSignature('org/opencv/imgproc/LineSegmentDetector')]
  JLineSegmentDetector = interface(JAlgorithm)
    ['{1D17091D-4EB5-4E84-8AE6-B56361A46D45}']
    function compareSegments(size: Jcore_Size; lines1: JMat; lines2: JMat): Integer; cdecl; overload;
    procedure detect(_image: JMat; _lines: JMat; width: JMat; prec: JMat; nfa: JMat); cdecl; overload;
    procedure detect(_image: JMat; _lines: JMat; width: JMat; prec: JMat); cdecl; overload;
  end;
  TJLineSegmentDetector = class(TJavaGenericImport<JLineSegmentDetectorClass, JLineSegmentDetector>) end;

  Jimgproc_MomentsClass = interface(JObjectClass)
    ['{F3BFC3CD-5A9A-457F-92E4-104246A33203}']
    {class} function _Getm03: Double; cdecl;
    {class} function _Getm10: Double; cdecl;
    {class} procedure _Setm10(Value: Double); cdecl;
    {class} function _Getm11: Double; cdecl;
    {class} procedure _Setm11(Value: Double); cdecl;
    {class} function _Getm21: Double; cdecl;
    {class} function _Getm30: Double; cdecl;
    {class} procedure _Setm30(Value: Double); cdecl;
    {class} function _Getmu12: Double; cdecl;
    {class} function _Getmu20: Double; cdecl;
    {class} function _Getmu21: Double; cdecl;
    {class} procedure _Setmu21(Value: Double); cdecl;
    {class} function _Getmu30: Double; cdecl;
    {class} function _Getnu02: Double; cdecl;
    {class} procedure _Setnu02(Value: Double); cdecl;
    {class} function _Getnu03: Double; cdecl;
    {class} procedure _Setnu03(Value: Double); cdecl;
    {class} function _Getnu20: Double; cdecl;
    {class} function _Getnu21: Double; cdecl;
    {class} function _Getnu30: Double; cdecl;
    {class} procedure _Setnu30(Value: Double); cdecl;
    {class} function init(m00: Double; m10: Double; m01: Double; m20: Double; m11: Double; m02: Double; m30: Double; m21: Double; m12: Double; m03: Double): Jimgproc_Moments; cdecl; overload;
    {class} function init: Jimgproc_Moments; cdecl; overload;
    {class} function init(vals: TJavaArray<Double>): Jimgproc_Moments; cdecl; overload;
    {class} function get_m00: Double; cdecl;
    {class} function get_m01: Double; cdecl;
    {class} function get_m11: Double; cdecl;
    {class} function get_m12: Double; cdecl;
    {class} function get_m20: Double; cdecl;
    {class} function get_mu03: Double; cdecl;
    {class} function get_mu11: Double; cdecl;
    {class} function get_mu30: Double; cdecl;//Deprecated
    {class} function get_nu02: Double; cdecl;//Deprecated
    {class} function get_nu03: Double; cdecl;//Deprecated
    {class} function get_nu21: Double; cdecl;//Deprecated
    {class} function get_nu30: Double; cdecl;//Deprecated
    {class} procedure &set(vals: TJavaArray<Double>); cdecl;//Deprecated
    {class} procedure set_m03(m03: Double); cdecl;//Deprecated
    {class} procedure set_m10(m10: Double); cdecl;//Deprecated
    {class} procedure set_m11(m11: Double); cdecl;//Deprecated
    {class} procedure set_m30(m30: Double); cdecl;//Deprecated
    {class} procedure set_mu02(mu02: Double); cdecl;
    {class} procedure set_mu03(mu03: Double); cdecl;
    {class} procedure set_mu11(mu11: Double); cdecl;
    {class} procedure set_mu30(mu30: Double); cdecl;
    {class} procedure set_nu02(nu02: Double); cdecl;
    {class} procedure set_nu03(nu03: Double); cdecl;
    {class} procedure set_nu21(nu21: Double); cdecl;
    {class} procedure set_nu30(nu30: Double); cdecl;
    {class} function toString: JString; cdecl;
    {class} property m03: Double read _Getm03;
    {class} property m10: Double read _Getm10 write _Setm10;
    {class} property m11: Double read _Getm11 write _Setm11;
    {class} property m21: Double read _Getm21;
    {class} property m30: Double read _Getm30 write _Setm30;
    {class} property mu12: Double read _Getmu12;
    {class} property mu20: Double read _Getmu20;
    {class} property mu21: Double read _Getmu21 write _Setmu21;
    {class} property mu30: Double read _Getmu30;
    {class} property nu02: Double read _Getnu02 write _Setnu02;
    {class} property nu03: Double read _Getnu03 write _Setnu03;
    {class} property nu20: Double read _Getnu20;
    {class} property nu21: Double read _Getnu21;
    {class} property nu30: Double read _Getnu30 write _Setnu30;
  end;

  [JavaSignature('org/opencv/imgproc/Moments')]
  Jimgproc_Moments = interface(JObject)
    ['{537A1820-E6C5-4B75-9C3F-9D231D99E714}']
    function _Getm00: Double; cdecl;
    procedure _Setm00(Value: Double); cdecl;
    function _Getm01: Double; cdecl;
    function _Getm02: Double; cdecl;
    procedure _Setm02(Value: Double); cdecl;
    function _Getm12: Double; cdecl;
    function _Getm20: Double; cdecl;
    procedure _Setm20(Value: Double); cdecl;
    function _Getmu02: Double; cdecl;
    procedure _Setmu02(Value: Double); cdecl;
    function _Getmu03: Double; cdecl;
    function _Getmu11: Double; cdecl;
    procedure _Setmu11(Value: Double); cdecl;
    function _Getnu11: Double; cdecl;
    function _Getnu12: Double; cdecl;
    procedure _Setnu12(Value: Double); cdecl;
    function get_m02: Double; cdecl;
    function get_m03: Double; cdecl;
    function get_m10: Double; cdecl;
    function get_m21: Double; cdecl;
    function get_m30: Double; cdecl;
    function get_mu02: Double; cdecl;
    function get_mu12: Double; cdecl;
    function get_mu20: Double; cdecl;
    function get_mu21: Double; cdecl;
    function get_nu11: Double; cdecl;//Deprecated
    function get_nu12: Double; cdecl;//Deprecated
    function get_nu20: Double; cdecl;//Deprecated
    procedure set_m00(m00: Double); cdecl;//Deprecated
    procedure set_m01(m01: Double); cdecl;//Deprecated
    procedure set_m02(m02: Double); cdecl;//Deprecated
    procedure set_m12(m12: Double); cdecl;//Deprecated
    procedure set_m20(m20: Double); cdecl;//Deprecated
    procedure set_m21(m21: Double); cdecl;//Deprecated
    procedure set_mu12(mu12: Double); cdecl;
    procedure set_mu20(mu20: Double); cdecl;
    procedure set_mu21(mu21: Double); cdecl;
    procedure set_nu11(nu11: Double); cdecl;
    procedure set_nu12(nu12: Double); cdecl;
    procedure set_nu20(nu20: Double); cdecl;
    property m00: Double read _Getm00 write _Setm00;
    property m01: Double read _Getm01;
    property m02: Double read _Getm02 write _Setm02;
    property m12: Double read _Getm12;
    property m20: Double read _Getm20 write _Setm20;
    property mu02: Double read _Getmu02 write _Setmu02;
    property mu03: Double read _Getmu03;
    property mu11: Double read _Getmu11 write _Setmu11;
    property nu11: Double read _Getnu11;
    property nu12: Double read _Getnu12 write _Setnu12;
  end;
  TJimgproc_Moments = class(TJavaGenericImport<Jimgproc_MomentsClass, Jimgproc_Moments>) end;

  JSubdiv2DClass = interface(JObjectClass)
    ['{15D9527D-4DBF-4D19-820D-4A75476F8C26}']
    {class} function _GetNEXT_AROUND_DST: Integer; cdecl;
    {class} function _GetNEXT_AROUND_LEFT: Integer; cdecl;
    {class} function _GetNEXT_AROUND_ORG: Integer; cdecl;
    {class} function _GetNEXT_AROUND_RIGHT: Integer; cdecl;
    {class} function _GetPREV_AROUND_DST: Integer; cdecl;
    {class} function _GetPREV_AROUND_LEFT: Integer; cdecl;
    {class} function _GetPREV_AROUND_ORG: Integer; cdecl;
    {class} function _GetPREV_AROUND_RIGHT: Integer; cdecl;
    {class} function _GetPTLOC_ERROR: Integer; cdecl;
    {class} function _GetPTLOC_INSIDE: Integer; cdecl;
    {class} function _GetPTLOC_ON_EDGE: Integer; cdecl;
    {class} function _GetPTLOC_OUTSIDE_RECT: Integer; cdecl;
    {class} function _GetPTLOC_VERTEX: Integer; cdecl;
    {class} function init(rect: Jcore_Rect): JSubdiv2D; cdecl; overload;
    {class} function init: JSubdiv2D; cdecl; overload;
    {class} function __fromPtr__(addr: Int64): JSubdiv2D; cdecl;//Deprecated
    {class} function edgeOrg(edge: Integer; orgpt: Jcore_Point): Integer; cdecl; overload;//Deprecated
    {class} function edgeOrg(edge: Integer): Integer; cdecl; overload;//Deprecated
    {class} function findNearest(pt: Jcore_Point; nearestPt: Jcore_Point): Integer; cdecl; overload;//Deprecated
    {class} function findNearest(pt: Jcore_Point): Integer; cdecl; overload;//Deprecated
    {class} procedure getEdgeList(edgeList: JMatOfFloat4); cdecl;//Deprecated
    {class} function getNativeObjAddr: Int64; cdecl;//Deprecated
    {class} function insert(pt: Jcore_Point): Integer; cdecl; overload;
    {class} procedure insert(ptvec: JMatOfPoint2f); cdecl; overload;//Deprecated
    {class} function locate(pt: Jcore_Point; edge: TJavaArray<Integer>; vertex: TJavaArray<Integer>): Integer; cdecl;//Deprecated
    {class} function nextEdge(edge: Integer): Integer; cdecl;
    {class} property NEXT_AROUND_DST: Integer read _GetNEXT_AROUND_DST;
    {class} property NEXT_AROUND_LEFT: Integer read _GetNEXT_AROUND_LEFT;
    {class} property NEXT_AROUND_ORG: Integer read _GetNEXT_AROUND_ORG;
    {class} property NEXT_AROUND_RIGHT: Integer read _GetNEXT_AROUND_RIGHT;
    {class} property PREV_AROUND_DST: Integer read _GetPREV_AROUND_DST;
    {class} property PREV_AROUND_LEFT: Integer read _GetPREV_AROUND_LEFT;
    {class} property PREV_AROUND_ORG: Integer read _GetPREV_AROUND_ORG;
    {class} property PREV_AROUND_RIGHT: Integer read _GetPREV_AROUND_RIGHT;
    {class} property PTLOC_ERROR: Integer read _GetPTLOC_ERROR;
    {class} property PTLOC_INSIDE: Integer read _GetPTLOC_INSIDE;
    {class} property PTLOC_ON_EDGE: Integer read _GetPTLOC_ON_EDGE;
    {class} property PTLOC_OUTSIDE_RECT: Integer read _GetPTLOC_OUTSIDE_RECT;
    {class} property PTLOC_VERTEX: Integer read _GetPTLOC_VERTEX;
  end;

  [JavaSignature('org/opencv/imgproc/Subdiv2D')]
  JSubdiv2D = interface(JObject)
    ['{0C9D45FF-E1F0-45CE-AC6F-7BC3A4A31966}']
    function edgeDst(edge: Integer; dstpt: Jcore_Point): Integer; cdecl; overload;//Deprecated
    function edgeDst(edge: Integer): Integer; cdecl; overload;//Deprecated
    function getEdge(edge: Integer; nextEdgeType: Integer): Integer; cdecl;//Deprecated
    procedure getLeadingEdgeList(leadingEdgeList: JMatOfInt); cdecl;//Deprecated
    procedure getTriangleList(triangleList: JMatOfFloat6); cdecl;//Deprecated
    function getVertex(vertex: Integer; firstEdge: TJavaArray<Integer>): Jcore_Point; cdecl; overload;//Deprecated
    function getVertex(vertex: Integer): Jcore_Point; cdecl; overload;//Deprecated
    procedure getVoronoiFacetList(idx: JMatOfInt; facetList: JList; facetCenters: JMatOfPoint2f); cdecl;//Deprecated
    procedure initDelaunay(rect: Jcore_Rect); cdecl;//Deprecated
    function rotateEdge(edge: Integer; rotate: Integer): Integer; cdecl;//Deprecated
    function symEdge(edge: Integer): Integer; cdecl;
  end;
  TJSubdiv2D = class(TJavaGenericImport<JSubdiv2DClass, JSubdiv2D>) end;

  JStatModelClass = interface(JAlgorithmClass)
    ['{BA4B8A2F-1790-4339-8D93-455C610D2B0C}']
    {class} function _GetCOMPRESSED_INPUT: Integer; cdecl;
    {class} function _GetPREPROCESSED_INPUT: Integer; cdecl;
    {class} function _GetRAW_OUTPUT: Integer; cdecl;
    {class} function _GetUPDATE_MODEL: Integer; cdecl;
    {class} function __fromPtr__(addr: Int64): JStatModel; cdecl;
    {class} function calcError(data: JTrainData; test: Boolean; resp: JMat): Single; cdecl;
    {class} function isTrained: Boolean; cdecl;//Deprecated
    {class} function predict(samples: JMat; results: JMat; flags: Integer): Single; cdecl; overload;//Deprecated
    {class} function train(trainData: JTrainData; flags: Integer): Boolean; cdecl; overload;//Deprecated
    {class} function train(trainData: JTrainData): Boolean; cdecl; overload;//Deprecated
    {class} property COMPRESSED_INPUT: Integer read _GetCOMPRESSED_INPUT;
    {class} property PREPROCESSED_INPUT: Integer read _GetPREPROCESSED_INPUT;
    {class} property RAW_OUTPUT: Integer read _GetRAW_OUTPUT;
    {class} property UPDATE_MODEL: Integer read _GetUPDATE_MODEL;
  end;

  [JavaSignature('org/opencv/ml/StatModel')]
  JStatModel = interface(JAlgorithm)
    ['{4D3E5B63-78BD-4120-9241-78F4488663CA}']
    function empty: Boolean; cdecl;
    function getVarCount: Integer; cdecl;
    function isClassifier: Boolean; cdecl;
    function predict(samples: JMat; results: JMat): Single; cdecl; overload;//Deprecated
    function predict(samples: JMat): Single; cdecl; overload;//Deprecated
    function train(samples: JMat; layout: Integer; responses: JMat): Boolean; cdecl; overload;//Deprecated
  end;
  TJStatModel = class(TJavaGenericImport<JStatModelClass, JStatModel>) end;

  JANN_MLPClass = interface(JStatModelClass)
    ['{9C7E967B-2D2D-4BDF-A62A-1298C4C79733}']
    {class} function _GetANNEAL: Integer; cdecl;
    {class} function _GetBACKPROP: Integer; cdecl;
    {class} function _GetGAUSSIAN: Integer; cdecl;
    {class} function _GetIDENTITY: Integer; cdecl;
    {class} function _GetLEAKYRELU: Integer; cdecl;
    {class} function _GetNO_INPUT_SCALE: Integer; cdecl;
    {class} function _GetNO_OUTPUT_SCALE: Integer; cdecl;
    {class} function _GetRELU: Integer; cdecl;
    {class} function _GetRPROP: Integer; cdecl;
    {class} function _GetSIGMOID_SYM: Integer; cdecl;
    {class} function _GetUPDATE_WEIGHTS: Integer; cdecl;
    {class} function __fromPtr__(addr: Int64): JANN_MLP; cdecl;//Deprecated
    {class} function create: JANN_MLP; cdecl;
    {class} function getAnnealFinalT: Double; cdecl;
    {class} function getAnnealInitialT: Double; cdecl;
    {class} function getAnnealItePerStep: Integer; cdecl;
    {class} function getLayerSizes: JMat; cdecl;
    {class} function getRpropDW0: Double; cdecl;//Deprecated
    {class} function getRpropDWMax: Double; cdecl;
    {class} function getRpropDWMin: Double; cdecl;
    {class} function getTrainMethod: Integer; cdecl;//Deprecated
    {class} function load(filepath: JString): JANN_MLP; cdecl;
    {class} procedure setActivationFunction(type_: Integer; param1: Double; param2: Double); cdecl; overload;
    {class} procedure setActivationFunction(type_: Integer; param1: Double); cdecl; overload;
    {class} procedure setAnnealInitialT(val: Double); cdecl;
    {class} procedure setAnnealItePerStep(val: Integer); cdecl;
    {class} procedure setBackpropMomentumScale(val: Double); cdecl;//Deprecated
    {class} procedure setBackpropWeightScale(val: Double); cdecl;
    {class} procedure setLayerSizes(_layer_sizes: JMat); cdecl;//Deprecated
    {class} procedure setRpropDW0(val: Double); cdecl;//Deprecated
    {class} procedure setTrainMethod(method: Integer; param1: Double; param2: Double); cdecl; overload;
    {class} procedure setTrainMethod(method: Integer); cdecl; overload;
    {class} property ANNEAL: Integer read _GetANNEAL;
    {class} property BACKPROP: Integer read _GetBACKPROP;
    {class} property GAUSSIAN: Integer read _GetGAUSSIAN;
    {class} property IDENTITY: Integer read _GetIDENTITY;
    {class} property LEAKYRELU: Integer read _GetLEAKYRELU;
    {class} property NO_INPUT_SCALE: Integer read _GetNO_INPUT_SCALE;
    {class} property NO_OUTPUT_SCALE: Integer read _GetNO_OUTPUT_SCALE;
    {class} property RELU: Integer read _GetRELU;
    {class} property RPROP: Integer read _GetRPROP;
    {class} property SIGMOID_SYM: Integer read _GetSIGMOID_SYM;
    {class} property UPDATE_WEIGHTS: Integer read _GetUPDATE_WEIGHTS;
  end;

  [JavaSignature('org/opencv/ml/ANN_MLP')]
  JANN_MLP = interface(JStatModel)
    ['{D861BBAB-FB9F-42C3-B46B-9E949264940E}']
    function getAnnealCoolingRatio: Double; cdecl;
    function getBackpropMomentumScale: Double; cdecl;
    function getBackpropWeightScale: Double; cdecl;
    function getRpropDWMinus: Double; cdecl;
    function getRpropDWPlus: Double; cdecl;
    function getTermCriteria: JTermCriteria; cdecl;
    function getWeights(layerIdx: Integer): JMat; cdecl;
    procedure setActivationFunction(type_: Integer); cdecl; overload;
    procedure setAnnealCoolingRatio(val: Double); cdecl;
    procedure setAnnealFinalT(val: Double); cdecl;
    procedure setRpropDWMax(val: Double); cdecl;
    procedure setRpropDWMin(val: Double); cdecl;//Deprecated
    procedure setRpropDWMinus(val: Double); cdecl;
    procedure setRpropDWPlus(val: Double); cdecl;//Deprecated
    procedure setTermCriteria(val: JTermCriteria); cdecl;//Deprecated
    procedure setTrainMethod(method: Integer; param1: Double); cdecl; overload;
  end;
  TJANN_MLP = class(TJavaGenericImport<JANN_MLPClass, JANN_MLP>) end;

  JDTreesClass = interface(JStatModelClass)
    ['{0281230A-5757-4ACF-8B62-6782C6558AF3}']
    {class} function _GetPREDICT_AUTO: Integer; cdecl;
    {class} function _GetPREDICT_MASK: Integer; cdecl;
    {class} function _GetPREDICT_MAX_VOTE: Integer; cdecl;
    {class} function _GetPREDICT_SUM: Integer; cdecl;
    {class} function __fromPtr__(addr: Int64): JDTrees; cdecl;//Deprecated
    {class} function create: JDTrees; cdecl;
    {class} function getMaxDepth: Integer; cdecl;
    {class} function getPriors: JMat; cdecl;
    {class} function getRegressionAccuracy: Single; cdecl;
    {class} function getTruncatePrunedTree: Boolean; cdecl;
    {class} function load(filepath: JString; nodeName: JString): JDTrees; cdecl; overload;
    {class} function load(filepath: JString): JDTrees; cdecl; overload;
    {class} procedure setCVFolds(val: Integer); cdecl;
    {class} procedure setPriors(val: JMat); cdecl;
    {class} procedure setRegressionAccuracy(val: Single); cdecl;
    {class} procedure setUse1SERule(val: Boolean); cdecl;
    {class} procedure setUseSurrogates(val: Boolean); cdecl;//Deprecated
    {class} property PREDICT_AUTO: Integer read _GetPREDICT_AUTO;
    {class} property PREDICT_MASK: Integer read _GetPREDICT_MASK;
    {class} property PREDICT_MAX_VOTE: Integer read _GetPREDICT_MAX_VOTE;
    {class} property PREDICT_SUM: Integer read _GetPREDICT_SUM;
  end;

  [JavaSignature('org/opencv/ml/DTrees')]
  JDTrees = interface(JStatModel)
    ['{2EAB51B0-E36F-45CD-BEAE-ED2E14141D0C}']
    function getCVFolds: Integer; cdecl;
    function getMaxCategories: Integer; cdecl;
    function getMinSampleCount: Integer; cdecl;//Deprecated
    function getUse1SERule: Boolean; cdecl;
    function getUseSurrogates: Boolean; cdecl;
    procedure setMaxCategories(val: Integer); cdecl;
    procedure setMaxDepth(val: Integer); cdecl;
    procedure setMinSampleCount(val: Integer); cdecl;
    procedure setTruncatePrunedTree(val: Boolean); cdecl;//Deprecated
  end;
  TJDTrees = class(TJavaGenericImport<JDTreesClass, JDTrees>) end;

  JBoostClass = interface(JDTreesClass)
    ['{4F9CF316-DC0E-4190-AE45-A7A6B25D209C}']
    {class} function _GetDISCRETE: Integer; cdecl;
    {class} function _GetGENTLE: Integer; cdecl;
    {class} function _GetLOGIT: Integer; cdecl;
    {class} function _GetREAL: Integer; cdecl;
    {class} function __fromPtr__(addr: Int64): JBoost; cdecl;//Deprecated
    {class} function create: JBoost; cdecl;
    {class} function getBoostType: Integer; cdecl;//Deprecated
    {class} function getWeakCount: Integer; cdecl;
    {class} function load(filepath: JString; nodeName: JString): JBoost; cdecl; overload;
    {class} function load(filepath: JString): JBoost; cdecl; overload;
    {class} procedure setBoostType(val: Integer); cdecl;//Deprecated
    {class} procedure setWeakCount(val: Integer); cdecl;//Deprecated
    {class} procedure setWeightTrimRate(val: Double); cdecl;//Deprecated
    {class} property DISCRETE: Integer read _GetDISCRETE;
    {class} property GENTLE: Integer read _GetGENTLE;
    {class} property LOGIT: Integer read _GetLOGIT;
    {class} property REAL: Integer read _GetREAL;
  end;

  [JavaSignature('org/opencv/ml/Boost')]
  JBoost = interface(JDTrees)
    ['{7B8EBB95-AC3B-44EB-B1F5-4B17457698C4}']
    function getWeightTrimRate: Double; cdecl;
  end;
  TJBoost = class(TJavaGenericImport<JBoostClass, JBoost>) end;

  JEMClass = interface(JStatModelClass)
    ['{277694A0-3F74-4179-9EB3-39B2E60A1A32}']
    {class} function _GetCOV_MAT_DEFAULT: Integer; cdecl;
    {class} function _GetCOV_MAT_DIAGONAL: Integer; cdecl;
    {class} function _GetCOV_MAT_GENERIC: Integer; cdecl;
    {class} function _GetCOV_MAT_SPHERICAL: Integer; cdecl;
    {class} function _GetDEFAULT_MAX_ITERS: Integer; cdecl;
    {class} function _GetDEFAULT_NCLUSTERS: Integer; cdecl;
    {class} function _GetSTART_AUTO_STEP: Integer; cdecl;
    {class} function _GetSTART_E_STEP: Integer; cdecl;
    {class} function _GetSTART_M_STEP: Integer; cdecl;
    {class} function __fromPtr__(addr: Int64): JEM; cdecl;//Deprecated
    {class} function create: JEM; cdecl;
    {class} function getClustersNumber: Integer; cdecl;
    {class} function getCovarianceMatrixType: Integer; cdecl;//Deprecated
    {class} procedure getCovs(covs: JList); cdecl;//Deprecated
    {class} function getMeans: JMat; cdecl;
    {class} function load(filepath: JString; nodeName: JString): JEM; cdecl; overload;//Deprecated
    {class} function load(filepath: JString): JEM; cdecl; overload;//Deprecated
    {class} function predict(samples: JMat): Single; cdecl; overload;//Deprecated
    {class} function predict2(sample: JMat; probs: JMat): TJavaArray<Double>; cdecl;//Deprecated
    {class} procedure setCovarianceMatrixType(val: Integer); cdecl;//Deprecated
    {class} procedure setTermCriteria(val: JTermCriteria); cdecl;//Deprecated
    {class} function trainE(samples: JMat; means0: JMat; covs0: JMat; weights0: JMat; logLikelihoods: JMat; labels: JMat; probs: JMat): Boolean; cdecl; overload;//Deprecated
    {class} function trainE(samples: JMat; means0: JMat; covs0: JMat; weights0: JMat): Boolean; cdecl; overload;//Deprecated
    {class} function trainE(samples: JMat; means0: JMat): Boolean; cdecl; overload;//Deprecated
    {class} function trainEM(samples: JMat; logLikelihoods: JMat): Boolean; cdecl; overload;
    {class} function trainEM(samples: JMat): Boolean; cdecl; overload;
    {class} function trainM(samples: JMat; probs0: JMat; logLikelihoods: JMat; labels: JMat; probs: JMat): Boolean; cdecl; overload;
    {class} property COV_MAT_DEFAULT: Integer read _GetCOV_MAT_DEFAULT;
    {class} property COV_MAT_DIAGONAL: Integer read _GetCOV_MAT_DIAGONAL;
    {class} property COV_MAT_GENERIC: Integer read _GetCOV_MAT_GENERIC;
    {class} property COV_MAT_SPHERICAL: Integer read _GetCOV_MAT_SPHERICAL;
    {class} property DEFAULT_MAX_ITERS: Integer read _GetDEFAULT_MAX_ITERS;
    {class} property DEFAULT_NCLUSTERS: Integer read _GetDEFAULT_NCLUSTERS;
    {class} property START_AUTO_STEP: Integer read _GetSTART_AUTO_STEP;
    {class} property START_E_STEP: Integer read _GetSTART_E_STEP;
    {class} property START_M_STEP: Integer read _GetSTART_M_STEP;
  end;

  [JavaSignature('org/opencv/ml/EM')]
  JEM = interface(JStatModel)
    ['{47D8E639-552C-42E3-9E67-98547CCC960F}']
    function getTermCriteria: JTermCriteria; cdecl;
    function getWeights: JMat; cdecl;
    function predict(samples: JMat; results: JMat; flags: Integer): Single; cdecl; overload;
    function predict(samples: JMat; results: JMat): Single; cdecl; overload;//Deprecated
    procedure setClustersNumber(val: Integer); cdecl;//Deprecated
    function trainE(samples: JMat; means0: JMat; covs0: JMat; weights0: JMat; logLikelihoods: JMat; labels: JMat): Boolean; cdecl; overload;//Deprecated
    function trainE(samples: JMat; means0: JMat; covs0: JMat; weights0: JMat; logLikelihoods: JMat): Boolean; cdecl; overload;//Deprecated
    function trainE(samples: JMat; means0: JMat; covs0: JMat): Boolean; cdecl; overload;//Deprecated
    function trainEM(samples: JMat; logLikelihoods: JMat; labels: JMat; probs: JMat): Boolean; cdecl; overload;//Deprecated
    function trainEM(samples: JMat; logLikelihoods: JMat; labels: JMat): Boolean; cdecl; overload;//Deprecated
    function trainM(samples: JMat; probs0: JMat; logLikelihoods: JMat; labels: JMat): Boolean; cdecl; overload;
    function trainM(samples: JMat; probs0: JMat; logLikelihoods: JMat): Boolean; cdecl; overload;
    function trainM(samples: JMat; probs0: JMat): Boolean; cdecl; overload;
  end;
  TJEM = class(TJavaGenericImport<JEMClass, JEM>) end;

  JKNearestClass = interface(JStatModelClass)
    ['{8C647CD8-4186-4EBB-9D10-7FFAA73C69AD}']
    {class} function _GetBRUTE_FORCE: Integer; cdecl;
    {class} function _GetKDTREE: Integer; cdecl;
    {class} function __fromPtr__(addr: Int64): JKNearest; cdecl;
    {class} function create: JKNearest; cdecl;
    {class} function getAlgorithmType: Integer; cdecl;
    {class} function getDefaultK: Integer; cdecl;
    {class} function getEmax: Integer; cdecl;
    {class} function getIsClassifier: Boolean; cdecl;//Deprecated
    {class} function load(filepath: JString): JKNearest; cdecl;
    {class} procedure setDefaultK(val: Integer); cdecl;//Deprecated
    {class} procedure setEmax(val: Integer); cdecl;
    {class} procedure setIsClassifier(val: Boolean); cdecl;
    {class} property BRUTE_FORCE: Integer read _GetBRUTE_FORCE;
    {class} property KDTREE: Integer read _GetKDTREE;
  end;

  [JavaSignature('org/opencv/ml/KNearest')]
  JKNearest = interface(JStatModel)
    ['{CB9D46D2-1EBD-467F-BF94-EEDD66C874E9}']
    function findNearest(samples: JMat; k: Integer; results: JMat; neighborResponses: JMat; dist: JMat): Single; cdecl; overload;
    function findNearest(samples: JMat; k: Integer; results: JMat; neighborResponses: JMat): Single; cdecl; overload;//Deprecated
    function findNearest(samples: JMat; k: Integer; results: JMat): Single; cdecl; overload;//Deprecated
    procedure setAlgorithmType(val: Integer); cdecl;
  end;
  TJKNearest = class(TJavaGenericImport<JKNearestClass, JKNearest>) end;

  JLogisticRegressionClass = interface(JStatModelClass)
    ['{E6D3BE70-4785-4C06-B2A7-92853A7E4074}']
    {class} function _GetBATCH: Integer; cdecl;
    {class} function _GetMINI_BATCH: Integer; cdecl;
    {class} function _GetREG_DISABLE: Integer; cdecl;
    {class} function _GetREG_L1: Integer; cdecl;
    {class} function _GetREG_L2: Integer; cdecl;
    {class} function __fromPtr__(addr: Int64): JLogisticRegression; cdecl;//Deprecated
    {class} function create: JLogisticRegression; cdecl;//Deprecated
    {class} function getIterations: Integer; cdecl;
    {class} function getLearningRate: Double; cdecl;
    {class} function getMiniBatchSize: Integer; cdecl;
    {class} function get_learnt_thetas: JMat; cdecl;
    {class} function load(filepath: JString; nodeName: JString): JLogisticRegression; cdecl; overload;
    {class} function load(filepath: JString): JLogisticRegression; cdecl; overload;
    {class} procedure setIterations(val: Integer); cdecl;
    {class} procedure setLearningRate(val: Double); cdecl;
    {class} procedure setMiniBatchSize(val: Integer); cdecl;
    {class} procedure setTrainMethod(val: Integer); cdecl;
    {class} property BATCH: Integer read _GetBATCH;
    {class} property MINI_BATCH: Integer read _GetMINI_BATCH;
    {class} property REG_DISABLE: Integer read _GetREG_DISABLE;
    {class} property REG_L1: Integer read _GetREG_L1;
    {class} property REG_L2: Integer read _GetREG_L2;
  end;

  [JavaSignature('org/opencv/ml/LogisticRegression')]
  JLogisticRegression = interface(JStatModel)
    ['{D16CD446-D064-45AF-B133-97951DAAD9EC}']
    function getRegularization: Integer; cdecl;
    function getTermCriteria: JTermCriteria; cdecl;
    function getTrainMethod: Integer; cdecl;
    function predict(samples: JMat; results: JMat; flags: Integer): Single; cdecl; overload;
    function predict(samples: JMat; results: JMat): Single; cdecl; overload;
    function predict(samples: JMat): Single; cdecl; overload;
    procedure setRegularization(val: Integer); cdecl;
    procedure setTermCriteria(val: JTermCriteria); cdecl;
  end;
  TJLogisticRegression = class(TJavaGenericImport<JLogisticRegressionClass, JLogisticRegression>) end;

  JMlClass = interface(JObjectClass)
    ['{326D6A19-F98C-45A5-981E-F406630BAB4F}']
    {class} function _GetCOL_SAMPLE: Integer; cdecl;
    {class} function _GetROW_SAMPLE: Integer; cdecl;
    {class} function _GetTEST_ERROR: Integer; cdecl;
    {class} function _GetTRAIN_ERROR: Integer; cdecl;
    {class} function _GetVAR_CATEGORICAL: Integer; cdecl;
    {class} function _GetVAR_NUMERICAL: Integer; cdecl;
    {class} function _GetVAR_ORDERED: Integer; cdecl;
    {class} function init: JMl; cdecl;
    {class} property COL_SAMPLE: Integer read _GetCOL_SAMPLE;
    {class} property ROW_SAMPLE: Integer read _GetROW_SAMPLE;
    {class} property TEST_ERROR: Integer read _GetTEST_ERROR;
    {class} property TRAIN_ERROR: Integer read _GetTRAIN_ERROR;
    {class} property VAR_CATEGORICAL: Integer read _GetVAR_CATEGORICAL;
    {class} property VAR_NUMERICAL: Integer read _GetVAR_NUMERICAL;
    {class} property VAR_ORDERED: Integer read _GetVAR_ORDERED;
  end;

  [JavaSignature('org/opencv/ml/Ml')]
  JMl = interface(JObject)
    ['{2279ADE7-52D6-4D87-927C-FC97BC6F1EB6}']
  end;
  TJMl = class(TJavaGenericImport<JMlClass, JMl>) end;

  JNormalBayesClassifierClass = interface(JStatModelClass)
    ['{283B648D-D2FA-4E52-9FEB-C31A9E264A24}']
    {class} function __fromPtr__(addr: Int64): JNormalBayesClassifier; cdecl;
    {class} function create: JNormalBayesClassifier; cdecl;
    {class} function load(filepath: JString; nodeName: JString): JNormalBayesClassifier; cdecl; overload;
    {class} function load(filepath: JString): JNormalBayesClassifier; cdecl; overload;
    {class} function predictProb(inputs: JMat; outputs: JMat; outputProbs: JMat): Single; cdecl; overload;
  end;

  [JavaSignature('org/opencv/ml/NormalBayesClassifier')]
  JNormalBayesClassifier = interface(JStatModel)
    ['{B787B1C8-7178-4DB5-821B-EDD9F53743A8}']
    function predictProb(inputs: JMat; outputs: JMat; outputProbs: JMat; flags: Integer): Single; cdecl; overload;
  end;
  TJNormalBayesClassifier = class(TJavaGenericImport<JNormalBayesClassifierClass, JNormalBayesClassifier>) end;

  JParamGridClass = interface(JObjectClass)
    ['{DB8CC4B7-8991-4984-827D-4A615DC943DA}']
    {class} function __fromPtr__(addr: Int64): JParamGrid; cdecl;//Deprecated
    {class} function create(minVal: Double; maxVal: Double; logstep: Double): JParamGrid; cdecl; overload;//Deprecated
    {class} function create(minVal: Double; maxVal: Double): JParamGrid; cdecl; overload;//Deprecated
    {class} function create(minVal: Double): JParamGrid; cdecl; overload;//Deprecated
    {class} function create: JParamGrid; cdecl; overload;//Deprecated
    {class} function get_maxVal: Double; cdecl;
    {class} procedure set_maxVal(maxVal: Double); cdecl;//Deprecated
    {class} procedure set_minVal(minVal: Double); cdecl;//Deprecated
  end;

  [JavaSignature('org/opencv/ml/ParamGrid')]
  JParamGrid = interface(JObject)
    ['{3579806F-4BF5-404B-8903-5263C24463FC}']
    function getNativeObjAddr: Int64; cdecl;//Deprecated
    function get_logStep: Double; cdecl;//Deprecated
    function get_minVal: Double; cdecl;//Deprecated
    procedure set_logStep(logStep: Double); cdecl;
  end;
  TJParamGrid = class(TJavaGenericImport<JParamGridClass, JParamGrid>) end;

  JRTreesClass = interface(JDTreesClass)
    ['{F65162C5-D79A-457F-B09B-CEB788B1007D}']
    {class} function __fromPtr__(addr: Int64): JRTrees; cdecl;//Deprecated
    {class} function create: JRTrees; cdecl;
    {class} function load(filepath: JString; nodeName: JString): JRTrees; cdecl; overload;
    {class} function load(filepath: JString): JRTrees; cdecl; overload;
    {class} procedure setActiveVarCount(val: Integer); cdecl;
    {class} procedure setCalculateVarImportance(val: Boolean); cdecl;
  end;

  [JavaSignature('org/opencv/ml/RTrees')]
  JRTrees = interface(JDTrees)
    ['{8FE59109-A114-40E2-A1E7-9522A2398237}']
    function getActiveVarCount: Integer; cdecl;
    function getCalculateVarImportance: Boolean; cdecl;
    function getTermCriteria: JTermCriteria; cdecl;
    function getVarImportance: JMat; cdecl;
    procedure getVotes(samples: JMat; results: JMat; flags: Integer); cdecl;
    procedure setTermCriteria(val: JTermCriteria); cdecl;
  end;
  TJRTrees = class(TJavaGenericImport<JRTreesClass, JRTrees>) end;

  JSVMClass = interface(JStatModelClass)
    ['{AC54D0B6-3E45-4C38-9DBF-D0D567476852}']
    {class} function _GetC: Integer; cdecl;
    {class} function _GetCHI2: Integer; cdecl;
    {class} function _GetCOEF: Integer; cdecl;
    {class} function _GetCUSTOM: Integer; cdecl;
    {class} function _GetC_SVC: Integer; cdecl;
    {class} function _GetDEGREE: Integer; cdecl;
    {class} function _GetEPS_SVR: Integer; cdecl;
    {class} function _GetGAMMA: Integer; cdecl;
    {class} function _GetINTER: Integer; cdecl;
    {class} function _GetLINEAR: Integer; cdecl;
    {class} function _GetNU: Integer; cdecl;
    {class} function _GetNU_SVC: Integer; cdecl;
    {class} function _GetNU_SVR: Integer; cdecl;
    {class} function _GetONE_CLASS: Integer; cdecl;
    {class} function _GetP: Integer; cdecl;
    {class} function _GetPOLY: Integer; cdecl;
    {class} function _GetRBF: Integer; cdecl;
    {class} function _GetSIGMOID: Integer; cdecl;
    {class} function __fromPtr__(addr: Int64): JSVM; cdecl;
    {class} function create: JSVM; cdecl;//Deprecated
    {class} function getC: Double; cdecl;
    {class} function getClassWeights: JMat; cdecl;
    {class} function getDefaultGridPtr(param_id: Integer): JParamGrid; cdecl;
    {class} function getDegree: Double; cdecl;
    {class} function getKernelType: Integer; cdecl;
    {class} function getNu: Double; cdecl;//Deprecated
    {class} function getP: Double; cdecl;//Deprecated
    {class} function getSupportVectors: JMat; cdecl;//Deprecated
    {class} function load(filepath: JString): JSVM; cdecl;//Deprecated
    {class} procedure setC(val: Double); cdecl;//Deprecated
    {class} procedure setClassWeights(val: JMat); cdecl;//Deprecated
    {class} procedure setDegree(val: Double); cdecl;//Deprecated
    {class} procedure setKernel(kernelType: Integer); cdecl;
    {class} procedure setNu(val: Double); cdecl;
    {class} procedure setP(val: Double); cdecl;
    {class} function trainAuto(samples: JMat; layout: Integer; responses: JMat; kFold: Integer; Cgrid: JParamGrid; gammaGrid: JParamGrid; pGrid: JParamGrid; nuGrid: JParamGrid; coeffGrid: JParamGrid): Boolean; cdecl; overload;//Deprecated
    {class} function trainAuto(samples: JMat; layout: Integer; responses: JMat; kFold: Integer; Cgrid: JParamGrid; gammaGrid: JParamGrid; pGrid: JParamGrid; nuGrid: JParamGrid): Boolean; cdecl; overload;//Deprecated
    {class} function trainAuto(samples: JMat; layout: Integer; responses: JMat; kFold: Integer; Cgrid: JParamGrid; gammaGrid: JParamGrid): Boolean; cdecl; overload;//Deprecated
    {class} property C: Integer read _GetC;
    {class} property CHI2: Integer read _GetCHI2;
    {class} property COEF: Integer read _GetCOEF;
    {class} property CUSTOM: Integer read _GetCUSTOM;
    {class} property C_SVC: Integer read _GetC_SVC;
    {class} property DEGREE: Integer read _GetDEGREE;
    {class} property EPS_SVR: Integer read _GetEPS_SVR;
    {class} property GAMMA: Integer read _GetGAMMA;
    {class} property INTER: Integer read _GetINTER;
    {class} property LINEAR: Integer read _GetLINEAR;
    {class} property NU: Integer read _GetNU;
    {class} property NU_SVC: Integer read _GetNU_SVC;
    {class} property NU_SVR: Integer read _GetNU_SVR;
    {class} property ONE_CLASS: Integer read _GetONE_CLASS;
    {class} property P: Integer read _GetP;
    {class} property POLY: Integer read _GetPOLY;
    {class} property RBF: Integer read _GetRBF;
    {class} property SIGMOID: Integer read _GetSIGMOID;
  end;

  [JavaSignature('org/opencv/ml/SVM')]
  JSVM = interface(JStatModel)
    ['{E3A0D426-2493-443C-B4E5-C15C7F205FAB}']
    function getCoef0: Double; cdecl;
    function getDecisionFunction(i: Integer; alpha: JMat; svidx: JMat): Double; cdecl;//Deprecated
    function getGamma: Double; cdecl;//Deprecated
    function getTermCriteria: JTermCriteria; cdecl;//Deprecated
    function getType: Integer; cdecl;
    function getUncompressedSupportVectors: JMat; cdecl;//Deprecated
    procedure setCoef0(val: Double); cdecl;
    procedure setGamma(val: Double); cdecl;//Deprecated
    procedure setTermCriteria(val: JTermCriteria); cdecl;
    procedure setType(val: Integer); cdecl;
    function trainAuto(samples: JMat; layout: Integer; responses: JMat; kFold: Integer; Cgrid: JParamGrid; gammaGrid: JParamGrid; pGrid: JParamGrid; nuGrid: JParamGrid; coeffGrid: JParamGrid; degreeGrid: JParamGrid; balanced: Boolean): Boolean; cdecl; overload;//Deprecated
    function trainAuto(samples: JMat; layout: Integer; responses: JMat; kFold: Integer; Cgrid: JParamGrid; gammaGrid: JParamGrid; pGrid: JParamGrid; nuGrid: JParamGrid; coeffGrid: JParamGrid; degreeGrid: JParamGrid): Boolean; cdecl; overload;//Deprecated
    function trainAuto(samples: JMat; layout: Integer; responses: JMat; kFold: Integer; Cgrid: JParamGrid; gammaGrid: JParamGrid; pGrid: JParamGrid): Boolean; cdecl; overload;
    function trainAuto(samples: JMat; layout: Integer; responses: JMat; kFold: Integer; Cgrid: JParamGrid): Boolean; cdecl; overload;//Deprecated
    function trainAuto(samples: JMat; layout: Integer; responses: JMat; kFold: Integer): Boolean; cdecl; overload;//Deprecated
    function trainAuto(samples: JMat; layout: Integer; responses: JMat): Boolean; cdecl; overload;//Deprecated
  end;
  TJSVM = class(TJavaGenericImport<JSVMClass, JSVM>) end;

  JSVMSGDClass = interface(JStatModelClass)
    ['{AC4847E3-465E-4FFF-A5BE-76D00CED013F}']
    {class} function _GetASGD: Integer; cdecl;
    {class} function _GetHARD_MARGIN: Integer; cdecl;
    {class} function _GetSGD: Integer; cdecl;
    {class} function _GetSOFT_MARGIN: Integer; cdecl;
    {class} function __fromPtr__(addr: Int64): JSVMSGD; cdecl;//Deprecated
    {class} function create: JSVMSGD; cdecl;//Deprecated
    {class} function getInitialStepSize: Single; cdecl;//Deprecated
    {class} function getMarginRegularization: Single; cdecl;//Deprecated
    {class} function getMarginType: Integer; cdecl;//Deprecated
    {class} function getTermCriteria: JTermCriteria; cdecl;//Deprecated
    {class} function getWeights: JMat; cdecl;//Deprecated
    {class} function load(filepath: JString; nodeName: JString): JSVMSGD; cdecl; overload;//Deprecated
    {class} function load(filepath: JString): JSVMSGD; cdecl; overload;//Deprecated
    {class} procedure setMarginRegularization(marginRegularization: Single); cdecl;//Deprecated
    {class} procedure setMarginType(marginType: Integer); cdecl;//Deprecated
    {class} procedure setOptimalParameters(svmsgdType: Integer; marginType: Integer); cdecl; overload;//Deprecated
    {class} procedure setSvmsgdType(svmsgdType: Integer); cdecl;
    {class} procedure setTermCriteria(val: JTermCriteria); cdecl;
    {class} property ASGD: Integer read _GetASGD;
    {class} property HARD_MARGIN: Integer read _GetHARD_MARGIN;
    {class} property SGD: Integer read _GetSGD;
    {class} property SOFT_MARGIN: Integer read _GetSOFT_MARGIN;
  end;

  [JavaSignature('org/opencv/ml/SVMSGD')]
  JSVMSGD = interface(JStatModel)
    ['{1A426A2E-D0D6-47A2-AC69-2A922B4D1C21}']
    function getShift: Single; cdecl;//Deprecated
    function getStepDecreasingPower: Single; cdecl;//Deprecated
    function getSvmsgdType: Integer; cdecl;//Deprecated
    procedure setInitialStepSize(InitialStepSize: Single); cdecl;//Deprecated
    procedure setOptimalParameters(svmsgdType: Integer); cdecl; overload;//Deprecated
    procedure setOptimalParameters; cdecl; overload;//Deprecated
    procedure setStepDecreasingPower(stepDecreasingPower: Single); cdecl;//Deprecated
  end;
  TJSVMSGD = class(TJavaGenericImport<JSVMSGDClass, JSVMSGD>) end;

  JTrainDataClass = interface(JObjectClass)
    ['{6A75CB5A-AEFC-4156-AF51-C3DA2DDF9EF4}']
    {class} function __fromPtr__(addr: Int64): JTrainData; cdecl;
    {class} function create(samples: JMat; layout: Integer; responses: JMat; varIdx: JMat; sampleIdx: JMat; sampleWeights: JMat; varType: JMat): JTrainData; cdecl; overload;
    {class} function create(samples: JMat; layout: Integer; responses: JMat; varIdx: JMat; sampleIdx: JMat; sampleWeights: JMat): JTrainData; cdecl; overload;
    {class} function create(samples: JMat; layout: Integer; responses: JMat; varIdx: JMat; sampleIdx: JMat): JTrainData; cdecl; overload;
    {class} function create(samples: JMat; layout: Integer; responses: JMat; varIdx: JMat): JTrainData; cdecl; overload;
    {class} function create(samples: JMat; layout: Integer; responses: JMat): JTrainData; cdecl; overload;
    {class} function getCatCount(vi: Integer): Integer; cdecl;
    {class} function getCatMap: JMat; cdecl;
    {class} function getClassLabels: JMat; cdecl;
    {class} function getLayout: Integer; cdecl;
    {class} function getMissing: JMat; cdecl;
    {class} function getNTestSamples: Integer; cdecl;
    {class} function getNTrainSamples: Integer; cdecl;
    {class} function getResponses: JMat; cdecl;//Deprecated
    {class} procedure getSample(varIdx: JMat; sidx: Integer; buf: Single); cdecl;//Deprecated
    {class} function getSampleWeights: JMat; cdecl;//Deprecated
    {class} function getSubMatrix(matrix: JMat; idx: JMat; layout: Integer): JMat; cdecl;//Deprecated
    {class} function getSubVector(vec: JMat; idx: JMat): JMat; cdecl;//Deprecated
    {class} function getTestNormCatResponses: JMat; cdecl;//Deprecated
    {class} function getTestResponses: JMat; cdecl;//Deprecated
    {class} function getTestSampleIdx: JMat; cdecl;//Deprecated
    {class} function getTrainResponses: JMat; cdecl;//Deprecated
    {class} function getTrainSampleIdx: JMat; cdecl;//Deprecated
    {class} function getTrainSamples(layout: Integer): JMat; cdecl; overload;
    {class} function getTrainSamples: JMat; cdecl; overload;
    {class} procedure getValues(vi: Integer; sidx: JMat; values: Single); cdecl;
    {class} procedure setTrainTestSplit(count: Integer; shuffle: Boolean); cdecl; overload;
    {class} procedure setTrainTestSplit(count: Integer); cdecl; overload;
    {class} procedure setTrainTestSplitRatio(ratio: Double; shuffle: Boolean); cdecl; overload;
  end;

  [JavaSignature('org/opencv/ml/TrainData')]
  JTrainData = interface(JObject)
    ['{64E3E1B6-A625-49A4-BCD0-AD0FD19027B8}']
    function getCatOfs: JMat; cdecl;
    function getDefaultSubstValues: JMat; cdecl;
    function getNAllVars: Integer; cdecl;
    function getNSamples: Integer; cdecl;
    function getNVars: Integer; cdecl;
    procedure getNames(names: JList); cdecl;
    function getNativeObjAddr: Int64; cdecl;//Deprecated
    function getNormCatResponses: JMat; cdecl;//Deprecated
    function getResponseType: Integer; cdecl;//Deprecated
    function getSamples: JMat; cdecl;//Deprecated
    function getTestSampleWeights: JMat; cdecl;//Deprecated
    function getTestSamples: JMat; cdecl;//Deprecated
    function getTrainNormCatResponses: JMat; cdecl;//Deprecated
    function getTrainSampleWeights: JMat; cdecl;//Deprecated
    function getTrainSamples(layout: Integer; compressSamples: Boolean; compressVars: Boolean): JMat; cdecl; overload;//Deprecated
    function getTrainSamples(layout: Integer; compressSamples: Boolean): JMat; cdecl; overload;//Deprecated
    function getVarIdx: JMat; cdecl;
    function getVarSymbolFlags: JMat; cdecl;
    function getVarType: JMat; cdecl;
    procedure setTrainTestSplitRatio(ratio: Double); cdecl; overload;
    procedure shuffleTrainTest; cdecl;
  end;
  TJTrainData = class(TJavaGenericImport<JTrainDataClass, JTrainData>) end;

  JBaseCascadeClassifierClass = interface(JAlgorithmClass)
    ['{D5D0B345-8180-4670-8757-EA0E3F78B617}']
    {class} function __fromPtr__(addr: Int64): JBaseCascadeClassifier; cdecl;//Deprecated
  end;

  [JavaSignature('org/opencv/objdetect/BaseCascadeClassifier')]
  JBaseCascadeClassifier = interface(JAlgorithm)
    ['{7E95E185-B852-42F6-9BB3-3C1B053FF39C}']
  end;
  TJBaseCascadeClassifier = class(TJavaGenericImport<JBaseCascadeClassifierClass, JBaseCascadeClassifier>) end;

  JCascadeClassifierClass = interface(JObjectClass)
    ['{49776515-AC66-4C2D-BA9B-09DE0664587D}']
    {class} function init(filename: JString): JCascadeClassifier; cdecl; overload;
    {class} function init: JCascadeClassifier; cdecl; overload;
    {class} function __fromPtr__(addr: Int64): JCascadeClassifier; cdecl;
    {class} function convert(oldcascade: JString; newcascade: JString): Boolean; cdecl;//Deprecated
    {class} procedure detectMultiScale(image: JMat; objects: JMatOfRect; scaleFactor: Double; minNeighbors: Integer); cdecl; overload;//Deprecated
    {class} procedure detectMultiScale(image: JMat; objects: JMatOfRect; scaleFactor: Double); cdecl; overload;//Deprecated
    {class} procedure detectMultiScale(image: JMat; objects: JMatOfRect); cdecl; overload;//Deprecated
    {class} procedure detectMultiScale2(image: JMat; objects: JMatOfRect; numDetections: JMatOfInt; scaleFactor: Double; minNeighbors: Integer; flags: Integer; minSize: Jcore_Size); cdecl; overload;//Deprecated
    {class} procedure detectMultiScale2(image: JMat; objects: JMatOfRect; numDetections: JMatOfInt; scaleFactor: Double; minNeighbors: Integer; flags: Integer); cdecl; overload;//Deprecated
    {class} procedure detectMultiScale3(image: JMat; objects: JMatOfRect; rejectLevels: JMatOfInt; levelWeights: JMatOfDouble; scaleFactor: Double; minNeighbors: Integer; flags: Integer; minSize: Jcore_Size; maxSize: Jcore_Size; outputRejectLevels: Boolean); cdecl; overload;//Deprecated
    {class} procedure detectMultiScale3(image: JMat; objects: JMatOfRect; rejectLevels: JMatOfInt; levelWeights: JMatOfDouble; scaleFactor: Double; minNeighbors: Integer; flags: Integer; minSize: Jcore_Size; maxSize: Jcore_Size); cdecl; overload;//Deprecated
    {class} procedure detectMultiScale3(image: JMat; objects: JMatOfRect; rejectLevels: JMatOfInt; levelWeights: JMatOfDouble; scaleFactor: Double; minNeighbors: Integer; flags: Integer; minSize: Jcore_Size); cdecl; overload;//Deprecated
    {class} procedure detectMultiScale3(image: JMat; objects: JMatOfRect; rejectLevels: JMatOfInt; levelWeights: JMatOfDouble); cdecl; overload;//Deprecated
    {class} function empty: Boolean; cdecl;//Deprecated
    {class} function getFeatureType: Integer; cdecl;//Deprecated
    {class} function load(filename: JString): Boolean; cdecl;
  end;

  [JavaSignature('org/opencv/objdetect/CascadeClassifier')]
  JCascadeClassifier = interface(JObject)
    ['{51036F7E-C81C-4429-BE28-00FE50F1A70F}']
    procedure detectMultiScale(image: JMat; objects: JMatOfRect; scaleFactor: Double; minNeighbors: Integer; flags: Integer; minSize: Jcore_Size; maxSize: Jcore_Size); cdecl; overload;//Deprecated
    procedure detectMultiScale(image: JMat; objects: JMatOfRect; scaleFactor: Double; minNeighbors: Integer; flags: Integer; minSize: Jcore_Size); cdecl; overload;//Deprecated
    procedure detectMultiScale(image: JMat; objects: JMatOfRect; scaleFactor: Double; minNeighbors: Integer; flags: Integer); cdecl; overload;//Deprecated
    procedure detectMultiScale2(image: JMat; objects: JMatOfRect; numDetections: JMatOfInt; scaleFactor: Double; minNeighbors: Integer; flags: Integer; minSize: Jcore_Size; maxSize: Jcore_Size); cdecl; overload;//Deprecated
    procedure detectMultiScale2(image: JMat; objects: JMatOfRect; numDetections: JMatOfInt; scaleFactor: Double; minNeighbors: Integer); cdecl; overload;//Deprecated
    procedure detectMultiScale2(image: JMat; objects: JMatOfRect; numDetections: JMatOfInt; scaleFactor: Double); cdecl; overload;//Deprecated
    procedure detectMultiScale2(image: JMat; objects: JMatOfRect; numDetections: JMatOfInt); cdecl; overload;//Deprecated
    procedure detectMultiScale3(image: JMat; objects: JMatOfRect; rejectLevels: JMatOfInt; levelWeights: JMatOfDouble; scaleFactor: Double; minNeighbors: Integer; flags: Integer); cdecl; overload;//Deprecated
    procedure detectMultiScale3(image: JMat; objects: JMatOfRect; rejectLevels: JMatOfInt; levelWeights: JMatOfDouble; scaleFactor: Double; minNeighbors: Integer); cdecl; overload;//Deprecated
    procedure detectMultiScale3(image: JMat; objects: JMatOfRect; rejectLevels: JMatOfInt; levelWeights: JMatOfDouble; scaleFactor: Double); cdecl; overload;//Deprecated
    function getNativeObjAddr: Int64; cdecl;//Deprecated
    function getOriginalWindowSize: Jcore_Size; cdecl;//Deprecated
    function isOldFormatCascade: Boolean; cdecl;//Deprecated
  end;
  TJCascadeClassifier = class(TJavaGenericImport<JCascadeClassifierClass, JCascadeClassifier>) end;

  JHOGDescriptorClass = interface(JObjectClass)
    ['{2C12AAA4-3303-46DA-98C1-B4A3016A68FF}']
    {class} function _GetDEFAULT_NLEVELS: Integer; cdecl;
    {class} function _GetDESCR_FORMAT_COL_BY_COL: Integer; cdecl;
    {class} function _GetDESCR_FORMAT_ROW_BY_ROW: Integer; cdecl;
    {class} function _GetL2Hys: Integer; cdecl;
    {class} function init(_winSize: Jcore_Size; _blockSize: Jcore_Size; _blockStride: Jcore_Size; _cellSize: Jcore_Size; _nbins: Integer; _derivAperture: Integer; _winSigma: Double; _histogramNormType: Integer; _L2HysThreshold: Double; _gammaCorrection: Boolean; _nlevels: Integer; _signedGradient: Boolean): JHOGDescriptor; cdecl; overload;
    {class} function init(_winSize: Jcore_Size; _blockSize: Jcore_Size; _blockStride: Jcore_Size; _cellSize: Jcore_Size; _nbins: Integer; _derivAperture: Integer; _winSigma: Double; _histogramNormType: Integer; _L2HysThreshold: Double; _gammaCorrection: Boolean; _nlevels: Integer): JHOGDescriptor; cdecl; overload;
    {class} function init(_winSize: Jcore_Size; _blockSize: Jcore_Size; _blockStride: Jcore_Size; _cellSize: Jcore_Size; _nbins: Integer; _derivAperture: Integer; _winSigma: Double; _histogramNormType: Integer; _L2HysThreshold: Double; _gammaCorrection: Boolean): JHOGDescriptor; cdecl; overload;
    {class} function init(_winSize: Jcore_Size; _blockSize: Jcore_Size; _blockStride: Jcore_Size; _cellSize: Jcore_Size; _nbins: Integer; _derivAperture: Integer; _winSigma: Double; _histogramNormType: Integer; _L2HysThreshold: Double): JHOGDescriptor; cdecl; overload;
    {class} function init(_winSize: Jcore_Size; _blockSize: Jcore_Size; _blockStride: Jcore_Size; _cellSize: Jcore_Size; _nbins: Integer; _derivAperture: Integer; _winSigma: Double; _histogramNormType: Integer): JHOGDescriptor; cdecl; overload;
    {class} function init(_winSize: Jcore_Size; _blockSize: Jcore_Size; _blockStride: Jcore_Size; _cellSize: Jcore_Size; _nbins: Integer; _derivAperture: Integer; _winSigma: Double): JHOGDescriptor; cdecl; overload;
    {class} function init(_winSize: Jcore_Size; _blockSize: Jcore_Size; _blockStride: Jcore_Size; _cellSize: Jcore_Size; _nbins: Integer; _derivAperture: Integer): JHOGDescriptor; cdecl; overload;
    {class} function init(_winSize: Jcore_Size; _blockSize: Jcore_Size; _blockStride: Jcore_Size; _cellSize: Jcore_Size; _nbins: Integer): JHOGDescriptor; cdecl; overload;
    {class} function init(filename: JString): JHOGDescriptor; cdecl; overload;
    {class} function init: JHOGDescriptor; cdecl; overload;
    {class} function __fromPtr__(addr: Int64): JHOGDescriptor; cdecl;
    {class} procedure computeGradient(img: JMat; grad: JMat; angleOfs: JMat); cdecl; overload;
    {class} procedure detect(img: JMat; foundLocations: JMatOfPoint; weights: JMatOfDouble; hitThreshold: Double; winStride: Jcore_Size; padding: Jcore_Size); cdecl; overload;
    {class} procedure detect(img: JMat; foundLocations: JMatOfPoint; weights: JMatOfDouble; hitThreshold: Double; winStride: Jcore_Size); cdecl; overload;
    {class} procedure detect(img: JMat; foundLocations: JMatOfPoint; weights: JMatOfDouble; hitThreshold: Double); cdecl; overload;
    {class} procedure detectMultiScale(img: JMat; foundLocations: JMatOfRect; foundWeights: JMatOfDouble; hitThreshold: Double; winStride: Jcore_Size; padding: Jcore_Size; scale: Double; finalThreshold: Double); cdecl; overload;
    {class} procedure detectMultiScale(img: JMat; foundLocations: JMatOfRect; foundWeights: JMatOfDouble; hitThreshold: Double; winStride: Jcore_Size; padding: Jcore_Size); cdecl; overload;
    {class} procedure detectMultiScale(img: JMat; foundLocations: JMatOfRect; foundWeights: JMatOfDouble; hitThreshold: Double; winStride: Jcore_Size); cdecl; overload;
    {class} procedure detectMultiScale(img: JMat; foundLocations: JMatOfRect; foundWeights: JMatOfDouble); cdecl; overload;
    {class} function getDaimlerPeopleDetector: JMatOfFloat; cdecl;
    {class} function getDefaultPeopleDetector: JMatOfFloat; cdecl;
    {class} function get_L2HysThreshold: Double; cdecl;//Deprecated
    {class} function get_blockSize: Jcore_Size; cdecl;//Deprecated
    {class} function get_blockStride: Jcore_Size; cdecl;//Deprecated
    {class} function get_histogramNormType: Integer; cdecl;//Deprecated
    {class} function get_nbins: Integer; cdecl;//Deprecated
    {class} function get_nlevels: Integer; cdecl;//Deprecated
    {class} function get_svmDetector: JMatOfFloat; cdecl;//Deprecated
    {class} function load(filename: JString; objname: JString): Boolean; cdecl; overload;//Deprecated
    {class} function load(filename: JString): Boolean; cdecl; overload;//Deprecated
    {class} procedure save(filename: JString; objname: JString); cdecl; overload;//Deprecated
    {class} procedure save(filename: JString); cdecl; overload;//Deprecated
    {class} property DEFAULT_NLEVELS: Integer read _GetDEFAULT_NLEVELS;
    {class} property DESCR_FORMAT_COL_BY_COL: Integer read _GetDESCR_FORMAT_COL_BY_COL;
    {class} property DESCR_FORMAT_ROW_BY_ROW: Integer read _GetDESCR_FORMAT_ROW_BY_ROW;
    {class} property L2Hys: Integer read _GetL2Hys;
  end;

  [JavaSignature('org/opencv/objdetect/HOGDescriptor')]
  JHOGDescriptor = interface(JObject)
    ['{2CC3A9FF-E844-468F-9E39-887F7CAC0C57}']
    function checkDetectorSize: Boolean; cdecl;//Deprecated
    procedure compute(img: JMat; descriptors: JMatOfFloat; winStride: Jcore_Size; padding: Jcore_Size; locations: JMatOfPoint); cdecl; overload;
    procedure compute(img: JMat; descriptors: JMatOfFloat; winStride: Jcore_Size; padding: Jcore_Size); cdecl; overload;
    procedure compute(img: JMat; descriptors: JMatOfFloat; winStride: Jcore_Size); cdecl; overload;
    procedure compute(img: JMat; descriptors: JMatOfFloat); cdecl; overload;
    procedure computeGradient(img: JMat; grad: JMat; angleOfs: JMat; paddingTL: Jcore_Size; paddingBR: Jcore_Size); cdecl; overload;
    procedure computeGradient(img: JMat; grad: JMat; angleOfs: JMat; paddingTL: Jcore_Size); cdecl; overload;
    procedure detect(img: JMat; foundLocations: JMatOfPoint; weights: JMatOfDouble; hitThreshold: Double; winStride: Jcore_Size; padding: Jcore_Size; searchLocations: JMatOfPoint); cdecl; overload;
    procedure detect(img: JMat; foundLocations: JMatOfPoint; weights: JMatOfDouble); cdecl; overload;
    procedure detectMultiScale(img: JMat; foundLocations: JMatOfRect; foundWeights: JMatOfDouble; hitThreshold: Double; winStride: Jcore_Size; padding: Jcore_Size; scale: Double; finalThreshold: Double; useMeanshiftGrouping: Boolean); cdecl; overload;
    procedure detectMultiScale(img: JMat; foundLocations: JMatOfRect; foundWeights: JMatOfDouble; hitThreshold: Double; winStride: Jcore_Size; padding: Jcore_Size; scale: Double); cdecl; overload;
    procedure detectMultiScale(img: JMat; foundLocations: JMatOfRect; foundWeights: JMatOfDouble; hitThreshold: Double); cdecl; overload;
    function getDescriptorSize: Int64; cdecl;
    function getNativeObjAddr: Int64; cdecl;
    function getWinSigma: Double; cdecl;
    function get_cellSize: Jcore_Size; cdecl;//Deprecated
    function get_derivAperture: Integer; cdecl;//Deprecated
    function get_gammaCorrection: Boolean; cdecl;//Deprecated
    function get_signedGradient: Boolean; cdecl;//Deprecated
    function get_winSigma: Double; cdecl;//Deprecated
    function get_winSize: Jcore_Size; cdecl;//Deprecated
    procedure setSVMDetector(svmdetector: JMat); cdecl;//Deprecated
  end;
  TJHOGDescriptor = class(TJavaGenericImport<JHOGDescriptorClass, JHOGDescriptor>) end;

  JObjdetectClass = interface(JObjectClass)
    ['{296CE44E-099D-4F0A-A050-6F05584ED773}']
    {class} function _GetCASCADE_DO_CANNY_PRUNING: Integer; cdecl;
    {class} function _GetCASCADE_DO_ROUGH_SEARCH: Integer; cdecl;
    {class} function _GetCASCADE_FIND_BIGGEST_OBJECT: Integer; cdecl;
    {class} function _GetCASCADE_SCALE_IMAGE: Integer; cdecl;
    {class} function _GetDetectionBasedTracker_DETECTED: Integer; cdecl;
    {class} function _GetDetectionBasedTracker_DETECTED_NOT_SHOWN_YET: Integer; cdecl;
    {class} function _GetDetectionBasedTracker_DETECTED_TEMPORARY_LOST: Integer; cdecl;
    {class} function _GetDetectionBasedTracker_WRONG_OBJECT: Integer; cdecl;
    {class} function init: JObjdetect; cdecl;
    {class} procedure groupRectangles(rectList: JMatOfRect; weights: JMatOfInt; groupThreshold: Integer; eps: Double); cdecl; overload;//Deprecated
    {class} procedure groupRectangles(rectList: JMatOfRect; weights: JMatOfInt; groupThreshold: Integer); cdecl; overload;//Deprecated
    {class} property CASCADE_DO_CANNY_PRUNING: Integer read _GetCASCADE_DO_CANNY_PRUNING;
    {class} property CASCADE_DO_ROUGH_SEARCH: Integer read _GetCASCADE_DO_ROUGH_SEARCH;
    {class} property CASCADE_FIND_BIGGEST_OBJECT: Integer read _GetCASCADE_FIND_BIGGEST_OBJECT;
    {class} property CASCADE_SCALE_IMAGE: Integer read _GetCASCADE_SCALE_IMAGE;
    {class} property DetectionBasedTracker_DETECTED: Integer read _GetDetectionBasedTracker_DETECTED;
    {class} property DetectionBasedTracker_DETECTED_NOT_SHOWN_YET: Integer read _GetDetectionBasedTracker_DETECTED_NOT_SHOWN_YET;
    {class} property DetectionBasedTracker_DETECTED_TEMPORARY_LOST: Integer read _GetDetectionBasedTracker_DETECTED_TEMPORARY_LOST;
    {class} property DetectionBasedTracker_WRONG_OBJECT: Integer read _GetDetectionBasedTracker_WRONG_OBJECT;
  end;

  [JavaSignature('org/opencv/objdetect/Objdetect')]
  JObjdetect = interface(JObject)
    ['{8718756E-DC0D-43BC-83E2-C1023AE12871}']
  end;
  TJObjdetect = class(TJavaGenericImport<JObjdetectClass, JObjdetect>) end;

  JQRCodeDetectorClass = interface(JObjectClass)
    ['{59BE6EFD-B363-44B1-81DA-BF2C9D7B5DE2}']
    {class} function init: JQRCodeDetector; cdecl;
    {class} function __fromPtr__(addr: Int64): JQRCodeDetector; cdecl;//Deprecated
    {class} function detect(img: JMat; points: JMat): Boolean; cdecl;
    {class} function detectAndDecode(img: JMat; points: JMat; straight_qrcode: JMat): JString; cdecl; overload;
    {class} function detectAndDecode(img: JMat; points: JMat): JString; cdecl; overload;
    {class} procedure setEpsY(epsY: Double); cdecl;
  end;

  [JavaSignature('org/opencv/objdetect/QRCodeDetector')]
  JQRCodeDetector = interface(JObject)
    ['{4B3099C7-A84D-4299-A8BB-59A9E439F70E}']
    function decode(img: JMat; points: JMat; straight_qrcode: JMat): JString; cdecl; overload;//Deprecated
    function decode(img: JMat; points: JMat): JString; cdecl; overload;//Deprecated
    function detectAndDecode(img: JMat): JString; cdecl; overload;
    function getNativeObjAddr: Int64; cdecl;
    procedure setEpsX(epsX: Double); cdecl;
  end;
  TJQRCodeDetector = class(TJavaGenericImport<JQRCodeDetectorClass, JQRCodeDetector>) end;

  JOpenCVInterfaceClass = interface(IJavaClass)
    ['{F1715727-AB59-41AE-B6E7-0B14FD6C22FC}']
  end;

  [JavaSignature('org/opencv/osgi/OpenCVInterface')]
  JOpenCVInterface = interface(IJavaInstance)
    ['{041132CE-ADD4-49A3-8346-008507F35D53}']
  end;
  TJOpenCVInterface = class(TJavaGenericImport<JOpenCVInterfaceClass, JOpenCVInterface>) end;

  JOpenCVNativeLoaderClass = interface(JObjectClass)
    ['{B37283C3-489F-47AD-A7B8-C8E4E56BE3FB}']
    {class} function init: JOpenCVNativeLoader; cdecl;
  end;

  [JavaSignature('org/opencv/osgi/OpenCVNativeLoader')]
  JOpenCVNativeLoader = interface(JObject)
    ['{531532F5-A565-45EB-A2F3-BDAFD5A11EC7}']
  end;
  TJOpenCVNativeLoader = class(TJavaGenericImport<JOpenCVNativeLoaderClass, JOpenCVNativeLoader>) end;

  JAlignExposuresClass = interface(JAlgorithmClass)
    ['{F10E6DEE-484A-4FCC-A9C2-C6CCFD3B2110}']
    {class} function __fromPtr__(addr: Int64): JAlignExposures; cdecl;
  end;

  [JavaSignature('org/opencv/photo/AlignExposures')]
  JAlignExposures = interface(JAlgorithm)
    ['{7AA34C77-356B-4296-B50E-91D3912E7FCE}']
    procedure process(src: JList; dst: JList; times: JMat; response: JMat); cdecl;
  end;
  TJAlignExposures = class(TJavaGenericImport<JAlignExposuresClass, JAlignExposures>) end;

  JAlignMTBClass = interface(JAlignExposuresClass)
    ['{A131F5B1-53B0-4D1E-A1B1-FB592DEA1F46}']
    {class} function __fromPtr__(addr: Int64): JAlignMTB; cdecl;
    {class} function getCut: Boolean; cdecl;//Deprecated
    {class} function getExcludeRange: Integer; cdecl;//Deprecated
    {class} function getMaxBits: Integer; cdecl;//Deprecated
    {class} procedure setExcludeRange(exclude_range: Integer); cdecl;//Deprecated
    {class} procedure setMaxBits(max_bits: Integer); cdecl;//Deprecated
    {class} procedure shiftMat(src: JMat; dst: JMat; shift: Jcore_Point); cdecl;//Deprecated
  end;

  [JavaSignature('org/opencv/photo/AlignMTB')]
  JAlignMTB = interface(JAlignExposures)
    ['{D2E44E0E-52DD-4D27-BB0C-011EFBE0C7CC}']
    function calculateShift(img0: JMat; img1: JMat): Jcore_Point; cdecl;
    procedure computeBitmaps(img: JMat; tb: JMat; eb: JMat); cdecl;
    procedure process(src: JList; dst: JList; times: JMat; response: JMat); cdecl; overload;//Deprecated
    procedure process(src: JList; dst: JList); cdecl; overload;//Deprecated
    procedure setCut(value: Boolean); cdecl;//Deprecated
  end;
  TJAlignMTB = class(TJavaGenericImport<JAlignMTBClass, JAlignMTB>) end;

  JCalibrateCRFClass = interface(JAlgorithmClass)
    ['{7907C77A-4BDB-43E2-8B84-232385D66B62}']
    {class} function __fromPtr__(addr: Int64): JCalibrateCRF; cdecl;
    {class} procedure process(src: JList; dst: JMat; times: JMat); cdecl;
  end;

  [JavaSignature('org/opencv/photo/CalibrateCRF')]
  JCalibrateCRF = interface(JAlgorithm)
    ['{10A8B7A7-3602-47E3-90BE-56CEC375ECAE}']
  end;
  TJCalibrateCRF = class(TJavaGenericImport<JCalibrateCRFClass, JCalibrateCRF>) end;

  JCalibrateDebevecClass = interface(JCalibrateCRFClass)
    ['{AF741BAF-D68F-4FEA-BF27-EC94FC9FDE0B}']
    {class} function __fromPtr__(addr: Int64): JCalibrateDebevec; cdecl;//Deprecated
    {class} function getRandom: Boolean; cdecl;//Deprecated
    {class} function getSamples: Integer; cdecl;//Deprecated
    {class} procedure setLambda(lambda: Single); cdecl;//Deprecated
    {class} procedure setSamples(samples: Integer); cdecl;//Deprecated
  end;

  [JavaSignature('org/opencv/photo/CalibrateDebevec')]
  JCalibrateDebevec = interface(JCalibrateCRF)
    ['{CD503EDD-1184-4F4E-A84F-FE06737A1347}']
    function getLambda: Single; cdecl;
    procedure setRandom(random: Boolean); cdecl;//Deprecated
  end;
  TJCalibrateDebevec = class(TJavaGenericImport<JCalibrateDebevecClass, JCalibrateDebevec>) end;

  JCalibrateRobertsonClass = interface(JCalibrateCRFClass)
    ['{51022635-557F-4040-8231-DB7573A9D2B0}']
    {class} function __fromPtr__(addr: Int64): JCalibrateRobertson; cdecl;//Deprecated
    {class} function getRadiance: JMat; cdecl;//Deprecated
    {class} function getThreshold: Single; cdecl;//Deprecated
  end;

  [JavaSignature('org/opencv/photo/CalibrateRobertson')]
  JCalibrateRobertson = interface(JCalibrateCRF)
    ['{064FCD6E-8BF0-4CF7-A3CA-D741CEB01147}']
    function getMaxIter: Integer; cdecl;//Deprecated
    procedure setMaxIter(max_iter: Integer); cdecl;
    procedure setThreshold(threshold: Single); cdecl;
  end;
  TJCalibrateRobertson = class(TJavaGenericImport<JCalibrateRobertsonClass, JCalibrateRobertson>) end;

  JMergeExposuresClass = interface(JAlgorithmClass)
    ['{DC9841B1-694D-4E44-A10E-43DF4C9F7F45}']
    {class} function __fromPtr__(addr: Int64): JMergeExposures; cdecl;
  end;

  [JavaSignature('org/opencv/photo/MergeExposures')]
  JMergeExposures = interface(JAlgorithm)
    ['{E8286BF3-C447-44DC-8FA8-7230824418A4}']
    procedure process(src: JList; dst: JMat; times: JMat; response: JMat); cdecl;//Deprecated
  end;
  TJMergeExposures = class(TJavaGenericImport<JMergeExposuresClass, JMergeExposures>) end;

  JMergeDebevecClass = interface(JMergeExposuresClass)
    ['{8CF4912F-C72C-48C3-9CB5-4E6EBBCEDF6B}']
    {class} function __fromPtr__(addr: Int64): JMergeDebevec; cdecl;
  end;

  [JavaSignature('org/opencv/photo/MergeDebevec')]
  JMergeDebevec = interface(JMergeExposures)
    ['{3DC888B6-6CB7-4801-9D6C-46672A846064}']
    procedure process(src: JList; dst: JMat; times: JMat; response: JMat); cdecl; overload;
    procedure process(src: JList; dst: JMat; times: JMat); cdecl; overload;
  end;
  TJMergeDebevec = class(TJavaGenericImport<JMergeDebevecClass, JMergeDebevec>) end;

  JMergeMertensClass = interface(JMergeExposuresClass)
    ['{6A3B9C1D-0F16-4ED6-B2FD-AF0A6E22C346}']
    {class} function __fromPtr__(addr: Int64): JMergeMertens; cdecl;//Deprecated
    {class} function getContrastWeight: Single; cdecl;//Deprecated
    {class} function getExposureWeight: Single; cdecl;//Deprecated
    {class} function getSaturationWeight: Single; cdecl;//Deprecated
    {class} procedure setExposureWeight(exposure_weight: Single); cdecl;
    {class} procedure setSaturationWeight(saturation_weight: Single); cdecl;
  end;

  [JavaSignature('org/opencv/photo/MergeMertens')]
  JMergeMertens = interface(JMergeExposures)
    ['{F631505C-354D-41D7-A6F8-C46F8C13D5DC}']
    procedure process(src: JList; dst: JMat; times: JMat; response: JMat); cdecl; overload;//Deprecated
    procedure process(src: JList; dst: JMat); cdecl; overload;//Deprecated
    procedure setContrastWeight(contrast_weiht: Single); cdecl;//Deprecated
  end;
  TJMergeMertens = class(TJavaGenericImport<JMergeMertensClass, JMergeMertens>) end;

  JMergeRobertsonClass = interface(JMergeExposuresClass)
    ['{F0DC4278-AF41-40B7-AC88-82B81C89089F}']
    {class} function __fromPtr__(addr: Int64): JMergeRobertson; cdecl;
    {class} procedure process(src: JList; dst: JMat; times: JMat; response: JMat); cdecl; overload;
  end;

  [JavaSignature('org/opencv/photo/MergeRobertson')]
  JMergeRobertson = interface(JMergeExposures)
    ['{2131EB06-A03C-45AE-BA58-6FE1016BB1CC}']
    procedure process(src: JList; dst: JMat; times: JMat); cdecl; overload;
  end;
  TJMergeRobertson = class(TJavaGenericImport<JMergeRobertsonClass, JMergeRobertson>) end;

  JPhotoClass = interface(JObjectClass)
    ['{7A36841C-B336-4ED6-9A76-471723B07D34}']
    {class} function _GetINPAINT_NS: Integer; cdecl;
    {class} function _GetINPAINT_TELEA: Integer; cdecl;
    {class} function _GetLDR_SIZE: Integer; cdecl;
    {class} function _GetMIXED_CLONE: Integer; cdecl;
    {class} function _GetMONOCHROME_TRANSFER: Integer; cdecl;
    {class} function _GetNORMAL_CLONE: Integer; cdecl;
    {class} function _GetNORMCONV_FILTER: Integer; cdecl;
    {class} function _GetRECURS_FILTER: Integer; cdecl;
    {class} function init: JPhoto; cdecl;
    {class} procedure colorChange(src: JMat; mask: JMat; dst: JMat; red_mul: Single; green_mul: Single; blue_mul: Single); cdecl; overload;//Deprecated
    {class} procedure colorChange(src: JMat; mask: JMat; dst: JMat; red_mul: Single; green_mul: Single); cdecl; overload;//Deprecated
    {class} procedure colorChange(src: JMat; mask: JMat; dst: JMat; red_mul: Single); cdecl; overload;//Deprecated
    {class} procedure colorChange(src: JMat; mask: JMat; dst: JMat); cdecl; overload;//Deprecated
    {class} function createAlignMTB(max_bits: Integer; exclude_range: Integer; cut: Boolean): JAlignMTB; cdecl; overload;//Deprecated
    {class} function createAlignMTB(max_bits: Integer; exclude_range: Integer): JAlignMTB; cdecl; overload;//Deprecated
    {class} function createAlignMTB(max_bits: Integer): JAlignMTB; cdecl; overload;//Deprecated
    {class} function createAlignMTB: JAlignMTB; cdecl; overload;//Deprecated
    {class} function createCalibrateDebevec(samples: Integer; lambda: Single; random: Boolean): JCalibrateDebevec; cdecl; overload;//Deprecated
    {class} function createCalibrateDebevec(samples: Integer; lambda: Single): JCalibrateDebevec; cdecl; overload;//Deprecated
    {class} function createCalibrateDebevec(samples: Integer): JCalibrateDebevec; cdecl; overload;//Deprecated
    {class} function createCalibrateDebevec: JCalibrateDebevec; cdecl; overload;//Deprecated
    {class} function createCalibrateRobertson(max_iter: Integer; threshold: Single): JCalibrateRobertson; cdecl; overload;//Deprecated
    {class} function createCalibrateRobertson(max_iter: Integer): JCalibrateRobertson; cdecl; overload;//Deprecated
    {class} function createCalibrateRobertson: JCalibrateRobertson; cdecl; overload;//Deprecated
    {class} function createMergeDebevec: JMergeDebevec; cdecl;//Deprecated
    {class} function createMergeMertens(contrast_weight: Single; saturation_weight: Single; exposure_weight: Single): JMergeMertens; cdecl; overload;//Deprecated
    {class} function createMergeMertens(contrast_weight: Single; saturation_weight: Single): JMergeMertens; cdecl; overload;//Deprecated
    {class} function createMergeMertens(contrast_weight: Single): JMergeMertens; cdecl; overload;//Deprecated
    {class} function createMergeMertens: JMergeMertens; cdecl; overload;//Deprecated
    {class} function createMergeRobertson: JMergeRobertson; cdecl;//Deprecated
    {class} function createTonemap(gamma: Single): JTonemap; cdecl; overload;//Deprecated
    {class} function createTonemap: JTonemap; cdecl; overload;
    {class} function createTonemapDrago(gamma: Single; saturation: Single; bias: Single): JTonemapDrago; cdecl; overload;
    {class} function createTonemapDrago(gamma: Single; saturation: Single): JTonemapDrago; cdecl; overload;
    {class} function createTonemapDrago(gamma: Single): JTonemapDrago; cdecl; overload;
    {class} function createTonemapDrago: JTonemapDrago; cdecl; overload;
    {class} function createTonemapMantiuk(gamma: Single; scale: Single; saturation: Single): JTonemapMantiuk; cdecl; overload;
    {class} function createTonemapMantiuk(gamma: Single; scale: Single): JTonemapMantiuk; cdecl; overload;
    {class} function createTonemapMantiuk(gamma: Single): JTonemapMantiuk; cdecl; overload;
    {class} function createTonemapMantiuk: JTonemapMantiuk; cdecl; overload;
    {class} function createTonemapReinhard(gamma: Single; intensity: Single; light_adapt: Single; color_adapt: Single): JTonemapReinhard; cdecl; overload;//Deprecated
    {class} function createTonemapReinhard(gamma: Single; intensity: Single; light_adapt: Single): JTonemapReinhard; cdecl; overload;
    {class} function createTonemapReinhard(gamma: Single; intensity: Single): JTonemapReinhard; cdecl; overload;//Deprecated
    {class} function createTonemapReinhard(gamma: Single): JTonemapReinhard; cdecl; overload;//Deprecated
    {class} function createTonemapReinhard: JTonemapReinhard; cdecl; overload;
    {class} procedure decolor(src: JMat; grayscale: JMat; color_boost: JMat); cdecl;//Deprecated
    {class} procedure denoise_TVL1(observations: JList; result: JMat; lambda: Double; niters: Integer); cdecl; overload;
    {class} procedure denoise_TVL1(observations: JList; result: JMat; lambda: Double); cdecl; overload;//Deprecated
    {class} procedure denoise_TVL1(observations: JList; result: JMat); cdecl; overload;//Deprecated
    {class} procedure detailEnhance(src: JMat; dst: JMat; sigma_s: Single; sigma_r: Single); cdecl; overload;
    {class} procedure detailEnhance(src: JMat; dst: JMat; sigma_s: Single); cdecl; overload;//Deprecated
    {class} procedure detailEnhance(src: JMat; dst: JMat); cdecl; overload;//Deprecated
    {class} procedure edgePreservingFilter(src: JMat; dst: JMat; flags: Integer; sigma_s: Single; sigma_r: Single); cdecl; overload;
    {class} procedure edgePreservingFilter(src: JMat; dst: JMat; flags: Integer; sigma_s: Single); cdecl; overload;//Deprecated
    {class} procedure edgePreservingFilter(src: JMat; dst: JMat; flags: Integer); cdecl; overload;//Deprecated
    {class} procedure edgePreservingFilter(src: JMat; dst: JMat); cdecl; overload;//Deprecated
    {class} procedure fastNlMeansDenoising(src: JMat; dst: JMat; h: Single; templateWindowSize: Integer; searchWindowSize: Integer); cdecl; overload;
    {class} procedure fastNlMeansDenoising(src: JMat; dst: JMat; h: Single; templateWindowSize: Integer); cdecl; overload;//Deprecated
    {class} procedure fastNlMeansDenoising(src: JMat; dst: JMat; h: Single); cdecl; overload;//Deprecated
    {class} procedure fastNlMeansDenoising(src: JMat; dst: JMat); cdecl; overload;//Deprecated
    {class} procedure fastNlMeansDenoising(src: JMat; dst: JMat; h: JMatOfFloat; templateWindowSize: Integer; searchWindowSize: Integer; normType: Integer); cdecl; overload;
    {class} procedure fastNlMeansDenoising(src: JMat; dst: JMat; h: JMatOfFloat; templateWindowSize: Integer; searchWindowSize: Integer); cdecl; overload;//Deprecated
    {class} procedure fastNlMeansDenoising(src: JMat; dst: JMat; h: JMatOfFloat; templateWindowSize: Integer); cdecl; overload;//Deprecated
    {class} procedure fastNlMeansDenoising(src: JMat; dst: JMat; h: JMatOfFloat); cdecl; overload;
    {class} procedure fastNlMeansDenoisingColored(src: JMat; dst: JMat; h: Single; hColor: Single; templateWindowSize: Integer; searchWindowSize: Integer); cdecl; overload;//Deprecated
    {class} procedure fastNlMeansDenoisingColored(src: JMat; dst: JMat; h: Single; hColor: Single; templateWindowSize: Integer); cdecl; overload;//Deprecated
    {class} procedure fastNlMeansDenoisingColored(src: JMat; dst: JMat; h: Single; hColor: Single); cdecl; overload;
    {class} procedure fastNlMeansDenoisingColored(src: JMat; dst: JMat; h: Single); cdecl; overload;//Deprecated
    {class} procedure fastNlMeansDenoisingColored(src: JMat; dst: JMat); cdecl; overload;
    {class} procedure fastNlMeansDenoisingColoredMulti(srcImgs: JList; dst: JMat; imgToDenoiseIndex: Integer; temporalWindowSize: Integer; h: Single; hColor: Single; templateWindowSize: Integer; searchWindowSize: Integer); cdecl; overload;
    {class} procedure fastNlMeansDenoisingColoredMulti(srcImgs: JList; dst: JMat; imgToDenoiseIndex: Integer; temporalWindowSize: Integer; h: Single; hColor: Single; templateWindowSize: Integer); cdecl; overload;
    {class} procedure fastNlMeansDenoisingColoredMulti(srcImgs: JList; dst: JMat; imgToDenoiseIndex: Integer; temporalWindowSize: Integer; h: Single; hColor: Single); cdecl; overload;
    {class} procedure fastNlMeansDenoisingColoredMulti(srcImgs: JList; dst: JMat; imgToDenoiseIndex: Integer; temporalWindowSize: Integer; h: Single); cdecl; overload;
    {class} procedure fastNlMeansDenoisingColoredMulti(srcImgs: JList; dst: JMat; imgToDenoiseIndex: Integer; temporalWindowSize: Integer); cdecl; overload;
    {class} procedure fastNlMeansDenoisingMulti(srcImgs: JList; dst: JMat; imgToDenoiseIndex: Integer; temporalWindowSize: Integer; h: Single; templateWindowSize: Integer; searchWindowSize: Integer); cdecl; overload;
    {class} procedure fastNlMeansDenoisingMulti(srcImgs: JList; dst: JMat; imgToDenoiseIndex: Integer; temporalWindowSize: Integer; h: Single; templateWindowSize: Integer); cdecl; overload;
    {class} procedure fastNlMeansDenoisingMulti(srcImgs: JList; dst: JMat; imgToDenoiseIndex: Integer; temporalWindowSize: Integer; h: Single); cdecl; overload;
    {class} procedure fastNlMeansDenoisingMulti(srcImgs: JList; dst: JMat; imgToDenoiseIndex: Integer; temporalWindowSize: Integer); cdecl; overload;
    {class} procedure fastNlMeansDenoisingMulti(srcImgs: JList; dst: JMat; imgToDenoiseIndex: Integer; temporalWindowSize: Integer; h: JMatOfFloat; templateWindowSize: Integer; searchWindowSize: Integer; normType: Integer); cdecl; overload;
    {class} procedure fastNlMeansDenoisingMulti(srcImgs: JList; dst: JMat; imgToDenoiseIndex: Integer; temporalWindowSize: Integer; h: JMatOfFloat; templateWindowSize: Integer; searchWindowSize: Integer); cdecl; overload;
    {class} procedure fastNlMeansDenoisingMulti(srcImgs: JList; dst: JMat; imgToDenoiseIndex: Integer; temporalWindowSize: Integer; h: JMatOfFloat; templateWindowSize: Integer); cdecl; overload;
    {class} procedure fastNlMeansDenoisingMulti(srcImgs: JList; dst: JMat; imgToDenoiseIndex: Integer; temporalWindowSize: Integer; h: JMatOfFloat); cdecl; overload;
    {class} procedure illuminationChange(src: JMat; mask: JMat; dst: JMat; alpha: Single; beta: Single); cdecl; overload;
    {class} procedure illuminationChange(src: JMat; mask: JMat; dst: JMat; alpha: Single); cdecl; overload;
    {class} procedure illuminationChange(src: JMat; mask: JMat; dst: JMat); cdecl; overload;
    {class} procedure inpaint(src: JMat; inpaintMask: JMat; dst: JMat; inpaintRadius: Double; flags: Integer); cdecl;
    {class} procedure pencilSketch(src: JMat; dst1: JMat; dst2: JMat; sigma_s: Single; sigma_r: Single; shade_factor: Single); cdecl; overload;
    {class} procedure pencilSketch(src: JMat; dst1: JMat; dst2: JMat; sigma_s: Single; sigma_r: Single); cdecl; overload;
    {class} procedure pencilSketch(src: JMat; dst1: JMat; dst2: JMat; sigma_s: Single); cdecl; overload;
    {class} procedure pencilSketch(src: JMat; dst1: JMat; dst2: JMat); cdecl; overload;
    {class} procedure seamlessClone(src: JMat; dst: JMat; mask: JMat; p: Jcore_Point; blend: JMat; flags: Integer); cdecl;
    {class} procedure stylization(src: JMat; dst: JMat; sigma_s: Single; sigma_r: Single); cdecl; overload;
    {class} procedure stylization(src: JMat; dst: JMat; sigma_s: Single); cdecl; overload;
    {class} procedure stylization(src: JMat; dst: JMat); cdecl; overload;//Deprecated
    {class} procedure textureFlattening(src: JMat; mask: JMat; dst: JMat; low_threshold: Single; high_threshold: Single; kernel_size: Integer); cdecl; overload;//Deprecated
    {class} procedure textureFlattening(src: JMat; mask: JMat; dst: JMat; low_threshold: Single; high_threshold: Single); cdecl; overload;//Deprecated
    {class} procedure textureFlattening(src: JMat; mask: JMat; dst: JMat; low_threshold: Single); cdecl; overload;//Deprecated
    {class} procedure textureFlattening(src: JMat; mask: JMat; dst: JMat); cdecl; overload;//Deprecated
    {class} property INPAINT_NS: Integer read _GetINPAINT_NS;
    {class} property INPAINT_TELEA: Integer read _GetINPAINT_TELEA;
    {class} property LDR_SIZE: Integer read _GetLDR_SIZE;
    {class} property MIXED_CLONE: Integer read _GetMIXED_CLONE;
    {class} property MONOCHROME_TRANSFER: Integer read _GetMONOCHROME_TRANSFER;
    {class} property NORMAL_CLONE: Integer read _GetNORMAL_CLONE;
    {class} property NORMCONV_FILTER: Integer read _GetNORMCONV_FILTER;
    {class} property RECURS_FILTER: Integer read _GetRECURS_FILTER;
  end;

  [JavaSignature('org/opencv/photo/Photo')]
  JPhoto = interface(JObject)
    ['{B595ACAA-7FA7-4E7D-893D-6D16857D1BFC}']
  end;
  TJPhoto = class(TJavaGenericImport<JPhotoClass, JPhoto>) end;

  JTonemapClass = interface(JAlgorithmClass)
    ['{603538E2-CF9E-486F-AAFC-A2F3F690EF88}']
    {class} function __fromPtr__(addr: Int64): JTonemap; cdecl;//Deprecated
  end;

  [JavaSignature('org/opencv/photo/Tonemap')]
  JTonemap = interface(JAlgorithm)
    ['{F7733B6A-DA17-4325-9186-2C84D78D52E2}']
    function getGamma: Single; cdecl;//Deprecated
    procedure process(src: JMat; dst: JMat); cdecl;//Deprecated
    procedure setGamma(gamma: Single); cdecl;//Deprecated
  end;
  TJTonemap = class(TJavaGenericImport<JTonemapClass, JTonemap>) end;

  JTonemapDragoClass = interface(JTonemapClass)
    ['{7B334623-0BEE-451F-AC1D-5C2F228677AC}']
    {class} function __fromPtr__(addr: Int64): JTonemapDrago; cdecl;
    {class} function getBias: Single; cdecl;//Deprecated
    {class} procedure setBias(bias: Single); cdecl;//Deprecated
    {class} procedure setSaturation(saturation: Single); cdecl;
  end;

  [JavaSignature('org/opencv/photo/TonemapDrago')]
  JTonemapDrago = interface(JTonemap)
    ['{C3800DEB-03B6-4D7B-A6B1-315CD770F48F}']
    function getSaturation: Single; cdecl;
  end;
  TJTonemapDrago = class(TJavaGenericImport<JTonemapDragoClass, JTonemapDrago>) end;

  JTonemapMantiukClass = interface(JTonemapClass)
    ['{70FC9B44-DEBB-4842-860A-6DEEB37063D9}']
    {class} function __fromPtr__(addr: Int64): JTonemapMantiuk; cdecl;//Deprecated
  end;

  [JavaSignature('org/opencv/photo/TonemapMantiuk')]
  JTonemapMantiuk = interface(JTonemap)
    ['{27A5A1B7-D053-4C62-AFD1-86CF6A3030A4}']
    function getSaturation: Single; cdecl;
    function getScale: Single; cdecl;
    procedure setSaturation(saturation: Single); cdecl;
    procedure setScale(scale: Single); cdecl;//Deprecated
  end;
  TJTonemapMantiuk = class(TJavaGenericImport<JTonemapMantiukClass, JTonemapMantiuk>) end;

  JTonemapReinhardClass = interface(JTonemapClass)
    ['{8D4FE1F4-FB68-456A-9D76-284CC124DFD6}']
    {class} function __fromPtr__(addr: Int64): JTonemapReinhard; cdecl;
    {class} function getLightAdaptation: Single; cdecl;
    {class} procedure setColorAdaptation(color_adapt: Single); cdecl;
    {class} procedure setIntensity(intensity: Single); cdecl;//Deprecated
    {class} procedure setLightAdaptation(light_adapt: Single); cdecl;
  end;

  [JavaSignature('org/opencv/photo/TonemapReinhard')]
  JTonemapReinhard = interface(JTonemap)
    ['{CD737C37-0071-431D-B25A-F53F47254F5B}']
    function getColorAdaptation: Single; cdecl;
    function getIntensity: Single; cdecl;
  end;
  TJTonemapReinhard = class(TJavaGenericImport<JTonemapReinhardClass, JTonemapReinhard>) end;

  JConvertersClass = interface(JObjectClass)
    ['{E822B2B8-1579-4C0C-8BEA-BED332E9FCA7}']
    {class} function init: JConverters; cdecl;
    {class} procedure Mat_to_vector_DMatch(m: JMat; matches: JList); cdecl;//Deprecated
    {class} procedure Mat_to_vector_KeyPoint(m: JMat; kps: JList); cdecl;//Deprecated
    {class} procedure Mat_to_vector_Mat(m: JMat; mats: JList); cdecl;//Deprecated
    {class} procedure Mat_to_vector_Point(m: JMat; pts: JList); cdecl;//Deprecated
    {class} procedure Mat_to_vector_Point2d(m: JMat; pts: JList); cdecl;//Deprecated
    {class} procedure Mat_to_vector_Point2f(m: JMat; pts: JList); cdecl;//Deprecated
    {class} procedure Mat_to_vector_Point3(m: JMat; pts: JList); cdecl;//Deprecated
    {class} procedure Mat_to_vector_Point3d(m: JMat; pts: JList); cdecl;//Deprecated
    {class} procedure Mat_to_vector_Point3f(m: JMat; pts: JList); cdecl;//Deprecated
    {class} procedure Mat_to_vector_Point3i(m: JMat; pts: JList); cdecl;//Deprecated
    {class} procedure Mat_to_vector_Rect(m: JMat; rs: JList); cdecl;//Deprecated
    {class} procedure Mat_to_vector_Rect2d(m: JMat; rs: JList); cdecl;//Deprecated
    {class} procedure Mat_to_vector_RotatedRect(m: JMat; rs: JList); cdecl;//Deprecated
    {class} procedure Mat_to_vector_char(m: JMat; bs: JList); cdecl;//Deprecated
    {class} procedure Mat_to_vector_double(m: JMat; ds: JList); cdecl;
    {class} procedure Mat_to_vector_float(m: JMat; fs: JList); cdecl;//Deprecated
    {class} procedure Mat_to_vector_int(m: JMat; is_: JList); cdecl;
    {class} procedure Mat_to_vector_uchar(m: JMat; us: JList); cdecl;//Deprecated
    {class} procedure Mat_to_vector_vector_DMatch(m: JMat; lvdm: JList); cdecl;
    {class} procedure Mat_to_vector_vector_KeyPoint(m: JMat; kps: JList); cdecl;//Deprecated
    {class} procedure Mat_to_vector_vector_Point(m: JMat; pts: JList); cdecl;
    {class} procedure Mat_to_vector_vector_Point2f(m: JMat; pts: JList); cdecl;//Deprecated
    {class} procedure Mat_to_vector_vector_Point3f(m: JMat; pts: JList); cdecl;
    {class} procedure Mat_to_vector_vector_char(m: JMat; llb: JList); cdecl;//Deprecated
    {class} function vector_DMatch_to_Mat(matches: JList): JMat; cdecl;
    {class} function vector_KeyPoint_to_Mat(kps: JList): JMat; cdecl;
    {class} function vector_Mat_to_Mat(mats: JList): JMat; cdecl;
    {class} function vector_Point2d_to_Mat(pts: JList): JMat; cdecl;//Deprecated
    {class} function vector_Point2f_to_Mat(pts: JList): JMat; cdecl;
    {class} function vector_Point3_to_Mat(pts: JList; typeDepth: Integer): JMat; cdecl;
    {class} function vector_Point3d_to_Mat(pts: JList): JMat; cdecl;//Deprecated
    {class} function vector_Point3f_to_Mat(pts: JList): JMat; cdecl;
    {class} function vector_Point3i_to_Mat(pts: JList): JMat; cdecl;//Deprecated
    {class} function vector_Point_to_Mat(pts: JList): JMat; cdecl; overload;//Deprecated
    {class} function vector_Point_to_Mat(pts: JList; typeDepth: Integer): JMat; cdecl; overload;//Deprecated
    {class} function vector_Rect2d_to_Mat(rs: JList): JMat; cdecl;
    {class} function vector_Rect_to_Mat(rs: JList): JMat; cdecl;
    {class} function vector_RotatedRect_to_Mat(rs: JList): JMat; cdecl;
    {class} function vector_char_to_Mat(bs: JList): JMat; cdecl;
    {class} function vector_double_to_Mat(ds: JList): JMat; cdecl;
    {class} function vector_float_to_Mat(fs: JList): JMat; cdecl;
    {class} function vector_int_to_Mat(is_: JList): JMat; cdecl;
    {class} function vector_uchar_to_Mat(bs: JList): JMat; cdecl;
    {class} function vector_vector_DMatch_to_Mat(lvdm: JList; mats: JList): JMat; cdecl;
    {class} function vector_vector_KeyPoint_to_Mat(kps: JList; mats: JList): JMat; cdecl;
    {class} function vector_vector_Point2f_to_Mat(pts: JList; mats: JList): JMat; cdecl;
    {class} function vector_vector_Point3f_to_Mat(pts: JList; mats: JList): JMat; cdecl;
    {class} function vector_vector_Point_to_Mat(pts: JList; mats: JList): JMat; cdecl;
    {class} function vector_vector_char_to_Mat(lvb: JList; mats: JList): JMat; cdecl;
  end;

  [JavaSignature('org/opencv/utils/Converters')]
  JConverters = interface(JObject)
    ['{872065EE-0454-4B61-BE2D-3B4C81837B95}']
  end;
  TJConverters = class(TJavaGenericImport<JConvertersClass, JConverters>) end;

  JBackgroundSubtractorClass = interface(JAlgorithmClass)
    ['{44E47572-763F-46F6-BA2F-FB91AB39D0CD}']
    {class} function __fromPtr__(addr: Int64): JBackgroundSubtractor; cdecl;
    {class} procedure apply(image: JMat; fgmask: JMat; learningRate: Double); cdecl; overload;
  end;

  [JavaSignature('org/opencv/video/BackgroundSubtractor')]
  JBackgroundSubtractor = interface(JAlgorithm)
    ['{4A889564-F608-4E97-921E-B5E8326B3F47}']
    procedure apply(image: JMat; fgmask: JMat); cdecl; overload;
    procedure getBackgroundImage(backgroundImage: JMat); cdecl;
  end;
  TJBackgroundSubtractor = class(TJavaGenericImport<JBackgroundSubtractorClass, JBackgroundSubtractor>) end;

  JBackgroundSubtractorKNNClass = interface(JBackgroundSubtractorClass)
    ['{0C620CB1-E012-43B0-BDD9-9D2173154F10}']
    {class} function __fromPtr__(addr: Int64): JBackgroundSubtractorKNN; cdecl;
    {class} function getDetectShadows: Boolean; cdecl;
    {class} function getDist2Threshold: Double; cdecl;
    {class} function getShadowValue: Integer; cdecl;
    {class} function getkNNSamples: Integer; cdecl;
    {class} procedure setDetectShadows(detectShadows: Boolean); cdecl;
    {class} procedure setNSamples(_nN: Integer); cdecl;//Deprecated
    {class} procedure setShadowThreshold(threshold: Double); cdecl;//Deprecated
    {class} procedure setShadowValue(value: Integer); cdecl;//Deprecated
  end;

  [JavaSignature('org/opencv/video/BackgroundSubtractorKNN')]
  JBackgroundSubtractorKNN = interface(JBackgroundSubtractor)
    ['{F92FF5B9-C550-4139-9AFF-234358241353}']
    function getHistory: Integer; cdecl;
    function getNSamples: Integer; cdecl;
    function getShadowThreshold: Double; cdecl;
    procedure setDist2Threshold(_dist2Threshold: Double); cdecl;
    procedure setHistory(history: Integer); cdecl;
    procedure setkNNSamples(_nkNN: Integer); cdecl;//Deprecated
  end;
  TJBackgroundSubtractorKNN = class(TJavaGenericImport<JBackgroundSubtractorKNNClass, JBackgroundSubtractorKNN>) end;

  JBackgroundSubtractorMOG2Class = interface(JBackgroundSubtractorClass)
    ['{DBF3DA63-B4A6-46A0-ACD8-3FA8DFF9B02B}']
    {class} function __fromPtr__(addr: Int64): JBackgroundSubtractorMOG2; cdecl;//Deprecated
    {class} procedure apply(image: JMat; fgmask: JMat; learningRate: Double); cdecl; overload;//Deprecated
    {class} procedure apply(image: JMat; fgmask: JMat); cdecl; overload;//Deprecated
    {class} function getHistory: Integer; cdecl;//Deprecated
    {class} function getNMixtures: Integer; cdecl;//Deprecated
    {class} function getShadowThreshold: Double; cdecl;//Deprecated
    {class} function getVarMin: Double; cdecl;
    {class} function getVarThreshold: Double; cdecl;
    {class} function getVarThresholdGen: Double; cdecl;
    {class} procedure setHistory(history: Integer); cdecl;
    {class} procedure setNMixtures(nmixtures: Integer); cdecl;
    {class} procedure setVarMax(varMax: Double); cdecl;
    {class} procedure setVarMin(varMin: Double); cdecl;
    {class} procedure setVarThreshold(varThreshold: Double); cdecl;
  end;

  [JavaSignature('org/opencv/video/BackgroundSubtractorMOG2')]
  JBackgroundSubtractorMOG2 = interface(JBackgroundSubtractor)
    ['{B07CD2F6-2B01-4324-9DA3-0EABB930FE30}']
    function getBackgroundRatio: Double; cdecl;//Deprecated
    function getComplexityReductionThreshold: Double; cdecl;//Deprecated
    function getDetectShadows: Boolean; cdecl;//Deprecated
    function getShadowValue: Integer; cdecl;//Deprecated
    function getVarInit: Double; cdecl;//Deprecated
    function getVarMax: Double; cdecl;//Deprecated
    procedure setBackgroundRatio(ratio: Double); cdecl;
    procedure setComplexityReductionThreshold(ct: Double); cdecl;
    procedure setDetectShadows(detectShadows: Boolean); cdecl;
    procedure setShadowThreshold(threshold: Double); cdecl;
    procedure setShadowValue(value: Integer); cdecl;
    procedure setVarInit(varInit: Double); cdecl;
    procedure setVarThresholdGen(varThresholdGen: Double); cdecl;
  end;
  TJBackgroundSubtractorMOG2 = class(TJavaGenericImport<JBackgroundSubtractorMOG2Class, JBackgroundSubtractorMOG2>) end;

  JDenseOpticalFlowClass = interface(JAlgorithmClass)
    ['{DDC2913F-8E09-408D-B39D-8EEBA1D7E20D}']
    {class} function __fromPtr__(addr: Int64): JDenseOpticalFlow; cdecl;//Deprecated
    {class} procedure calc(I0: JMat; I1: JMat; flow: JMat); cdecl;//Deprecated
  end;

  [JavaSignature('org/opencv/video/DenseOpticalFlow')]
  JDenseOpticalFlow = interface(JAlgorithm)
    ['{BE3D911B-C39B-413B-A91A-2299A53ACBB0}']
    procedure collectGarbage; cdecl;//Deprecated
  end;
  TJDenseOpticalFlow = class(TJavaGenericImport<JDenseOpticalFlowClass, JDenseOpticalFlow>) end;

  JDISOpticalFlowClass = interface(JDenseOpticalFlowClass)
    ['{142BF034-FCD6-4A2F-9AEF-3E42E505A1BD}']
    {class} function _GetPRESET_FAST: Integer; cdecl;
    {class} function _GetPRESET_MEDIUM: Integer; cdecl;
    {class} function _GetPRESET_ULTRAFAST: Integer; cdecl;
    {class} function __fromPtr__(addr: Int64): JDISOpticalFlow; cdecl;//Deprecated
    {class} function create(preset: Integer): JDISOpticalFlow; cdecl; overload;//Deprecated
    {class} function create: JDISOpticalFlow; cdecl; overload;//Deprecated
    {class} function getFinestScale: Integer; cdecl;//Deprecated
    {class} function getGradientDescentIterations: Integer; cdecl;//Deprecated
    {class} function getUseMeanNormalization: Boolean; cdecl;//Deprecated
    {class} function getUseSpatialPropagation: Boolean; cdecl;//Deprecated
    {class} function getVariationalRefinementAlpha: Single; cdecl;//Deprecated
    {class} procedure setFinestScale(val: Integer); cdecl;
    {class} procedure setGradientDescentIterations(val: Integer); cdecl;
    {class} procedure setPatchSize(val: Integer); cdecl;
    {class} procedure setVariationalRefinementAlpha(val: Single); cdecl;
    {class} procedure setVariationalRefinementDelta(val: Single); cdecl;
    {class} procedure setVariationalRefinementGamma(val: Single); cdecl;
    {class} property PRESET_FAST: Integer read _GetPRESET_FAST;
    {class} property PRESET_MEDIUM: Integer read _GetPRESET_MEDIUM;
    {class} property PRESET_ULTRAFAST: Integer read _GetPRESET_ULTRAFAST;
  end;

  [JavaSignature('org/opencv/video/DISOpticalFlow')]
  JDISOpticalFlow = interface(JDenseOpticalFlow)
    ['{86072F05-EF9D-4B50-9245-07A0198F4055}']
    function getPatchSize: Integer; cdecl;//Deprecated
    function getPatchStride: Integer; cdecl;//Deprecated
    function getVariationalRefinementDelta: Single; cdecl;//Deprecated
    function getVariationalRefinementGamma: Single; cdecl;//Deprecated
    function getVariationalRefinementIterations: Integer; cdecl;//Deprecated
    procedure setPatchStride(val: Integer); cdecl;
    procedure setUseMeanNormalization(val: Boolean); cdecl;
    procedure setUseSpatialPropagation(val: Boolean); cdecl;
    procedure setVariationalRefinementIterations(val: Integer); cdecl;
  end;
  TJDISOpticalFlow = class(TJavaGenericImport<JDISOpticalFlowClass, JDISOpticalFlow>) end;

  JFarnebackOpticalFlowClass = interface(JDenseOpticalFlowClass)
    ['{DCB96186-BC4C-4F49-8402-EADEF6F70F02}']
    {class} function __fromPtr__(addr: Int64): JFarnebackOpticalFlow; cdecl;//Deprecated
    {class} function create(numLevels: Integer; pyrScale: Double; fastPyramids: Boolean; winSize: Integer; numIters: Integer; polyN: Integer; polySigma: Double; flags: Integer): JFarnebackOpticalFlow; cdecl; overload;//Deprecated
    {class} function create(numLevels: Integer; pyrScale: Double; fastPyramids: Boolean; winSize: Integer; numIters: Integer; polyN: Integer; polySigma: Double): JFarnebackOpticalFlow; cdecl; overload;//Deprecated
    {class} function create(numLevels: Integer; pyrScale: Double; fastPyramids: Boolean; winSize: Integer; numIters: Integer; polyN: Integer): JFarnebackOpticalFlow; cdecl; overload;//Deprecated
    {class} function create(numLevels: Integer; pyrScale: Double; fastPyramids: Boolean; winSize: Integer; numIters: Integer): JFarnebackOpticalFlow; cdecl; overload;//Deprecated
    {class} function create(numLevels: Integer; pyrScale: Double; fastPyramids: Boolean; winSize: Integer): JFarnebackOpticalFlow; cdecl; overload;//Deprecated
    {class} function create(numLevels: Integer; pyrScale: Double; fastPyramids: Boolean): JFarnebackOpticalFlow; cdecl; overload;//Deprecated
    {class} function create(numLevels: Integer; pyrScale: Double): JFarnebackOpticalFlow; cdecl; overload;//Deprecated
    {class} function create(numLevels: Integer): JFarnebackOpticalFlow; cdecl; overload;//Deprecated
    {class} function create: JFarnebackOpticalFlow; cdecl; overload;
    {class} function getFastPyramids: Boolean; cdecl;
    {class} function getFlags: Integer; cdecl;
    {class} function getPolySigma: Double; cdecl;
    {class} function getPyrScale: Double; cdecl;
    {class} function getWinSize: Integer; cdecl;
    {class} procedure setNumIters(numIters: Integer); cdecl;
    {class} procedure setNumLevels(numLevels: Integer); cdecl;
    {class} procedure setPolyN(polyN: Integer); cdecl;
  end;

  [JavaSignature('org/opencv/video/FarnebackOpticalFlow')]
  JFarnebackOpticalFlow = interface(JDenseOpticalFlow)
    ['{84817299-7497-4FA3-A65F-9FEB9DC7D16E}']
    function getNumIters: Integer; cdecl;
    function getNumLevels: Integer; cdecl;
    function getPolyN: Integer; cdecl;
    procedure setFastPyramids(fastPyramids: Boolean); cdecl;
    procedure setFlags(flags: Integer); cdecl;
    procedure setPolySigma(polySigma: Double); cdecl;
    procedure setPyrScale(pyrScale: Double); cdecl;
    procedure setWinSize(winSize: Integer); cdecl;
  end;
  TJFarnebackOpticalFlow = class(TJavaGenericImport<JFarnebackOpticalFlowClass, JFarnebackOpticalFlow>) end;

  JKalmanFilterClass = interface(JObjectClass)
    ['{B80A7B4C-68CD-49E4-8DFF-6983E1F548DC}']
    {class} function init(dynamParams: Integer; measureParams: Integer; controlParams: Integer; type_: Integer): JKalmanFilter; cdecl; overload;
    {class} function init(dynamParams: Integer; measureParams: Integer; controlParams: Integer): JKalmanFilter; cdecl; overload;
    {class} function init(dynamParams: Integer; measureParams: Integer): JKalmanFilter; cdecl; overload;
    {class} function init: JKalmanFilter; cdecl; overload;
    {class} function __fromPtr__(addr: Int64): JKalmanFilter; cdecl;//Deprecated
    {class} function get_controlMatrix: JMat; cdecl;
    {class} function get_errorCovPost: JMat; cdecl;
    {class} function get_errorCovPre: JMat; cdecl;
    {class} function get_gain: JMat; cdecl;
    {class} function get_statePost: JMat; cdecl;
    {class} function get_transitionMatrix: JMat; cdecl;
    {class} function predict: JMat; cdecl; overload;
    {class} procedure set_errorCovPost(errorCovPost: JMat); cdecl;//Deprecated
    {class} procedure set_measurementMatrix(measurementMatrix: JMat); cdecl;
    {class} procedure set_measurementNoiseCov(measurementNoiseCov: JMat); cdecl;//Deprecated
    {class} procedure set_processNoiseCov(processNoiseCov: JMat); cdecl;
    {class} procedure set_transitionMatrix(transitionMatrix: JMat); cdecl;
  end;

  [JavaSignature('org/opencv/video/KalmanFilter')]
  JKalmanFilter = interface(JObject)
    ['{837A932B-7A93-4F98-9F3E-904C9B0DFBC3}']
    function correct(measurement: JMat): JMat; cdecl;//Deprecated
    function getNativeObjAddr: Int64; cdecl;//Deprecated
    function get_measurementMatrix: JMat; cdecl;
    function get_measurementNoiseCov: JMat; cdecl;
    function get_processNoiseCov: JMat; cdecl;
    function get_statePre: JMat; cdecl;
    function predict(control: JMat): JMat; cdecl; overload;
    procedure set_controlMatrix(controlMatrix: JMat); cdecl;
    procedure set_errorCovPre(errorCovPre: JMat); cdecl;
    procedure set_gain(gain: JMat); cdecl;
    procedure set_statePost(statePost: JMat); cdecl;
    procedure set_statePre(statePre: JMat); cdecl;
  end;
  TJKalmanFilter = class(TJavaGenericImport<JKalmanFilterClass, JKalmanFilter>) end;

  JSparseOpticalFlowClass = interface(JAlgorithmClass)
    ['{7099C674-7EEB-46D9-86B1-572F0A24758C}']
    {class} function __fromPtr__(addr: Int64): JSparseOpticalFlow; cdecl;//Deprecated
    {class} procedure calc(prevImg: JMat; nextImg: JMat; prevPts: JMat; nextPts: JMat; status: JMat; err: JMat); cdecl; overload;//Deprecated
  end;

  [JavaSignature('org/opencv/video/SparseOpticalFlow')]
  JSparseOpticalFlow = interface(JAlgorithm)
    ['{CCE5B00A-8A71-4EB0-82D9-FC2EAFFF3DF7}']
    procedure calc(prevImg: JMat; nextImg: JMat; prevPts: JMat; nextPts: JMat; status: JMat); cdecl; overload;//Deprecated
  end;
  TJSparseOpticalFlow = class(TJavaGenericImport<JSparseOpticalFlowClass, JSparseOpticalFlow>) end;

  JSparsePyrLKOpticalFlowClass = interface(JSparseOpticalFlowClass)
    ['{8A0E8376-A272-48CA-84AE-456270686DFE}']
    {class} function __fromPtr__(addr: Int64): JSparsePyrLKOpticalFlow; cdecl;
    {class} function create(winSize: Jcore_Size; maxLevel: Integer; crit: JTermCriteria; flags: Integer; minEigThreshold: Double): JSparsePyrLKOpticalFlow; cdecl; overload;
    {class} function create(winSize: Jcore_Size; maxLevel: Integer; crit: JTermCriteria; flags: Integer): JSparsePyrLKOpticalFlow; cdecl; overload;
    {class} function create(winSize: Jcore_Size; maxLevel: Integer; crit: JTermCriteria): JSparsePyrLKOpticalFlow; cdecl; overload;
    {class} function create(winSize: Jcore_Size; maxLevel: Integer): JSparsePyrLKOpticalFlow; cdecl; overload;
    {class} function create(winSize: Jcore_Size): JSparsePyrLKOpticalFlow; cdecl; overload;
    {class} function create: JSparsePyrLKOpticalFlow; cdecl; overload;
    {class} function getFlags: Integer; cdecl;
    {class} function getWinSize: Jcore_Size; cdecl;
    {class} procedure setFlags(flags: Integer); cdecl;
    {class} procedure setMaxLevel(maxLevel: Integer); cdecl;
  end;

  [JavaSignature('org/opencv/video/SparsePyrLKOpticalFlow')]
  JSparsePyrLKOpticalFlow = interface(JSparseOpticalFlow)
    ['{3795A868-F9AE-4DB1-8BAB-AE1022947241}']
    function getMaxLevel: Integer; cdecl;
    function getMinEigThreshold: Double; cdecl;
    function getTermCriteria: JTermCriteria; cdecl;
    procedure setMinEigThreshold(minEigThreshold: Double); cdecl;
    procedure setTermCriteria(crit: JTermCriteria); cdecl;
    procedure setWinSize(winSize: Jcore_Size); cdecl;
  end;
  TJSparsePyrLKOpticalFlow = class(TJavaGenericImport<JSparsePyrLKOpticalFlowClass, JSparsePyrLKOpticalFlow>) end;

  JVariationalRefinementClass = interface(JDenseOpticalFlowClass)
    ['{A083083F-271D-417B-8C8F-10E1E1BA6292}']
    {class} function __fromPtr__(addr: Int64): JVariationalRefinement; cdecl;//Deprecated
    {class} procedure calcUV(I0: JMat; I1: JMat; flow_u: JMat; flow_v: JMat); cdecl;//Deprecated
    {class} function create: JVariationalRefinement; cdecl;//Deprecated
    {class} function getAlpha: Single; cdecl;//Deprecated
    {class} function getOmega: Single; cdecl;
    {class} function getSorIterations: Integer; cdecl;
    {class} procedure setAlpha(val: Single); cdecl;
    {class} procedure setOmega(val: Single); cdecl;
    {class} procedure setSorIterations(val: Integer); cdecl;
  end;

  [JavaSignature('org/opencv/video/VariationalRefinement')]
  JVariationalRefinement = interface(JDenseOpticalFlow)
    ['{F95EAD38-2DE6-4F01-9807-E1E9CE1F4602}']
    function getDelta: Single; cdecl;//Deprecated
    function getFixedPointIterations: Integer; cdecl;//Deprecated
    function getGamma: Single; cdecl;//Deprecated
    procedure setDelta(val: Single); cdecl;
    procedure setFixedPointIterations(val: Integer); cdecl;
    procedure setGamma(val: Single); cdecl;
  end;
  TJVariationalRefinement = class(TJavaGenericImport<JVariationalRefinementClass, JVariationalRefinement>) end;

  JVideoClass = interface(JObjectClass)
    ['{29763709-34F3-4326-90FA-84455C097700}']
    {class} function _GetMOTION_AFFINE: Integer; cdecl;
    {class} function _GetMOTION_EUCLIDEAN: Integer; cdecl;
    {class} function _GetMOTION_HOMOGRAPHY: Integer; cdecl;
    {class} function _GetMOTION_TRANSLATION: Integer; cdecl;
    {class} function _GetOPTFLOW_FARNEBACK_GAUSSIAN: Integer; cdecl;
    {class} function _GetOPTFLOW_LK_GET_MIN_EIGENVALS: Integer; cdecl;
    {class} function _GetOPTFLOW_USE_INITIAL_FLOW: Integer; cdecl;
    {class} function init: JVideo; cdecl;
    {class} function CamShift(probImage: JMat; window: Jcore_Rect; criteria: JTermCriteria): JRotatedRect; cdecl;
    {class} function buildOpticalFlowPyramid(img: JMat; pyramid: JList; winSize: Jcore_Size; maxLevel: Integer; withDerivatives: Boolean; pyrBorder: Integer; derivBorder: Integer; tryReuseInputImage: Boolean): Integer; cdecl; overload;
    {class} function buildOpticalFlowPyramid(img: JMat; pyramid: JList; winSize: Jcore_Size; maxLevel: Integer; withDerivatives: Boolean; pyrBorder: Integer; derivBorder: Integer): Integer; cdecl; overload;
    {class} function buildOpticalFlowPyramid(img: JMat; pyramid: JList; winSize: Jcore_Size; maxLevel: Integer; withDerivatives: Boolean; pyrBorder: Integer): Integer; cdecl; overload;//Deprecated
    {class} function buildOpticalFlowPyramid(img: JMat; pyramid: JList; winSize: Jcore_Size; maxLevel: Integer; withDerivatives: Boolean): Integer; cdecl; overload;//Deprecated
    {class} function buildOpticalFlowPyramid(img: JMat; pyramid: JList; winSize: Jcore_Size; maxLevel: Integer): Integer; cdecl; overload;//Deprecated
    {class} procedure calcOpticalFlowFarneback(prev: JMat; next: JMat; flow: JMat; pyr_scale: Double; levels: Integer; winsize: Integer; iterations: Integer; poly_n: Integer; poly_sigma: Double; flags: Integer); cdecl;//Deprecated
    {class} procedure calcOpticalFlowPyrLK(prevImg: JMat; nextImg: JMat; prevPts: JMatOfPoint2f; nextPts: JMatOfPoint2f; status: JMatOfByte; err: JMatOfFloat; winSize: Jcore_Size; maxLevel: Integer; criteria: JTermCriteria; flags: Integer; minEigThreshold: Double); cdecl; overload;//Deprecated
    {class} procedure calcOpticalFlowPyrLK(prevImg: JMat; nextImg: JMat; prevPts: JMatOfPoint2f; nextPts: JMatOfPoint2f; status: JMatOfByte; err: JMatOfFloat; winSize: Jcore_Size; maxLevel: Integer; criteria: JTermCriteria; flags: Integer); cdecl; overload;//Deprecated
    {class} procedure calcOpticalFlowPyrLK(prevImg: JMat; nextImg: JMat; prevPts: JMatOfPoint2f; nextPts: JMatOfPoint2f; status: JMatOfByte; err: JMatOfFloat; winSize: Jcore_Size; maxLevel: Integer; criteria: JTermCriteria); cdecl; overload;//Deprecated
    {class} procedure calcOpticalFlowPyrLK(prevImg: JMat; nextImg: JMat; prevPts: JMatOfPoint2f; nextPts: JMatOfPoint2f; status: JMatOfByte; err: JMatOfFloat; winSize: Jcore_Size; maxLevel: Integer); cdecl; overload;//Deprecated
    {class} procedure calcOpticalFlowPyrLK(prevImg: JMat; nextImg: JMat; prevPts: JMatOfPoint2f; nextPts: JMatOfPoint2f; status: JMatOfByte; err: JMatOfFloat; winSize: Jcore_Size); cdecl; overload;//Deprecated
    {class} procedure calcOpticalFlowPyrLK(prevImg: JMat; nextImg: JMat; prevPts: JMatOfPoint2f; nextPts: JMatOfPoint2f; status: JMatOfByte; err: JMatOfFloat); cdecl; overload;//Deprecated
    {class} function computeECC(templateImage: JMat; inputImage: JMat; inputMask: JMat): Double; cdecl; overload;//Deprecated
    {class} function computeECC(templateImage: JMat; inputImage: JMat): Double; cdecl; overload;//Deprecated
    {class} function createBackgroundSubtractorKNN(history: Integer; dist2Threshold: Double; detectShadows: Boolean): JBackgroundSubtractorKNN; cdecl; overload;//Deprecated
    {class} function createBackgroundSubtractorKNN(history: Integer; dist2Threshold: Double): JBackgroundSubtractorKNN; cdecl; overload;//Deprecated
    {class} function createBackgroundSubtractorKNN(history: Integer): JBackgroundSubtractorKNN; cdecl; overload;//Deprecated
    {class} function createBackgroundSubtractorKNN: JBackgroundSubtractorKNN; cdecl; overload;//Deprecated
    {class} function createBackgroundSubtractorMOG2(history: Integer; varThreshold: Double; detectShadows: Boolean): JBackgroundSubtractorMOG2; cdecl; overload;//Deprecated
    {class} function createBackgroundSubtractorMOG2(history: Integer; varThreshold: Double): JBackgroundSubtractorMOG2; cdecl; overload;//Deprecated
    {class} function createBackgroundSubtractorMOG2(history: Integer): JBackgroundSubtractorMOG2; cdecl; overload;//Deprecated
    {class} function createBackgroundSubtractorMOG2: JBackgroundSubtractorMOG2; cdecl; overload;//Deprecated
    {class} function findTransformECC(templateImage: JMat; inputImage: JMat; warpMatrix: JMat; motionType: Integer; criteria: JTermCriteria; inputMask: JMat; gaussFiltSize: Integer): Double; cdecl;//Deprecated
    {class} function meanShift(probImage: JMat; window: Jcore_Rect; criteria: JTermCriteria): Integer; cdecl;//Deprecated
    {class} function readOpticalFlow(path: JString): JMat; cdecl;//Deprecated
    {class} function writeOpticalFlow(path: JString; flow: JMat): Boolean; cdecl;
    {class} property MOTION_AFFINE: Integer read _GetMOTION_AFFINE;
    {class} property MOTION_EUCLIDEAN: Integer read _GetMOTION_EUCLIDEAN;
    {class} property MOTION_HOMOGRAPHY: Integer read _GetMOTION_HOMOGRAPHY;
    {class} property MOTION_TRANSLATION: Integer read _GetMOTION_TRANSLATION;
    {class} property OPTFLOW_FARNEBACK_GAUSSIAN: Integer read _GetOPTFLOW_FARNEBACK_GAUSSIAN;
    {class} property OPTFLOW_LK_GET_MIN_EIGENVALS: Integer read _GetOPTFLOW_LK_GET_MIN_EIGENVALS;
    {class} property OPTFLOW_USE_INITIAL_FLOW: Integer read _GetOPTFLOW_USE_INITIAL_FLOW;
  end;

  [JavaSignature('org/opencv/video/Video')]
  JVideo = interface(JObject)
    ['{AAB6C622-904E-4900-BC72-48B31B2A51A8}']
  end;
  TJVideo = class(TJavaGenericImport<JVideoClass, JVideo>) end;

  JVideoCaptureClass = interface(JObjectClass)
    ['{519EDC26-B75C-419A-9271-BE166A5EA729}']
    {class} function init(filename: JString; apiPreference: Integer): JVideoCapture; cdecl; overload;
    {class} function init(filename: JString): JVideoCapture; cdecl; overload;
    {class} function init(index: Integer; apiPreference: Integer): JVideoCapture; cdecl; overload;
    {class} function init(index: Integer): JVideoCapture; cdecl; overload;
    {class} function init: JVideoCapture; cdecl; overload;
    {class} function __fromPtr__(addr: Int64): JVideoCapture; cdecl;
    {class} function getExceptionMode: Boolean; cdecl;
    {class} function getNativeObjAddr: Int64; cdecl;
    {class} function grab: Boolean; cdecl;
    {class} function open(index: Integer; apiPreference: Integer): Boolean; cdecl; overload;
    {class} function open(index: Integer): Boolean; cdecl; overload;
    {class} function read(image: JMat): Boolean; cdecl;
    {class} function &set(propId: Integer; value: Double): Boolean; cdecl;
    {class} procedure setExceptionMode(enable: Boolean); cdecl;
  end;

  [JavaSignature('org/opencv/videoio/VideoCapture')]
  JVideoCapture = interface(JObject)
    ['{2C13AF7C-6D04-42E4-A3DB-E9D9A23A124A}']
    function &get(propId: Integer): Double; cdecl;
    function getBackendName: JString; cdecl;
    function isOpened: Boolean; cdecl;
    function open(filename: JString; apiPreference: Integer): Boolean; cdecl; overload;
    function open(filename: JString): Boolean; cdecl; overload;
    procedure release; cdecl;
    function retrieve(image: JMat; flag: Integer): Boolean; cdecl; overload;
    function retrieve(image: JMat): Boolean; cdecl; overload;
  end;
  TJVideoCapture = class(TJavaGenericImport<JVideoCaptureClass, JVideoCapture>) end;

  JVideoWriterClass = interface(JObjectClass)
    ['{72135812-AE08-49DE-8B00-0E03B655EFF4}']
    {class} function init(filename: JString; apiPreference: Integer; fourcc: Integer; fps: Double; frameSize: Jcore_Size; isColor: Boolean): JVideoWriter; cdecl; overload;
    {class} function init(filename: JString; apiPreference: Integer; fourcc: Integer; fps: Double; frameSize: Jcore_Size): JVideoWriter; cdecl; overload;
    {class} function init(filename: JString; fourcc: Integer; fps: Double; frameSize: Jcore_Size; isColor: Boolean): JVideoWriter; cdecl; overload;
    {class} function init(filename: JString; fourcc: Integer; fps: Double; frameSize: Jcore_Size): JVideoWriter; cdecl; overload;
    {class} function init: JVideoWriter; cdecl; overload;
    {class} function __fromPtr__(addr: Int64): JVideoWriter; cdecl;
    {class} function fourcc(c1: Char; c2: Char; c3: Char; c4: Char): Integer; cdecl;
    {class} function getBackendName: JString; cdecl;
    {class} function getNativeObjAddr: Int64; cdecl;
    {class} function isOpened: Boolean; cdecl;
    {class} function open(filename: JString; fourcc: Integer; fps: Double; frameSize: Jcore_Size; isColor: Boolean): Boolean; cdecl; overload;//Deprecated
    {class} function open(filename: JString; fourcc: Integer; fps: Double; frameSize: Jcore_Size): Boolean; cdecl; overload;//Deprecated
    {class} function &set(propId: Integer; value: Double): Boolean; cdecl;//Deprecated
    {class} procedure write(image: JMat); cdecl;
  end;

  [JavaSignature('org/opencv/videoio/VideoWriter')]
  JVideoWriter = interface(JObject)
    ['{9A118358-91EC-4D15-AC3B-A95D91FEC997}']
    function &get(propId: Integer): Double; cdecl;
    function open(filename: JString; apiPreference: Integer; fourcc: Integer; fps: Double; frameSize: Jcore_Size; isColor: Boolean): Boolean; cdecl; overload;
    function open(filename: JString; apiPreference: Integer; fourcc: Integer; fps: Double; frameSize: Jcore_Size): Boolean; cdecl; overload;
    procedure release; cdecl;//Deprecated
  end;
  TJVideoWriter = class(TJavaGenericImport<JVideoWriterClass, JVideoWriter>) end;

  JVideoioClass = interface(JObjectClass)
    ['{67954C19-496B-4DB2-A568-BCAFEB526354}']
    {class} function _GetCAP_ANDROID: Integer; cdecl;
    {class} function _GetCAP_ANY: Integer; cdecl;
    {class} function _GetCAP_ARAVIS: Integer; cdecl;
    {class} function _GetCAP_AVFOUNDATION: Integer; cdecl;
    {class} function _GetCAP_CMU1394: Integer; cdecl;
    {class} function _GetCAP_DC1394: Integer; cdecl;
    {class} function _GetCAP_DSHOW: Integer; cdecl;
    {class} function _GetCAP_FFMPEG: Integer; cdecl;
    {class} function _GetCAP_FIREWARE: Integer; cdecl;
    {class} function _GetCAP_FIREWIRE: Integer; cdecl;
    {class} function _GetCAP_GIGANETIX: Integer; cdecl;
    {class} function _GetCAP_GPHOTO2: Integer; cdecl;
    {class} function _GetCAP_GSTREAMER: Integer; cdecl;
    {class} function _GetCAP_IEEE1394: Integer; cdecl;
    {class} function _GetCAP_IMAGES: Integer; cdecl;
    {class} function _GetCAP_INTELPERC: Integer; cdecl;
    {class} function _GetCAP_INTELPERC_DEPTH_GENERATOR: Integer; cdecl;
    {class} function _GetCAP_INTELPERC_DEPTH_MAP: Integer; cdecl;
    {class} function _GetCAP_INTELPERC_GENERATORS_MASK: Integer; cdecl;
    {class} function _GetCAP_INTELPERC_IMAGE: Integer; cdecl;
    {class} function _GetCAP_INTELPERC_IMAGE_GENERATOR: Integer; cdecl;
    {class} function _GetCAP_INTELPERC_IR_GENERATOR: Integer; cdecl;
    {class} function _GetCAP_INTELPERC_IR_MAP: Integer; cdecl;
    {class} function _GetCAP_INTELPERC_UVDEPTH_MAP: Integer; cdecl;
    {class} function _GetCAP_INTEL_MFX: Integer; cdecl;
    {class} function _GetCAP_MSMF: Integer; cdecl;
    {class} function _GetCAP_OPENCV_MJPEG: Integer; cdecl;
    {class} function _GetCAP_OPENNI: Integer; cdecl;
    {class} function _GetCAP_OPENNI2: Integer; cdecl;
    {class} function _GetCAP_OPENNI2_ASUS: Integer; cdecl;
    {class} function _GetCAP_OPENNI_ASUS: Integer; cdecl;
    {class} function _GetCAP_OPENNI_BGR_IMAGE: Integer; cdecl;
    {class} function _GetCAP_OPENNI_DEPTH_GENERATOR: Integer; cdecl;
    {class} function _GetCAP_OPENNI_DEPTH_GENERATOR_BASELINE: Integer; cdecl;
    {class} function _GetCAP_OPENNI_DEPTH_GENERATOR_FOCAL_LENGTH: Integer; cdecl;
    {class} function _GetCAP_OPENNI_DEPTH_GENERATOR_PRESENT: Integer; cdecl;
    {class} function _GetCAP_OPENNI_DEPTH_GENERATOR_REGISTRATION: Integer; cdecl;
    {class} function _GetCAP_OPENNI_DEPTH_GENERATOR_REGISTRATION_ON: Integer; cdecl;
    {class} function _GetCAP_OPENNI_DEPTH_MAP: Integer; cdecl;
    {class} function _GetCAP_OPENNI_DISPARITY_MAP: Integer; cdecl;
    {class} function _GetCAP_OPENNI_DISPARITY_MAP_32F: Integer; cdecl;
    {class} function _GetCAP_OPENNI_GENERATORS_MASK: Integer; cdecl;
    {class} function _GetCAP_OPENNI_GRAY_IMAGE: Integer; cdecl;
    {class} function _GetCAP_OPENNI_IMAGE_GENERATOR: Integer; cdecl;
    {class} function _GetCAP_OPENNI_IMAGE_GENERATOR_OUTPUT_MODE: Integer; cdecl;
    {class} function _GetCAP_OPENNI_IMAGE_GENERATOR_PRESENT: Integer; cdecl;
    {class} function _GetCAP_OPENNI_IR_GENERATOR: Integer; cdecl;
    {class} function _GetCAP_OPENNI_IR_GENERATOR_PRESENT: Integer; cdecl;
    {class} function _GetCAP_OPENNI_IR_IMAGE: Integer; cdecl;
    {class} function _GetCAP_OPENNI_POINT_CLOUD_MAP: Integer; cdecl;
    {class} function _GetCAP_OPENNI_QVGA_30HZ: Integer; cdecl;
    {class} function _GetCAP_OPENNI_QVGA_60HZ: Integer; cdecl;
    {class} function _GetCAP_OPENNI_SXGA_15HZ: Integer; cdecl;
    {class} function _GetCAP_OPENNI_SXGA_30HZ: Integer; cdecl;
    {class} function _GetCAP_OPENNI_VALID_DEPTH_MASK: Integer; cdecl;
    {class} function _GetCAP_OPENNI_VGA_30HZ: Integer; cdecl;
    {class} function _GetCAP_PROP_APERTURE: Integer; cdecl;
    {class} function _GetCAP_PROP_AUTOFOCUS: Integer; cdecl;
    {class} function _GetCAP_PROP_AUTO_EXPOSURE: Integer; cdecl;
    {class} function _GetCAP_PROP_AUTO_WB: Integer; cdecl;
    {class} function _GetCAP_PROP_BACKEND: Integer; cdecl;
    {class} function _GetCAP_PROP_BACKLIGHT: Integer; cdecl;
    {class} function _GetCAP_PROP_BRIGHTNESS: Integer; cdecl;
    {class} function _GetCAP_PROP_BUFFERSIZE: Integer; cdecl;
    {class} function _GetCAP_PROP_CHANNEL: Integer; cdecl;
    {class} function _GetCAP_PROP_CODEC_PIXEL_FORMAT: Integer; cdecl;
    {class} function _GetCAP_PROP_CONTRAST: Integer; cdecl;
    {class} function _GetCAP_PROP_CONVERT_RGB: Integer; cdecl;
    {class} function _GetCAP_PROP_DC1394_MAX: Integer; cdecl;
    {class} function _GetCAP_PROP_DC1394_MODE_AUTO: Integer; cdecl;
    {class} function _GetCAP_PROP_DC1394_MODE_MANUAL: Integer; cdecl;
    {class} function _GetCAP_PROP_DC1394_MODE_ONE_PUSH_AUTO: Integer; cdecl;
    {class} function _GetCAP_PROP_DC1394_OFF: Integer; cdecl;
    {class} function _GetCAP_PROP_EXPOSURE: Integer; cdecl;
    {class} function _GetCAP_PROP_EXPOSUREPROGRAM: Integer; cdecl;
    {class} function _GetCAP_PROP_FOCUS: Integer; cdecl;
    {class} function _GetCAP_PROP_FORMAT: Integer; cdecl;
    {class} function _GetCAP_PROP_FOURCC: Integer; cdecl;
    {class} function _GetCAP_PROP_FPS: Integer; cdecl;
    {class} function _GetCAP_PROP_FRAME_COUNT: Integer; cdecl;
    {class} function _GetCAP_PROP_FRAME_HEIGHT: Integer; cdecl;
    {class} function _GetCAP_PROP_FRAME_WIDTH: Integer; cdecl;
    {class} function _GetCAP_PROP_GAIN: Integer; cdecl;
    {class} function _GetCAP_PROP_GAMMA: Integer; cdecl;
    {class} function _GetCAP_PROP_GIGA_FRAME_HEIGH_MAX: Integer; cdecl;
    {class} function _GetCAP_PROP_GIGA_FRAME_OFFSET_X: Integer; cdecl;
    {class} function _GetCAP_PROP_GIGA_FRAME_OFFSET_Y: Integer; cdecl;
    {class} function _GetCAP_PROP_GIGA_FRAME_SENS_HEIGH: Integer; cdecl;
    {class} function _GetCAP_PROP_GIGA_FRAME_SENS_WIDTH: Integer; cdecl;
    {class} function _GetCAP_PROP_GIGA_FRAME_WIDTH_MAX: Integer; cdecl;
    {class} function _GetCAP_PROP_GPHOTO2_COLLECT_MSGS: Integer; cdecl;
    {class} function _GetCAP_PROP_GPHOTO2_FLUSH_MSGS: Integer; cdecl;
    {class} function _GetCAP_PROP_GPHOTO2_PREVIEW: Integer; cdecl;
    {class} function _GetCAP_PROP_GPHOTO2_RELOAD_CONFIG: Integer; cdecl;
    {class} function _GetCAP_PROP_GPHOTO2_RELOAD_ON_CHANGE: Integer; cdecl;
    {class} function _GetCAP_PROP_GPHOTO2_WIDGET_ENUMERATE: Integer; cdecl;
    {class} function _GetCAP_PROP_GSTREAMER_QUEUE_LENGTH: Integer; cdecl;
    {class} function _GetCAP_PROP_GUID: Integer; cdecl;
    {class} function _GetCAP_PROP_HUE: Integer; cdecl;
    {class} function _GetCAP_PROP_IMAGES_BASE: Integer; cdecl;
    {class} function _GetCAP_PROP_IMAGES_LAST: Integer; cdecl;
    {class} function _GetCAP_PROP_INTELPERC_DEPTH_CONFIDENCE_THRESHOLD: Integer; cdecl;
    {class} function _GetCAP_PROP_INTELPERC_DEPTH_FOCAL_LENGTH_HORZ: Integer; cdecl;
    {class} function _GetCAP_PROP_INTELPERC_DEPTH_FOCAL_LENGTH_VERT: Integer; cdecl;
    {class} function _GetCAP_PROP_INTELPERC_DEPTH_LOW_CONFIDENCE_VALUE: Integer; cdecl;
    {class} function _GetCAP_PROP_INTELPERC_DEPTH_SATURATION_VALUE: Integer; cdecl;
    {class} function _GetCAP_PROP_INTELPERC_PROFILE_COUNT: Integer; cdecl;
    {class} function _GetCAP_PROP_INTELPERC_PROFILE_IDX: Integer; cdecl;
    {class} function _GetCAP_PROP_IOS_DEVICE_EXPOSURE: Integer; cdecl;
    {class} function _GetCAP_PROP_IOS_DEVICE_FLASH: Integer; cdecl;
    {class} function _GetCAP_PROP_IOS_DEVICE_FOCUS: Integer; cdecl;
    {class} function _GetCAP_PROP_IOS_DEVICE_TORCH: Integer; cdecl;
    {class} function _GetCAP_PROP_IOS_DEVICE_WHITEBALANCE: Integer; cdecl;
    {class} function _GetCAP_PROP_IRIS: Integer; cdecl;
    {class} function _GetCAP_PROP_ISO_SPEED: Integer; cdecl;
    {class} function _GetCAP_PROP_MODE: Integer; cdecl;
    {class} function _GetCAP_PROP_MONOCHROME: Integer; cdecl;
    {class} function _GetCAP_PROP_OPENNI2_MIRROR: Integer; cdecl;
    {class} function _GetCAP_PROP_OPENNI2_SYNC: Integer; cdecl;
    {class} function _GetCAP_PROP_OPENNI_APPROX_FRAME_SYNC: Integer; cdecl;
    {class} function _GetCAP_PROP_OPENNI_BASELINE: Integer; cdecl;
    {class} function _GetCAP_PROP_OPENNI_CIRCLE_BUFFER: Integer; cdecl;
    {class} function _GetCAP_PROP_OPENNI_FOCAL_LENGTH: Integer; cdecl;
    {class} function _GetCAP_PROP_OPENNI_FRAME_MAX_DEPTH: Integer; cdecl;
    {class} function _GetCAP_PROP_OPENNI_GENERATOR_PRESENT: Integer; cdecl;
    {class} function _GetCAP_PROP_OPENNI_MAX_BUFFER_SIZE: Integer; cdecl;
    {class} function _GetCAP_PROP_OPENNI_MAX_TIME_DURATION: Integer; cdecl;
    {class} function _GetCAP_PROP_OPENNI_OUTPUT_MODE: Integer; cdecl;
    {class} function _GetCAP_PROP_OPENNI_REGISTRATION: Integer; cdecl;
    {class} function _GetCAP_PROP_OPENNI_REGISTRATION_ON: Integer; cdecl;
    {class} function _GetCAP_PROP_PAN: Integer; cdecl;
    {class} function _GetCAP_PROP_POS_AVI_RATIO: Integer; cdecl;
    {class} function _GetCAP_PROP_POS_FRAMES: Integer; cdecl;
    {class} function _GetCAP_PROP_POS_MSEC: Integer; cdecl;
    {class} function _GetCAP_PROP_PVAPI_BINNINGX: Integer; cdecl;
    {class} function _GetCAP_PROP_PVAPI_BINNINGY: Integer; cdecl;
    {class} function _GetCAP_PROP_PVAPI_DECIMATIONHORIZONTAL: Integer; cdecl;
    {class} function _GetCAP_PROP_PVAPI_DECIMATIONVERTICAL: Integer; cdecl;
    {class} function _GetCAP_PROP_PVAPI_FRAMESTARTTRIGGERMODE: Integer; cdecl;
    {class} function _GetCAP_PROP_PVAPI_MULTICASTIP: Integer; cdecl;
    {class} function _GetCAP_PROP_PVAPI_PIXELFORMAT: Integer; cdecl;
    {class} function _GetCAP_PROP_RECTIFICATION: Integer; cdecl;
    {class} function _GetCAP_PROP_ROLL: Integer; cdecl;
    {class} function _GetCAP_PROP_SAR_DEN: Integer; cdecl;
    {class} function _GetCAP_PROP_SAR_NUM: Integer; cdecl;
    {class} function _GetCAP_PROP_SATURATION: Integer; cdecl;
    {class} function _GetCAP_PROP_SETTINGS: Integer; cdecl;
    {class} function _GetCAP_PROP_SHARPNESS: Integer; cdecl;
    {class} function _GetCAP_PROP_SPEED: Integer; cdecl;
    {class} function _GetCAP_PROP_TEMPERATURE: Integer; cdecl;
    {class} function _GetCAP_PROP_TILT: Integer; cdecl;
    {class} function _GetCAP_PROP_TRIGGER: Integer; cdecl;
    {class} function _GetCAP_PROP_TRIGGER_DELAY: Integer; cdecl;
    {class} function _GetCAP_PROP_VIEWFINDER: Integer; cdecl;
    {class} function _GetCAP_PROP_WB_TEMPERATURE: Integer; cdecl;
    {class} function _GetCAP_PROP_WHITE_BALANCE_BLUE_U: Integer; cdecl;
    {class} function _GetCAP_PROP_WHITE_BALANCE_RED_V: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_ACQ_BUFFER_SIZE: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_ACQ_BUFFER_SIZE_UNIT: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_ACQ_FRAME_BURST_COUNT: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_ACQ_TIMING_MODE: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_ACQ_TRANSPORT_BUFFER_COMMIT: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_ACQ_TRANSPORT_BUFFER_SIZE: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_AEAG: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_AEAG_LEVEL: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_AEAG_ROI_HEIGHT: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_AEAG_ROI_OFFSET_X: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_AEAG_ROI_OFFSET_Y: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_AEAG_ROI_WIDTH: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_AE_MAX_LIMIT: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_AG_MAX_LIMIT: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_APPLY_CMS: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_AUTO_BANDWIDTH_CALCULATION: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_AUTO_WB: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_AVAILABLE_BANDWIDTH: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_BINNING_HORIZONTAL: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_BINNING_PATTERN: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_BINNING_SELECTOR: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_BINNING_VERTICAL: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_BPC: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_BUFFERS_QUEUE_SIZE: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_BUFFER_POLICY: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_CC_MATRIX_00: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_CC_MATRIX_01: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_CC_MATRIX_02: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_CC_MATRIX_03: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_CC_MATRIX_10: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_CC_MATRIX_11: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_CC_MATRIX_12: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_CC_MATRIX_13: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_CC_MATRIX_20: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_CC_MATRIX_21: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_CC_MATRIX_22: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_CC_MATRIX_23: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_CC_MATRIX_30: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_CC_MATRIX_31: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_CC_MATRIX_32: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_CC_MATRIX_33: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_CHIP_TEMP: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_CMS: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_COLOR_FILTER_ARRAY: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_COLUMN_FPN_CORRECTION: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_COOLING: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_COUNTER_SELECTOR: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_COUNTER_VALUE: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_DATA_FORMAT: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_DEBOUNCE_EN: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_DEBOUNCE_POL: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_DEBOUNCE_T0: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_DEBOUNCE_T1: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_DEBUG_LEVEL: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_DECIMATION_HORIZONTAL: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_DECIMATION_PATTERN: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_DECIMATION_SELECTOR: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_DECIMATION_VERTICAL: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_DEFAULT_CC_MATRIX: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_DEVICE_MODEL_ID: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_DEVICE_RESET: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_DEVICE_SN: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_DOWNSAMPLING: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_DOWNSAMPLING_TYPE: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_EXPOSURE: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_EXPOSURE_BURST_COUNT: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_EXP_PRIORITY: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_FFS_ACCESS_KEY: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_FFS_FILE_ID: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_FFS_FILE_SIZE: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_FRAMERATE: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_FREE_FFS_SIZE: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_GAIN: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_GAIN_SELECTOR: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_GAMMAC: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_GAMMAY: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_GPI_LEVEL: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_GPI_MODE: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_GPI_SELECTOR: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_GPO_MODE: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_GPO_SELECTOR: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_HDR: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_HDR_KNEEPOINT_COUNT: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_HDR_T1: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_HDR_T2: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_HEIGHT: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_HOUS_BACK_SIDE_TEMP: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_HOUS_TEMP: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_HW_REVISION: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_IMAGE_BLACK_LEVEL: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_IMAGE_DATA_BIT_DEPTH: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_IMAGE_DATA_FORMAT: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_IMAGE_DATA_FORMAT_RGB32_ALPHA: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_IMAGE_IS_COLOR: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_IMAGE_PAYLOAD_SIZE: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_IS_COOLED: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_IS_DEVICE_EXIST: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_KNEEPOINT1: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_KNEEPOINT2: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_LED_MODE: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_LED_SELECTOR: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_LENS_APERTURE_VALUE: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_LENS_FEATURE: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_LENS_FEATURE_SELECTOR: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_LENS_FOCAL_LENGTH: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_LENS_FOCUS_DISTANCE: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_LENS_FOCUS_MOVE: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_LENS_FOCUS_MOVEMENT_VALUE: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_LENS_MODE: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_LIMIT_BANDWIDTH: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_LUT_EN: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_LUT_INDEX: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_LUT_VALUE: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_MANUAL_WB: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_OFFSET_X: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_OFFSET_Y: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_OUTPUT_DATA_BIT_DEPTH: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_OUTPUT_DATA_PACKING: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_OUTPUT_DATA_PACKING_TYPE: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_RECENT_FRAME: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_REGION_MODE: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_REGION_SELECTOR: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_ROW_FPN_CORRECTION: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_SENSOR_BOARD_TEMP: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_SENSOR_CLOCK_FREQ_HZ: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_SENSOR_CLOCK_FREQ_INDEX: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_SENSOR_DATA_BIT_DEPTH: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_SENSOR_FEATURE_SELECTOR: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_SENSOR_FEATURE_VALUE: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_SENSOR_MODE: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_SENSOR_OUTPUT_CHANNEL_COUNT: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_SENSOR_TAPS: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_SHARPNESS: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_SHUTTER_TYPE: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_TARGET_TEMP: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_TEST_PATTERN: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_TEST_PATTERN_GENERATOR_SELECTOR: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_TIMEOUT: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_TRANSPORT_PIXEL_FORMAT: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_TRG_DELAY: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_TRG_SELECTOR: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_TRG_SOFTWARE: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_TRG_SOURCE: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_TS_RST_MODE: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_TS_RST_SOURCE: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_USED_FFS_SIZE: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_WB_KB: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_WB_KG: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_WB_KR: Integer; cdecl;
    {class} function _GetCAP_PROP_XI_WIDTH: Integer; cdecl;
    {class} function _GetCAP_PROP_ZOOM: Integer; cdecl;
    {class} function _GetCAP_PVAPI: Integer; cdecl;
    {class} function _GetCAP_PVAPI_DECIMATION_2OUTOF16: Integer; cdecl;
    {class} function _GetCAP_PVAPI_DECIMATION_2OUTOF4: Integer; cdecl;
    {class} function _GetCAP_PVAPI_DECIMATION_2OUTOF8: Integer; cdecl;
    {class} function _GetCAP_PVAPI_DECIMATION_OFF: Integer; cdecl;
    {class} function _GetCAP_PVAPI_FSTRIGMODE_FIXEDRATE: Integer; cdecl;
    {class} function _GetCAP_PVAPI_FSTRIGMODE_FREERUN: Integer; cdecl;
    {class} function _GetCAP_PVAPI_FSTRIGMODE_SOFTWARE: Integer; cdecl;
    {class} function _GetCAP_PVAPI_FSTRIGMODE_SYNCIN1: Integer; cdecl;
    {class} function _GetCAP_PVAPI_FSTRIGMODE_SYNCIN2: Integer; cdecl;
    {class} function _GetCAP_PVAPI_PIXELFORMAT_BAYER16: Integer; cdecl;
    {class} function _GetCAP_PVAPI_PIXELFORMAT_BAYER8: Integer; cdecl;
    {class} function _GetCAP_PVAPI_PIXELFORMAT_BGR24: Integer; cdecl;
    {class} function _GetCAP_PVAPI_PIXELFORMAT_BGRA32: Integer; cdecl;
    {class} function _GetCAP_PVAPI_PIXELFORMAT_MONO16: Integer; cdecl;
    {class} function _GetCAP_PVAPI_PIXELFORMAT_MONO8: Integer; cdecl;
    {class} function _GetCAP_PVAPI_PIXELFORMAT_RGB24: Integer; cdecl;
    {class} function _GetCAP_PVAPI_PIXELFORMAT_RGBA32: Integer; cdecl;
    {class} function _GetCAP_QT: Integer; cdecl;
    {class} function _GetCAP_REALSENSE: Integer; cdecl;
    {class} function _GetCAP_UNICAP: Integer; cdecl;
    {class} function _GetCAP_V4L: Integer; cdecl;
    {class} function _GetCAP_V4L2: Integer; cdecl;
    {class} function _GetCAP_VFW: Integer; cdecl;
    {class} function _GetCAP_WINRT: Integer; cdecl;
    {class} function _GetCAP_XIAPI: Integer; cdecl;
    {class} function _GetCAP_XINE: Integer; cdecl;
    {class} function _GetVIDEOWRITER_PROP_FRAMEBYTES: Integer; cdecl;
    {class} function _GetVIDEOWRITER_PROP_NSTRIPES: Integer; cdecl;
    {class} function _GetVIDEOWRITER_PROP_QUALITY: Integer; cdecl;
    {class} function init: JVideoio; cdecl;
    {class} function getBackendName(api: Integer): JString; cdecl;//Deprecated
    {class} property CAP_ANDROID: Integer read _GetCAP_ANDROID;
    {class} property CAP_ANY: Integer read _GetCAP_ANY;
    {class} property CAP_ARAVIS: Integer read _GetCAP_ARAVIS;
    {class} property CAP_AVFOUNDATION: Integer read _GetCAP_AVFOUNDATION;
    {class} property CAP_CMU1394: Integer read _GetCAP_CMU1394;
    {class} property CAP_DC1394: Integer read _GetCAP_DC1394;
    {class} property CAP_DSHOW: Integer read _GetCAP_DSHOW;
    {class} property CAP_FFMPEG: Integer read _GetCAP_FFMPEG;
    {class} property CAP_FIREWARE: Integer read _GetCAP_FIREWARE;
    {class} property CAP_FIREWIRE: Integer read _GetCAP_FIREWIRE;
    {class} property CAP_GIGANETIX: Integer read _GetCAP_GIGANETIX;
    {class} property CAP_GPHOTO2: Integer read _GetCAP_GPHOTO2;
    {class} property CAP_GSTREAMER: Integer read _GetCAP_GSTREAMER;
    {class} property CAP_IEEE1394: Integer read _GetCAP_IEEE1394;
    {class} property CAP_IMAGES: Integer read _GetCAP_IMAGES;
    {class} property CAP_INTELPERC: Integer read _GetCAP_INTELPERC;
    {class} property CAP_INTELPERC_DEPTH_GENERATOR: Integer read _GetCAP_INTELPERC_DEPTH_GENERATOR;
    {class} property CAP_INTELPERC_DEPTH_MAP: Integer read _GetCAP_INTELPERC_DEPTH_MAP;
    {class} property CAP_INTELPERC_GENERATORS_MASK: Integer read _GetCAP_INTELPERC_GENERATORS_MASK;
    {class} property CAP_INTELPERC_IMAGE: Integer read _GetCAP_INTELPERC_IMAGE;
    {class} property CAP_INTELPERC_IMAGE_GENERATOR: Integer read _GetCAP_INTELPERC_IMAGE_GENERATOR;
    {class} property CAP_INTELPERC_IR_GENERATOR: Integer read _GetCAP_INTELPERC_IR_GENERATOR;
    {class} property CAP_INTELPERC_IR_MAP: Integer read _GetCAP_INTELPERC_IR_MAP;
    {class} property CAP_INTELPERC_UVDEPTH_MAP: Integer read _GetCAP_INTELPERC_UVDEPTH_MAP;
    {class} property CAP_INTEL_MFX: Integer read _GetCAP_INTEL_MFX;
    {class} property CAP_MSMF: Integer read _GetCAP_MSMF;
    {class} property CAP_OPENCV_MJPEG: Integer read _GetCAP_OPENCV_MJPEG;
    {class} property CAP_OPENNI: Integer read _GetCAP_OPENNI;
    {class} property CAP_OPENNI2: Integer read _GetCAP_OPENNI2;
    {class} property CAP_OPENNI2_ASUS: Integer read _GetCAP_OPENNI2_ASUS;
    {class} property CAP_OPENNI_ASUS: Integer read _GetCAP_OPENNI_ASUS;
    {class} property CAP_OPENNI_BGR_IMAGE: Integer read _GetCAP_OPENNI_BGR_IMAGE;
    {class} property CAP_OPENNI_DEPTH_GENERATOR: Integer read _GetCAP_OPENNI_DEPTH_GENERATOR;
    {class} property CAP_OPENNI_DEPTH_GENERATOR_BASELINE: Integer read _GetCAP_OPENNI_DEPTH_GENERATOR_BASELINE;
    {class} property CAP_OPENNI_DEPTH_GENERATOR_FOCAL_LENGTH: Integer read _GetCAP_OPENNI_DEPTH_GENERATOR_FOCAL_LENGTH;
    {class} property CAP_OPENNI_DEPTH_GENERATOR_PRESENT: Integer read _GetCAP_OPENNI_DEPTH_GENERATOR_PRESENT;
    {class} property CAP_OPENNI_DEPTH_GENERATOR_REGISTRATION: Integer read _GetCAP_OPENNI_DEPTH_GENERATOR_REGISTRATION;
    {class} property CAP_OPENNI_DEPTH_GENERATOR_REGISTRATION_ON: Integer read _GetCAP_OPENNI_DEPTH_GENERATOR_REGISTRATION_ON;
    {class} property CAP_OPENNI_DEPTH_MAP: Integer read _GetCAP_OPENNI_DEPTH_MAP;
    {class} property CAP_OPENNI_DISPARITY_MAP: Integer read _GetCAP_OPENNI_DISPARITY_MAP;
    {class} property CAP_OPENNI_DISPARITY_MAP_32F: Integer read _GetCAP_OPENNI_DISPARITY_MAP_32F;
    {class} property CAP_OPENNI_GENERATORS_MASK: Integer read _GetCAP_OPENNI_GENERATORS_MASK;
    {class} property CAP_OPENNI_GRAY_IMAGE: Integer read _GetCAP_OPENNI_GRAY_IMAGE;
    {class} property CAP_OPENNI_IMAGE_GENERATOR: Integer read _GetCAP_OPENNI_IMAGE_GENERATOR;
    {class} property CAP_OPENNI_IMAGE_GENERATOR_OUTPUT_MODE: Integer read _GetCAP_OPENNI_IMAGE_GENERATOR_OUTPUT_MODE;
    {class} property CAP_OPENNI_IMAGE_GENERATOR_PRESENT: Integer read _GetCAP_OPENNI_IMAGE_GENERATOR_PRESENT;
    {class} property CAP_OPENNI_IR_GENERATOR: Integer read _GetCAP_OPENNI_IR_GENERATOR;
    {class} property CAP_OPENNI_IR_GENERATOR_PRESENT: Integer read _GetCAP_OPENNI_IR_GENERATOR_PRESENT;
    {class} property CAP_OPENNI_IR_IMAGE: Integer read _GetCAP_OPENNI_IR_IMAGE;
    {class} property CAP_OPENNI_POINT_CLOUD_MAP: Integer read _GetCAP_OPENNI_POINT_CLOUD_MAP;
    {class} property CAP_OPENNI_QVGA_30HZ: Integer read _GetCAP_OPENNI_QVGA_30HZ;
    {class} property CAP_OPENNI_QVGA_60HZ: Integer read _GetCAP_OPENNI_QVGA_60HZ;
    {class} property CAP_OPENNI_SXGA_15HZ: Integer read _GetCAP_OPENNI_SXGA_15HZ;
    {class} property CAP_OPENNI_SXGA_30HZ: Integer read _GetCAP_OPENNI_SXGA_30HZ;
    {class} property CAP_OPENNI_VALID_DEPTH_MASK: Integer read _GetCAP_OPENNI_VALID_DEPTH_MASK;
    {class} property CAP_OPENNI_VGA_30HZ: Integer read _GetCAP_OPENNI_VGA_30HZ;
    {class} property CAP_PROP_APERTURE: Integer read _GetCAP_PROP_APERTURE;
    {class} property CAP_PROP_AUTOFOCUS: Integer read _GetCAP_PROP_AUTOFOCUS;
    {class} property CAP_PROP_AUTO_EXPOSURE: Integer read _GetCAP_PROP_AUTO_EXPOSURE;
    {class} property CAP_PROP_AUTO_WB: Integer read _GetCAP_PROP_AUTO_WB;
    {class} property CAP_PROP_BACKEND: Integer read _GetCAP_PROP_BACKEND;
    {class} property CAP_PROP_BACKLIGHT: Integer read _GetCAP_PROP_BACKLIGHT;
    {class} property CAP_PROP_BRIGHTNESS: Integer read _GetCAP_PROP_BRIGHTNESS;
    {class} property CAP_PROP_BUFFERSIZE: Integer read _GetCAP_PROP_BUFFERSIZE;
    {class} property CAP_PROP_CHANNEL: Integer read _GetCAP_PROP_CHANNEL;
    {class} property CAP_PROP_CODEC_PIXEL_FORMAT: Integer read _GetCAP_PROP_CODEC_PIXEL_FORMAT;
    {class} property CAP_PROP_CONTRAST: Integer read _GetCAP_PROP_CONTRAST;
    {class} property CAP_PROP_CONVERT_RGB: Integer read _GetCAP_PROP_CONVERT_RGB;
    {class} property CAP_PROP_DC1394_MAX: Integer read _GetCAP_PROP_DC1394_MAX;
    {class} property CAP_PROP_DC1394_MODE_AUTO: Integer read _GetCAP_PROP_DC1394_MODE_AUTO;
    {class} property CAP_PROP_DC1394_MODE_MANUAL: Integer read _GetCAP_PROP_DC1394_MODE_MANUAL;
    {class} property CAP_PROP_DC1394_MODE_ONE_PUSH_AUTO: Integer read _GetCAP_PROP_DC1394_MODE_ONE_PUSH_AUTO;
    {class} property CAP_PROP_DC1394_OFF: Integer read _GetCAP_PROP_DC1394_OFF;
    {class} property CAP_PROP_EXPOSURE: Integer read _GetCAP_PROP_EXPOSURE;
    {class} property CAP_PROP_EXPOSUREPROGRAM: Integer read _GetCAP_PROP_EXPOSUREPROGRAM;
    {class} property CAP_PROP_FOCUS: Integer read _GetCAP_PROP_FOCUS;
    {class} property CAP_PROP_FORMAT: Integer read _GetCAP_PROP_FORMAT;
    {class} property CAP_PROP_FOURCC: Integer read _GetCAP_PROP_FOURCC;
    {class} property CAP_PROP_FPS: Integer read _GetCAP_PROP_FPS;
    {class} property CAP_PROP_FRAME_COUNT: Integer read _GetCAP_PROP_FRAME_COUNT;
    {class} property CAP_PROP_FRAME_HEIGHT: Integer read _GetCAP_PROP_FRAME_HEIGHT;
    {class} property CAP_PROP_FRAME_WIDTH: Integer read _GetCAP_PROP_FRAME_WIDTH;
    {class} property CAP_PROP_GAIN: Integer read _GetCAP_PROP_GAIN;
    {class} property CAP_PROP_GAMMA: Integer read _GetCAP_PROP_GAMMA;
    {class} property CAP_PROP_GIGA_FRAME_HEIGH_MAX: Integer read _GetCAP_PROP_GIGA_FRAME_HEIGH_MAX;
    {class} property CAP_PROP_GIGA_FRAME_OFFSET_X: Integer read _GetCAP_PROP_GIGA_FRAME_OFFSET_X;
    {class} property CAP_PROP_GIGA_FRAME_OFFSET_Y: Integer read _GetCAP_PROP_GIGA_FRAME_OFFSET_Y;
    {class} property CAP_PROP_GIGA_FRAME_SENS_HEIGH: Integer read _GetCAP_PROP_GIGA_FRAME_SENS_HEIGH;
    {class} property CAP_PROP_GIGA_FRAME_SENS_WIDTH: Integer read _GetCAP_PROP_GIGA_FRAME_SENS_WIDTH;
    {class} property CAP_PROP_GIGA_FRAME_WIDTH_MAX: Integer read _GetCAP_PROP_GIGA_FRAME_WIDTH_MAX;
    {class} property CAP_PROP_GPHOTO2_COLLECT_MSGS: Integer read _GetCAP_PROP_GPHOTO2_COLLECT_MSGS;
    {class} property CAP_PROP_GPHOTO2_FLUSH_MSGS: Integer read _GetCAP_PROP_GPHOTO2_FLUSH_MSGS;
    {class} property CAP_PROP_GPHOTO2_PREVIEW: Integer read _GetCAP_PROP_GPHOTO2_PREVIEW;
    {class} property CAP_PROP_GPHOTO2_RELOAD_CONFIG: Integer read _GetCAP_PROP_GPHOTO2_RELOAD_CONFIG;
    {class} property CAP_PROP_GPHOTO2_RELOAD_ON_CHANGE: Integer read _GetCAP_PROP_GPHOTO2_RELOAD_ON_CHANGE;
    {class} property CAP_PROP_GPHOTO2_WIDGET_ENUMERATE: Integer read _GetCAP_PROP_GPHOTO2_WIDGET_ENUMERATE;
    {class} property CAP_PROP_GSTREAMER_QUEUE_LENGTH: Integer read _GetCAP_PROP_GSTREAMER_QUEUE_LENGTH;
    {class} property CAP_PROP_GUID: Integer read _GetCAP_PROP_GUID;
    {class} property CAP_PROP_HUE: Integer read _GetCAP_PROP_HUE;
    {class} property CAP_PROP_IMAGES_BASE: Integer read _GetCAP_PROP_IMAGES_BASE;
    {class} property CAP_PROP_IMAGES_LAST: Integer read _GetCAP_PROP_IMAGES_LAST;
    {class} property CAP_PROP_INTELPERC_DEPTH_CONFIDENCE_THRESHOLD: Integer read _GetCAP_PROP_INTELPERC_DEPTH_CONFIDENCE_THRESHOLD;
    {class} property CAP_PROP_INTELPERC_DEPTH_FOCAL_LENGTH_HORZ: Integer read _GetCAP_PROP_INTELPERC_DEPTH_FOCAL_LENGTH_HORZ;
    {class} property CAP_PROP_INTELPERC_DEPTH_FOCAL_LENGTH_VERT: Integer read _GetCAP_PROP_INTELPERC_DEPTH_FOCAL_LENGTH_VERT;
    {class} property CAP_PROP_INTELPERC_DEPTH_LOW_CONFIDENCE_VALUE: Integer read _GetCAP_PROP_INTELPERC_DEPTH_LOW_CONFIDENCE_VALUE;
    {class} property CAP_PROP_INTELPERC_DEPTH_SATURATION_VALUE: Integer read _GetCAP_PROP_INTELPERC_DEPTH_SATURATION_VALUE;
    {class} property CAP_PROP_INTELPERC_PROFILE_COUNT: Integer read _GetCAP_PROP_INTELPERC_PROFILE_COUNT;
    {class} property CAP_PROP_INTELPERC_PROFILE_IDX: Integer read _GetCAP_PROP_INTELPERC_PROFILE_IDX;
    {class} property CAP_PROP_IOS_DEVICE_EXPOSURE: Integer read _GetCAP_PROP_IOS_DEVICE_EXPOSURE;
    {class} property CAP_PROP_IOS_DEVICE_FLASH: Integer read _GetCAP_PROP_IOS_DEVICE_FLASH;
    {class} property CAP_PROP_IOS_DEVICE_FOCUS: Integer read _GetCAP_PROP_IOS_DEVICE_FOCUS;
    {class} property CAP_PROP_IOS_DEVICE_TORCH: Integer read _GetCAP_PROP_IOS_DEVICE_TORCH;
    {class} property CAP_PROP_IOS_DEVICE_WHITEBALANCE: Integer read _GetCAP_PROP_IOS_DEVICE_WHITEBALANCE;
    {class} property CAP_PROP_IRIS: Integer read _GetCAP_PROP_IRIS;
    {class} property CAP_PROP_ISO_SPEED: Integer read _GetCAP_PROP_ISO_SPEED;
    {class} property CAP_PROP_MODE: Integer read _GetCAP_PROP_MODE;
    {class} property CAP_PROP_MONOCHROME: Integer read _GetCAP_PROP_MONOCHROME;
    {class} property CAP_PROP_OPENNI2_MIRROR: Integer read _GetCAP_PROP_OPENNI2_MIRROR;
    {class} property CAP_PROP_OPENNI2_SYNC: Integer read _GetCAP_PROP_OPENNI2_SYNC;
    {class} property CAP_PROP_OPENNI_APPROX_FRAME_SYNC: Integer read _GetCAP_PROP_OPENNI_APPROX_FRAME_SYNC;
    {class} property CAP_PROP_OPENNI_BASELINE: Integer read _GetCAP_PROP_OPENNI_BASELINE;
    {class} property CAP_PROP_OPENNI_CIRCLE_BUFFER: Integer read _GetCAP_PROP_OPENNI_CIRCLE_BUFFER;
    {class} property CAP_PROP_OPENNI_FOCAL_LENGTH: Integer read _GetCAP_PROP_OPENNI_FOCAL_LENGTH;
    {class} property CAP_PROP_OPENNI_FRAME_MAX_DEPTH: Integer read _GetCAP_PROP_OPENNI_FRAME_MAX_DEPTH;
    {class} property CAP_PROP_OPENNI_GENERATOR_PRESENT: Integer read _GetCAP_PROP_OPENNI_GENERATOR_PRESENT;
    {class} property CAP_PROP_OPENNI_MAX_BUFFER_SIZE: Integer read _GetCAP_PROP_OPENNI_MAX_BUFFER_SIZE;
    {class} property CAP_PROP_OPENNI_MAX_TIME_DURATION: Integer read _GetCAP_PROP_OPENNI_MAX_TIME_DURATION;
    {class} property CAP_PROP_OPENNI_OUTPUT_MODE: Integer read _GetCAP_PROP_OPENNI_OUTPUT_MODE;
    {class} property CAP_PROP_OPENNI_REGISTRATION: Integer read _GetCAP_PROP_OPENNI_REGISTRATION;
    {class} property CAP_PROP_OPENNI_REGISTRATION_ON: Integer read _GetCAP_PROP_OPENNI_REGISTRATION_ON;
    {class} property CAP_PROP_PAN: Integer read _GetCAP_PROP_PAN;
    {class} property CAP_PROP_POS_AVI_RATIO: Integer read _GetCAP_PROP_POS_AVI_RATIO;
    {class} property CAP_PROP_POS_FRAMES: Integer read _GetCAP_PROP_POS_FRAMES;
    {class} property CAP_PROP_POS_MSEC: Integer read _GetCAP_PROP_POS_MSEC;
    {class} property CAP_PROP_PVAPI_BINNINGX: Integer read _GetCAP_PROP_PVAPI_BINNINGX;
    {class} property CAP_PROP_PVAPI_BINNINGY: Integer read _GetCAP_PROP_PVAPI_BINNINGY;
    {class} property CAP_PROP_PVAPI_DECIMATIONHORIZONTAL: Integer read _GetCAP_PROP_PVAPI_DECIMATIONHORIZONTAL;
    {class} property CAP_PROP_PVAPI_DECIMATIONVERTICAL: Integer read _GetCAP_PROP_PVAPI_DECIMATIONVERTICAL;
    {class} property CAP_PROP_PVAPI_FRAMESTARTTRIGGERMODE: Integer read _GetCAP_PROP_PVAPI_FRAMESTARTTRIGGERMODE;
    {class} property CAP_PROP_PVAPI_MULTICASTIP: Integer read _GetCAP_PROP_PVAPI_MULTICASTIP;
    {class} property CAP_PROP_PVAPI_PIXELFORMAT: Integer read _GetCAP_PROP_PVAPI_PIXELFORMAT;
    {class} property CAP_PROP_RECTIFICATION: Integer read _GetCAP_PROP_RECTIFICATION;
    {class} property CAP_PROP_ROLL: Integer read _GetCAP_PROP_ROLL;
    {class} property CAP_PROP_SAR_DEN: Integer read _GetCAP_PROP_SAR_DEN;
    {class} property CAP_PROP_SAR_NUM: Integer read _GetCAP_PROP_SAR_NUM;
    {class} property CAP_PROP_SATURATION: Integer read _GetCAP_PROP_SATURATION;
    {class} property CAP_PROP_SETTINGS: Integer read _GetCAP_PROP_SETTINGS;
    {class} property CAP_PROP_SHARPNESS: Integer read _GetCAP_PROP_SHARPNESS;
    {class} property CAP_PROP_SPEED: Integer read _GetCAP_PROP_SPEED;
    {class} property CAP_PROP_TEMPERATURE: Integer read _GetCAP_PROP_TEMPERATURE;
    {class} property CAP_PROP_TILT: Integer read _GetCAP_PROP_TILT;
    {class} property CAP_PROP_TRIGGER: Integer read _GetCAP_PROP_TRIGGER;
    {class} property CAP_PROP_TRIGGER_DELAY: Integer read _GetCAP_PROP_TRIGGER_DELAY;
    {class} property CAP_PROP_VIEWFINDER: Integer read _GetCAP_PROP_VIEWFINDER;
    {class} property CAP_PROP_WB_TEMPERATURE: Integer read _GetCAP_PROP_WB_TEMPERATURE;
    {class} property CAP_PROP_WHITE_BALANCE_BLUE_U: Integer read _GetCAP_PROP_WHITE_BALANCE_BLUE_U;
    {class} property CAP_PROP_WHITE_BALANCE_RED_V: Integer read _GetCAP_PROP_WHITE_BALANCE_RED_V;
    {class} property CAP_PROP_XI_ACQ_BUFFER_SIZE: Integer read _GetCAP_PROP_XI_ACQ_BUFFER_SIZE;
    {class} property CAP_PROP_XI_ACQ_BUFFER_SIZE_UNIT: Integer read _GetCAP_PROP_XI_ACQ_BUFFER_SIZE_UNIT;
    {class} property CAP_PROP_XI_ACQ_FRAME_BURST_COUNT: Integer read _GetCAP_PROP_XI_ACQ_FRAME_BURST_COUNT;
    {class} property CAP_PROP_XI_ACQ_TIMING_MODE: Integer read _GetCAP_PROP_XI_ACQ_TIMING_MODE;
    {class} property CAP_PROP_XI_ACQ_TRANSPORT_BUFFER_COMMIT: Integer read _GetCAP_PROP_XI_ACQ_TRANSPORT_BUFFER_COMMIT;
    {class} property CAP_PROP_XI_ACQ_TRANSPORT_BUFFER_SIZE: Integer read _GetCAP_PROP_XI_ACQ_TRANSPORT_BUFFER_SIZE;
    {class} property CAP_PROP_XI_AEAG: Integer read _GetCAP_PROP_XI_AEAG;
    {class} property CAP_PROP_XI_AEAG_LEVEL: Integer read _GetCAP_PROP_XI_AEAG_LEVEL;
    {class} property CAP_PROP_XI_AEAG_ROI_HEIGHT: Integer read _GetCAP_PROP_XI_AEAG_ROI_HEIGHT;
    {class} property CAP_PROP_XI_AEAG_ROI_OFFSET_X: Integer read _GetCAP_PROP_XI_AEAG_ROI_OFFSET_X;
    {class} property CAP_PROP_XI_AEAG_ROI_OFFSET_Y: Integer read _GetCAP_PROP_XI_AEAG_ROI_OFFSET_Y;
    {class} property CAP_PROP_XI_AEAG_ROI_WIDTH: Integer read _GetCAP_PROP_XI_AEAG_ROI_WIDTH;
    {class} property CAP_PROP_XI_AE_MAX_LIMIT: Integer read _GetCAP_PROP_XI_AE_MAX_LIMIT;
    {class} property CAP_PROP_XI_AG_MAX_LIMIT: Integer read _GetCAP_PROP_XI_AG_MAX_LIMIT;
    {class} property CAP_PROP_XI_APPLY_CMS: Integer read _GetCAP_PROP_XI_APPLY_CMS;
    {class} property CAP_PROP_XI_AUTO_BANDWIDTH_CALCULATION: Integer read _GetCAP_PROP_XI_AUTO_BANDWIDTH_CALCULATION;
    {class} property CAP_PROP_XI_AUTO_WB: Integer read _GetCAP_PROP_XI_AUTO_WB;
    {class} property CAP_PROP_XI_AVAILABLE_BANDWIDTH: Integer read _GetCAP_PROP_XI_AVAILABLE_BANDWIDTH;
    {class} property CAP_PROP_XI_BINNING_HORIZONTAL: Integer read _GetCAP_PROP_XI_BINNING_HORIZONTAL;
    {class} property CAP_PROP_XI_BINNING_PATTERN: Integer read _GetCAP_PROP_XI_BINNING_PATTERN;
    {class} property CAP_PROP_XI_BINNING_SELECTOR: Integer read _GetCAP_PROP_XI_BINNING_SELECTOR;
    {class} property CAP_PROP_XI_BINNING_VERTICAL: Integer read _GetCAP_PROP_XI_BINNING_VERTICAL;
    {class} property CAP_PROP_XI_BPC: Integer read _GetCAP_PROP_XI_BPC;
    {class} property CAP_PROP_XI_BUFFERS_QUEUE_SIZE: Integer read _GetCAP_PROP_XI_BUFFERS_QUEUE_SIZE;
    {class} property CAP_PROP_XI_BUFFER_POLICY: Integer read _GetCAP_PROP_XI_BUFFER_POLICY;
    {class} property CAP_PROP_XI_CC_MATRIX_00: Integer read _GetCAP_PROP_XI_CC_MATRIX_00;
    {class} property CAP_PROP_XI_CC_MATRIX_01: Integer read _GetCAP_PROP_XI_CC_MATRIX_01;
    {class} property CAP_PROP_XI_CC_MATRIX_02: Integer read _GetCAP_PROP_XI_CC_MATRIX_02;
    {class} property CAP_PROP_XI_CC_MATRIX_03: Integer read _GetCAP_PROP_XI_CC_MATRIX_03;
    {class} property CAP_PROP_XI_CC_MATRIX_10: Integer read _GetCAP_PROP_XI_CC_MATRIX_10;
    {class} property CAP_PROP_XI_CC_MATRIX_11: Integer read _GetCAP_PROP_XI_CC_MATRIX_11;
    {class} property CAP_PROP_XI_CC_MATRIX_12: Integer read _GetCAP_PROP_XI_CC_MATRIX_12;
    {class} property CAP_PROP_XI_CC_MATRIX_13: Integer read _GetCAP_PROP_XI_CC_MATRIX_13;
    {class} property CAP_PROP_XI_CC_MATRIX_20: Integer read _GetCAP_PROP_XI_CC_MATRIX_20;
    {class} property CAP_PROP_XI_CC_MATRIX_21: Integer read _GetCAP_PROP_XI_CC_MATRIX_21;
    {class} property CAP_PROP_XI_CC_MATRIX_22: Integer read _GetCAP_PROP_XI_CC_MATRIX_22;
    {class} property CAP_PROP_XI_CC_MATRIX_23: Integer read _GetCAP_PROP_XI_CC_MATRIX_23;
    {class} property CAP_PROP_XI_CC_MATRIX_30: Integer read _GetCAP_PROP_XI_CC_MATRIX_30;
    {class} property CAP_PROP_XI_CC_MATRIX_31: Integer read _GetCAP_PROP_XI_CC_MATRIX_31;
    {class} property CAP_PROP_XI_CC_MATRIX_32: Integer read _GetCAP_PROP_XI_CC_MATRIX_32;
    {class} property CAP_PROP_XI_CC_MATRIX_33: Integer read _GetCAP_PROP_XI_CC_MATRIX_33;
    {class} property CAP_PROP_XI_CHIP_TEMP: Integer read _GetCAP_PROP_XI_CHIP_TEMP;
    {class} property CAP_PROP_XI_CMS: Integer read _GetCAP_PROP_XI_CMS;
    {class} property CAP_PROP_XI_COLOR_FILTER_ARRAY: Integer read _GetCAP_PROP_XI_COLOR_FILTER_ARRAY;
    {class} property CAP_PROP_XI_COLUMN_FPN_CORRECTION: Integer read _GetCAP_PROP_XI_COLUMN_FPN_CORRECTION;
    {class} property CAP_PROP_XI_COOLING: Integer read _GetCAP_PROP_XI_COOLING;
    {class} property CAP_PROP_XI_COUNTER_SELECTOR: Integer read _GetCAP_PROP_XI_COUNTER_SELECTOR;
    {class} property CAP_PROP_XI_COUNTER_VALUE: Integer read _GetCAP_PROP_XI_COUNTER_VALUE;
    {class} property CAP_PROP_XI_DATA_FORMAT: Integer read _GetCAP_PROP_XI_DATA_FORMAT;
    {class} property CAP_PROP_XI_DEBOUNCE_EN: Integer read _GetCAP_PROP_XI_DEBOUNCE_EN;
    {class} property CAP_PROP_XI_DEBOUNCE_POL: Integer read _GetCAP_PROP_XI_DEBOUNCE_POL;
    {class} property CAP_PROP_XI_DEBOUNCE_T0: Integer read _GetCAP_PROP_XI_DEBOUNCE_T0;
    {class} property CAP_PROP_XI_DEBOUNCE_T1: Integer read _GetCAP_PROP_XI_DEBOUNCE_T1;
    {class} property CAP_PROP_XI_DEBUG_LEVEL: Integer read _GetCAP_PROP_XI_DEBUG_LEVEL;
    {class} property CAP_PROP_XI_DECIMATION_HORIZONTAL: Integer read _GetCAP_PROP_XI_DECIMATION_HORIZONTAL;
    {class} property CAP_PROP_XI_DECIMATION_PATTERN: Integer read _GetCAP_PROP_XI_DECIMATION_PATTERN;
    {class} property CAP_PROP_XI_DECIMATION_SELECTOR: Integer read _GetCAP_PROP_XI_DECIMATION_SELECTOR;
    {class} property CAP_PROP_XI_DECIMATION_VERTICAL: Integer read _GetCAP_PROP_XI_DECIMATION_VERTICAL;
    {class} property CAP_PROP_XI_DEFAULT_CC_MATRIX: Integer read _GetCAP_PROP_XI_DEFAULT_CC_MATRIX;
    {class} property CAP_PROP_XI_DEVICE_MODEL_ID: Integer read _GetCAP_PROP_XI_DEVICE_MODEL_ID;
    {class} property CAP_PROP_XI_DEVICE_RESET: Integer read _GetCAP_PROP_XI_DEVICE_RESET;
    {class} property CAP_PROP_XI_DEVICE_SN: Integer read _GetCAP_PROP_XI_DEVICE_SN;
    {class} property CAP_PROP_XI_DOWNSAMPLING: Integer read _GetCAP_PROP_XI_DOWNSAMPLING;
    {class} property CAP_PROP_XI_DOWNSAMPLING_TYPE: Integer read _GetCAP_PROP_XI_DOWNSAMPLING_TYPE;
    {class} property CAP_PROP_XI_EXPOSURE: Integer read _GetCAP_PROP_XI_EXPOSURE;
    {class} property CAP_PROP_XI_EXPOSURE_BURST_COUNT: Integer read _GetCAP_PROP_XI_EXPOSURE_BURST_COUNT;
    {class} property CAP_PROP_XI_EXP_PRIORITY: Integer read _GetCAP_PROP_XI_EXP_PRIORITY;
    {class} property CAP_PROP_XI_FFS_ACCESS_KEY: Integer read _GetCAP_PROP_XI_FFS_ACCESS_KEY;
    {class} property CAP_PROP_XI_FFS_FILE_ID: Integer read _GetCAP_PROP_XI_FFS_FILE_ID;
    {class} property CAP_PROP_XI_FFS_FILE_SIZE: Integer read _GetCAP_PROP_XI_FFS_FILE_SIZE;
    {class} property CAP_PROP_XI_FRAMERATE: Integer read _GetCAP_PROP_XI_FRAMERATE;
    {class} property CAP_PROP_XI_FREE_FFS_SIZE: Integer read _GetCAP_PROP_XI_FREE_FFS_SIZE;
    {class} property CAP_PROP_XI_GAIN: Integer read _GetCAP_PROP_XI_GAIN;
    {class} property CAP_PROP_XI_GAIN_SELECTOR: Integer read _GetCAP_PROP_XI_GAIN_SELECTOR;
    {class} property CAP_PROP_XI_GAMMAC: Integer read _GetCAP_PROP_XI_GAMMAC;
    {class} property CAP_PROP_XI_GAMMAY: Integer read _GetCAP_PROP_XI_GAMMAY;
    {class} property CAP_PROP_XI_GPI_LEVEL: Integer read _GetCAP_PROP_XI_GPI_LEVEL;
    {class} property CAP_PROP_XI_GPI_MODE: Integer read _GetCAP_PROP_XI_GPI_MODE;
    {class} property CAP_PROP_XI_GPI_SELECTOR: Integer read _GetCAP_PROP_XI_GPI_SELECTOR;
    {class} property CAP_PROP_XI_GPO_MODE: Integer read _GetCAP_PROP_XI_GPO_MODE;
    {class} property CAP_PROP_XI_GPO_SELECTOR: Integer read _GetCAP_PROP_XI_GPO_SELECTOR;
    {class} property CAP_PROP_XI_HDR: Integer read _GetCAP_PROP_XI_HDR;
    {class} property CAP_PROP_XI_HDR_KNEEPOINT_COUNT: Integer read _GetCAP_PROP_XI_HDR_KNEEPOINT_COUNT;
    {class} property CAP_PROP_XI_HDR_T1: Integer read _GetCAP_PROP_XI_HDR_T1;
    {class} property CAP_PROP_XI_HDR_T2: Integer read _GetCAP_PROP_XI_HDR_T2;
    {class} property CAP_PROP_XI_HEIGHT: Integer read _GetCAP_PROP_XI_HEIGHT;
    {class} property CAP_PROP_XI_HOUS_BACK_SIDE_TEMP: Integer read _GetCAP_PROP_XI_HOUS_BACK_SIDE_TEMP;
    {class} property CAP_PROP_XI_HOUS_TEMP: Integer read _GetCAP_PROP_XI_HOUS_TEMP;
    {class} property CAP_PROP_XI_HW_REVISION: Integer read _GetCAP_PROP_XI_HW_REVISION;
    {class} property CAP_PROP_XI_IMAGE_BLACK_LEVEL: Integer read _GetCAP_PROP_XI_IMAGE_BLACK_LEVEL;
    {class} property CAP_PROP_XI_IMAGE_DATA_BIT_DEPTH: Integer read _GetCAP_PROP_XI_IMAGE_DATA_BIT_DEPTH;
    {class} property CAP_PROP_XI_IMAGE_DATA_FORMAT: Integer read _GetCAP_PROP_XI_IMAGE_DATA_FORMAT;
    {class} property CAP_PROP_XI_IMAGE_DATA_FORMAT_RGB32_ALPHA: Integer read _GetCAP_PROP_XI_IMAGE_DATA_FORMAT_RGB32_ALPHA;
    {class} property CAP_PROP_XI_IMAGE_IS_COLOR: Integer read _GetCAP_PROP_XI_IMAGE_IS_COLOR;
    {class} property CAP_PROP_XI_IMAGE_PAYLOAD_SIZE: Integer read _GetCAP_PROP_XI_IMAGE_PAYLOAD_SIZE;
    {class} property CAP_PROP_XI_IS_COOLED: Integer read _GetCAP_PROP_XI_IS_COOLED;
    {class} property CAP_PROP_XI_IS_DEVICE_EXIST: Integer read _GetCAP_PROP_XI_IS_DEVICE_EXIST;
    {class} property CAP_PROP_XI_KNEEPOINT1: Integer read _GetCAP_PROP_XI_KNEEPOINT1;
    {class} property CAP_PROP_XI_KNEEPOINT2: Integer read _GetCAP_PROP_XI_KNEEPOINT2;
    {class} property CAP_PROP_XI_LED_MODE: Integer read _GetCAP_PROP_XI_LED_MODE;
    {class} property CAP_PROP_XI_LED_SELECTOR: Integer read _GetCAP_PROP_XI_LED_SELECTOR;
    {class} property CAP_PROP_XI_LENS_APERTURE_VALUE: Integer read _GetCAP_PROP_XI_LENS_APERTURE_VALUE;
    {class} property CAP_PROP_XI_LENS_FEATURE: Integer read _GetCAP_PROP_XI_LENS_FEATURE;
    {class} property CAP_PROP_XI_LENS_FEATURE_SELECTOR: Integer read _GetCAP_PROP_XI_LENS_FEATURE_SELECTOR;
    {class} property CAP_PROP_XI_LENS_FOCAL_LENGTH: Integer read _GetCAP_PROP_XI_LENS_FOCAL_LENGTH;
    {class} property CAP_PROP_XI_LENS_FOCUS_DISTANCE: Integer read _GetCAP_PROP_XI_LENS_FOCUS_DISTANCE;
    {class} property CAP_PROP_XI_LENS_FOCUS_MOVE: Integer read _GetCAP_PROP_XI_LENS_FOCUS_MOVE;
    {class} property CAP_PROP_XI_LENS_FOCUS_MOVEMENT_VALUE: Integer read _GetCAP_PROP_XI_LENS_FOCUS_MOVEMENT_VALUE;
    {class} property CAP_PROP_XI_LENS_MODE: Integer read _GetCAP_PROP_XI_LENS_MODE;
    {class} property CAP_PROP_XI_LIMIT_BANDWIDTH: Integer read _GetCAP_PROP_XI_LIMIT_BANDWIDTH;
    {class} property CAP_PROP_XI_LUT_EN: Integer read _GetCAP_PROP_XI_LUT_EN;
    {class} property CAP_PROP_XI_LUT_INDEX: Integer read _GetCAP_PROP_XI_LUT_INDEX;
    {class} property CAP_PROP_XI_LUT_VALUE: Integer read _GetCAP_PROP_XI_LUT_VALUE;
    {class} property CAP_PROP_XI_MANUAL_WB: Integer read _GetCAP_PROP_XI_MANUAL_WB;
    {class} property CAP_PROP_XI_OFFSET_X: Integer read _GetCAP_PROP_XI_OFFSET_X;
    {class} property CAP_PROP_XI_OFFSET_Y: Integer read _GetCAP_PROP_XI_OFFSET_Y;
    {class} property CAP_PROP_XI_OUTPUT_DATA_BIT_DEPTH: Integer read _GetCAP_PROP_XI_OUTPUT_DATA_BIT_DEPTH;
    {class} property CAP_PROP_XI_OUTPUT_DATA_PACKING: Integer read _GetCAP_PROP_XI_OUTPUT_DATA_PACKING;
    {class} property CAP_PROP_XI_OUTPUT_DATA_PACKING_TYPE: Integer read _GetCAP_PROP_XI_OUTPUT_DATA_PACKING_TYPE;
    {class} property CAP_PROP_XI_RECENT_FRAME: Integer read _GetCAP_PROP_XI_RECENT_FRAME;
    {class} property CAP_PROP_XI_REGION_MODE: Integer read _GetCAP_PROP_XI_REGION_MODE;
    {class} property CAP_PROP_XI_REGION_SELECTOR: Integer read _GetCAP_PROP_XI_REGION_SELECTOR;
    {class} property CAP_PROP_XI_ROW_FPN_CORRECTION: Integer read _GetCAP_PROP_XI_ROW_FPN_CORRECTION;
    {class} property CAP_PROP_XI_SENSOR_BOARD_TEMP: Integer read _GetCAP_PROP_XI_SENSOR_BOARD_TEMP;
    {class} property CAP_PROP_XI_SENSOR_CLOCK_FREQ_HZ: Integer read _GetCAP_PROP_XI_SENSOR_CLOCK_FREQ_HZ;
    {class} property CAP_PROP_XI_SENSOR_CLOCK_FREQ_INDEX: Integer read _GetCAP_PROP_XI_SENSOR_CLOCK_FREQ_INDEX;
    {class} property CAP_PROP_XI_SENSOR_DATA_BIT_DEPTH: Integer read _GetCAP_PROP_XI_SENSOR_DATA_BIT_DEPTH;
    {class} property CAP_PROP_XI_SENSOR_FEATURE_SELECTOR: Integer read _GetCAP_PROP_XI_SENSOR_FEATURE_SELECTOR;
    {class} property CAP_PROP_XI_SENSOR_FEATURE_VALUE: Integer read _GetCAP_PROP_XI_SENSOR_FEATURE_VALUE;
    {class} property CAP_PROP_XI_SENSOR_MODE: Integer read _GetCAP_PROP_XI_SENSOR_MODE;
    {class} property CAP_PROP_XI_SENSOR_OUTPUT_CHANNEL_COUNT: Integer read _GetCAP_PROP_XI_SENSOR_OUTPUT_CHANNEL_COUNT;
    {class} property CAP_PROP_XI_SENSOR_TAPS: Integer read _GetCAP_PROP_XI_SENSOR_TAPS;
    {class} property CAP_PROP_XI_SHARPNESS: Integer read _GetCAP_PROP_XI_SHARPNESS;
    {class} property CAP_PROP_XI_SHUTTER_TYPE: Integer read _GetCAP_PROP_XI_SHUTTER_TYPE;
    {class} property CAP_PROP_XI_TARGET_TEMP: Integer read _GetCAP_PROP_XI_TARGET_TEMP;
    {class} property CAP_PROP_XI_TEST_PATTERN: Integer read _GetCAP_PROP_XI_TEST_PATTERN;
    {class} property CAP_PROP_XI_TEST_PATTERN_GENERATOR_SELECTOR: Integer read _GetCAP_PROP_XI_TEST_PATTERN_GENERATOR_SELECTOR;
    {class} property CAP_PROP_XI_TIMEOUT: Integer read _GetCAP_PROP_XI_TIMEOUT;
    {class} property CAP_PROP_XI_TRANSPORT_PIXEL_FORMAT: Integer read _GetCAP_PROP_XI_TRANSPORT_PIXEL_FORMAT;
    {class} property CAP_PROP_XI_TRG_DELAY: Integer read _GetCAP_PROP_XI_TRG_DELAY;
    {class} property CAP_PROP_XI_TRG_SELECTOR: Integer read _GetCAP_PROP_XI_TRG_SELECTOR;
    {class} property CAP_PROP_XI_TRG_SOFTWARE: Integer read _GetCAP_PROP_XI_TRG_SOFTWARE;
    {class} property CAP_PROP_XI_TRG_SOURCE: Integer read _GetCAP_PROP_XI_TRG_SOURCE;
    {class} property CAP_PROP_XI_TS_RST_MODE: Integer read _GetCAP_PROP_XI_TS_RST_MODE;
    {class} property CAP_PROP_XI_TS_RST_SOURCE: Integer read _GetCAP_PROP_XI_TS_RST_SOURCE;
    {class} property CAP_PROP_XI_USED_FFS_SIZE: Integer read _GetCAP_PROP_XI_USED_FFS_SIZE;
    {class} property CAP_PROP_XI_WB_KB: Integer read _GetCAP_PROP_XI_WB_KB;
    {class} property CAP_PROP_XI_WB_KG: Integer read _GetCAP_PROP_XI_WB_KG;
    {class} property CAP_PROP_XI_WB_KR: Integer read _GetCAP_PROP_XI_WB_KR;
    {class} property CAP_PROP_XI_WIDTH: Integer read _GetCAP_PROP_XI_WIDTH;
    {class} property CAP_PROP_ZOOM: Integer read _GetCAP_PROP_ZOOM;
    {class} property CAP_PVAPI: Integer read _GetCAP_PVAPI;
    {class} property CAP_PVAPI_DECIMATION_2OUTOF16: Integer read _GetCAP_PVAPI_DECIMATION_2OUTOF16;
    {class} property CAP_PVAPI_DECIMATION_2OUTOF4: Integer read _GetCAP_PVAPI_DECIMATION_2OUTOF4;
    {class} property CAP_PVAPI_DECIMATION_2OUTOF8: Integer read _GetCAP_PVAPI_DECIMATION_2OUTOF8;
    {class} property CAP_PVAPI_DECIMATION_OFF: Integer read _GetCAP_PVAPI_DECIMATION_OFF;
    {class} property CAP_PVAPI_FSTRIGMODE_FIXEDRATE: Integer read _GetCAP_PVAPI_FSTRIGMODE_FIXEDRATE;
    {class} property CAP_PVAPI_FSTRIGMODE_FREERUN: Integer read _GetCAP_PVAPI_FSTRIGMODE_FREERUN;
    {class} property CAP_PVAPI_FSTRIGMODE_SOFTWARE: Integer read _GetCAP_PVAPI_FSTRIGMODE_SOFTWARE;
    {class} property CAP_PVAPI_FSTRIGMODE_SYNCIN1: Integer read _GetCAP_PVAPI_FSTRIGMODE_SYNCIN1;
    {class} property CAP_PVAPI_FSTRIGMODE_SYNCIN2: Integer read _GetCAP_PVAPI_FSTRIGMODE_SYNCIN2;
    {class} property CAP_PVAPI_PIXELFORMAT_BAYER16: Integer read _GetCAP_PVAPI_PIXELFORMAT_BAYER16;
    {class} property CAP_PVAPI_PIXELFORMAT_BAYER8: Integer read _GetCAP_PVAPI_PIXELFORMAT_BAYER8;
    {class} property CAP_PVAPI_PIXELFORMAT_BGR24: Integer read _GetCAP_PVAPI_PIXELFORMAT_BGR24;
    {class} property CAP_PVAPI_PIXELFORMAT_BGRA32: Integer read _GetCAP_PVAPI_PIXELFORMAT_BGRA32;
    {class} property CAP_PVAPI_PIXELFORMAT_MONO16: Integer read _GetCAP_PVAPI_PIXELFORMAT_MONO16;
    {class} property CAP_PVAPI_PIXELFORMAT_MONO8: Integer read _GetCAP_PVAPI_PIXELFORMAT_MONO8;
    {class} property CAP_PVAPI_PIXELFORMAT_RGB24: Integer read _GetCAP_PVAPI_PIXELFORMAT_RGB24;
    {class} property CAP_PVAPI_PIXELFORMAT_RGBA32: Integer read _GetCAP_PVAPI_PIXELFORMAT_RGBA32;
    {class} property CAP_QT: Integer read _GetCAP_QT;
    {class} property CAP_REALSENSE: Integer read _GetCAP_REALSENSE;
    {class} property CAP_UNICAP: Integer read _GetCAP_UNICAP;
    {class} property CAP_V4L: Integer read _GetCAP_V4L;
    {class} property CAP_V4L2: Integer read _GetCAP_V4L2;
    {class} property CAP_VFW: Integer read _GetCAP_VFW;
    {class} property CAP_WINRT: Integer read _GetCAP_WINRT;
    {class} property CAP_XIAPI: Integer read _GetCAP_XIAPI;
    {class} property CAP_XINE: Integer read _GetCAP_XINE;
    {class} property VIDEOWRITER_PROP_FRAMEBYTES: Integer read _GetVIDEOWRITER_PROP_FRAMEBYTES;
    {class} property VIDEOWRITER_PROP_NSTRIPES: Integer read _GetVIDEOWRITER_PROP_NSTRIPES;
    {class} property VIDEOWRITER_PROP_QUALITY: Integer read _GetVIDEOWRITER_PROP_QUALITY;
  end;

  [JavaSignature('org/opencv/videoio/Videoio')]
  JVideoio = interface(JObject)
    ['{71B439DD-220F-4FC0-8097-6C2D9C4B820F}']
  end;
  TJVideoio = class(TJavaGenericImport<JVideoioClass, JVideoio>) end;

implementation

procedure RegisterTypes;
begin
  TRegTypes.RegisterType('Android.OpenCV.JAnimator', TypeInfo(Android.OpenCV.JAnimator));
  TRegTypes.RegisterType('Android.OpenCV.JAnimator_AnimatorListener', TypeInfo(Android.OpenCV.JAnimator_AnimatorListener));
  TRegTypes.RegisterType('Android.OpenCV.JAnimator_AnimatorPauseListener', TypeInfo(Android.OpenCV.JAnimator_AnimatorPauseListener));
  TRegTypes.RegisterType('Android.OpenCV.JKeyframe', TypeInfo(Android.OpenCV.JKeyframe));
  TRegTypes.RegisterType('Android.OpenCV.JLayoutTransition', TypeInfo(Android.OpenCV.JLayoutTransition));
  TRegTypes.RegisterType('Android.OpenCV.JLayoutTransition_TransitionListener', TypeInfo(Android.OpenCV.JLayoutTransition_TransitionListener));
  TRegTypes.RegisterType('Android.OpenCV.JPropertyValuesHolder', TypeInfo(Android.OpenCV.JPropertyValuesHolder));
  TRegTypes.RegisterType('Android.OpenCV.JStateListAnimator', TypeInfo(Android.OpenCV.JStateListAnimator));
  TRegTypes.RegisterType('Android.OpenCV.JTimeInterpolator', TypeInfo(Android.OpenCV.JTimeInterpolator));
  TRegTypes.RegisterType('Android.OpenCV.JTypeConverter', TypeInfo(Android.OpenCV.JTypeConverter));
  TRegTypes.RegisterType('Android.OpenCV.JTypeEvaluator', TypeInfo(Android.OpenCV.JTypeEvaluator));
  TRegTypes.RegisterType('Android.OpenCV.JValueAnimator', TypeInfo(Android.OpenCV.JValueAnimator));
  TRegTypes.RegisterType('Android.OpenCV.JValueAnimator_AnimatorUpdateListener', TypeInfo(Android.OpenCV.JValueAnimator_AnimatorUpdateListener));
  TRegTypes.RegisterType('Android.OpenCV.JPathMotion', TypeInfo(Android.OpenCV.JPathMotion));
  TRegTypes.RegisterType('Android.OpenCV.JScene', TypeInfo(Android.OpenCV.JScene));
  TRegTypes.RegisterType('Android.OpenCV.JTransition', TypeInfo(Android.OpenCV.JTransition));
  TRegTypes.RegisterType('Android.OpenCV.JTransition_EpicenterCallback', TypeInfo(Android.OpenCV.JTransition_EpicenterCallback));
  TRegTypes.RegisterType('Android.OpenCV.JTransition_TransitionListener', TypeInfo(Android.OpenCV.JTransition_TransitionListener));
  TRegTypes.RegisterType('Android.OpenCV.JTransitionManager', TypeInfo(Android.OpenCV.JTransitionManager));
  TRegTypes.RegisterType('Android.OpenCV.JTransitionPropagation', TypeInfo(Android.OpenCV.JTransitionPropagation));
  TRegTypes.RegisterType('Android.OpenCV.JTransitionValues', TypeInfo(Android.OpenCV.JTransitionValues));
  TRegTypes.RegisterType('Android.OpenCV.JInterpolator', TypeInfo(Android.OpenCV.JInterpolator));
  TRegTypes.RegisterType('Android.OpenCV.JToolbar_LayoutParams', TypeInfo(Android.OpenCV.JToolbar_LayoutParams));
  TRegTypes.RegisterType('Android.OpenCV.JBaseLoaderCallback', TypeInfo(Android.OpenCV.JBaseLoaderCallback));
  TRegTypes.RegisterType('Android.OpenCV.JCameraGLRendererBase', TypeInfo(Android.OpenCV.JCameraGLRendererBase));
  TRegTypes.RegisterType('Android.OpenCV.JCamera2Renderer', TypeInfo(Android.OpenCV.JCamera2Renderer));
  TRegTypes.RegisterType('Android.OpenCV.JCameraActivity', TypeInfo(Android.OpenCV.JCameraActivity));
  TRegTypes.RegisterType('Android.OpenCV.JCameraBridgeViewBase', TypeInfo(Android.OpenCV.JCameraBridgeViewBase));
  TRegTypes.RegisterType('Android.OpenCV.JCameraBridgeViewBase_CvCameraViewFrame', TypeInfo(Android.OpenCV.JCameraBridgeViewBase_CvCameraViewFrame));
  TRegTypes.RegisterType('Android.OpenCV.JCameraBridgeViewBase_CvCameraViewListener', TypeInfo(Android.OpenCV.JCameraBridgeViewBase_CvCameraViewListener));
  TRegTypes.RegisterType('Android.OpenCV.JCameraBridgeViewBase_CvCameraViewListener2', TypeInfo(Android.OpenCV.JCameraBridgeViewBase_CvCameraViewListener2));
  TRegTypes.RegisterType('Android.OpenCV.JCameraBridgeViewBase_ListItemAccessor', TypeInfo(Android.OpenCV.JCameraBridgeViewBase_ListItemAccessor));
  TRegTypes.RegisterType('Android.OpenCV.JCameraGLSurfaceView', TypeInfo(Android.OpenCV.JCameraGLSurfaceView));
  TRegTypes.RegisterType('Android.OpenCV.JCameraGLSurfaceView_CameraTextureListener', TypeInfo(Android.OpenCV.JCameraGLSurfaceView_CameraTextureListener));
  TRegTypes.RegisterType('Android.OpenCV.JCameraRenderer', TypeInfo(Android.OpenCV.JCameraRenderer));
  TRegTypes.RegisterType('Android.OpenCV.JFpsMeter', TypeInfo(Android.OpenCV.JFpsMeter));
  TRegTypes.RegisterType('Android.OpenCV.JInstallCallbackInterface', TypeInfo(Android.OpenCV.JInstallCallbackInterface));
  TRegTypes.RegisterType('Android.OpenCV.JJavaCamera2View', TypeInfo(Android.OpenCV.JJavaCamera2View));
  TRegTypes.RegisterType('Android.OpenCV.JJavaCamera2View_JavaCameraSizeAccessor', TypeInfo(Android.OpenCV.JJavaCamera2View_JavaCameraSizeAccessor));
  TRegTypes.RegisterType('Android.OpenCV.JJavaCameraView', TypeInfo(Android.OpenCV.JJavaCameraView));
  TRegTypes.RegisterType('Android.OpenCV.JJavaCameraView_JavaCameraSizeAccessor', TypeInfo(Android.OpenCV.JJavaCameraView_JavaCameraSizeAccessor));
  TRegTypes.RegisterType('Android.OpenCV.JLoaderCallbackInterface', TypeInfo(Android.OpenCV.JLoaderCallbackInterface));
  TRegTypes.RegisterType('Android.OpenCV.JOpenCVLoader', TypeInfo(Android.OpenCV.JOpenCVLoader));
  TRegTypes.RegisterType('Android.OpenCV.Jandroid_Utils', TypeInfo(Android.OpenCV.Jandroid_Utils));
  TRegTypes.RegisterType('Android.OpenCV.JCalib3d', TypeInfo(Android.OpenCV.JCalib3d));
  TRegTypes.RegisterType('Android.OpenCV.JAlgorithm', TypeInfo(Android.OpenCV.JAlgorithm));
  TRegTypes.RegisterType('Android.OpenCV.JStereoMatcher', TypeInfo(Android.OpenCV.JStereoMatcher));
  TRegTypes.RegisterType('Android.OpenCV.JStereoBM', TypeInfo(Android.OpenCV.JStereoBM));
  TRegTypes.RegisterType('Android.OpenCV.JStereoSGBM', TypeInfo(Android.OpenCV.JStereoSGBM));
  TRegTypes.RegisterType('Android.OpenCV.JCore', TypeInfo(Android.OpenCV.JCore));
  TRegTypes.RegisterType('Android.OpenCV.JCore_MinMaxLocResult', TypeInfo(Android.OpenCV.JCore_MinMaxLocResult));
  TRegTypes.RegisterType('Android.OpenCV.JCvException', TypeInfo(Android.OpenCV.JCvException));
  TRegTypes.RegisterType('Android.OpenCV.JCvType', TypeInfo(Android.OpenCV.JCvType));
  TRegTypes.RegisterType('Android.OpenCV.JDMatch', TypeInfo(Android.OpenCV.JDMatch));
  TRegTypes.RegisterType('Android.OpenCV.JKeyPoint', TypeInfo(Android.OpenCV.JKeyPoint));
  TRegTypes.RegisterType('Android.OpenCV.JMat', TypeInfo(Android.OpenCV.JMat));
  TRegTypes.RegisterType('Android.OpenCV.JMatOfByte', TypeInfo(Android.OpenCV.JMatOfByte));
  TRegTypes.RegisterType('Android.OpenCV.JMatOfDMatch', TypeInfo(Android.OpenCV.JMatOfDMatch));
  TRegTypes.RegisterType('Android.OpenCV.JMatOfDouble', TypeInfo(Android.OpenCV.JMatOfDouble));
  TRegTypes.RegisterType('Android.OpenCV.JMatOfFloat', TypeInfo(Android.OpenCV.JMatOfFloat));
  TRegTypes.RegisterType('Android.OpenCV.JMatOfFloat4', TypeInfo(Android.OpenCV.JMatOfFloat4));
  TRegTypes.RegisterType('Android.OpenCV.JMatOfFloat6', TypeInfo(Android.OpenCV.JMatOfFloat6));
  TRegTypes.RegisterType('Android.OpenCV.JMatOfInt', TypeInfo(Android.OpenCV.JMatOfInt));
  TRegTypes.RegisterType('Android.OpenCV.JMatOfInt4', TypeInfo(Android.OpenCV.JMatOfInt4));
  TRegTypes.RegisterType('Android.OpenCV.JMatOfKeyPoint', TypeInfo(Android.OpenCV.JMatOfKeyPoint));
  TRegTypes.RegisterType('Android.OpenCV.JMatOfPoint', TypeInfo(Android.OpenCV.JMatOfPoint));
  TRegTypes.RegisterType('Android.OpenCV.JMatOfPoint2f', TypeInfo(Android.OpenCV.JMatOfPoint2f));
  TRegTypes.RegisterType('Android.OpenCV.JMatOfPoint3', TypeInfo(Android.OpenCV.JMatOfPoint3));
  TRegTypes.RegisterType('Android.OpenCV.JMatOfPoint3f', TypeInfo(Android.OpenCV.JMatOfPoint3f));
  TRegTypes.RegisterType('Android.OpenCV.JMatOfRect', TypeInfo(Android.OpenCV.JMatOfRect));
  TRegTypes.RegisterType('Android.OpenCV.JMatOfRect2d', TypeInfo(Android.OpenCV.JMatOfRect2d));
  TRegTypes.RegisterType('Android.OpenCV.JMatOfRotatedRect', TypeInfo(Android.OpenCV.JMatOfRotatedRect));
  TRegTypes.RegisterType('Android.OpenCV.Jcore_Point', TypeInfo(Android.OpenCV.Jcore_Point));
  TRegTypes.RegisterType('Android.OpenCV.JPoint3', TypeInfo(Android.OpenCV.JPoint3));
  TRegTypes.RegisterType('Android.OpenCV.Jcore_Range', TypeInfo(Android.OpenCV.Jcore_Range));
  TRegTypes.RegisterType('Android.OpenCV.Jcore_Rect', TypeInfo(Android.OpenCV.Jcore_Rect));
  TRegTypes.RegisterType('Android.OpenCV.JRect2d', TypeInfo(Android.OpenCV.JRect2d));
  TRegTypes.RegisterType('Android.OpenCV.JRotatedRect', TypeInfo(Android.OpenCV.JRotatedRect));
  TRegTypes.RegisterType('Android.OpenCV.JScalar', TypeInfo(Android.OpenCV.JScalar));
  TRegTypes.RegisterType('Android.OpenCV.Jcore_Size', TypeInfo(Android.OpenCV.Jcore_Size));
  TRegTypes.RegisterType('Android.OpenCV.JTermCriteria', TypeInfo(Android.OpenCV.JTermCriteria));
  TRegTypes.RegisterType('Android.OpenCV.JTickMeter', TypeInfo(Android.OpenCV.JTickMeter));
  TRegTypes.RegisterType('Android.OpenCV.JNet', TypeInfo(Android.OpenCV.JNet));
  TRegTypes.RegisterType('Android.OpenCV.JModel', TypeInfo(Android.OpenCV.JModel));
  TRegTypes.RegisterType('Android.OpenCV.JClassificationModel', TypeInfo(Android.OpenCV.JClassificationModel));
  TRegTypes.RegisterType('Android.OpenCV.JDetectionModel', TypeInfo(Android.OpenCV.JDetectionModel));
  TRegTypes.RegisterType('Android.OpenCV.JDictValue', TypeInfo(Android.OpenCV.JDictValue));
  TRegTypes.RegisterType('Android.OpenCV.JDnn', TypeInfo(Android.OpenCV.JDnn));
  TRegTypes.RegisterType('Android.OpenCV.JKeypointsModel', TypeInfo(Android.OpenCV.JKeypointsModel));
  TRegTypes.RegisterType('Android.OpenCV.JLayer', TypeInfo(Android.OpenCV.JLayer));
  TRegTypes.RegisterType('Android.OpenCV.JSegmentationModel', TypeInfo(Android.OpenCV.JSegmentationModel));
  TRegTypes.RegisterType('Android.OpenCV.JFeature2D', TypeInfo(Android.OpenCV.JFeature2D));
  TRegTypes.RegisterType('Android.OpenCV.JAKAZE', TypeInfo(Android.OpenCV.JAKAZE));
  TRegTypes.RegisterType('Android.OpenCV.JAgastFeatureDetector', TypeInfo(Android.OpenCV.JAgastFeatureDetector));
  TRegTypes.RegisterType('Android.OpenCV.JDescriptorMatcher', TypeInfo(Android.OpenCV.JDescriptorMatcher));
  TRegTypes.RegisterType('Android.OpenCV.JBFMatcher', TypeInfo(Android.OpenCV.JBFMatcher));
  TRegTypes.RegisterType('Android.OpenCV.JBOWImgDescriptorExtractor', TypeInfo(Android.OpenCV.JBOWImgDescriptorExtractor));
  TRegTypes.RegisterType('Android.OpenCV.JBOWTrainer', TypeInfo(Android.OpenCV.JBOWTrainer));
  TRegTypes.RegisterType('Android.OpenCV.JBOWKMeansTrainer', TypeInfo(Android.OpenCV.JBOWKMeansTrainer));
  TRegTypes.RegisterType('Android.OpenCV.JBRISK', TypeInfo(Android.OpenCV.JBRISK));
  TRegTypes.RegisterType('Android.OpenCV.JFastFeatureDetector', TypeInfo(Android.OpenCV.JFastFeatureDetector));
  TRegTypes.RegisterType('Android.OpenCV.JFeatures2d', TypeInfo(Android.OpenCV.JFeatures2d));
  TRegTypes.RegisterType('Android.OpenCV.JFlannBasedMatcher', TypeInfo(Android.OpenCV.JFlannBasedMatcher));
  TRegTypes.RegisterType('Android.OpenCV.JGFTTDetector', TypeInfo(Android.OpenCV.JGFTTDetector));
  TRegTypes.RegisterType('Android.OpenCV.JKAZE', TypeInfo(Android.OpenCV.JKAZE));
  TRegTypes.RegisterType('Android.OpenCV.JMSER', TypeInfo(Android.OpenCV.JMSER));
  TRegTypes.RegisterType('Android.OpenCV.JORB', TypeInfo(Android.OpenCV.JORB));
  TRegTypes.RegisterType('Android.OpenCV.JParams', TypeInfo(Android.OpenCV.JParams));
  TRegTypes.RegisterType('Android.OpenCV.JSimpleBlobDetector', TypeInfo(Android.OpenCV.JSimpleBlobDetector));
  TRegTypes.RegisterType('Android.OpenCV.JImgcodecs', TypeInfo(Android.OpenCV.JImgcodecs));
  TRegTypes.RegisterType('Android.OpenCV.JCLAHE', TypeInfo(Android.OpenCV.JCLAHE));
  TRegTypes.RegisterType('Android.OpenCV.JGeneralizedHough', TypeInfo(Android.OpenCV.JGeneralizedHough));
  TRegTypes.RegisterType('Android.OpenCV.JGeneralizedHoughBallard', TypeInfo(Android.OpenCV.JGeneralizedHoughBallard));
  TRegTypes.RegisterType('Android.OpenCV.JGeneralizedHoughGuil', TypeInfo(Android.OpenCV.JGeneralizedHoughGuil));
  TRegTypes.RegisterType('Android.OpenCV.JImgproc', TypeInfo(Android.OpenCV.JImgproc));
  TRegTypes.RegisterType('Android.OpenCV.JLineSegmentDetector', TypeInfo(Android.OpenCV.JLineSegmentDetector));
  TRegTypes.RegisterType('Android.OpenCV.Jimgproc_Moments', TypeInfo(Android.OpenCV.Jimgproc_Moments));
  TRegTypes.RegisterType('Android.OpenCV.JSubdiv2D', TypeInfo(Android.OpenCV.JSubdiv2D));
  TRegTypes.RegisterType('Android.OpenCV.JStatModel', TypeInfo(Android.OpenCV.JStatModel));
  TRegTypes.RegisterType('Android.OpenCV.JANN_MLP', TypeInfo(Android.OpenCV.JANN_MLP));
  TRegTypes.RegisterType('Android.OpenCV.JDTrees', TypeInfo(Android.OpenCV.JDTrees));
  TRegTypes.RegisterType('Android.OpenCV.JBoost', TypeInfo(Android.OpenCV.JBoost));
  TRegTypes.RegisterType('Android.OpenCV.JEM', TypeInfo(Android.OpenCV.JEM));
  TRegTypes.RegisterType('Android.OpenCV.JKNearest', TypeInfo(Android.OpenCV.JKNearest));
  TRegTypes.RegisterType('Android.OpenCV.JLogisticRegression', TypeInfo(Android.OpenCV.JLogisticRegression));
  TRegTypes.RegisterType('Android.OpenCV.JMl', TypeInfo(Android.OpenCV.JMl));
  TRegTypes.RegisterType('Android.OpenCV.JNormalBayesClassifier', TypeInfo(Android.OpenCV.JNormalBayesClassifier));
  TRegTypes.RegisterType('Android.OpenCV.JParamGrid', TypeInfo(Android.OpenCV.JParamGrid));
  TRegTypes.RegisterType('Android.OpenCV.JRTrees', TypeInfo(Android.OpenCV.JRTrees));
  TRegTypes.RegisterType('Android.OpenCV.JSVM', TypeInfo(Android.OpenCV.JSVM));
  TRegTypes.RegisterType('Android.OpenCV.JSVMSGD', TypeInfo(Android.OpenCV.JSVMSGD));
  TRegTypes.RegisterType('Android.OpenCV.JTrainData', TypeInfo(Android.OpenCV.JTrainData));
  TRegTypes.RegisterType('Android.OpenCV.JBaseCascadeClassifier', TypeInfo(Android.OpenCV.JBaseCascadeClassifier));
  TRegTypes.RegisterType('Android.OpenCV.JCascadeClassifier', TypeInfo(Android.OpenCV.JCascadeClassifier));
  TRegTypes.RegisterType('Android.OpenCV.JHOGDescriptor', TypeInfo(Android.OpenCV.JHOGDescriptor));
  TRegTypes.RegisterType('Android.OpenCV.JObjdetect', TypeInfo(Android.OpenCV.JObjdetect));
  TRegTypes.RegisterType('Android.OpenCV.JQRCodeDetector', TypeInfo(Android.OpenCV.JQRCodeDetector));
  TRegTypes.RegisterType('Android.OpenCV.JOpenCVInterface', TypeInfo(Android.OpenCV.JOpenCVInterface));
  TRegTypes.RegisterType('Android.OpenCV.JOpenCVNativeLoader', TypeInfo(Android.OpenCV.JOpenCVNativeLoader));
  TRegTypes.RegisterType('Android.OpenCV.JAlignExposures', TypeInfo(Android.OpenCV.JAlignExposures));
  TRegTypes.RegisterType('Android.OpenCV.JAlignMTB', TypeInfo(Android.OpenCV.JAlignMTB));
  TRegTypes.RegisterType('Android.OpenCV.JCalibrateCRF', TypeInfo(Android.OpenCV.JCalibrateCRF));
  TRegTypes.RegisterType('Android.OpenCV.JCalibrateDebevec', TypeInfo(Android.OpenCV.JCalibrateDebevec));
  TRegTypes.RegisterType('Android.OpenCV.JCalibrateRobertson', TypeInfo(Android.OpenCV.JCalibrateRobertson));
  TRegTypes.RegisterType('Android.OpenCV.JMergeExposures', TypeInfo(Android.OpenCV.JMergeExposures));
  TRegTypes.RegisterType('Android.OpenCV.JMergeDebevec', TypeInfo(Android.OpenCV.JMergeDebevec));
  TRegTypes.RegisterType('Android.OpenCV.JMergeMertens', TypeInfo(Android.OpenCV.JMergeMertens));
  TRegTypes.RegisterType('Android.OpenCV.JMergeRobertson', TypeInfo(Android.OpenCV.JMergeRobertson));
  TRegTypes.RegisterType('Android.OpenCV.JPhoto', TypeInfo(Android.OpenCV.JPhoto));
  TRegTypes.RegisterType('Android.OpenCV.JTonemap', TypeInfo(Android.OpenCV.JTonemap));
  TRegTypes.RegisterType('Android.OpenCV.JTonemapDrago', TypeInfo(Android.OpenCV.JTonemapDrago));
  TRegTypes.RegisterType('Android.OpenCV.JTonemapMantiuk', TypeInfo(Android.OpenCV.JTonemapMantiuk));
  TRegTypes.RegisterType('Android.OpenCV.JTonemapReinhard', TypeInfo(Android.OpenCV.JTonemapReinhard));
  TRegTypes.RegisterType('Android.OpenCV.JConverters', TypeInfo(Android.OpenCV.JConverters));
  TRegTypes.RegisterType('Android.OpenCV.JBackgroundSubtractor', TypeInfo(Android.OpenCV.JBackgroundSubtractor));
  TRegTypes.RegisterType('Android.OpenCV.JBackgroundSubtractorKNN', TypeInfo(Android.OpenCV.JBackgroundSubtractorKNN));
  TRegTypes.RegisterType('Android.OpenCV.JBackgroundSubtractorMOG2', TypeInfo(Android.OpenCV.JBackgroundSubtractorMOG2));
  TRegTypes.RegisterType('Android.OpenCV.JDenseOpticalFlow', TypeInfo(Android.OpenCV.JDenseOpticalFlow));
  TRegTypes.RegisterType('Android.OpenCV.JDISOpticalFlow', TypeInfo(Android.OpenCV.JDISOpticalFlow));
  TRegTypes.RegisterType('Android.OpenCV.JFarnebackOpticalFlow', TypeInfo(Android.OpenCV.JFarnebackOpticalFlow));
  TRegTypes.RegisterType('Android.OpenCV.JKalmanFilter', TypeInfo(Android.OpenCV.JKalmanFilter));
  TRegTypes.RegisterType('Android.OpenCV.JSparseOpticalFlow', TypeInfo(Android.OpenCV.JSparseOpticalFlow));
  TRegTypes.RegisterType('Android.OpenCV.JSparsePyrLKOpticalFlow', TypeInfo(Android.OpenCV.JSparsePyrLKOpticalFlow));
  TRegTypes.RegisterType('Android.OpenCV.JVariationalRefinement', TypeInfo(Android.OpenCV.JVariationalRefinement));
  TRegTypes.RegisterType('Android.OpenCV.JVideo', TypeInfo(Android.OpenCV.JVideo));
  TRegTypes.RegisterType('Android.OpenCV.JVideoCapture', TypeInfo(Android.OpenCV.JVideoCapture));
  TRegTypes.RegisterType('Android.OpenCV.JVideoWriter', TypeInfo(Android.OpenCV.JVideoWriter));
  TRegTypes.RegisterType('Android.OpenCV.JVideoio', TypeInfo(Android.OpenCV.JVideoio));
end;

initialization
  RegisterTypes;
end.

