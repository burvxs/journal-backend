require 'test_helper'

class CatergoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get catergories_index_url
    assert_response :success
  end

  test "should get create" do
    get catergories_create_url
    assert_response :success
  end

  test "should get lists" do
    get catergories_lists_url
    assert_response :success
  end

end
