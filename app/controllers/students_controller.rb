class StudentsController < ApplicationController
  before_action :find_student, only: [:show, :edit, :update]
    def index
      @students = Student.all
    end

    def show
      # @student = Student.find(params[:id])
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

    def find_student
      @student = Student.find(params[:id])
    end

    def student_params
      params.require(:student).permit(:first_name, :last_name)
    end

end
