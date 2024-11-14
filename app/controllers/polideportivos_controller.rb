class PolideportivosController < ApplicationController
  before_action :set_polideportivo, only: [:show, :edit, :update, :destroy]

  def index
    @polideportivos = Polideportivo.all
  end

  def show
  end


  def new
    @polideportivo = Polideportivo.new
  end

  def create
    @polideportivo = Polideportivo.new(polideportivo_params)
    if @polideportivo.save
      redirect_to administrador_dash_index_path, notice: 'El polideportivo fue creado exitosamente.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @polideportivo.update(polideportivo_params)
      redirect_to administrador_dash_index_path, notice: 'Polideportivo actualizado exitosamente.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @polideportivo = Polideportivo.find(params[:id])

    if @polideportivo.destroy
      redirect_to administrador_dash_index_path, notice: 'Polideportivo eliminado exitosamente.'
    else
      redirect_to administrador_dash_index_path, alert: 'No se pudo eliminar el polideportivo.'
    end
  end

  private

  def set_polideportivo
    @polideportivo = Polideportivo.find(params[:id])
  end

  def polideportivo_params
    params.require(:polideportivo).permit(:nombre, :ubicacion, :categoria, :descripcion, :contacto, :ubicacion_api, :imagen, :map_url)
  end
end
