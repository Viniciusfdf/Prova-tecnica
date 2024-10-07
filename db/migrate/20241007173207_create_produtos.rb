class CreateProdutos < ActiveRecord::Migration[7.2]
  def change
    create_table :produtos do |t|
      t.string :descricao
      t.decimal :valor
      t.boolean :ativo

      t.timestamps
    end
  end
end
