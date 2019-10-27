class Statistic

  def self.degree_count(teacher_id)
    Degree.joins(:teacher)
      .where(teacher_id: teacher_id).count
  end

  def self.students
    Student.all.count
  end

  def self.teachers
    Teacher.all.count
  end

  def self.teachers_with_most_degrees
    ActiveRecord::Base.connection.execute("select count(teachers.id) as 'teacher_count', teachers.name from degrees
      join teachers on degrees.teacher_id = teachers.id
      group by teachers.id
      order by teacher_count desc
      limit 1").first["name"]
  end
end