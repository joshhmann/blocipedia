require 'rails_helper'
require 'faker'
require 'factory_bot'
RSpec.describe WikisController, type: :controller do
  let(:my_user) { create(:user) }
  let(:my_wiki) { create(:wiki, user: my_user) }
  
  context "creating wiki page for user"
  before do 
    @user = my_user
    sign_in @user
  end
  
  describe "POST create" do
    it "increases the number of wikis by 1" do
      expect { post :create, user_id: my_user.id, wiki: { title: title, body: body, private: private, user: user } }.to change(Wiki, :count).by(1)
    end
    
  it "assigns the new wiki to @wiki" do
    post :create, user_id: my_user.id, wiki: { title: title, body: body, private: private, user: user }
    expect(assigns(:wiki)).to eq Wiki.last
  end
  
  it "redirects to the new wiki" do
   post :create, user_id: my_user.id, wiki: { title: title, body: body, private: private, user: user }
   expect(response).to redirect_to Wiki.last
  end
 end
end
