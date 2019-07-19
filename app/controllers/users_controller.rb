class UsersController < ApplicationController
  before_action :authenticate_admin_user

  # GET /users
  def index
    @users = User.all.order(created_at: :desc)
  end

  # GET /users/:id/approve
  def approve
    User.find(params[:id]).approve
    redirect_to :users
  end

  # GET /users/:id/remove_approval
  def remove_approval
    User.find(params[:id]).remove_approval
    redirect_to :users
  end

  # GET /users/:id/toggle_admin
  def toggle_admin
    User.find(params[:id]).toggle_admin
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
