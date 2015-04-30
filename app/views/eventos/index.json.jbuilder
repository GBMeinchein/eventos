json.array!(@eventos) do |evento|
  json.extract! evento, :id, :titulo, :descricao, :inicio, :termino, :imagem
  json.url evento_url(evento, format: :json)
end
