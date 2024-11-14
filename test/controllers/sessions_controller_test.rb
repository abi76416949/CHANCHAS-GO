require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @propietario = PropietarioDeportivo.create(
      email: "example@gmail",
      password: "password123",
      nombre: "Juan Pérez",
      numero: "1234567890",
      polideportivo_id: 1
    )
    puts @propietario.inspect # Esto te permitirá ver los atributos de @propietario
    @admin = Admin.create(usuario: "admin_test", password: "password123")
  end


  test "should log in as propietario with valid credentials" do
    post login_path, params: { session: { usuario: "propietario_test", password: "password123" } }
    assert_response :redirect
    assert_redirected_to propietario_dashboard_path
    assert_equal @propietario.id, session[:propietario_id]
    assert_nil session[:admin_id]
  end

  test "should log in as admin with valid credentials" do
    post login_path, params: { session: { usuario: "admin_test", password: "password123" } }
    assert_response :redirect
    assert_redirected_to admin_dashboard_path
    assert_equal @admin.id, session[:admin_id]
    assert_nil session[:propietario_id]
  end

  test "should not log in with invalid credentials" do
    post login_path, params: { session: { usuario: "propietario_test", password: "wrongpassword" } }
    assert_response :success
    assert_nil session[:propietario_id]
    assert_nil session[:admin_id]
    assert_select "div.alert", "Usuario o contraseña incorrectos."
  end

  test "should log out" do
    post login_path, params: { session: { usuario: "propietario_test", password: "password123" } }
    assert_equal @propietario.id, session[:propietario_id]

    delete logout_path
    assert_nil session[:propietario_id]
    assert_nil session[:admin_id]
    assert_redirected_to login_path
  end
end
