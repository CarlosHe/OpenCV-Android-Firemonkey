program RGBToGray;

uses
  System.StartUpCopy,
  FMX.Forms,
  Main.View in 'Main.View.pas' {MainView};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainView, MainView);
  Application.Run;
end.
