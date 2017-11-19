class Api::ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  before_action :authenticate_request!

  attr_reader :current_user

  def authenticate_request!
    user_id = auth_token.first["user_id"]
    return render_not_authenticated_error unless user_id
    @current_user = User.find(user_id)

    return render_not_authenticated_error unless valid_token?
  rescue JWT::VerificationError, JWT::DecodeError
    render json: { errors: ['Not Authenticated'] }, status: :unauthorized
  end

  private

    def http_token
      @http_token ||= if request.headers['Authorization'].present?
        request.headers['Authorization'].split(' ').last
      end
    end

    def auth_token
      @auth_token ||= JWT.decode(http_token, Rails.application.secrets.secret_key_base)
    end

    def valid_token?
      token = Token.find_by(value: http_token)
      return false unless token

      token.user_id == current_user.id
    end

    def render_not_authenticated_error
      render json: { errors: ['Not Authenticated'] }, status: :unauthorized
    end
end
