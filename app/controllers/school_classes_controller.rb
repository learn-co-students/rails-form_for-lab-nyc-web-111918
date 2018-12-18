class SchoolClassesController < ApplicationController
  before_action :find_class, only: [:show, :edit, :update]
  def index
    @classes = SchoolClass.all
  end

  def show
    # @class = SchoolClass.find(params[:id])
  end

  def new
    @class = SchoolClass.new
  end

  def create
    # byebug
    @class = SchoolClass.create(class_params)
    redirect_to school_class_path(@class)
  end

  def edit

  end

  def update
    @class.update(class_params)
    redirect_to school_class_path(@class)
  end

  private

  def class_params
    # byebug
    params.require(:school_class).permit(:title, :room_number)
  end

  def find_class
    @class = SchoolClass.find(params[:id])
  end
end
