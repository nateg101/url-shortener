require 'url_shortener'

describe UrlShortener do

  context '#add_url' do
    it 'accepts a url and returns it in a hash' do
      urlshorten = UrlShortener.new

      urlshorten.add_url("http://www.farmdrop.com")
      expect(urlshorten.return_url).to eq({ "url" => "http://www.farmdrop.com" })
    end
  end
end
