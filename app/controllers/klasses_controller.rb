class KlassesController < ApplicationController
  # TODO: Distinguish between new class and class lookup?
  helper_method :klass, :klasses, :teacher

  def index; end

  def show; end

  def new
    @klass = Klass.new
  end

  def edit; end

  def create
    @teacher = Teacher.find(params[:teacher_id])
    @klass = @teacher.klasses.new(klass_params)
    if @klass.save
      redirect_to teacher_klasses_path(@teacher), notice: "Class was successfully created."
    else
      render :new
    end
  end

  def update
    if klass.update(klass_params)
      redirect_to teacher_klass_path(teacher), notice: "Class was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    redirect_to teacher_klasses_path(teacher_id), notice: "Class was successfully destroyed." if klass.destroy
  end

private

  def klass_id
    params[:id]
  end

  def teacher_id
    params[:teacher_id]
  end

  def teacher
    Teacher.find(teacher_id)
  end

  def klass
    Klass.find(klass_id)
  end

  def klass_params
    params.require(:klass).permit(:name, :time, :level)
  end

  def klasses
    Klass.where(teacher_id: teacher_id)
  end
end
