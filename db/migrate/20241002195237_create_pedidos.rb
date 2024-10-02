class CreatePedidos < ActiveRecord::Migration[7.0]
  def change
    create_table :pedidos do |t|
      t.references :cliente, null: false, foreign_key: true
      t.datetime :data_hora, null: false, default: -> { 'CURRENT_TIMESTAMP' }
      t.jsonb :produtos_quantidade, default: {}

      t.timestamps
    end
  end
end
