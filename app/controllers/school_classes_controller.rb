require 'byebug'

class SchoolClassesController < ApplicationController
before_action :school_class_find, only: [:show, :edit, :update]


  def new
    @school_class = SchoolClass.new
  end

  def show
  end

  def create
    @school_class = SchoolClass.new(school_class_params(:title, :room_number))
    @school_class.save
    redirect_to school_class_path(@school_class)
  end

  def edit
  end

  def update
    @school_class.update(school_class_params(:title, :room_number))
    redirect_to school_class_path(@school_class)
  end

private

  def school_class_find
    @school_class = SchoolClass.find(params[:id])
  end

  def school_class_params(*args)
    params.require(:school_class).permit(*args)

  end

end
