class StatisticsController < ApplicationController
    def index
      @degree_count = Statistic.teachers_with_most_degrees
      @students = Statistic.students
      @teachers = Statistic.teachers
    end
  end