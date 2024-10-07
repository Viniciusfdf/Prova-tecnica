class CreatePedidos < ActiveRecord::Migration[7.2]
  def change
    create_table :pedidos do |t|
      t.references :cliente, null: false, foreign_key: true
      t.decimal :valor_total, precision: 10, scale: 2, default: 0, null: false

      t.timestamps
    end
  end
end
