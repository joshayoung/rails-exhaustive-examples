class Degree < ApplicationRecord
  before_destroy :last_degree?
  belongs_to :teacher

  before_validation :capitilze_each_word

  validates :title, :level, :completed, presence: true

  validates :title, length: { in: 2..20 }

  validates :level, inclusion: { in: [1, 2, 3, 4],
                                 message: "%<value> is not a valid size" }

  validates :level, numericality: { only_integer: true }

  validate :completed_date_not_in_future

  def last_degree?
    throw(:abort) unless number_of_degrees > 1
  end

  def number_of_degrees
    Degree.joins(:teacher).where(teacher_id: teacher.id).count
  end

private

  def capitilze_each_word
    self.title = title.titleize
  end

  def completed_date_not_in_future
    errors.add(:completed, "must be a date in the past") if completed >= Date.today
  end
end
