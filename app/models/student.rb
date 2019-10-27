class Student < ApplicationRecord
  has_many :registrars
  has_many :klasses, through: :registrars
  validates :name, :average_grade, :class_of, presence: true

  validates :average_grade, numericality: { only_integer: true }

  validate :class_of_in_the_future

  scope :graduating_latest, -> { select(:name).maximum(:class_of) }
  scope :graduating_soonest, -> { select(:name).minimum(:class_of) }
  scope :average_student_grade, -> { sum(:average_grade).to_f / count }
  scope :max_average, -> { maximum("average_grade") }
  scope :min_average, -> { minimum("average_grade") }
  scope :students_in_classes, -> {
    joins(:registrars).select(:name)
  }

private

  def class_of_in_the_future
    if class_of <= Date.today
      errors.add(:class_of, "must be a date in the future")
    end
  end
end
