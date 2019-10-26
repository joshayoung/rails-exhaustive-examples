class Degree < ApplicationRecord
  belongs_to :teacher

  validates :title, :level, :completed, presence: true

  validates :title, length: { in: 2..20 }

  validates :level, inclusion: { in: %w(1 2 3 4),
    message: "%{value} is not a valid size" }

  validates :level, numericality: { only_integer: true }

  validate :completed_date_not_in_future

private

  def completed_date_not_in_future
    if completed <= Date.today
      # errors.add(:base, "Add errors to the base")
      errors.add(:completed, "must be a date in the past")
    end
  end
end
