json.extract! feedback, :id, :issue, :content, :created_at, :updated_at
json.url feedback_url(feedback, format: :json)
