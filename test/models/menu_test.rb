require "test_helper"

class MenuTest < ActiveSupport::TestCase
  def setup
    @menu = menus(:dinner)
  end

  test "menu should be valid" do
    assert @menu.valid?
  end

  test "name must be present" do
    @menu.name = nil
    assert_not @menu.valid?
  end
end
