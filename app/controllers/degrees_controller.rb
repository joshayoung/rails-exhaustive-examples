class DegreesController < ApplicationController
  before_action :set_degree, only: %w(show edit update destroy)

  helper_method :degree
  helper_method :degrees
  helper_method :teacher

  def index; end

  def show; end

  def new
    @degree = Degree.new
    @teacher = Teacher.find(params[:teacher_id])
  end

  def edit; end

  def create # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
    @teacher = Teacher.find(params[:teacher_id])
    @degree = @teacher.degrees.new(degree_params)

    if @degree.save
      redirect_to teacher_degrees_url(teacher), notice: "Degree was successfully created."
    else
      render :new
    end
  end

  def update
    if @degree.update(degree_params)
      redirect_to teacher_degrees_url(teacher, degree), notice: "Degree was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    if @degree.destroy
      redirect_to teacher_degrees_url(teacher), notice: "Degree was successfully destroyed."
    else
      redirect_to teacher_degrees_url(teacher), notice: "You cannot delete the last degree"
    end
  end

private

  def degree
    teacher.degrees
  end

  def degrees
    Degree.all
  end

  def teacher
    Teacher.find(params[:teacher_id])
  end

  def set_degree
    @degree = Degree.find(params[:id])
    @teacher = Teacher.find(params[:teacher_id])
  end

  def degree_params
    params.require(:degree).permit(:title, :level, :completed)
  end
end
