require 'test_helper'

class OffersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @offer = offers(:one)
  end

  test "should get index" do
    get offers_url
    assert_response :success
  end

  test "should get new" do
    get new_offer_url
    assert_response :success
  end

  test "should create offer" do
    assert_difference('Offer.count') do
      post offers_url, params: { offer: { company_id: @offer.company_id, conocimientos_especificos: @offer.conocimientos_especificos, disponibilidad_residencia: @offer.disponibilidad_residencia, disponibilidad_viajar: @offer.disponibilidad_viajar, educacion_minima: @offer.educacion_minima, experiencia: @offer.experiencia, idiomas: @offer.idiomas, nombre_cargo: @offer.nombre_cargo, objetivo: @offer.objetivo, programas: @offer.programas, salario_float: @offer.salario_float, tipo: @offer.tipo, tipo_contrato: @offer.tipo_contrato, vacantes: @offer.vacantes } }
    end

    assert_redirected_to offer_url(Offer.last)
  end

  test "should show offer" do
    get offer_url(@offer)
    assert_response :success
  end

  test "should get edit" do
    get edit_offer_url(@offer)
    assert_response :success
  end

  test "should update offer" do
    patch offer_url(@offer), params: { offer: { company_id: @offer.company_id, conocimientos_especificos: @offer.conocimientos_especificos, disponibilidad_residencia: @offer.disponibilidad_residencia, disponibilidad_viajar: @offer.disponibilidad_viajar, educacion_minima: @offer.educacion_minima, experiencia: @offer.experiencia, idiomas: @offer.idiomas, nombre_cargo: @offer.nombre_cargo, objetivo: @offer.objetivo, programas: @offer.programas, salario_float: @offer.salario_float, tipo: @offer.tipo, tipo_contrato: @offer.tipo_contrato, vacantes: @offer.vacantes } }
    assert_redirected_to offer_url(@offer)
  end

  test "should destroy offer" do
    assert_difference('Offer.count', -1) do
      delete offer_url(@offer)
    end

    assert_redirected_to offers_url
  end
end
