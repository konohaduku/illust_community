require "test_helper"

class IllustsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get illusts_index_url
    assert_response :success
  end

  test "should get edit" do
    get illusts_edit_url
    assert_response :success
  end

  test "should get show" do
    get illusts_show_url
    assert_response :success
  end

  test "should get create" do
    get illusts_create_url
    assert_response :success
  end

  test "should get update" do
    get illusts_update_url
    assert_response :success
  end

  test "should get destroy" do
    get illusts_destroy_url
    assert_response :success
  end
end
