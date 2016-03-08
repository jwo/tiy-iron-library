require 'rubygems'
require 'mechanize'
# class Mechanize
# end

agent = Mechanize.new

page = agent.get('http://www.amazon.com/gp/bestsellers/2015/books/')

titles = []
page.search('.zg_title').each do |title|
  titles << title.text.strip
end
puts titles

authors = []
page.search('.zg_byline').each do |author|
  authors << author.text.strip
end
puts authors

prices = []
page.search('.zg_price .price').each do |price|
  prices << price.text.strip
end
puts prices

photo_urls = []
page.search('.zg_itemImageImmersion').each do |photo_url|
  photo_urls << photo_url.text.strip
end
puts photo_urls

titles.each.with_index do |record, index|


end
