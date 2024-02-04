# frozen_string_literal: true

module Api
  module V1
    class AuthController < ApplicationController
      # POST /api/v1/auth/signin
      def signin
        user = User.find_by(email: login_params[:email])
        if user.present? && user.authenticate(login_params[:password])
          token = JsonWebToken.encode(user_id: user.id)
          render jsonapi: user, params: { token: token },
                  status: :ok, code: '200'
        else
          render jsonapi_errors: [{ title: 'Invalid Email or Password' }],
                  code: '401', status: :unauthorized
        end
      end

      private

        def login_params
          params.require(:auth).permit(:email, :password)
        end
    end
  end
end