require 'test_helper'

class Settings::TokensControllerTest < ActionDispatch::IntegrationTest
  setup do
    @settings_token = settings_tokens(:one)
  end

  test "should get index" do
    get settings_tokens_url
    assert_response :success
  end

  test "should get new" do
    get new_settings_token_url
    assert_response :success
  end

  test "should create settings_token" do
    assert_difference('Settings::Token.count') do
      post settings_tokens_url, params: { settings_token: {  } }
    end

    assert_redirected_to settings_token_url(Settings::Token.last)
  end

  test "should show settings_token" do
    get settings_token_url(@settings_token)
    assert_response :success
  end

  test "should get edit" do
    get edit_settings_token_url(@settings_token)
    assert_response :success
  end

  test "should update settings_token" do
    patch settings_token_url(@settings_token), params: { settings_token: {  } }
    assert_redirected_to settings_token_url(@settings_token)
  end

  test "should destroy settings_token" do
    assert_difference('Settings::Token.count', -1) do
      delete settings_token_url(@settings_token)
    end

    assert_redirected_to settings_tokens_url
  end
end
