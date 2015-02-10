require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  test "should get title" do
    get :title
    assert_response :success
  end

  test "should get description" do
    get :description
    assert_response :success
  end

end
