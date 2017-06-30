unit UDMPrincipal;

interface

uses
  System.SysUtils, System.Classes, Data.DB, UniProvider, MySQLUniProvider,
  MemDS, DBAccess, Uni;

type
  TDMPrincipal = class(TDataModule)
    UniConn: TUniConnection;
    QueryImagem: TUniQuery;
    MySQLUniProvider1: TMySQLUniProvider;
    QueryImagemid: TLongWordField;
    QueryImagemfoto: TBlobField;
    QueryImagemNome: TStringField;
    QueryImagemcategoria_id: TLongWordField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMPrincipal: TDMPrincipal;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

end.
