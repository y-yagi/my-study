require "test_helper"

class TokenTest < ActiveSupport::TestCase
  sub_test_case("validation") do
    test "should have the necessary required validators" do
      token = Token.new(user: users(:google))
      assert_not token.valid?
      assert_equal %i(description), token.errors.keys
    end
  end

  test "#build_token" do
    user = users(:google)
    token = Token.new(user: user, description: "for test")
    assert_not token.value

    token.build_token

    assert token.value

    payload = JWT.decode(token.value, Rails.application.secrets.secret_key_base)

    assert_equal user.id, payload.first["user_id"]
  end
end
