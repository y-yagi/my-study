class User < ApplicationRecord
  has_many :themes, dependent: :destroy
  has_many :studies, dependent: :destroy
  has_many :tokens, dependent: :destroy

  class << self
    def find_or_create_from_auth_hash(auth)
      find_by(provider: auth['provider'], uid: auth['uid']) || create_with_omniauth!(auth)
    end

    def create_with_omniauth!(auth)
      create! do |u|
        u.provider = auth['provider']
        u.uid = auth['uid']
      end
    end
  end
end
