class SchoolClassesController < ApplicationController

  before_action :find_school_classes, only: [:show, :edit, :update]

  def new
    @school_class = SchoolClass.new
  end

  def create
    @school_class = SchoolClass.create(schoolClassParams)
    redirect_to school_class_path(@school_class)
  end

  def show
  end

  def edit
  end

  def update
    @school_class.update(schoolClassParams)
    redirect_to school_class_path(@school_class)
  end

  private

  def find_school_classes
    @school_class = SchoolClass.find(params[:id])
  end

  def schoolClassParams
    params.require(:school_class).permit(:title, :room_number)
  end

end
