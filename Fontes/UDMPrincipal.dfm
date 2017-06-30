object DMPrincipal: TDMPrincipal
  OldCreateOrder = False
  Height = 187
  Width = 276
  object UniConn: TUniConnection
    ProviderName = 'MySQL'
    Port = 2020
    Database = 'edubrink'
    Username = 'root'
    Server = 'ielb.no-ip.org'
    Connected = True
    LoginPrompt = False
    Left = 48
    Top = 20
    EncryptedPassword = 'CEFFC6FFCFFFCBFF'
  end
  object QueryImagem: TUniQuery
    Connection = UniConn
    SQL.Strings = (
      'SELECT id,foto, upper(nome) Nome,categoria_id FROM imagem'
      'where categoria_id = :pCategoria'
      'order by rand() limit 4;')
    Left = 128
    Top = 20
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pCategoria'
        Value = nil
      end>
    object QueryImagemid: TLongWordField
      FieldName = 'id'
    end
    object QueryImagemfoto: TBlobField
      FieldName = 'foto'
      Required = True
    end
    object QueryImagemNome: TStringField
      FieldName = 'Nome'
      ReadOnly = True
      Size = 45
    end
    object QueryImagemcategoria_id: TLongWordField
      FieldName = 'categoria_id'
      Required = True
    end
  end
  object MySQLUniProvider1: TMySQLUniProvider
    Left = 48
    Top = 68
  end
end
