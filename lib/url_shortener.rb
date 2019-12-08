class UrlShortener

  attr_accessor :urls

  def initialize
    @urls = {}
  end

  def self.instance
    @urlshortener = UrlShortener.new
  end

  def create_new_shortener(fullurl)
    add_url(fullurl)
    shorten_url(fullurl)
  end

  def add_url(fullurl)
    @urls["url"] = fullurl
  end

  def return_url
    @urls["url"]
  end

  def shorten_url(fullurl)
    split_domain = fullurl.tr('./:', '').split('')
    short_domain = choose_characters(split_domain)
    urls["short_url"] = "/#{short_domain}"
  end

  def return_short_url
    @urls["short_url"]
  end

  private

  def choose_characters(split_url)
    split_url.sample(4).join()
  end

end
