json.array!(@presses) do |press|
  json.extract! press, :id, :title, :body, :images
  json.url press_url(press, format: :json)
end
