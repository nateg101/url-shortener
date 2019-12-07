require 'sinatra/base'
require_relative 'lib/url_shortener'

class App < Sinatra::Base

  before do
    @url_shortener = UrlShortener.new
  end

  get '/' do
    'URL Shortener'
  end

  get '/:fullurl' do
    fullurl = params[:fullurl]

    @url_shortener.add_url(fullurl)
    @url_shortener.shorten_url(fullurl)
  end
end
