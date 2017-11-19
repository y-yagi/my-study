require "test_helper"

class ThemeTest < ActiveSupport::TestCase
  test "should have the necessary required validators" do
    theme = Theme.new(user: users(:google))
    assert_not theme.valid?
    assert_equal %i(title), theme.errors.keys
  end
end
