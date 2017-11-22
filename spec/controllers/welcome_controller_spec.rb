require 'rails_helper'
require 'faker'
RSpec.describe WelcomeController, type: :controller do
  let(:my_user) { create(:user) }
  before do 
    @user = my_user
    sign_in @user
  end
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #about" do
    it "returns http success" do
      get :about
      expect(response).to have_http_status(:success)
    end
  end

end
