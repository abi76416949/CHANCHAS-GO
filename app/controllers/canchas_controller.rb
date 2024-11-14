class CanchasController < ApplicationController
  before_action :set_polideportivo, only: [:index, :new, :create]

  def index
    @canchas = @polideportivo.canchas
  end

  def new
    @cancha = @polideportivo.canchas.new
  end

  def create
    @cancha = @polideportivo.canchas.new(cancha_params)
    if @cancha.save
      redirect_to polideportivo_canchas_path(@polideportivo), notice: 'Cancha creada exitosamente.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_polideportivo
    @polideportivo = Polideportivo.find_by(id: params[:polideportivo_id])
    redirect_to polideportivos_path, alert: "Polideportivo no encontrado" if @polideportivo.nil?
  end

  def cancha_params
    params.require(:cancha).permit(:nombre, :descripcion, :precio_dia, :precio_noche, :tipo, :imagen)
  end
end
class CanchasController < ApplicationController
end
