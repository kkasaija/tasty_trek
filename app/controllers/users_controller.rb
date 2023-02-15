class UsersController < ApplicationController
  def Index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
end
