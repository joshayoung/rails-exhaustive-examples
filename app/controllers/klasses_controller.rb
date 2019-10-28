class KlassesController < ApplicationController
  before_action :set_klass, only: %w(show edit update destroy)

  def index
    @klasses = Klass.where(teacher_id: params[:teacher_id])
  end

  def show; end

  def new
    @klass = Klass.new
    @teacher = Teacher.find(params[:teacher_id])
  end

  def edit; end

  def create # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
    @teacher = Teacher.find(params[:teacher_id])
    @klass = @teacher.klasses.new(klass_params)

    respond_to do |format|
      if @klass.save
        format.html { redirect_to root_url, notice: "Class was successfully created." }
        format.json { render :show, status: :created, location: @klass }
      else
        format.html do
          render :new
        end
        format.json do
          render json: @klass.errors, status: :unprocessable_entity
        end
      end
    end
  end

  def update
    respond_to do |format|
      if @klass.update(klass_params)
        format.html { redirect_to @klass, notice: "Class was successfully updated." }
        format.json { render :show, status: :ok, location: @klass }
      else
        format.html { render :edit }
        format.json { render json: @klass.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    binding.pry
    @klass.destroy
    respond_to do |format|
      format.html { redirect_to teacher_klasses_path(@klass.teacher_id), notice: "Class was successfully destroyed." }
      format.json { head :no_content }
    end
  end

private

  def set_klass
    @klass = Klass.find(params[:id])
  end

  def klass_params
    params.require(:klass).permit(:name, :time, :level)
  end
end
