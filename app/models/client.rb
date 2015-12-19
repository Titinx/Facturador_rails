class Client < ActiveRecord::Base
  has_many :contacts, dependent: :destroy
  has_many :invoices, dependent: :destroy

  #Validaciones
  validates :name, :surname, :cuil_cuit, :kind_document, :document, :gender, :birthday, presence: true
  
  validates :name, :surname, format: { 
    with: /\A[a-zA-Z\s]+\z/,
    message: "sólo permite letras" 
  }

  validates :cuil_cuit, uniqueness: { message: "ya existe en el sistema" }
  validates :cuil_cuit, format: { 
    with: /\A\d{2}-{1}\d{8}-{1}\d{1}\z/,
    message: "debe tener el formato XX-XXXXXXXX-X" 
  }

  validates :document, uniqueness: { 
    scope: :kind_document, 
    message: "ya existe un numero con este tipo de documento" }
  
  validates :document, numericality: { only_integers: true }
  validates :document, length: { minimum: 7, maximum: 9 }
  
  validates :gender, inclusion: { in: %w(Masculino Femenino), 
    message: "admite los valores <<Masculino>> o <<Femenino>>" } 

  validates :kind_document, inclusion: { 
    in: %w(DNI LE LC), 
    message: "admite solo los valores <<dni>>, <<lc>>, <<le>>" 
  } 
end
