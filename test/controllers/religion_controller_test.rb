require 'test_helper'

class ReligionControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get religion_index_url
    assert_response :success
  end

  test "should get show" do
    get religion_show_url
    assert_response :success
  end

  test "should get new" do
    get religion_new_url
    assert_response :success
  end

  test "should get edit" do
    get religion_edit_url
    assert_response :success
  end

  test "should get create" do
    get religion_create_url
    assert_response :success
  end

  test "should get update" do
    get religion_update_url
    assert_response :success
  end

  test "should get destroy" do
    get religion_destroy_url
    assert_response :success
  end

end
