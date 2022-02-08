require "test_helper"

class DishTest < ActiveSupport::TestCase
  def setup
    @menu = menus(:dinner)
    @dish = @menu.dish.build(name: 'pizza', price: 15)
    @first_menu = menus(:starters)
    @dish_on_fm = @first_menu.dish.build(name: 'spring rolls', price: 74)
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

  test "the sum of the prices of the meny and the price of the dish can be under 77" do
    @dish_on_fm.price = 14
    assert @dish_on_fm.valid?
  end

  test "the sum of the prices of the menu and the price of the dish can be above 77" do
    @dish_on_fm.price = 77
    assert @dish_on_fm.valid?
  end

  test "the sum of the prices of the menu and the price of the dish cannot be 77" do
    assert_not @dish_on_fm.valid?
  end
end
