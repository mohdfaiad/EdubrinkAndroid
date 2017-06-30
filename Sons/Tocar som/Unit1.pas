unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, MMSystem,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts,System.IOUtils;

type
  TForm1 = class(TForm)
    Layout1: TLayout;
    Button3: TButton;
    Button2: TButton;
    btnacesso: TButton;
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btnacessoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.btnacessoClick(Sender: TObject);
begin

  sndPlaySound('/Som_Erro.wav',SND_ASYNC);

end;

procedure TForm1.Button2Click(Sender: TObject);
begin

  sndPlaySound('/Som_Acerto.wav',SND_ASYNC);

end;

procedure TForm1.Button3Click(Sender: TObject);
begin

  sndPlaySound('Som_Splash.wav',SND_ASYNC);

end;

end.
