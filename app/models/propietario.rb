class Propietario < ApplicationRecord
  validates :nombre, :polideportivo, :contacto, :email, presence: true
  belongs_to :polideportivo
end
