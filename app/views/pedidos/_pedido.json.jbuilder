json.extract! pedido, :id, :cliente_id, :data_hora, :produtos_quantidade, :created_at, :updated_at
json.url pedido_url(pedido, format: :json)
