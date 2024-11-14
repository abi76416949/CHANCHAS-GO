module PropietarioAutenticado
  class LoginController < ApplicationController
    def new
      @propietario = Propietario.new
    end

    def create
      puts "Parametros recibidos: #{params.inspect}"
      
      # Busca al propietario con el email en `params[:propietario][:email]`
      propietario = Propietario.find_by(email: params[:propietario][:email])

      # Verifica la autenticación con `params[:propietario][:password]`
      if propietario&.authenticate(params[:propietario][:password])
        session[:propietario_id] = propietario.id
        redirect_to auth_dashboard_index_path, notice: 'Inicio de sesión exitoso'
      else
        flash.now[:alert] = 'Email o contraseña incorrectos'
        render :new
      end
    end

    def destroy
      session[:propietario_id] = nil
      redirect_to login_path, notice: 'Sesión cerrada'
    end
  end
end
