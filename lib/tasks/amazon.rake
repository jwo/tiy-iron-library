desc 'scrape amazon'
task :scrape => :environment do

  original_book_count = Book.count

  require 'rubygems'
  require 'mechanize'
  require 'open-uri'

  agent = Mechanize.new

  page = agent.get('http://www.amazon.com/gp/bestsellers/2016/books/')

  page.search('.zg_itemImmersion').take(10).each do |amazon_book|

    next if amazon_book.search('.zg_itemImageImmersion a')[0].blank?

    the_url = amazon_book.search('.zg_itemImageImmersion a')[0]["href"]

    mechanize = Mechanize.new
    begin
      amazon_individual_page = mechanize.get("#{the_url}")
    rescue Mechanize::ResponseCodeError => exception
      if exception.response_code.nil?
      else
        next
      end
    end

    the_title = amazon_individual_page.search('.feature .a-size-large .a-size-large').text.strip
    book = Book.where(title: the_title).first_or_initialize
    book.title = the_title
    book.price = amazon_book.search('.zg_price .price').text.split('$')[1].to_s.to_f
    photo_url = amazon_individual_page.search('.maintain-height img')[0]["data-a-dynamic-image"].to_s
    photo_url =photo_url.split('{"')[1].to_s
    photo_url = photo_url.split('"')[0].to_s
    open(photo_url, "rb") do |file|
      book.photo = file
    end

    the_author = amazon_book.search('.zg_byline').text.strip
    the_author = the_author.split('by ')[1].to_s
    the_author_first_name = the_author.split(' ')[0].to_s
    the_author_last_name = the_author.split(' ')[1].to_s
    book.author = Author.where("last_name = ? AND first_name = ?", the_author_last_name, the_author_first_name).first_or_initialize
    book.author.first_name = the_author_first_name
    book.author.last_name = the_author_last_name
    book.author.bio = "* add a bio for me!"
    photo_url = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBLFn_gkJY7aEkYyKgr2Mma_N_PpdFiwccMEcjO_oMi-OMAU3Skw"
    open(photo_url, "rb") do |file|
      book.author.photo = file
    end
    book.author.save
    book.author = book.author

    book.save

  end

  new_book_count = Book.count
  if new_book_count - original_book_count > 0
    puts "BAM! Created #{new_book_count - original_book_count} books"
  else
    puts "Ran, but no new books created"
  end

end
