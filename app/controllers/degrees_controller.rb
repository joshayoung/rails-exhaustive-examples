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

    respond_to do |format|
      if @degree.save
        format.html { redirect_to teacher_degrees_url(teacher), notice: "Degree was successfully created." }
        format.json { render :show, status: :created, location: @degree }
      else
        format.html { render :new }
        format.json { render json: @degree.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @degree.update(degree_params)
        format.html { redirect_to teacher_degrees_url(teacher, degree), notice: "Degree was successfully updated." }
        format.json { render :show, status: :ok, location: @degree }
      else
        format.html { render :edit }
        format.json { render json: @degree.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    # The before_destroy callback is not working:
    if !@degree.last_degree?
      return redirect_to teacher_degrees_url(teacher), notice: "Last degree cannot be deleted!"
    end

    @degree.destroy
    respond_to do |format|
      format.html { redirect_to teacher_degrees_url(teacher), notice: "Degree was successfully destroyed." }
      format.json { head :no_content }
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
