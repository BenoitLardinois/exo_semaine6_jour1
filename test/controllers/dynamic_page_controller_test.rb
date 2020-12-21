require 'test_helper'

class DynamicPageControllerTest < ActionDispatch::IntegrationTest
  test "should get welcome" do
    get dynamic_page_welcome_url
    assert_response :success
  end

end
