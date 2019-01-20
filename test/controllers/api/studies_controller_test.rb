require "test_helper"

class Api::StudiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:google)
    @token = Token.new(user: @user, description: "for test")
    @token.build_token
    @token.save
    @study = studies(:dep)
  end

  sub_test_case("unauthorized") do
    test "without token" do
      get api_study_path(@study), as: :json
      assert_response :unauthorized
    end

    test "use deleted token" do
      @token.destroy!
      get api_study_path(@study), headers: { "Authorization": "JWT #{@token.value}" }, as: :json
      assert_response :unauthorized
    end

    test "use another user token" do
      another_user = User.create!(uid: 99999, provider: "google_oauth2")
      another_user_token = Token.new(user: another_user, description: "for test")
      another_user_token.build_token
      another_user_token.save

      assert_raise(ActiveRecord::RecordNotFound) do
        get api_study_path(@study), headers: { "Authorization": "JWT #{another_user_token.value}" }, as: :json
      end
    end
  end

  test "show" do
    get api_study_path(@study), headers: { "Authorization": "JWT #{@token.value}" }, as: :json
    assert_response :success

    assert_equal "Go", response.parsed_body["theme"]
    assert_equal "depのコードリーディング", response.parsed_body["content"]
  end

  sub_test_case("create") do
    test "success" do
      assert_difference '@user.studies.count' do
        post api_studies_path, params: { theme: "Docker", content: "マニュアルを読んだ", hour: 1 }, headers: { "Authorization": "JWT #{@token.value}" }, as: :json
      end
      assert_response :success

      assert_equal "マニュアルを読んだ", response.parsed_body["content"]
      assert response.parsed_body["id"]
    end

    test "error" do
      post api_studies_path, params: { content: "マニュアルを読んだ", hour: 1 }, headers: { "Authorization": "JWT #{@token.value}" }, as: :json
      assert_response :success

      assert_equal "テーマを入力してください", response.parsed_body["errors"]["detail"]
    end
  end
end
