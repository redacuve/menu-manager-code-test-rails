require "test_helper"

class DishTest < ActiveSupport::TestCase
  def setup
    @menu = menus(:dinner)
    @dish = @menu.dish.build(name: 'pizza', price: 15)
  end

  test "dish should be valid" do
    assert @dish.valid?
  end

  test "menu_id must be present" do
    @dish.menu_id = nil
    assert_not @dish.valid?
  end

  test "price must be present" do
    @dish.price = nil
    assert_not @dish.valid?
  end

  test "name must be present" do
    @dish.name = nil
    assert_not @dish.valid?
  end
  test "name cannot start with letter e lowercase" do
    @dish.name = 'empanadas'
    assert_not @dish.valid?
  end

  test "name cannot start with letter E uppercase" do
    @dish.name = 'Empanadas'
    assert_not @dish.valid?
  end

  test "name must be unique" do
    duplicate_dish = @dish.dup
    @dish.save
    assert_not duplicate_dish.valid?
  end
end
