class FormularioPropietarioController < ApplicationController
    def new
      @propietario = Propietario.new
    end
  
    def create
      @propietario = Propietario.new(propietario_params)
      if @propietario.save
        redirect_to administrador_dashboard_path, notice: 'Propietario creado exitosamente'
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    private
  
    def propietario_params
      params.require(:propietario).permit(:nombre, :polideportivo, :contacto, :email)
    end
  end
  

  