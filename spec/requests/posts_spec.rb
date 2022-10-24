require 'rails_helper'

RSpec.describe 'Posts', type: :request do
 describe 'GET #index' do
    it 'should render success message' do
      get posts_index_path
      expect(response).to have_http_status(:ok)
    end

      it 'should render index template' do
      get posts_index_path
      expect(response).to render_template(:index)
    end
 end
end
