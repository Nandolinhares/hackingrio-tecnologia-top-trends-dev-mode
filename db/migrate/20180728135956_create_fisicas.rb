class CreateFisicas < ActiveRecord::Migration[5.2]
  def change
    create_table :fisicas do |t|
      t.string :nome
      t.string :cpf
      t.string :telefone
      t.string :endereco
      t.string :token

      t.timestamps
    end
  end
end
