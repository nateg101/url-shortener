class UrlShortener

  attr_accessor :urls

  def initialize
    @urls = {}
  end

  def add_url(fullurl)
    @urls["url"] = fullurl
  end

  def return_url
    @urls
  end

end
