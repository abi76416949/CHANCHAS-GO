# app/controllers/auth/dashboard_controller.rb
module PropietarioAutenticado
  class DashboardController < ApplicationController
    before_action :authenticate_propietario! # Asegura que solo administradores autenticados accedan

    def index
      # Muestra un resumen del panel, incluyendo la lista de propietarios
    end

    private

    def authenticate_propietario!
      unless session[:propietario_id]
        redirect_to new_administrador_session_path, alert: "Debes iniciar sesión como administrador para acceder a esta página."
      end
    end
  end
end
