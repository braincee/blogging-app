require 'rails_helper'

RSpec.describe 'Users', type: :request do
    describe 'GET #index' do

    it 'should render success message' do
      get users_index_path
      expect(response).to have_http_status(:ok)
    end

     it 'should render index template' do
      get users_index_path
      expect(response).to render_template(:index)
    end

     it 'returns text in response body' do
      get users_index_path
      expect(response.body).to include('Display the list of all Users')
    end
 end
end
