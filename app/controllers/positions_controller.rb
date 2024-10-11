class PositionsController < ApplicationController
  before_action :get_user
  before_action :get_position, only: [:show, :update, :destroy]

  def index
    authorize!(:read)

    @position = @user.positions
    render(json: @position)
  end

  def show
    authorize!(:read)

    render(json: @position)
  end

  def create
    authorize!(:create)

    @user.positions.create!(position_params)
  end

  def update
    authorize!(:update)

    @position.update(position_params)
  end

  def destroy
    authorize!(:destroy)

    @position.destroy
  end

  private

  def position_params
    params.permit(:name)
  end

  def get_user
    @user = User.find(params[:user_id])
  end

  def get_comment
    @position = @user.positions.find(params[:id]) if @user
  end
end
