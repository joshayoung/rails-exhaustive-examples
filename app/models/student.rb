class Student < ApplicationRecord
  has_many :registrars
  has_many :klasses, through: :registrars
end
