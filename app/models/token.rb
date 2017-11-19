class Token < ApplicationRecord
  belongs_to :user

  validates :description, presence: true

  def build_token
    payload = { user_id: user.id, iat: Time.current.to_i }
    self.value = JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end
end
