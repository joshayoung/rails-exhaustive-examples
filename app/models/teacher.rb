class Teacher < ApplicationRecord
  has_many :degrees
  has_many :klasses

  def self.students(teacher_id)
    find_by_sql("select distinct students.name from registrars
                join students on registrars.student_id = students.id
                where klass_id in ( select id from klasses where teacher_id = #{teacher_id})")
  end
end
