class PedidoItem < ApplicationRecord
  belongs_to :produto
  belongs_to :pedido
end
