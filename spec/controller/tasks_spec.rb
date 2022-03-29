#unit test for the Tasks controller

require "rails_helper"

RSpec.describe TasksController, type: :controller do
  context "GET #index" do
    it "returns a success response" do
      get :index
      # expect(response.success).to eq(true)
      expect(response).to be_success
    end
  end

  context "GET #show" do
    let!(:task) { Task.create(title: "Test title", descritpion: "Test description") }
    it "returns a success response" do
      get :show, params: { id: task }
      expect(response).to be_success
    end
  end
end
