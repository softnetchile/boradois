require 'test_helper'

class ServicosControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:servicos)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_servico
    assert_difference('Servico.count') do
      post :create, :servico => { }
    end

    assert_redirected_to servico_path(assigns(:servico))
  end

  def test_should_show_servico
    get :show, :id => servicos(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => servicos(:one).id
    assert_response :success
  end

  def test_should_update_servico
    put :update, :id => servicos(:one).id, :servico => { }
    assert_redirected_to servico_path(assigns(:servico))
  end

  def test_should_destroy_servico
    assert_difference('Servico.count', -1) do
      delete :destroy, :id => servicos(:one).id
    end

    assert_redirected_to servicos_path
  end
end
