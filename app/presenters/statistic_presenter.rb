class StatisticPresenter < SimpleDelegator
  def initialize(model, view)
    @view = view
    super(model)
  end

  def h
    @view
  end

  def teacher_degrees
    return h.content_tag(:li, "No Degrees") unless teachers_with_most_degrees.present?

    h.content_tag(:li, "Teacher with most degrees: #{teachers_with_most_degrees}")
  end

  def students_all
    return h.content_tag(:li, "No Students") unless students.positive?

    h.content_tag(:li, "Total number of students: #{students}")
  end

  def teachers_all
    return h.content_tag(:li, "No Teachers") unless teachers.positive?

    h.content_tag(:li, "Total number of teachers: #{teachers}")
  end
end
