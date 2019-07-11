require 'test_helper'

class Admin::ChaptersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_chapters_new_url
    assert_response :success
  end

  test "should get index" do
    get admin_chapters_index_url
    assert_response :success
  end

end
