class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
  end

  def new 
    @course = Course.new
  end

  def create
    course= Course.create(course_params)
    redirect_to courses_path
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    course = Course.find(params[:id])
    course << current_user
    course.update(course_params) 
    redirect_to course
  end

  def destroy
    
  end

  private

  def course_params
  params.require(:course).permit(:name, :img, :date, :type, :desc, :instructor_id)

  end
end
