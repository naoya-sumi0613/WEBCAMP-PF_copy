require 'test_helper'

class Admins::ContactControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_contact_index_url
    assert_response :success
  end

  test "should get show" do
    get admins_contact_show_url
    assert_response :success
  end

end
