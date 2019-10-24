class Teacher < ApplicationRecord
  has_many :degrees
  has_many :klasses
  has_many :registrations
  has_many :students, through: :registrations
end
