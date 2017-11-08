class Theme < ApplicationRecord
  belongs_to :user
  has_many :studies

  validates :title, presence: true
end
