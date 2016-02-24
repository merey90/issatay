json.array!(@carousels) do |carousel|
  json.extract! carousel, :id, :title, :, :description, :
  json.url carousel_url(carousel, format: :json)
end
