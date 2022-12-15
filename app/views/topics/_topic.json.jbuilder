json.extract! topic, :id, :title, :rating, :type, :created_at, :updated_at
json.url topic_url(topic, format: :json)
