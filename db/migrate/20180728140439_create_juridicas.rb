class CreateJuridicas < ActiveRecord::Migration[5.2]
  def change
    create_table :juridicas do |t|
      t.string :cnpj
      t.string :razao
      t.string :fantasia
      t.string :telefone
      t.string :endereco
      t.string :token

      t.timestamps
    end
  end
end
