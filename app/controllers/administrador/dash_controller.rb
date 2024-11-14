module Administrador
  class DashController < ApplicationController
    before_action :authenticate_admin!
    before_action :set_polideportivo, only: [:dash_canchas]
    def new
      @propietario = Propietario.new
    end

    def index
      @polideportivos = Polideportivo.all
    end

    def dash_canchas
      @canchas = @polideportivo.canchas
    end

    private

    def authenticate_admin!
      unless session[:admin_id]
        redirect_to new_administrador_session_path, alert: "Debes iniciar sesión como administrador para acceder a esta página."
      end
    end

    def set_polideportivo
      @polideportivo = Polideportivo.find(params[:polideportivo_id])
    end
  end
end
