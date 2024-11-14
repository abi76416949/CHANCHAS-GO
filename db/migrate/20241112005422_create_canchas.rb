class CreateCanchas < ActiveRecord::Migration[7.0]
  def change
    create_table :canchas do |t|
      t.references :polideportivo, null: false, foreign_key: true
      t.string :nombre, null: false
      t.text :descripcion
      t.float :precio_dia
      t.float :precio_noche

      t.timestamps
    end
  end
end
