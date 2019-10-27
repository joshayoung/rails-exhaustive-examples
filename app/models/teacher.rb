class Teacher < ApplicationRecord
  has_many :degrees
  has_many :klasses

  validates :name, :age, presence: true

  validates :age, numericality: { only_integer: true }

  scope :max_age, -> { maximum(:age) }
  scope :min_age, -> { minimum(:age) }

  def self.students(teacher_id)
    find_by_sql("select distinct students.name from registrars
                join students on registrars.student_id = students.id
                where klass_id in ( select id from klasses where teacher_id = #{teacher_id})")
  end
end
