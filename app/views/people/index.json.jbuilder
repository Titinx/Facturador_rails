json.array!(@people) do |person|
  json.extract! person, :id, :name, :surname, :birthday, :gender, :kind_document, :document, :cuil_cuit
  json.url person_url(person, format: :json)
end
