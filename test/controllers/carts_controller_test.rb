require "test_helper"

class CartsControllerTest < ActionController::TestCase
  def test_view
    get :view
    assert_response :success
  end

end
