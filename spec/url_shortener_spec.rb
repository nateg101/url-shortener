require 'url_shortener'

describe UrlShortener do

  subject(:urlshorten) { described_class.new }

  context '#add_url' do
    before (:each) do
      urlshorten.add_url("http://www.farmdrop.com")
    end
    
    it 'accepts a url and returns it in a hash' do
      expect(urlshorten.return_url).to eq({ "url" => "http://www.farmdrop.com" })
    end
  end
end
