class SchoolClassesController < ApplicationController
  def index
    @school_classes = SchoolClass.all
    render :'/school_classes/index'
  end

  def show
    find_class
  end

  def new
    @school_class = SchoolClass.new
  end

  def create
    @school_class = SchoolClass.new(class_params(:tite, :room_number))
    @school_class.save
    redirect_to school_class_path(@school_class)
  end

  def update
    find_class
    @school_class.update(class_params(:title, :room_number))
    redirect_to school_class_path(@school_class)
  end

  def edit
    find_class
  end

  def destroy
    find_class
    @school_class.destroy
    redirect_to school_classes_path
  end

  private

  def find_class
    @school_class = SchoolClass.find(params[:id])
  end

  def class_params(*args)
    params.require(:school_class).permit(:title, :room_number)
  end

end
