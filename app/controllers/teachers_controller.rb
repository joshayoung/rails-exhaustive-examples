class TeachersController < ApplicationController
  before_action :set_teacher, only: %w(show edit update destroy)

  def index
    @teachers = Teacher.all
  end

  def show
    @students = Teacher.students(params[:id])
    @klasses = Teacher.find(params[:id]).klasses
    @degrees = Teacher.find(params[:id]).degrees
  end

  def new
    @teacher = Teacher.new
  end

  def edit; end

  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      redirect_to @teacher, notice: "Teacher was successfully created."
    else
      render :new
    end
  end

  def update
    if @teacher.update(teacher_params)
      redirect_to @teacher, notice: "Teacher was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @teacher.destroy
    redirect_to teachers_url, notice: "Teacher was successfully destroyed."
  end

private

  def set_teacher
    @teacher = TeacherDecorator.new(Teacher.find(params[:id]))
  end

  def teacher_params
    params.require(:teacher).permit(:name, :age)
  end
end
