class Student < ApplicationRecord
  has_many :registrations
  has_many :teachers, through: :registrations

  has_many :registrars
  has_many :klasses, through: :registrars
end
