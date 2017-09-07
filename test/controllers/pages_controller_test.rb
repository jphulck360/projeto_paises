require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get pages" do
    get pages_pages_url
    assert_response :success
  end

  test "should get sobre" do
    get pages_sobre_url
    assert_response :success
  end

end
