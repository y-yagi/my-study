class Study < ApplicationRecord
  belongs_to :user
  belongs_to :theme

  validate :study_time

  def study_time
    if self.hour.zero? && self.minute.zero?
      errors.add(:base, :hour_and_minute_blank)
    end
  end
end
