class Client < ActiveRecord::Base
  has_many :contacts, dependent: :destroy
  has_many :invoices, dependent: :destroy
  has_many :people, through: :invoices

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

  def client_age
      ((Date.current - birthday)/365).to_i
  end  

  def fac_per_people
    people
      .select("name, sum(amount) as sum_amount")
      .group(:id)
      .order("sum_amount DESC")
  end

  def count_fac_per_people
    people
      .select("name, count(amount) as tot_amount")
      .group(:id)
      .order("tot_amount DESC")
  end

  def fac_per_year
    invoices
      .select("strftime('%Y', date) as year, sum(amount) as total")
      .group("year")
      .order("year")
  end

  def fac_per_mouth
    invoices
      .select("strftime('%m', date) as mes, sum(amount) as total")
      .where("strftime('%Y', date) == strftime('%Y', 'now')")
      .group("mes")
  end
end
