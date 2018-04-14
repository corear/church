require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get profile" do
    get :profile
    assert_response :success
  end

  test "should get groups" do
    get :groups
    assert_response :success
  end

  test "should get prayers" do
    get :prayers
    assert_response :success
  end

end
