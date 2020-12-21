require 'test_helper'

class PageShowControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get page_show_show_url
    assert_response :success
  end

end
