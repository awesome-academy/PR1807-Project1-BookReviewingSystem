require 'test_helper'

class Admin::BookPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get admin_book_pages_home_url
    assert_response :success
  end

end
