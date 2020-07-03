require 'test_helper'

class JStockControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get j_stock_index_url
    assert_response :success
  end

  test "should get new" do
    get j_stock_new_url
    assert_response :success
  end

  test "should get create" do
    get j_stock_create_url
    assert_response :success
  end

  test "should get show" do
    get j_stock_show_url
    assert_response :success
  end

  test "should get edit" do
    get j_stock_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get j_stock_destroy_url
    assert_response :success
  end

end
