require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "POST /users/sign_in" do
    it "should have status of 200" do
      user = FactoryBot.create(:user, email: "email@email.com", password: 'password')
      post '/users/sign_in', params: {user: {email: user.email, password: 'password'}}

      expect(response).to have_http_status(:ok)
    end

    it "should return a user" do
      user = FactoryBot.create(:user, email: "email@email.com", password: 'password')
      post '/users/sign_in', params: {user: {email: user.email, password: 'password'}}

      res_json = JSON.parse(response.body)
      expect(res_json['data']).to include('email')
      expect(res_json['data']).to include('id')
      expect(res_json['data']['email']).to eq(user.email)
    end
  end
end