require 'test_helper'

class ClientTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "Intentando crear un cliente vacio" do
    assert_not Client.new.save(), "No se debe poder crear un cliente vacio!."
  end

  test "Intentando crear cliente con un solo atributo" do
    assert_not Client.new(name: 'Bruce').save(), "No se debe poder crear un cliente con solo el nombre."
    assert_not Client.new(surname: 'Willis').save(), "No se debe poder crear un cliente con solo el el apellido."
    assert_not Client.new(birthday: '1940-2-27').save(), "No se debe poder crear un cliene con solo la fecha de nacimento."
    assert_not Client.new(kind_document: 'DNI').save(), "No se debe poder crear un cliene con solo el tipo de documento"
    assert_not Client.new(document: '38383838').save(), "No se debe poder crear un cliene con solo el numero de documento"
    assert_not Client.new(gender: "Masculino").save(), "No se debe poder crear un cliene con solo el genero"
    assert_not Client.new(cuil_cuit: '27-12345678-5').save(), "No se debe poder crear un cliene con solo el CUIL/CUIT"
  end

  test "Intentado crear cliente sin contacto" do
    client = clients(:valido)
    assert(client.save, "Cliente debe ser guardado")
  end

  test "Intentado crear cliente con contacto" do
    client = clients(:valido)
    client.contacts.build(
    	kind: "email",
    	data: "valido@gmail.com"
    )
    assert(client.save, "Cliente debe ser guardado")
  end

  test "Intentado crear cliente con datos invalidos" do
    client = clients(:invalido)
    assert_not(client.save, "Cliente NO debe ser guardado")
  end

  test "Intentado crear cliente con cuil_cuit y dni repetido repetido" do
  	@client_info = {
    	name: "juan", surname: "suarez", birthday: "2015-12-15",
 		gender: "Masculino", kind_document: "DNI", 
 		document: 40404040, cuil_cuit: "20-38383839-5"
    }
    client = Client.new(@client_info)
    client.save
    client_dup = Client.new(@client_info)
    assert_not(client_dup.save, "Cliente NO debe ser guardado con cuil_cuit y dni repetidos")
  end

  test "Intentando borrar un cliente con facturas" do
  	client = clients(:valido)
  	client.save
  	person = people(:person_one)
  	person.save
  	inv = invoices(:valida)
  	inv.save
  	assert_difference('Client.count',-1, "deberia eliminar el contacto") do
      client.destroy
    end
  end

  test "Intentando borrar un cliente sin facturas" do
  	client = clients(:valido)
  	client.save
  	assert_difference('Client.count',-1, "deberia eliminar el contacto") do
      client.destroy
    end
  end

end
