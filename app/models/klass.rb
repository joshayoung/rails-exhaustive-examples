class Klass < ApplicationRecord
  belongs_to :teacher
  has_many :students, through: :registrars

  validates :name, :time, :level, presence: true
end
