class Pedido < ApplicationRecord
  # relacionamentos
  belongs_to :cliente
  has_many :pedido_items, dependent: :destroy
  has_many :produtos, through: :pedido_items
  accepts_nested_attributes_for :pedido_items
  # Validações
  # Scopes
  # Callbacks

  private
  # Metodo de classe

end