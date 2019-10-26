class Degree < ApplicationRecord
  belongs_to :teacher

  validates :title, :level, :completed, presence: true
end
