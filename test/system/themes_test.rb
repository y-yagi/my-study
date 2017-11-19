require "application_system_test_case"

class ThemesTest < ApplicationSystemTestCase
  setup do
    login
    visit themes_url
  end

  test "visiting the index" do
    assert_match "Go", page.text
    assert_match "Docker", page.text
  end

  test "create new theme" do
    click_on "登録"

    fill_in("theme[title]", with: "機械学習")
    fill_in("theme[content]", with: "鳥居の識別を出来るようにする")
    click_on "登録する"

    assert_match "機械学習", page.text
    assert_match "鳥居の識別を出来るようにする", page.text
  end

  test "edit theme" do
    theme = themes(:go)
    find(".app-edit-#{theme.id}").click

    fill_in("theme[content]", with: "depもやれ")
    click_on "更新する"
    assert_match "depもやれ", page.text
  end

  test "destroy theme" do
    theme = themes(:go)
    accept_alert do
      find(".app-delete-#{theme.id}").click
    end

    assert_no_match "go", page.text
  end
end
