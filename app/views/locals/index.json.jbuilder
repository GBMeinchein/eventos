json.array!(@locals) do |local|
  json.extract! local, :id, :nome, :cidade_id
  json.url local_url(local, format: :json)
end
