class Person < ActiveRecord::Base
	
  validates :kind_person, inclusion: { 
    in: %w(fisica juridica), 
    message: "admite solo los valores <<fisica>> o <<juridica>>" 
  }

  validates :cuil_cuit, uniqueness: { message: "ya existe en el sistema" }

  validates :cuil_cuit, format: { 
    with: /\A\d{2}-{1}\d{8}-{1}\d{1}\z/,
    message: "debe tener el formato XX-XXXXXXXX-X" 
  } 

  with_options if: :is_fisica? do |fisica|
    
    fisica.validates :name, :surname, :cuil_cuit, :birthday, :kind_document, :document, :gender, presence: true
    fisica.validates :document, numericality: { only_integers: true }
    fisica.validates :document, length: { minimum: 7, maximum: 9 }

    fisica.validates :name, :surname, 
      format:{ 
        with: /\A[a-zA-Z\s]+\z/,
        message: "sólo permite letras" 
      }

    fisica.validates :document, 
      uniqueness: { 
        scope: :kind_document, 
        message: "ya existe un numero con ese tipo de documento" 
      }
    
    fisica.validates :gender, 
      inclusion: { 
        in: %w(Masculino Femenino), 
        message: "admite los valores <<Femenino>> o <<Masculino>>" 
      }

    fisica.validates :kind_document, 
      inclusion: { 
        in: %w(DNI LE LC), 
        message: "admite solo los valores <<dni>>, <<lc>>, <<le>>" 
      } 
  end

  # ACLARACION: para las personas juridicas solo se valida que tengan:
    # name, birthday, cuil_cuit

  with_options if: :is_juridica? do |juridica|
    juridica.validates :name, :cuil_cuit, :birthday, presence: true
    juridica.validates :surname, :gender, :kind_document, :document, absence: true
  end
  
  def is_fisica?
    kind_person == "fisica"
  end

  def is_juridica?
    kind_person == "juridica"
  end
end
