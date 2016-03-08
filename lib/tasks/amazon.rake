desc 'scrape amazon'
task :scrape => :environment do

  original_book_count = Book.count

  require 'rubygems'
  require 'mechanize'

  agent = Mechanize.new

  page = agent.get('http://www.amazon.com/gp/bestsellers/2015/books/')

  page.search('.zg_itemImmersion').take(20).each do |amazon_book|

    next if amazon_book.search('.zg_itemImageImmersion a')[0].blank?

    the_url = amazon_book.search('.zg_itemImageImmersion a')[0]["href"]
    puts the_url
    mechanize = Mechanize.new
    amazon_individual_page = mechanize.get("#{the_url}")

    the_title = amazon_individual_page.search('.feature .a-size-large').text.strip
    book = Book.where(title: the_title).first_or_initialize
    book.title = the_title
    book.price = amazon_book.search('.zg_price .price').text.split('$')[1].to_s.to_f
    book.photo_url = amazon_individual_page.search('.maintain-height img')[0]["src"].to_s

    the_author = amazon_book.search('.zg_byline').text.strip
    the_author = the_author.split('by ')[1].to_s
    the_author_first_name = the_author.split(' ')[0].to_s
    the_author_last_name = the_author.split(' ')[1].to_s
    book.author = Author.where("last_name = ? AND first_name = ?", the_author_first_name, the_author_last_name).first_or_initialize
    book.author.first_name = the_author_first_name
    book.author.last_name = the_author_last_name
    book.author.bio = "* add a bio for me!"
    puts the_author
    book.author.save
    puts "The author saved" if book.author.save
    book.author = book.author

    book.save
    puts "The book saved" if book.save


  end


  new_book_count = Book.count
  if new_book_count - original_book_count > 0
    puts "BAM! Created #{new_book_count - original_book_count} books"
  else
    puts "Ran, but no new books created"
  end

end
