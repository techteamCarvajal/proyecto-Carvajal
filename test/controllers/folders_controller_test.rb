require 'test_helper'

class FoldersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @folder = folders(:one)
  end

  test "should get index" do
    get folders_url
    assert_response :success
  end

  test "should get new" do
    get new_folder_url
    assert_response :success
  end

  test "should create folder" do
    assert_difference('Folder.count') do
      post folders_url, params: { folder: { certificado_cuenta_bancaria: @folder.certificado_cuenta_bancaria, certificado_eps: @folder.certificado_eps, certificado_formacion: @folder.certificado_formacion, cesantias: @folder.cesantias, fondo_pension: @folder.fondo_pension, fotocopia_cedula: @folder.fotocopia_cedula, referencia_laboral: @folder.referencia_laboral, soporte_estudios: @folder.soporte_estudios, user_id: @folder.user_id } }
    end

    assert_redirected_to folder_url(Folder.last)
  end

  test "should show folder" do
    get folder_url(@folder)
    assert_response :success
  end

  test "should get edit" do
    get edit_folder_url(@folder)
    assert_response :success
  end

  test "should update folder" do
    patch folder_url(@folder), params: { folder: { certificado_cuenta_bancaria: @folder.certificado_cuenta_bancaria, certificado_eps: @folder.certificado_eps, certificado_formacion: @folder.certificado_formacion, cesantias: @folder.cesantias, fondo_pension: @folder.fondo_pension, fotocopia_cedula: @folder.fotocopia_cedula, referencia_laboral: @folder.referencia_laboral, soporte_estudios: @folder.soporte_estudios, user_id: @folder.user_id } }
    assert_redirected_to folder_url(@folder)
  end

  test "should destroy folder" do
    assert_difference('Folder.count', -1) do
      delete folder_url(@folder)
    end

    assert_redirected_to folders_url
  end
end
