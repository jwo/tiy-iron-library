json.books @books do |book|
  json.partial! 'book', book: book
end
