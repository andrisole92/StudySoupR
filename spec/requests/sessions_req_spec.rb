RSpec.describe 'Sessions API', type: :request do
  # initialize test data
  let!(:sessions) {create_list(:session, 10)}
  let(:session_id) {sessions.first.id}

  # Test suite for GET /sessions
  describe 'GET /sessions' do
    # make HTTP get request before each example
    before {get '/sessions'}

    it 'returns sessions' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(json.size)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /sessions/:id
  describe 'GET /sessions/:id' do
    before {get "/sessions/#{session_id}"}

    context 'when the record exists' do
      it 'returns the session' do
        expect(json).not_to be_empty
        expect(json['_id']['$oid']).to eq(session_id.to_s)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:session_id) {100}

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to eq("not found")
      end
    end
  end

  # Test suite for POST /sessions
  describe 'POST /sessions' do
    # valid payload
    let(:valid_attributes) {{session: {title: 'Learn Elm', status: 'Request', startAt: DateTime.now}}}

    context 'when the request is valid' do
      before {post '/sessions', params: valid_attributes}

      it 'creates a session' do
        expect(json['title']).to eq('Learn Elm')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before {post '/sessions', params: {session: {title: 'Foobar'}}}

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(json['status'][0])
            .to match(/can't be blank/)
        expect(json['startAt'][0])
            .to match(/can't be blank/)
      end
    end
  end

  # Test suite for PUT /sessions/:id
  describe 'PUT /sessions/:id' do
    let(:valid_attributes) {{session: {title: 'Shopping'}}}

    context 'when the record exists' do
      before {put "/sessions/#{session_id}", params: valid_attributes}

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /sessions/:id
  describe 'DELETE /sessions/:id' do
    before {delete "/sessions/#{session_id}"}

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end