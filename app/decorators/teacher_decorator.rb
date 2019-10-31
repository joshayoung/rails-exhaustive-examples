class TeacherDecorator < SimpleDelegator
  def age_type
    return "young" if age_i < 25
    return "middle age" if age_i > 24

    "old"
  end
end