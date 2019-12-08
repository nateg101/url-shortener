require 'url_shortener'

describe UrlShortener do

  subject(:urlshortener) { described_class.new }

  context '#add_url' do
    before(:each) do
      urlshortener.add_url("http://www.farmdrop.com")
    end

    it 'accepts a url and returns it' do

      expect(urlshortener.return_url).to eq "http://www.farmdrop.com"
    end
  end

  context '#shorten_url' do
    before(:each) do
      urlshortener.add_url("http://www.farmdrop.com")
    end

    it 'accepts a url and returns a shorter url' do
      allow(urlshortener).to receive(:choose_characters).and_return("farm")
      urlshortener.shorten_url("http://www.farmdrop.com")

      expect(urlshortener.return_short_url).to eq "/farm"
    end
  end

  context '#create_new_shortener' do
    it 'returns the urls hash with the full and short urls' do
      allow(urlshortener).to receive(:choose_characters).and_return("farm")

      urlshortener.create_new_shortener("http://www.farmdrop.com")
      expect(urlshortener.urls).to eq { "url" => "http://www.farmdrop.com", "short_url" => "/farm" }
    end
  end
end
