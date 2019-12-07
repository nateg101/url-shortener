describe 'App' do

  subject(:app) { App.new }

  context 'get /:fullurl' do
    let (:response) { get "/www.farmdrop.com" }

    it 'returns 200 status' do
      expect(response.status).to eq 200
    end
  end
end
