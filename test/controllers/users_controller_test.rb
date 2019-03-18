require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get users_new_url
    assert_response :success
  end

  test "should get create" do
    get users_create_url
    assert_response :success
  end

  test "should get show" do
    get users_show_url
    assert_response :success
  end

  test "should get challenge" do
    get users_challenge_url
    assert_response :success
  end

  test "should get verify" do
    get users_verify_url
    assert_response :success
  end

  test "should get success" do
    get users_success_url
    assert_response :success
  end

end
