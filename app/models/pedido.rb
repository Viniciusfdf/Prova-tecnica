class Pedido < ApplicationRecord
  # relacionamentos
  belongs_to :cliente
  has_many :pedido_items
  has_many :pedido_items, dependent: :destroy
  has_many :produtos, through: :pedido_items
  accepts_nested_attributes_for :pedido_items
  # Validações
  validates :concluido, inclusion: { in: [true, false] }
  # Scopes
  # Callbacks
  before_save :calculate_total

  private
  # Metodo de classe
  def calculate_total
    self.total = produtos.sum(:valor)
  end
end