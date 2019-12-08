require 'sinatra/base'
require_relative 'lib/url_shortener'

class App < Sinatra::Base

  before do
    @url_shortener = UrlShortener.new
  end

  get '/' do
    'URL Shortener'
  end

  post '/' do
    url = JSON.parse(request.body.read)

    full_url = @url_shortener.add_url(url)

    short_url = @url_shortener.shorten_url(url['url'])

    { short_url: "#{short_url}", url: @url_shortener.return_url["url"] }.to_json
  end

  get '/:short_url' do
    url = params[:short_url]
    redirect "#{ @url_shortener.return_url }", 301
  end

  run! if app_file == $0
end
