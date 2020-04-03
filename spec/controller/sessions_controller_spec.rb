require 'rails_helper'

RSpec.describe SessionsController, type: :request do
  let(:user) { User.create(name: 'Hugo', email: 'hugo@mail.com', password: '123456') }

  describe "POST #create" do
    it "should return status ok when log in with existing user" do
      headers = { "ACCEPT" => "application/json" }
      login = post "/sessions", :params => { email: 'hugo@mail.com', password: '123456' }, :headers => headers

      json_response = JSON.parse(login)
      expect(json_response["status"]).to eq(:created)
    end

    it "should return status 401 when email or password is incorrect" do
      # headers = { "ACCEPT" => "application/json" }
      # post "/sessions", :params => { email: 'hugo@mail.com', password: '12345' }, :headers => headers
      #
      # expect(response.content_type).to eq("application/json; charset=utf-8")
      # expect(response).to have_http_status(401)
    end
  end
end
