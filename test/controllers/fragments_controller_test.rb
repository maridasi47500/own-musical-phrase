require "test_helper"

class FragmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fragment = fragments(:one)
  end

  test "should get index" do
    get fragments_url
    assert_response :success
  end

  test "should get new" do
    get new_fragment_url
    assert_response :success
  end

  test "should create fragment" do
    assert_difference("Fragment.count") do
      post fragments_url, params: { fragment: { caractere: @fragment.caractere, clef: @fragment.clef, key_signature: @fragment.key_signature, myscore: @fragment.myscore, nuance: @fragment.nuance, tempo: @fragment.tempo, time_signature: @fragment.time_signature, title: @fragment.title } }
    end

    assert_redirected_to fragment_url(Fragment.last)
  end

  test "should show fragment" do
    get fragment_url(@fragment)
    assert_response :success
  end

  test "should get edit" do
    get edit_fragment_url(@fragment)
    assert_response :success
  end

  test "should update fragment" do
    patch fragment_url(@fragment), params: { fragment: { caractere: @fragment.caractere, clef: @fragment.clef, key_signature: @fragment.key_signature, myscore: @fragment.myscore, nuance: @fragment.nuance, tempo: @fragment.tempo, time_signature: @fragment.time_signature, title: @fragment.title } }
    assert_redirected_to fragment_url(@fragment)
  end

  test "should destroy fragment" do
    assert_difference("Fragment.count", -1) do
      delete fragment_url(@fragment)
    end

    assert_redirected_to fragments_url
  end
end
