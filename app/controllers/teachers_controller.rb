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

  def teachers_students
    @teacher = Teacher.find(params[:id])
    @students = Teacher.find_by_sql("select distinct students.name from registrars
                        join students on registrars.student_id = students.id
                        where klass_id in ( select id from klasses where teacher_id = 1)")
  end

  def edit; end

  def create
    @teacher = Teacher.new(teacher_params)

    respond_to do |format|
      if @teacher.save
        format.html { redirect_to @teacher, notice: "Teacher was successfully created." }
        format.json { render :show, status: :created, location: @teacher }
      else
        format.html { render :new }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @teacher.update(teacher_params)
        format.html { redirect_to @teacher, notice: "Teacher was successfully updated." }
        format.json { render :show, status: :ok, location: @teacher }
      else
        format.html { render :edit }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @teacher.destroy
    respond_to do |format|
      format.html { redirect_to teachers_url, notice: "Teacher was successfully destroyed." }
      format.json { head :no_content }
    end
  end

private

  def set_teacher
    @teacher = TeacherDecorator.new(Teacher.find(params[:id]))
  end

  def teacher_params
    params.require(:teacher).permit(:name, :age)
  end
end
