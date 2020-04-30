require 'test_helper'

class CulesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cules_index_url
    assert_response :success
  end

  test "should get show" do
    get cules_show_url
    assert_response :success
  end

  test "should get new" do
    get cules_new_url
    assert_response :success
  end

  test "should get create" do
    get cules_create_url
    assert_response :success
  end

  test "should get edit" do
    get cules_edit_url
    assert_response :success
  end

  test "should get update" do
    get cules_update_url
    assert_response :success
  end

  test "should get destroy" do
    get cules_destroy_url
    assert_response :success
  end

end
