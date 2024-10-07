class Cliente < ApplicationRecord
  # relacionamentos
  has_many :pedidos
  # Validações
  validates :nome, :telefone, :data_nascimento, presence: true, length: { maximum: 255 }
  validates :ativo, inclusion: { in: [true, false] }
  # Scopes
  scope :ativos, -> { where(ativo: true) }
  # Callbacks
  # Metodo de classe
end
