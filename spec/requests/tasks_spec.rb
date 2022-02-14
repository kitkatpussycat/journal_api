require 'rails_helper'

RSpec.describe "Tasks", type: :request do
  describe "GET /tasks/:id" do
    it 'it returns a task' do
      user = FactoryBot.create(:user, email: 'email@email.com', password: 'password')
      headers = { 'Accept' => 'application/json', 'Content-Type' => 'application/json' }
   
      auth_headers = Devise::JWT::TestHelpers.auth_headers(headers, user)
      c = FactoryBot.create(:category, name: 'name', description: '', user: user)
      t = FactoryBot.create(:task, name: 'name', description: '', date: Date.today, category:c)

      get "/api/v1/tasks/#{t.id}", headers: auth_headers
      expect(response).to have_http_status(:success)
    end
  end


  describe "POST /tasks" do
    let!(:user) { FactoryBot.create(:user, email: 'email@email.com', password: 'password') }
    let!(:cat) { FactoryBot.create(:category, name: 'name', description: '', user: user) }
    it 'creates a new task' do
      headers = { 'Accept' => 'application/json', 'Content-Type' => 'application/json' }
   
      auth_headers = Devise::JWT::TestHelpers.auth_headers(headers, user)
      expect {
        post '/api/v1/tasks/', params: {task: {name: 'name', description: '', date: Date.today, category_id: cat.id}}.to_json, headers: auth_headers
      }.to change { Task.count }.from(0).to(1)

      expect(response).to have_http_status(:created)
    end
  end

  describe "PATCH/PUT /tasks/:id" do
    it "should update data" do
      user = FactoryBot.create(:user, email: 'email@email.com', password: 'password')
      headers = { 'Accept' => 'application/json', 'Content-Type' => 'application/json' }
   
      auth_headers = Devise::JWT::TestHelpers.auth_headers(headers, user)
      cat = FactoryBot.create(:category, name: 'name', description: '', user: user)
      t = FactoryBot.create(:task, name: 'name', description: '', date: Date.today, category:cat)
      put "/api/v1/tasks/#{t.id}", params: {task: {completed: true} }.to_json, headers: auth_headers

      expect(response).to have_http_status(200)
      json_body = JSON.parse(response.body)
      expect(json_body['completed']).to eq(true)
    end
  end

  describe 'DELETE /tasks/:id' do
    let!(:user) { FactoryBot.create(:user, email: 'email@email.com', password: 'password') }
    let!(:cat) { FactoryBot.create(:category, name: 'name', description: '', user:user) }
    let!(:task) { FactoryBot.create(:task, name: 'name', description: '', date: Date.today, category_id: cat.id) }
    it 'deletes a category' do
      headers = { 'Accept' => 'application/json', 'Content-Type' => 'application/json' }
   
      auth_headers = Devise::JWT::TestHelpers.auth_headers(headers, user)
      expect {
        delete "/api/v1/tasks/#{task.id}", headers: auth_headers
    }.to change {Task.count}.from(1).to(0)
      expect(response).to have_http_status(:no_content)
    end
  end
end