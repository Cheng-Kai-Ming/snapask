class CoursesController < ApplicationController
  require 'rest-client'

  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
  end

  def buy
    @course = Course.find(params[:id])
    @order = Order.new
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to courses_path, notice: "新增課程成功"
    else
      render :new
    end
  end

  def edit
    @course = Course.find_by(id:params["id"])
  end

  def update
    @course = Course.find_by(id:params["id"])
    if @course.update(course_params)
      redirect_to courses_path, notice: "課程更新成功"
    else
      render :edit
    end
  end

  def destroy
    @course = Course.find_by(id:params["id"])
    @course.destroy
    redirect_to courses_path, notice: "課程已刪除"
  end

  private
  def set_course
    @course = current_user.courses.find(params[:id])
  end

  def course_params

    params.require(:course).permit(:name, :price, :intro, :currency, :valid_time, :category)

  end
end