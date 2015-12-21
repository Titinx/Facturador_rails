class Contact < ActiveRecord::Base
  belongs_to :client

  validates :kind, :data, :client, presence: true
  validates :kind, inclusion: { 
  	in: %w(email skype phone direction),
    message: "%{value} no es un tipo de contacto valido" }

  validates :data, format: { 
  	with: /\A([a-zA-Z0-9])+([a-zA-Z0-9\._-])*@[a-z0-9-]+(.[a-z0-9-]+)*(.[a-z]{2,4})\z/,
    message: "%{value} no se permiten espacios ni letras epseciales" }, if: :email?

  validates :data, format: { 
  	with: /\A([a-zA-Z0-9])+([a-zA-Z0-9\._-])*\z/,
    message: "%{value} no se permiten espacios ni letras especiales" }, if: :skype?

  validates :data, format: { 
  	with: /\A[\+0-9\-][0-9]{7,15}|^[\+0-9\-][0-9\-\ ]{5,19}[0-9]\z/,
    message: "%{value} Ingrese solo numeros, o +,-" }, if: :phone?

  validates :data, format: { 
  	with: /\A[a-zA-Z0-9+\°\(\)_\-][a-zA-Z0-9+\°\(\)_\-\ ]*\z/,
    message: "%{value} Ingrese una direccion, no se permite caracteres en blanco al principio" }, 
    if: :direction?

  def email?
  	kind == "email"
  end

  def skype?
  	kind == "skype"
  end

  def phone?
  	kind == "phone"
  end

  def direction?
  	kind == "direction"
  end



end
