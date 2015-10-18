require 'test_helper'

class ConfirmadosControllerTest < ActionController::TestCase
  setup do
    @confirmado = confirmados(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:confirmados)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create confirmado" do
    assert_difference('Confirmado.count') do
      post :create, confirmado: { evento_id: @confirmado.evento_id, login_id: @confirmado.login_id }
    end

    assert_redirected_to confirmado_path(assigns(:confirmado))
  end

  test "should show confirmado" do
    get :show, id: @confirmado
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @confirmado
    assert_response :success
  end

  test "should update confirmado" do
    patch :update, id: @confirmado, confirmado: { evento_id: @confirmado.evento_id, login_id: @confirmado.login_id }
    assert_redirected_to confirmado_path(assigns(:confirmado))
  end

  test "should destroy confirmado" do
    assert_difference('Confirmado.count', -1) do
      delete :destroy, id: @confirmado
    end

    assert_redirected_to confirmados_path
  end
end
