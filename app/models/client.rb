class Client < ActiveRecord::Base
  has_many :contacts, dependent: :destroy
  has_many :invoices, dependent: :destroy

  #Validaciones
  validates :name, :surname, :cuil_cuit, :kind_document, :document, :gender, :birthday, presence: true
  
  validates :name, :surname, :kind_document, format: { with: /[a-zA-Z\s]/,
    message: "sólo permite letras" }

  validates :cuil_cuit, uniqueness: { message: "ya existe en el sistema" }
  
  validates :document, uniqueness: { 
    scope: :kind_document, 
    message: "ya existe un numero con este tipo de documento" }
  
  validates :document, numericality: { only_integers: true }
  validates :document, length: { minimum: 7, maximum: 9 }
  
  validates :gender, inclusion: { in: %w(M F), 
    message: "admite los valores M o F" } 
end
