class AddMapUrlToPolideportivos < ActiveRecord::Migration[7.0]
  def change
    add_column :polideportivos, :map_url, :string
  end
end
