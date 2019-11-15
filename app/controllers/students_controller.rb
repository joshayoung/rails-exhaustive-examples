class StudentsController < ApplicationController
  before_action :set_student, only: %w(show edit update destroy)

  def index
    @students = Student.all
  end

  def show
    @klasses = Student.find(params[:id]).klasses
  end

  def new
    @student = Student.new
  end

  def edit; end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to @student, notice: "Student was successfully created."
    else
      render :new
    end
  end

  def update
    if @student.update(student_params)
      redirect_to @student, notice: "Student was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @student.destroy
    redirect_to students_url, notice: "Student was successfully destroyed."
  end

  def new_classes
    @classes = Klass.all
  end

  def add_classes
    return unless params[:klass_id].present?

    registrar = Registrar.new
    student = Student.find(params[:id])
    klass = Klass.find(params[:klass_id])
    registrar.klass = klass
    registrar.student = student

    redirect_to student_url(student) if registrar.save
  end

private

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:name, :average_grade, :class_of)
  end
end
