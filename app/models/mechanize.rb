require 'rubygems'
require 'mechanize'
# class Mechanize
# end

agent = Mechanize.new

page = agent.get('http://www.amazon.com/gp/bestsellers/2015/books/')

page.links.each do |link|
  puts link.text
end
