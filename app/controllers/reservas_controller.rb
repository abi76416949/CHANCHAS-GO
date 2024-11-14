class ReservasController < ApplicationController
  before_action :set_polideportivo
  before_action :set_cancha

  def index
    @reservas = @cancha.reservas
  end

  def new
    @reserva = Reserva.new
  end

  def create
    @reserva = @cancha.reservas.new(reserva_params)
    if @reserva.save
      redirect_to polideportivo_canchas_path(@polideportivo), notice: 'Reserva y cliente creados exitosamente.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_polideportivo
    @polideportivo = Polideportivo.find_by(id: params[:polideportivo_id])
    if @polideportivo.nil?
      redirect_to polideportivos_path, alert: "Polideportivo no encontrado."
    end
  end

  def set_cancha
    @cancha = Cancha.find_by(id: params[:cancha_id])
    if @cancha.nil?
      redirect_to polideportivo_canchas_path(@polideportivo), alert: "Cancha no encontrada."
    end
  end

  def reserva_params
    params.require(:reserva).permit(:nombre, :telefono, :email, :fecha, :hora_inicio, :hora_fin)
  end
end
