class CreatePropietarios < ActiveRecord::Migration[7.0]
  def change
    create_table :propietarios do |t|
      t.string :nombre
      t.string :contacto
      t.string :email
      t.references :polideportivo, foreign_key: true
      t.timestamps
    end
  end
end
