json.extract! cliente, :id, :nome, :telefone, :data_nascimento, :ativo, :created_at, :updated_at
json.url cliente_url(cliente, format: :json)
