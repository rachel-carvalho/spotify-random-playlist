require "test_helper"

class PlaylistsControllerTest < ActionDispatch::IntegrationTest
  test "should create playlist" do
    User.any_instance.expects(:create_randomized_playlist!)
    post playlist_url
    assert_redirected_to root_url
  end

  test "should destroy playlist" do
    User.any_instance.expects(:destroy_randomized_playlist!)
    delete playlist_url
    assert_redirected_to root_url
  end
end
