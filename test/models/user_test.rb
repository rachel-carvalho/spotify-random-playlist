require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @spotify_user = RSpotify::User.new({})
    @user = User.new(@spotify_user)
  end

  test 'delegates methods to RSpotify::User' do
    @spotify_user.stubs(:display_name).returns 'User Name'

    assert_equal @spotify_user, @user.spotify_user
    assert_equal 'User Name', @user.display_name
  end

  test '#songs lists all users songs' do
    page1 = [mock('track from page 1')] * 50
    page2 = [mock('track from page 2')] * 50
    page3 = [mock('track from page 3')] * 20
    @spotify_user.stubs(:saved_tracks).with(limit: 50, offset: 0).returns page1
    @spotify_user.stubs(:saved_tracks).with(limit: 50, offset: 50).returns page2
    @spotify_user.stubs(:saved_tracks).with(limit: 50, offset: 100).returns page3
    assert_equal page1 + page2 + page3, @user.all_songs
  end

  test '#songs lists all users songs when user has number of songs multiple of limit' do
    page1 = [mock('track from page 1')] * 50
    page2 = [mock('track from page 2')] * 50
    page3 = [mock('track from page 3')] * 50
    @spotify_user.stubs(:saved_tracks).with(limit: 50, offset: 0).returns page1
    @spotify_user.stubs(:saved_tracks).with(limit: 50, offset: 50).returns page2
    @spotify_user.stubs(:saved_tracks).with(limit: 50, offset: 100).returns page3
    @spotify_user.stubs(:saved_tracks).with(limit: 50, offset: 150).returns []
    assert_equal page1 + page2 + page3, @user.all_songs
  end

  test '#playlists lists all users playlists' do
    page1 = [mock('playlist from page 1')] * 50
    page2 = [mock('playlist from page 2')] * 50
    page3 = [mock('playlist from page 3')] * 20
    @spotify_user.stubs(:playlists).with(limit: 50, offset: 0).returns page1
    @spotify_user.stubs(:playlists).with(limit: 50, offset: 50).returns page2
    @spotify_user.stubs(:playlists).with(limit: 50, offset: 100).returns page3
    assert_equal page1 + page2 + page3, @user.playlists
  end

  test "#randomized_playlist returns the user's playlist with name 'Randomized Liked Songs'" do

  end
end
