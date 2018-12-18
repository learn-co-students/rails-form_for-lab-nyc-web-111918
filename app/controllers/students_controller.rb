class StudentsController < ApplicationController

  before_action :find_students, only: [:show, :edit, :update]

  def new
    @student = Student.new
  end

  def create
    @student = Student.create(studentParams)
    redirect_to student_path(@student)
  end

  def show
  end

  def edit
  end

  def update
    @student.update(studentParams)
    redirect_to student_path(@student)
  end

  private

  def find_students
    @student = Student.find(params[:id])
  end

  def studentParams
    params.require(:student).permit(:first_name, :last_name)
  end

end
