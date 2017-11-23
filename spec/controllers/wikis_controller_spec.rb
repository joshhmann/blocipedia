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
      expect { post :create, user_id: my_user.id, wiki: { title: Faker::Overwatch.name, body: Faker::Overwatch.quote, private: false, user: my_user  } }.to change(Wiki, :count).by(1)
    end
    
  it "assigns the new wiki to @wiki" do
    post :create, user_id: my_user.id, wiki: { title: Faker::Overwatch.name, body: Faker::Overwatch.quote, private: false, user: my_user   }
    expect(assigns(:wiki)).to eq Wiki.last
  end
  
  it "redirects to the new wiki" do
   post :create, user_id: my_user.id, wiki: { title: Faker::Overwatch.name, body: Faker::Overwatch.quote, private: false, user: my_user  }
   expect(response).to redirect_to Wiki.last
  end
 end
 
 describe "GET show" do
   it "returns http success" do
     get :show, {id: my_wiki.id}
     expect(response).to have_http_status(:success)
   end
   it "renders the #show view" do
     get :show, {id: my_wiki.id}
     expect(response).to render_template :show
   end
   
   it "assigns my_wiki to @wiki" do
     get :show, {id: my_wiki.id}
     expect(assigns(:wiki)).to eq(my_wiki)
   end
 end
end
