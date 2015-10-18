json.array!(@confirmados) do |confirmado|
  json.extract! confirmado, :id, :evento_id, :login_id
  json.url confirmado_url(confirmado, format: :json)
end
