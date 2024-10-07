class Produto < ApplicationRecord
  has_many :itens
  has_many :pedidos, through: :itens
end
