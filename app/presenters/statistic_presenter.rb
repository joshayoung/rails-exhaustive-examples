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
end
