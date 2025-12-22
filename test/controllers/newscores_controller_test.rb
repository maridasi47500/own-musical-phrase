require "test_helper"

class NewscoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @newscore = newscores(:one)
  end

  test "should get index" do
    get newscores_url
    assert_response :success
  end

  test "should get new" do
    get new_newscore_url
    assert_response :success
  end

  test "should create newscore" do
    assert_difference("Newscore.count") do
      post newscores_url, params: { newscore: { cmajorsevensymbol: @newscore.cmajorsevensymbol, composer: @newscore.composer, dynamictext: @newscore.dynamictext, fingering: @newscore.fingering, key_signature: @newscore.key_signature, lyrictext: @newscore.lyrictext, metronomemark: @newscore.metronomemark, notehead: @newscore.notehead, rest: @newscore.rest, testscript: @newscore.testscript, textmark: @newscore.textmark, time_signature: @newscore.time_signature, title: @newscore.title, toplevelmarkup: @newscore.toplevelmarkup, tuplenumber: @newscore.tuplenumber } }
    end

    assert_redirected_to newscore_url(Newscore.last)
  end

  test "should show newscore" do
    get newscore_url(@newscore)
    assert_response :success
  end

  test "should get edit" do
    get edit_newscore_url(@newscore)
    assert_response :success
  end

  test "should update newscore" do
    patch newscore_url(@newscore), params: { newscore: { cmajorsevensymbol: @newscore.cmajorsevensymbol, composer: @newscore.composer, dynamictext: @newscore.dynamictext, fingering: @newscore.fingering, key_signature: @newscore.key_signature, lyrictext: @newscore.lyrictext, metronomemark: @newscore.metronomemark, notehead: @newscore.notehead, rest: @newscore.rest, testscript: @newscore.testscript, textmark: @newscore.textmark, time_signature: @newscore.time_signature, title: @newscore.title, toplevelmarkup: @newscore.toplevelmarkup, tuplenumber: @newscore.tuplenumber } }
    assert_redirected_to newscore_url(@newscore)
  end

  test "should destroy newscore" do
    assert_difference("Newscore.count", -1) do
      delete newscore_url(@newscore)
    end

    assert_redirected_to newscores_url
  end
end
