require 'test_helper'

class BookPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get book_pages_home_url
    assert_response :success
  end

end
