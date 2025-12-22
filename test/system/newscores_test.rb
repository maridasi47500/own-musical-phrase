require "application_system_test_case"

class NewscoresTest < ApplicationSystemTestCase
  setup do
    @newscore = newscores(:one)
  end

  test "visiting the index" do
    visit newscores_url
    assert_selector "h1", text: "Newscores"
  end

  test "should create newscore" do
    visit newscores_url
    click_on "New newscore"

    fill_in "Cmajorsevensymbol", with: @newscore.cmajorsevensymbol
    fill_in "Composer", with: @newscore.composer
    fill_in "Dynamictext", with: @newscore.dynamictext
    fill_in "Fingering", with: @newscore.fingering
    fill_in "Key signature", with: @newscore.key_signature
    fill_in "Lyrictext", with: @newscore.lyrictext
    fill_in "Metronomemark", with: @newscore.metronomemark
    fill_in "Notehead", with: @newscore.notehead
    fill_in "Rest", with: @newscore.rest
    fill_in "Testscript", with: @newscore.testscript
    fill_in "Textmark", with: @newscore.textmark
    fill_in "Time signature", with: @newscore.time_signature
    fill_in "Title", with: @newscore.title
    fill_in "Toplevelmarkup", with: @newscore.toplevelmarkup
    fill_in "Tuplenumber", with: @newscore.tuplenumber
    click_on "Create Newscore"

    assert_text "Newscore was successfully created"
    click_on "Back"
  end

  test "should update Newscore" do
    visit newscore_url(@newscore)
    click_on "Edit this newscore", match: :first

    fill_in "Cmajorsevensymbol", with: @newscore.cmajorsevensymbol
    fill_in "Composer", with: @newscore.composer
    fill_in "Dynamictext", with: @newscore.dynamictext
    fill_in "Fingering", with: @newscore.fingering
    fill_in "Key signature", with: @newscore.key_signature
    fill_in "Lyrictext", with: @newscore.lyrictext
    fill_in "Metronomemark", with: @newscore.metronomemark
    fill_in "Notehead", with: @newscore.notehead
    fill_in "Rest", with: @newscore.rest
    fill_in "Testscript", with: @newscore.testscript
    fill_in "Textmark", with: @newscore.textmark
    fill_in "Time signature", with: @newscore.time_signature
    fill_in "Title", with: @newscore.title
    fill_in "Toplevelmarkup", with: @newscore.toplevelmarkup
    fill_in "Tuplenumber", with: @newscore.tuplenumber
    click_on "Update Newscore"

    assert_text "Newscore was successfully updated"
    click_on "Back"
  end

  test "should destroy Newscore" do
    visit newscore_url(@newscore)
    click_on "Destroy this newscore", match: :first

    assert_text "Newscore was successfully destroyed"
  end
end
