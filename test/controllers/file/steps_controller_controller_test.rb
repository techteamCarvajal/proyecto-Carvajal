require 'test_helper'

class File::StepsControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get file_steps_controller_show_url
    assert_response :success
  end

  test "should get update" do
    get file_steps_controller_update_url
    assert_response :success
  end

end
