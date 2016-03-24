json.id author.id
json.first_name author.first_name
json.last_name author.last_name
json.full_name author.full_name
json.bio author.bio
json.photo_url author.photo_url

json.created_at author.created_at
json.updated_at author.updated_at

json.author_url author_path(id: author.id)
