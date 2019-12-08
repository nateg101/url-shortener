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
    @urlshortener.create_new_shortener(url['url'])
    { short_url: @urlshortener.return_short_url, url: @urlshortener.return_url["url"] }.to_json

    puts @urlshortener.urls
  end

  get '/:short_url' do
    short_url = params[:short_url]

    redirect "#{@urlshortener.urls[params[short_url]]}", 301
  end

  run! if app_file == $0
end
