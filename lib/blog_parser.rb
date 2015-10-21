require_relative('./post.rb')
require 'nokogiri'
require 'open-uri'
require 'awesome_print'
require 'pry'

class BlogParser
  def initialize(url)
    @url = url
  end

  def create_posts
    create_links.map do | link |
      create_post(link)
    end
  end

  def create_links
    home_page = Nokogiri::HTML(open(@url))
    post_links = home_page.css('.mini-post-link').map do | link |
      @url + link['href']
    end
    return post_links
  end

  def create_post(link)
    single_post = Nokogiri::HTML(open(link))
    title = single_post.css('.title').text.strip
    content = parse_paragraphs(single_post)
    date = single_post.css('.meta-date').children.text.strip
    Post.new(title, date, content)
  end

  def parse_paragraphs(article)
    article.css('.post-body p').map do | content |
      content.text.strip
    end.join("\n")
  end

end
