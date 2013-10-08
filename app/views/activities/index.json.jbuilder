json.array!(@activities) do |activity|
  json.extract! activity, :title, :user_id, :description, :link, :xp
  json.url activity_url(activity, format: :json)
end
