require 'test_helper'

class Users::ContactsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get users_contacts_new_url
    assert_response :success
  end

  test "should get done" do
    get users_contacts_done_url
    assert_response :success
  end

end
