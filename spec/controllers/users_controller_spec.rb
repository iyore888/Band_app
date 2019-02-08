require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'Get #new' do
    before { get :new }
    
    it 'レスポンスコードが２００であること' do
      expect(response).to have_http_status(:ok)
    end
      
    it 'newテンプレートをレンダリングすること' do
      expect(response).to render_template :new
    end
      
    it '新しいユーザーオブジェクトがビューに渡されること' do
      expect(assigns(:user)).to be_a_new User
    end
  end
  
  describe 'Post #create' do
    context '正しいユーザーが渡ってきた場合' do
      let(:params) do
        { user: {
            name:                   "user",
            email:                  "user@email.com",
            password:               "password",
            password_confirmation:  "password"
            }
        }
      end
    
      it 'ユーザーが一人増えていること' do
        expect { post :create, params: params }.to change(User, :count).by(1)
      end
          
      # it 'マイページにリダイレクトされること' do
      #   expect ( post :create, params: params ).to redirect_to(user_path)
      # end
    end
  end
end
