class CreatePolideportivos < ActiveRecord::Migration[7.0]
  def change
    create_table :polideportivos do |t|
      t.string :nombre
      t.string :ubicacion
      t.string :categoria
      t.text :descripcion
      t.string :contacto
      t.string :ubicacion_api

      t.timestamps
    end
  end
end
