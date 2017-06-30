unit UFormPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Effects,
  FMX.StdCtrls, FMX.Objects, FMX.Layouts, FMX.Controls.Presentation;

type
  TFormPrincipal = class(TForm)
    Label1: TLabel;
    GridPanelLayout1: TGridPanelLayout;
    RctPersonagem: TRectangle;
    BtnPersonagem: TCornerButton;
    ShadowEffect1: TShadowEffect;
    RctCores: TRectangle;
    ShadowEffect2: TShadowEffect;
    BtnCores: TCornerButton;
    RctBrinquedo: TRectangle;
    ShadowEffect3: TShadowEffect;
    BtnBrinquedo: TCornerButton;
    RctMateriais: TRectangle;
    ShadowEffect4: TShadowEffect;
    BtnMateriasEscolares: TCornerButton;
    ShadowEffect5: TShadowEffect;
    procedure BtnBrinquedoClick(Sender: TObject);
    procedure BtnCoresClick(Sender: TObject);
    procedure BtnMateriasEscolaresClick(Sender: TObject);
    procedure BtnPersonagemClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    CategoriaEscolhida:String;
    procedure AtualizaAtividade(id_categoria:integer;Categoria:String);
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

{$R *.fmx}
{$R *.XLgXhdpiTb.fmx ANDROID}

uses UDMPrincipal, UFormAtividade;

procedure TFormPrincipal.AtualizaAtividade(id_categoria: integer;Categoria: String);
begin
  with DMPrincipal do
  begin
    QueryImagem.Filtered := false;
    QueryImagem.Close;
    QueryImagem.ParamByName('pCategoria').Value := id_categoria;
    QueryImagem.Open;

    if not QueryImagem.IsEmpty then
    Begin
      CategoriaEscolhida := categoria;
      if FormAtividade = nil then
        Application.CreateForm(TFormAtividade, FormAtividade);
      TFormAtividade.Create(self).Show;
    End;
  end;

end;

procedure TFormPrincipal.BtnBrinquedoClick(Sender: TObject);
begin

  AtualizaAtividade(1,'BRINQUEDOS');

end;

procedure TFormPrincipal.BtnCoresClick(Sender: TObject);
begin

  AtualizaAtividade(3,'CORES');

end;

procedure TFormPrincipal.BtnMateriasEscolaresClick(Sender: TObject);
begin

  AtualizaAtividade(4,'MATERIAIS ESCOLARES');

end;

procedure TFormPrincipal.BtnPersonagemClick(Sender: TObject);
begin

  AtualizaAtividade(2,'PERSONAGENS');

end;

procedure TFormPrincipal.FormKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin

  if key = vkHardwareBack then
    Application.Terminate;

end;

procedure TFormPrincipal.FormShow(Sender: TObject);
begin
    try
      DMPrincipal.UniConn.Connected:= true;
    except
      ShowMessage('Voce precisa estar conectado na internet para executar o jogo!');
      Application.Terminate;
    end;

end;

end.



