class PropietariosController < ApplicationController
    def new
      @propietario = Propietario.new
    end

    def create
      @propietario = Propietario.new(propietario_params)
      if @propietario.save
        redirect_to propietarios_path, notice: 'Propietario creado exitosamente'
      else
        render :new
      end
    end

    private

    def propietario_params
      params.require(:propietario).permit(:nombre, :contacto, :email,:polideportivo_id)
    end
end
