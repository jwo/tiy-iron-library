require 'open-uri'

if Author.count == 0

  author = Author.new
  author.first_name = "James"
  author.last_name = "Joyce"
  author.bio = "James Joyce, the twentieth century’s most influential novelist, was born in Dublin on February 2, 1882. The oldest of ten children, he grew up in a family that went from prosperity to penury because of his father’s wastrel behavior. After receiving a rigorous Jesuit education, twenty-year-old Joyce renounced his Catholicism and left Dublin in 1902 to spend most of his life as a writer in exile in Paris, Trieste, Rome, and Zurich. On one trip back to Ireland, he fell in love with the now famous Nora Barnacle on June 16, the day he later chose as “Bloomsday” in his novel Ulysses. Nara was an uneducated Galway girl who became his lifelong companion an the mother of his two children. In debt and drinking heavily, Joyce lived for thirty-six years on the Continent, supporting himself first by teaching jobs, then trough the patronage of Mrs. Harold McCormick (Edith Rockerfeller) and the English feminist and editor Harriet Shaw Weaver. His writings include Chamber Music (1907), Dubliners (1914), A Portrait of the Artist as a Young Man (1916), Exiles (1918), Ulysses (1922), Pomes Penyeach (1927), Finnegan’s Wake (1939), and an early draft of A Portrait of a Young Man, Stephan Hero (1944). Ulysses required seven years to complete, and his masterpiece, Finnegan’s Wake, took seventeen. Both works revolutionized the form, structure, and content of the novel. Joyce died in Zurich in 1941."
  url = "http://d.gr-assets.com/authors/1418595211p5/5144.jpg"
  open(url, "rb") do |file|
    author.photo = file
  end
  author.save

  author = Author.new
  author.first_name = "Kurt"
  author.last_name = "Vonnegut"
  author.bio = "Kurt Vonnegut was a master of contemporary American literature. His black humor, satiric voice, and incomparable imagination first captured America’s attention in The Sirens of Titan in 1959 and established him, in the words of The New York Times, as “a true artist” with the publication of Cat’s Cradle in 1963. He was, as Graham Greene declared, “one of the best living American writers.” Mr. Vonnegut passed away in April 2007."
  url = "http://www.notablebiographies.com/images/uewb_10_img0706.jpg"
  open(url, "rb") do |file|
    author.photo = file
  end
  author.save

  author = Author.new
  author.first_name = "Ralph"
  author.last_name = "Ellison"
  author.bio = "Ralph Ellison (1914–94) was born in Oklahoma and trained as a musician at Tuskegee Institute from 1933 to 1936, at which time a visit to New York and a meeting with Richard Wright led to his first attempts at fiction. Invisible Man won the National Book Award. Appointed to the Academy of American Arts and Letters in 1964, Ellison taught at several institutions, including Bard College, the University of Chicago, and New York University, where he was Albert Schweitzer Professor of Humanities."
  url = "http://mjrizza.com/wp-content/uploads/2014/07/11_ralph_ellison.jpg"
  open(url, "rb") do |file|
    author.photo = file
  end
  author.save

end

if Book.count == 0

  book = Book.new
  book.title = "Ulysses"
  book.price = 26.00
  book.author_id = 1
  url = "http://ecx.images-amazon.com/images/I/51yXIymgmwL.jpg"
  open(url, "rb") do |file|
    book.photo = file
  end
  book.save

  book = Book.new
  book.title = "A Portrait of the Artist as a Young Man"
  book.price = 2.99
  book.author_id = 1
  url = "http://ecx.images-amazon.com/images/I/51zL6QEMp5L.jpg"
  open(url, "rb") do |file|
    book.photo = file
  end
  book.save

  book = Book.new
  book.title = "Slaughterhouse-Five"
  book.price = 7.99
  book.author_id = 2
  url = "http://ecx.images-amazon.com/images/I/4120yizU-2L.jpg"
  open(url, "rb") do |file|
    book.photo = file
  end
  book.save

  book = Book.new
  book.title = "Invisible Man"
  book.price = 21.00
  book.author_id = 3
  url = "http://ecx.images-amazon.com/images/I/51LU-4hu%2BIL._SX322_BO1,204,203,200_.jpg"
  open(url, "rb") do |file|
    book.photo = file
  end
  book.save

end
