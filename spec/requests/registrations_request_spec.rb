require 'rails_helper'

RSpec.describe 'Registrations', type: :request do
  describe 'POST #create' do
    it 'should return status created when successfully register a new user' do
      params = { name: 'Hugo', email: 'hugo@mail.com', password: '123456', password_confirmation: '123456' }
      headers = { 'Accept': 'application/json', 'Content-Type': 'application/json' }
      post '/signup', params: params.to_json, headers: headers
      json_response = JSON.parse(response.body)
      expect(json_response['status']).to eq('created')
      expect(json_response['user']['name']).to eq('Hugo')
    end

    it 'should return status 400 when it is not possible to register a new user' do
      User.create(name: 'Hugo', email: 'hugo@mail.com', password: '123456')
      # Invalid email as it was already taken
      params = { name: 'Another Hugo', email: 'hugo@mail.com', password: '123456', password_confirmation: '123456' }
      headers = { 'Accept': 'application/json', 'Content-Type': 'application/json' }
      post '/signup', params: params.to_json, headers: headers
      json_response = JSON.parse(response.body)
      expect(json_response['status']).to eq(400)
    end
  end

end
