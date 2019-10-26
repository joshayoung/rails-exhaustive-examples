class Student < ApplicationRecord
  has_many :registrars
  has_many :klasses, through: :registrars
  validates :name, :average_grade, :class_of, presence: true
end
