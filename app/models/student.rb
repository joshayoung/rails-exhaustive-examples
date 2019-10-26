class Student < ApplicationRecord
  has_many :registrars
  has_many :klasses, through: :registrars
  validates :name, :average_grade, :class_of, presence: true

  validates :average_grade, numericality: { only_integer: true }

  validate :class_of_in_the_future

private

  def class_of_in_the_future
    if class_of <= Date.today
      errors.add(:class_of, "must be a date in the future")
    end
  end
end
