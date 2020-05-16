require 'test_helper'

class Users::RelationshipsControllerTest < ActionDispatch::IntegrationTest
  test "should get follow" do
    get users_relationships_follow_url
    assert_response :success
  end

  test "should get follower" do
    get users_relationships_follower_url
    assert_response :success
  end

end
