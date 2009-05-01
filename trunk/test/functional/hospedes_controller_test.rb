require 'test_helper'

class HospedesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:hospedes)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_hospede
    assert_difference('Hospede.count') do
      post :create, :hospede => { }
    end

    assert_redirected_to hospede_path(assigns(:hospede))
  end

  def test_should_show_hospede
    get :show, :id => hospedes(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => hospedes(:one).id
    assert_response :success
  end

  def test_should_update_hospede
    put :update, :id => hospedes(:one).id, :hospede => { }
    assert_redirected_to hospede_path(assigns(:hospede))
  end

  def test_should_destroy_hospede
    assert_difference('Hospede.count', -1) do
      delete :destroy, :id => hospedes(:one).id
    end

    assert_redirected_to hospedes_path
  end
end
