require 'sinatra/base'
require_relative 'lib/url_shortener'

class App < Sinatra::Base

  before do
    @urlshortener = UrlShortener.instance
  end

  get '/' do
    'URL Shortener'
  end

  post '/' do
    url = JSON.parse(request.body.read)
    full_url = @urlshortener.add_url(url['url'])

    short_url = @urlshortener.shorten_url(url['url'])
    { short_url: "#{short_url}", url: @urlshortener.return_url["url"] }.to_json
  end

  get '/:short_url' do
    puts @urlshortener.return_url

    redirect "#{@urlshortener.urls["url"]}", 301
  end

  run! if app_file == $0
end
