require 'test_helper'

class RootControllerTest < ActionDispatch::IntegrationTest
  test "the truth" do
    assert get '/'
    assert_response :success
  end
end
