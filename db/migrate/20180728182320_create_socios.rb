class CreateSocios < ActiveRecord::Migration[5.2]
  def change
    create_table :socios do |t|
      t.boolean :administrador
      t.string :token
      t.references :fisica, foreign_key: true
      t.references :juridica, foreign_key: true

      t.timestamps
    end
  end
end
