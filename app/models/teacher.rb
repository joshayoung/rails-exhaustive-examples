class Teacher < ApplicationRecord
  has_many :degrees
  has_many :klasses
end
