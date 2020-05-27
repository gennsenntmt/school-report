class ReportsController < ApplicationController
  before_action :move_to_login, except: :index

  def index
    @reports = Report.all.order("created_at DESC")
    @students = Student.all.order("created_at DESC")
    @result = Report.all.length
    @result_student = Student.all.length
    @user = current_user
  end

  def show
    @report = Report.find(params[:id])
    @user = current_user
    @student_all = Student.all
  end

  def new
    @report = Report.new
    @user = current_user
    @student_all = Student.all
  end

  def create
    @student_all = Student.all
    @report = Report.new(report_params)
    if @report.save
      redirect_to root_path
    else    
      render :new
    end
  end

  def edit
  end

  def update
    @report = Report.find(params[:id])
    if @report.update(report_admin_params) 
      redirect_to root_path
    else       
      redirect_to report_path(@report)
    end
  end

  def destroy
    @report = Report.find(params[:id])
    if @report.destroy
      redirect_to root_path
    else
      flash[:notice] = '問題が発生して削除できませんでした'
      render :show
    end
  end


  private

  def report_params
    params.require(:report)
            .permit(:title, :description, :homework,:day, :subject, :other, 
                    :student_id, :principal
                    )
          .merge(user_id: current_user.id)
  end

  def report_admin_params
    params.require(:report)
            .permit(:title, :description, :homework,:day, :subject, :other, 
                    :student_id, :principal
                    )
  end

  def move_to_login
    redirect_to new_user_session_path unless user_signed_in?
  end

end


