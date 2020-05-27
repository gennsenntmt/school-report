class StudentsController < ApplicationController
  before_action :move_to_login

  def index
  end

  def show
    @student = Student.find(params[:id])
    @user = current_user

    @reports = Report.where(student_id: params[:id]).order("created_at DESC")
    @result = Report.where(student_id: params[:id]).length
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to root_path
    else    
      render :new
    end
  end

  def edit
  end

  def update
    @student = Student.find(params[:id])
    @user = current_user
    if @student.update(student_params) 
      redirect_to root_path
    else       
      redirect_to student_path(@student)
    end
  end

  def destroy
  end


  private

  def student_params
    params.require(:student)
            .permit(:name, :grade, :english,
                    :math, :japanese, :science, :social_studies
                    )
  end

  def move_to_login
    redirect_to new_user_session_path unless user_signed_in?
  end

end
