require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  # checking the response for the controller
  test "index state should be success" do
    get '/'
    assert_response :success
  end

  test "users filter response state should be success" do
    get '/users/filter'
    assert_response :success
  end

  
end
