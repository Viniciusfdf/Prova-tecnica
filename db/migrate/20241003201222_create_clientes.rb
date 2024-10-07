class CreateClientes < ActiveRecord::Migration[7.2]
  def change
    create_table :clientes do |t|
      t.string :nome, null: false
      t.string :telefone, null: false
      t.date :data_nascimento, default: "01/01/2006", null: false
      t.boolean :ativo, default: true, null: false

      t.timestamps
    end
  end
end
