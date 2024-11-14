class Cancha < ApplicationRecord
  belongs_to :polideportivo
  enum tipo: { "Techada" => 0, "Al aire libre" => 1 }
  has_many :reservas, dependent: :destroy # para que la cancha pueda tener muchas reserva

  has_one_attached :imagen
end
