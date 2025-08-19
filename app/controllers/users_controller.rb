class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @users = policy_scope(User)

    if params[:query].present?
      @users = User.search_by_name(params[:query])
    end

  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end
end
