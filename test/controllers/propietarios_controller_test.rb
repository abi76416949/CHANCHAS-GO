require "test_helper"

class PropietariosControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get propietarios_new_url
    assert_response :success
  end

  test "should get create" do
    get propietarios_create_url
    assert_response :success
  end
end
