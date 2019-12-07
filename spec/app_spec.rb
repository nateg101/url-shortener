describe 'App' do

  subject(:app) { App.new }

  context 'get/:shorturl' do
    let (:response) { get "/farm"}

    it 'returns a 301 status' do
      expect(response.status).to eq 301
    end
  end
end
