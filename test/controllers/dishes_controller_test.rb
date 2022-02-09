require "test_helper"

class DishesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dishes_path
    assert_response :success
  end

  test "should get new" do
    get new_dish_path
    assert_response :success
  end
end
