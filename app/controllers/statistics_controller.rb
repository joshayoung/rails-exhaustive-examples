class StatisticsController < ApplicationController
  helper_method :students, :teachers, :teacher_degrees

  def index; end

private

  def teacher_degrees
    statsp.teacher_degrees
  end

  def teachers
    statsp.teachers_all
  end

  def students
    statsp.students_all
  end

  def statsp
    StatisticPresenter.new(
      Statistic.new, view_context
    )
  end
end
