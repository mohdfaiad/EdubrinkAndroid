unit UFormSplash;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Media,System.IOUtils,
  FMX.Objects;

type
  TFormSplash = class(TForm)
    Image1: TImage;
    MediaPlayer1: TMediaPlayer;
    Timer1: TTimer;
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    procedure PlayAudio(ResourceID,NomeArquivo: string);
  end;

var
  FormSplash: TFormSplash;

implementation

{$R *.fmx}
{$R *.XLgXhdpiTb.fmx ANDROID}

uses UFormPrincipal;

procedure TFormSplash.FormShow(Sender: TObject);
begin

  PlayAudio('Resource_3','Som_Splash.mp3');
//  MediaPlayer1.Stop;
//  MediaPlayer1.Clear;

end;

procedure TFormSplash.PlayAudio(ResourceID,NomeArquivo: string);
var
  ResStream: TResourceStream;
  TmpFile: string;
begin
  ResStream := TResourceStream.Create(HInstance, ResourceID, RT_RCDATA);
  try
    TmpFile := System.IOUtils.TPath.Combine(System.IOUtils.TPath.GetTempPath, NomeArquivo);

    ResStream.Position := 0;
    ResStream.SaveToFile(TmpFile);
    MediaPlayer1.FileName := TmpFile;

    MediaPlayer1.Play;

  finally
    ResStream.Free;
  end;

end;

procedure TFormSplash.Timer1Timer(Sender: TObject);
begin

  if (Timer1.Interval = 4000) then
  begin
    if FormPrincipal=nil then
      Application.CreateForm(TFormPrincipal,FormPrincipal);
    FormPrincipal.show;
    timer1.Enabled := false;
  end;

end;

end.
