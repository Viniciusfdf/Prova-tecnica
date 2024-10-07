json.extract! pedido_item, :id, :produto_id, :pedido_id, :created_at, :updated_at
json.url pedido_item_url(pedido_item, format: :json)
