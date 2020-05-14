require 'test_helper'

class Users::CommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_comments_index_url
    assert_response :success
  end

end
