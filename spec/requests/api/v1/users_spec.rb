require 'rails_helper'

RSpec.describe "Api::V1::Users", type: :request do
  describe "GET /api/v1/users" do
    it "get all users" do
      get "/api/v1/users/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /api/v1/users" do
    it "creates a new user" do
      total_users = User.all.count
      request_body = {
        "firstName": "Nishan", # Required
        "lastName": "Boyaju", # Required
        "email": "nishan@example.com", # Required
        "password": "password", # Required
        "country": "Nepal" # Optional
      }

      post api_v1_users_signup_path, params: request_body
      expect(response).to have_http_status(201)
      expect(User.all.count).to eq(total_users + 1)
    end
  end
end
