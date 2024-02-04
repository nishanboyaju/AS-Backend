class Api::V1::ContentsController < ApplicationController
  before_action :authenticate_request!
  before_action :set_content, only: [:update, :destroy]

  def index
    render jsonapi: Content.all, status: :ok
  end

  def create
    @content = @current_user.contents.new(content_params)
    if @content.save
      render jsonapi: @content, status: :created
    else
      render jsonapi_errors: @content.errors, status: unprocessable_entity
    end
  end

  def update
    if @content.update(content_params)
      render jsonapi: @content, status: :ok
    else
      render jsonapi_errors: @content.errors, status: unprocessable_entity
    end
  end

  def destroy
    if @content.destroy
      render json: { message: 'Deleted' }
    else
      render jsonapi_errors: @content.errors, status: unprocessable_entity
    end
  end

  private

  def set_content
    @content = Content.find(params[:id])
  end

  def content_params
    params.permit(:title, :body)
  end
end
