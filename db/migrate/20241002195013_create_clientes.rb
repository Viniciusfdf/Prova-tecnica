class CreateClientes < ActiveRecord::Migration[7.0]
  def change
    create_table :clientes do |t|
      t.string :nome, null: false
      t.string :telefone, null: false
      t.date :data_nascimento, null: false
      t.boolean :ativo, default: true

      t.timestamps
    end
  end
end
