Rails.application.routes.draw do
  # Ruta raíz (solo debe haber una)
  root 'polideportivos#index'

  resources :polideportivos, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  resources :polideportivos do
    resources :canchas
  end


  resources :polideportivos do
    resources :canchas do
      resources :reservas
    end
  end

  # Rutas para el administrador (dashboard)
  namespace :administrador, path: 'administrador' do
    resources :sessions, only: [:new, :create, :destroy],controllers: { sessions: 'administrador/sessions' }
    resources :dash, only: [:index, :new, :create],controllers: { sessions: 'administrador/dash' }
  end

# Rutas para propietarios (dentro del módulo de autenticación)
namespace :propietario_autenticado, path: 'propietario_autenticado', as: :auth do
  resources :login, only: [:new, :create, :destroy], controllers: {login: 'propietario_autenticado/login'} # Rutas para iniciar y cerrar sesión
  resources :dashboard, only: [:index, :show, :edit, :new] # Coma eliminada aquí
end


  # Rutas para propietarios (Sin namespace)
  resources :propietarios, only: [:index, :new, :create]
end
#TOCAS ALGO Y NO FUNCIONA :)
