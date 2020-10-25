require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  
  setup do
    get '/users/sign_in'
    sign_in users(:admin_user)
    post user_session_url
    follow_redirect!
    assert_response :success
  end

  #checking the response for the controller
  test "index state should be success" do
    get '/'
    assert_response :success
  end

  test "users filter response state should be success" do
    get '/users/filter'
    assert_response :success
  end

  
end
