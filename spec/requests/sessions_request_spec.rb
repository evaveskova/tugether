require 'rails_helper'

RSpec.describe SessionsController, type: :request do
  before(:each) do
    User.create(name: 'Hugo', email: 'hugo@mail.com', password: '123456')
  end

  describe 'POST #create' do
    it 'should return status: :created and logged_in: true when logging in with existing user' do
      params = { email: 'hugo@mail.com', password: '123456' }
      headers = { 'Accept': 'application/json', 'Content-Type': 'application/json' }
      post '/sessions', params: params.to_json, headers: headers
      json_response = JSON.parse(response.body)
      expect(json_response['status']).to eq('created')
      expect(json_response['logged_in']).to eq(true)
    end

    it 'should return status 401 when logging in with incorrect data' do
      params = { email: 'hugo@mail.com', password: 'incorrect' }
      headers = { 'Accept': 'application/json', 'Content-Type': 'application/json' }
      post '/sessions', params: params.to_json, headers: headers
      json_response = JSON.parse(response.body)
      expect(json_response['status']).to eq(401)
      expect(json_response['error']).to eq('Incorrect email or password!')
    end
  end
end
