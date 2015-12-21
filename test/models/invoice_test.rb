require 'test_helper'

class InvoiceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @client = clients(:con_facturas)
    @client.save

    @person = people(:person_one)
    @person.save
  end

  test "crear una factura con datos validos" do
  	assert(invoices(:valida).save, "deberia ser guardado")
  end

  test "crear una factura sin campo person_id" do
  	assert_not(invoices(:invalida_person).save, "NO deberia ser guardado")
  end

  test "crear una factura sin campo client_id" do
  	assert_not(invoices(:invalida_client).save, "NO deberia ser guardado")
  end

  test "crear una factura con amount invalido" do
  	assert_not(invoices(:invalida_amount).save, "NO deberia ser guardado")
  end

  test "crear una factura con descripcion invalidos" do
  	assert_not(invoices(:invalida_description).save, "NO deberia ser guardado")
  end

  test "crear una factura con date invalidos" do
  	assert_not(invoices(:invalida_date).save, "NO deberia ser guardado")
  end

end
