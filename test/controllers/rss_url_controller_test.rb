require "test_helper"

class RssUrlControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get rss_url_index_url
    assert_response :success
  end

  test "should get new" do
    get rss_url_new_url
    assert_response :success
  end

  test "should get create" do
    get rss_url_create_url
    assert_response :success
  end

  test "should get destroy" do
    get rss_url_destroy_url
    assert_response :success
  end
end
