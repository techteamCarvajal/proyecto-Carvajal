json.extract! blog, :id, :nombre, :contenido, :user_id, :created_at, :updated_at
json.url blog_url(blog, format: :json)
