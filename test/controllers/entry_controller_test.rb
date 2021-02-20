require "test_helper"

class EntryControllerTest < ActionDispatch::IntegrationTest
  test "should get tracking" do
    get entry_tracking_url
    assert_response :success
  end

  test "should get read" do
    get entry_read_url
    assert_response :success
  end
end
