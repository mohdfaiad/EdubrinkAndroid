program Edubrink;



{$R *.dres}

uses
  System.StartUpCopy,
  FMX.Forms,
  UFormSplash in 'UFormSplash.pas' {FormSplash},
  UFormPrincipal in 'UFormPrincipal.pas' {FormPrincipal},
  UDMPrincipal in 'UDMPrincipal.pas' {DMPrincipal: TDataModule},
  UFormAtividade in 'UFormAtividade.pas' {FormAtividade};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormSplash, FormSplash);
  Application.CreateForm(TDMPrincipal, DMPrincipal);
  Application.Run;
end.
