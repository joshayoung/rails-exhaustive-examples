class DegreesController < ApplicationController
  before_action :new_up, only: %w(new)
  before_action :set_degree, only: %w(show edit update destroy)

  def index
    @degrees = Degree.all
  end

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
        format.html { redirect_to root_url, notice: "Degree was successfully created." }
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
        format.html { redirect_to @degree, notice: "Degree was successfully updated." }
        format.json { render :show, status: :ok, location: @degree }
      else
        format.html { render :edit }
        format.json { render json: @degree.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @degree.destroy
    respond_to do |format|
      format.html { redirect_to degrees_url, notice: "Degree was successfully destroyed." }
      format.json { head :no_content }
    end
  end

private

  def set_degree
    @degree = Degree.find(params[:id])
    @teacher = Teacher.find(params[:teacher_id])
  end

  def new_up
    @degree = Degree.new
    @teacher = Teacher.find(params[:teacher_id])
  end

  def degree_params
    params.require(:degree).permit(:title, :level, :completed)
  end
end
