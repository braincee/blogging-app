require 'rails_helper'

RSpec.describe 'Users', type: :request do
    describe 'GET #index' do

    it 'should render success message' do
      get users_index_path
      expect(response).to have_http_status(:ok)
    end

    
end