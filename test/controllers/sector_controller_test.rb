require 'test_helper'

class SectorControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sector_index_url
    assert_response :success
  end

  test "should get new" do
    get sector_new_url
    assert_response :success
  end

  test "should get create" do
    get sector_create_url
    assert_response :success
  end

  test "should get show" do
    get sector_show_url
    assert_response :success
  end

  test "should get edit" do
    get sector_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get sector_destroy_url
    assert_response :success
  end

end
