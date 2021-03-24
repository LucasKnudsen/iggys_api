RSpec.describe 'GET /api/messages', type: :request do
  let(:user) {create(:user)}
  let!(:message) {3.times {create(:message, user: user)}}

  describe 'successfully' do
    before do
      get '/api/messages'
    end

    it 'responds with a 200 status' do
      expect(response).to have_http_status 200
    end

    it 'responds with all messages' do
      expect(response_json['messages'].count).to eq 3
    end
  end
end
