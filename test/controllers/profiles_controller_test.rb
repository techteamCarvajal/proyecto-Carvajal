require 'test_helper'

class ProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @profile = profiles(:one)
  end

  test "should get index" do
    get profiles_url
    assert_response :success
  end

  test "should get new" do
    get new_profile_url
    assert_response :success
  end

  test "should create profile" do
    assert_difference('Profile.count') do
      post profiles_url, params: { profile: { certificado_curso: @profile.certificado_curso, cursos: @profile.cursos, experiencia_laboral: @profile.experiencia_laboral, fecha_expedicion: @profile.fecha_expedicion, habilidades: @profile.habilidades, hoja_vida: @profile.hoja_vida, ingles: @profile.ingles, nivel_educativo: @profile.nivel_educativo, num_tarjeta_profesional: @profile.num_tarjeta_profesional, parentesco_carvajal: @profile.parentesco_carvajal, programas: @profile.programas, sector: @profile.sector, tarjeta_profesional: @profile.tarjeta_profesional } }
    end

    assert_redirected_to profile_url(Profile.last)
  end

  test "should show profile" do
    get profile_url(@profile)
    assert_response :success
  end

  test "should get edit" do
    get edit_profile_url(@profile)
    assert_response :success
  end

  test "should update profile" do
    patch profile_url(@profile), params: { profile: { certificado_curso: @profile.certificado_curso, cursos: @profile.cursos, experiencia_laboral: @profile.experiencia_laboral, fecha_expedicion: @profile.fecha_expedicion, habilidades: @profile.habilidades, hoja_vida: @profile.hoja_vida, ingles: @profile.ingles, nivel_educativo: @profile.nivel_educativo, num_tarjeta_profesional: @profile.num_tarjeta_profesional, parentesco_carvajal: @profile.parentesco_carvajal, programas: @profile.programas, sector: @profile.sector, tarjeta_profesional: @profile.tarjeta_profesional } }
    assert_redirected_to profile_url(@profile)
  end

  test "should destroy profile" do
    assert_difference('Profile.count', -1) do
      delete profile_url(@profile)
    end

    assert_redirected_to profiles_url
  end
end
