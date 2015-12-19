class Invoice < ActiveRecord::Base
  belongs_to :person
  belongs_to :client

  validates :person_id, :client_id, :date, :description, :amount, presence: true
  validates :amount, numericality: { greater_than_or_equal_to: 0, message: "solo se permite números positivos o el valr 0" }
end
