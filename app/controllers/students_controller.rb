class StudentsController < ApplicationController
  def show
    @student = Student.find(params[:id])
  end

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    student = Student.create(student_params)
    redirect_to student_path(student)
  end

  private

  def student_params
    params.require(:student).permit(:name)
  end
end
