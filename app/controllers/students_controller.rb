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

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: "Student was successfully created." }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: "Student was successfully updated." }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: "Student was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def new_classes
    @classes = Klass.all
  end

  def add_classes
    return if (!params[:klass_id].present?)

    registrar = Registrar.new
    student = Student.find(params[:id])
    klass = Klass.find(params[:klass_id])
    registrar.klass = klass
    registrar.student = student

    redirect_to root_url if registrar.save
  end

private

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:name, :average_grade, :class_of)
  end
end
