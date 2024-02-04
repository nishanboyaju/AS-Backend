class Api::V1::UsersController < ApplicationController
include ParamsHelper

before_action :authenticate_request!, only: [:change_password]

  def index
    render jsonapi: User.all, status: :ok
  end

  def signup
    user = User.new(user_params)
      if user.save
        token = JsonWebToken.encode(user_id: user.id)
        render jsonapi: user, params: { token: token }, status: :created
      else
        render jsonapi_errors: user.errors, 
                status: :unprocessable_entity
      end
  end

  def change_password
    if params[:auth][:password] && @current_user.update(password: params[:auth][:password])
      render jsonapi: @current_user, status: :ok, code: '200'
    else
      render jsonapi_errors: @current_user.errors, status: :unprocessable_entity, code: '422'
    end
  end

  private

  def user_params
    params.transform_keys! do |key|
      key.underscore
    end.permit(:first_name, :last_name, :email, :password, :country)
  end
end
