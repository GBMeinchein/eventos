json.array!(@usuarios) do |usuario|
  json.extract! usuario, :id, :nome, :login, :email, :senha, :dataCadastro
  json.url usuario_url(usuario, format: :json)
end
