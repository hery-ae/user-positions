class UsersController < ApplicationController
  def index
    authorize!(:read)

    @users = User.all
    render(json: @users)
  end

  def show
    authorize!(:read)

    @user = User.find(params[:id])
    render(json: @user)
  end

  def create
    authorize!(:create)

    @user = User.new(params.permit(:username))
    @user.save
  end

  def update
    authorize!(:update)

    @user = User.find(params[:id])
    @user.update(user_params)
  end

  def destroy
    authorize!(:destroy)

    @user = User.find(params[:id])
    @user.destroy
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end
