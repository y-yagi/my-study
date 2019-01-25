class Study < ApplicationRecord
  paginates_per 10

  belongs_to :user
  belongs_to :theme

  validate :study_time

  def study_time
    if self.hour&.zero? && self.minute&.zero?
      errors.add(:base, :hour_and_minute_blank)
    end
  end
end
