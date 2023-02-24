require "test_helper"

class PostsavesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get postsaves_index_url
    assert_response :success
  end
end
