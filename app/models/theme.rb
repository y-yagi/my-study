class Theme < ApplicationRecord
  belongs_to :user
  has_many :studies, dependent: :destroy

  validates :title, presence: true
end
