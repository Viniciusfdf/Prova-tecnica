class PedidoItem < ApplicationRecord
  belongs_to :produto
  belongs_to :pedido
  after_save do
    #  self.pedido.update(valor_total: self.pedido.pedido_items.sum(:valor))
    soma = 0
    self.pedido.pedido_items.each do |item|
      soma += item.produto.valor
    end
    self.pedido.update(valor_total: soma)
  end
end
