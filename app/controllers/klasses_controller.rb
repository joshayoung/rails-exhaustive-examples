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

      if @klass.save
        redirect_to root_url, notice: "Class was successfully created."
      else
        render :new
      end
  end

  def update
    if @klass.update(klass_params)
      redirect_to @klass, notice: "Class was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @klass.destroy
    redirect_to teacher_klasses_path(@klass.teacher_id), notice: "Class was successfully destroyed."
  end

private

  def set_klass
    @klass = Klass.find(params[:id])
  end

  def klass_params
    params.require(:klass).permit(:name, :time, :level)
  end
end
