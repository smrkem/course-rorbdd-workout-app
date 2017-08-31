class Exercise < ApplicationRecord
  validates :workout, presence: true
  validates :workout_date, presence: true
  validates :duration_in_min, presence: true

  belongs_to :user
end
