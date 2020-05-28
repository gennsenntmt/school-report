class UsersController < ApplicationController
  before_action :move_to_login, except: :index

  def show
    @reports = Report.where(user_id: current_user.id).order("created_at DESC")
    @result = Report.where(user_id: current_user.id).length
    @user = current_user
  end

  def move_to_login
    redirect_to new_user_session_path unless user_signed_in?
  end
end
