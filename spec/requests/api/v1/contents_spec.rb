require 'rails_helper'

RSpec.describe "Api::V1::Contents", type: :request do
  let(:user) { create(:user) }
  let(:content) { create(:content, user: user) }
  let(:valid_attributes) { attributes_for(:content) }
  let(:auth_params) { { auth: { email: user.email, password: 'password' } } }

  before do
    post api_v1_auth_signin_path, params: auth_params
    @token = JSON.parse(response.body)['data']['attributes']['token']
  end

  describe 'GET /api/v1/contents' do
    it 'returns a success response' do
      get api_v1_contents_path, headers: {'Authorization' => "Bearer #{@token}"}
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /api/v1/contents' do
    context 'with valid params' do
      it 'creates a new Content' do
        expect {
          post api_v1_contents_path, params: valid_attributes, headers: {'Authorization' => "Bearer #{@token}"}
        }.to change(Content, :count).by(1)
        expect(response).to have_http_status :created
      end
    end
  end

  describe 'PATCH /api/v1/content' do
    context 'with valid params and authorized user' do
      let(:new_attributes) { { title: 'Updated Title' } }

      it 'updates the requested content' do
        patch api_v1_content_path(content.id), params: new_attributes, headers: {'Authorization' => "Bearer #{@token}"}
        content.reload
        expect(content.title).to eq('Updated Title')
        expect(response).to have_http_status :ok
      end
    end
  end

  describe 'DELETE /api/v1/content' do
    it 'destroys the requested content from authorized user' do
      content # Ensure the content exists
      expect {
        delete api_v1_content_path(content.id), headers: {'Authorization' => "Bearer #{@token}"}
      }.to change(Content, :count).by(-1)
      .and change { JSON.parse(response.body)['message'] }.to eq('Deleted')
    end
  end
end
