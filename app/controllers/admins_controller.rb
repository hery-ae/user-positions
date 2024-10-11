class AdminsController < ApplicationController
  skip_before_action :authenticate_request

  def register
    @user = Admin.create!(user_params)
    if @user.save
      render(json: { message: "User created successfully" }, status: :created)
    else
      render(json: @user.errors, status: :bad)
    end
  end

  private

  def user_params
    params.permit(:email, :password)
  end
end
