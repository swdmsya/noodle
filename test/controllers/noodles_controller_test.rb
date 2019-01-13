require 'test_helper'

class NoodlesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get noodles_index_url
    assert_response :success
  end

  test "should get show" do
    get noodles_show_url
    assert_response :success
  end

  test "should get new" do
    get noodles_new_url
    assert_response :success
  end

  test "should get edit" do
    get noodles_edit_url
    assert_response :success
  end

end
