require 'test_helper'

class DocumentsControllerTest < ActionDispatch::IntegrationTest
  test "should get etapa1" do
    get documents_etapa1_url
    assert_response :success
  end

  test "should get etapa2" do
    get documents_etapa2_url
    assert_response :success
  end

  test "should get etapa3" do
    get documents_etapa3_url
    assert_response :success
  end

  test "should get etapa4" do
    get documents_etapa4_url
    assert_response :success
  end

end
