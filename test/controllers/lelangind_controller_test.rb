require 'test_helper'

class LelangindControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get lelangind_index_url
    assert_response :success
  end

end
