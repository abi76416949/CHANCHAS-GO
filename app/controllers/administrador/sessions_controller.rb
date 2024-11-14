module Administrador
  class SessionsController < ApplicationController
    def new
      @admin = Admin.new
    end

    def create
      # Usa strong parameters para permitir solo los parámetros necesarios
      admin = Admin.find_by(usuario: session_params[:usuario])

      if admin&.authenticate(session_params[:password])
        session[:admin_id] = admin.id
        redirect_to administrador_dash_index_path	, notice: "Inicio de sesión exitoso como administrador"
      else
        flash.now[:alert] = "Usuario o contraseña incorrectos"
        render :new
      end
    end

    def destroy
      session[:admin_id] = nil
      redirect_to administrador_dash_index_path, notice: "Sesión de administrador cerrada"
    end

    private

    def session_params
      # Permitir solo los parámetros necesarios
      params.require(:admin).permit(:usuario, :password)
    end
  end
end
