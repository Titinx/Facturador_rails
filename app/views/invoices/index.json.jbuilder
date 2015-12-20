json.array!(@invoices) do |invoice|
  json.extract! invoice, :id, :description, :amount, :date, :person_id, :client_id
  json.url client_invoice_url(@client, invoice, format: :json)
end
