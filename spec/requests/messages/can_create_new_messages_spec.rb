RSpec.describe 'POST /api/messages', type: :request do
  let(:user) {create(:user)}
  let(:auth_headers) {user.create_new_auth_token}

  describe 'successfully' do
    before do
      post '/api/messages',
           params: {
             user_id: user.id,
             content: 'Hello, nice to meet you!'
           },
           headers: auth_headers
    end

    it 'responds with a 200 status' do
      expect(response).to have_http_status 201
    end

    it 'will create a new message in the DB' do
      messages = Message.all
      expect(messages.count).to eq 1
    end

    it 'will add a message to the user' do
      expect(user.messages.reload.count).to eq 1
    end
  end
end
