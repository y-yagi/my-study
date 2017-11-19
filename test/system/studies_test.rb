require "application_system_test_case"

class StudiesTest < ApplicationSystemTestCase
  setup do
    login
    visit studies_url
  end

  test "visiting the index" do
    assert_match "depのコードリーディング", page.text
  end

  test "create new study" do
    click_on "登録"

    select('Docker', from: 'study[theme_id]')
    fill_in("study[content]", with: "Docker Composeのセットアップ")
    fill_in("study[hour]", with: "2")
    fill_in("study[minute]", with: "15")
    click_on "登録する"

    assert_match "Docker Composeのセットアップ", page.text
    assert_match "2:15", page.text
  end

  test "edit study" do
    study = studies(:dep)
    find(".app-edit-#{study.id}").click

    fill_in("study[content]", with: "https://github.com/golang/dep")
    click_on "更新する"
    assert_match "https://github.com/golang/dep", page.text
  end

  test "destroy study" do
    study = studies(:dep)
    accept_alert do
      find(".app-delete-#{study.id}").click
    end

    assert_no_match "depのコードリーディング", page.text
  end
end
