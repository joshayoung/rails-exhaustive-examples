class StatisticsController < ApplicationController
    def index
      @teacher_degrees = StatisticPresenter.new(
        Statistic.new, view_context
      ).teacher_degrees
      @students = Statistic.students
      @teachers = Statistic.teachers
    end
  end
