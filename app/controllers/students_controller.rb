class StudentsController < ApplicationController
  #the Student.find(params[:id]) method is always found in
  #the show, update, edit, and deystory method
  before_action :find_student, only: [:show, :edit, :update]

  def index
    @students = Student.all
  end

  def show
    # @student = Student.find(params[:id]) #this is placed in show, and update and edit!
  end

  def new
    @student = Student.new

  end

  def create

    @student = Student.create(student_params)
    redirect_to @student
  end

  def edit
    # @student = Student.find(params[:id])
  end

  def update
    # @student = Student.find(params[:id])
    @student.update(student_params)
    redirect_to @student
  end

  private

  def student_params
    #the class you are requiring is SINGULARRRR!!!!!!!!!!
    params.require(:student).permit(:first_name, :last_name)
  end

  def find_student
    @student = Student.find(params[:id])
  end

end #end ot StudentController class
