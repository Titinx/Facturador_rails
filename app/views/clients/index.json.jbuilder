json.array!(@clients) do |client|
  json.extract! client, :id, :name, :surname, :birthday, :gender, :kind_document, :document, :cuil_cuit
  json.url client_url(client, format: :json)
end
