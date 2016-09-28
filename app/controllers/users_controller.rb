class UsersController < ApplicationController
  before_filter :authenticate_admin_user

  # GET /users
  def index
    @users = User.all.order(created_at: :desc)
  end

  # GET /users/:id/approve
  def approve
    User.find(params[:id]).approve
    redirect_to :users
  end

  # DELETE /users/:id
  def destroy
    User.find(params[:id]).destroy
    redirect_to :users
  end

  private

  def authenticate_admin_user
    unless current_user.admin?
      raise ActionController::RoutingError.new('Not Found')
    end
  end

  def user_params
    params.require(:user).permit()
  end
end
