class StudentsController < ApplicationController
  
  def index
    @students = Student.all
  end

  def new
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    @student.update(params.require(:student))
    redirect_to student_path(@student)
  end

  def create
    @student = Student.new(student_params(:first_name, :last_name))
    @student.save
    #byebug
    redirect_to student_path(@student)
  end

  def show
    @student = Student.find(params[:id])
  end

  private

  def student_params(*args)
    params.require(:student).permit(:first_name, :last_name)
  end
end
