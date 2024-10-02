class CreateProdutos < ActiveRecord::Migration[7.0]
  def change
    create_table :produtos do |t|
      t.string :nome, null: false
      t.decimal :valor, precision: 10, scale: 2, null: false
      t.boolean :ativo, default: true

      t.timestamps
    end
  end
end
