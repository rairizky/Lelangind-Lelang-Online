require 'test_helper'

class PetugasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get petugas_index_url
    assert_response :success
  end

end
