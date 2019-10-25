class Registrar < ApplicationRecord
  belongs_to :klass
  belongs_to :student
end
