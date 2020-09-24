require 'test_helper'

class SublistsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get sublists_create_url
    assert_response :success
  end

end
