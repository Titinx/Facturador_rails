json.array!(@invoices) do |invoice|
  json.extract! invoice, :id, :description, :amount, :date, :person_id, :client_id
  json.url invoice_url(invoice, format: :json)
end
