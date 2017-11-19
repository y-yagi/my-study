require "application_system_test_case"

class ThemesTest < ApplicationSystemTestCase
  setup { login }

  test "visiting the index" do
    visit themes_url
    assert_match "Go", page.text
    assert_match "Docker", page.text
  end
end
