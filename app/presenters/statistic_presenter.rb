class StatisticPresenter < SimpleDelegator
  def initialize(model, view)
    @view = view
    super(model)
  end

  def h
    @view
  end

  def teacher_degrees
    if teachers_with_most_degrees
      h.content_tag(:li, "Teacher with most degrees: #{teachers_with_most_degrees}")
    end
  end

  def students_all
    if students
      h.content_tag(:li, "Total number of students: #{students}")
    end
  end

  def teachers_all
    if teachers
      h.content_tag(:li, "Total number of teachers: #{teachers}")
    end
  end
end
