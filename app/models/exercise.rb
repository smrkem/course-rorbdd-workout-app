class Exercise < ApplicationRecord
  belongs_to :user

  alias_attribute :workout_details, :workout
  alias_attribute :activity_date, :workout_date

  validates :workout_details, presence: true
  validates :activity_date, presence: true
  validates :duration_in_min, presence: true, numericality: { greater_than: 0.0 }
end
