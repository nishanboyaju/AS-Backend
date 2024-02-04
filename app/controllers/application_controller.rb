class ApplicationController < ActionController::API
  def authenticate_request!
    @decoded = JsonWebToken.decode(auth_token).deep_symbolize_keys
    current_user
    rescue JWT::ExpiredSignature
    render jsonapi_errors: [{ title: e.message }], code: '401', status: :unauthorized
    rescue JWT::DecodeError => e
    render jsonapi_errors: [{ title: e.message }], code: '401', status: :unauthorized
  end

  def current_user
    @current_user = User.find(@decoded[:user_id]) if @decoded[:user_id].present?
  end

  def auth_token
  @auth_token ||= request.headers.fetch('Authorization', '').split(' ').last
  end
end
