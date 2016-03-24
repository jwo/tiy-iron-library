json.id book.id
json.title book.title
json.price book.price
json.photo_url book.photo_url
json.author do
  json.id book.author.id
  json.first_name book.author.first_name
  json.last_name book.author.last_name
  json.full_name book.author.full_name
end
json.created_at book.created_at
json.updated_at book.updated_at

json.book_url book_path(id: book.id)
