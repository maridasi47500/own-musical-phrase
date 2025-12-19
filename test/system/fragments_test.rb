require "application_system_test_case"

class FragmentsTest < ApplicationSystemTestCase
  setup do
    @fragment = fragments(:one)
  end

  test "visiting the index" do
    visit fragments_url
    assert_selector "h1", text: "Fragments"
  end

  test "should create fragment" do
    visit fragments_url
    click_on "New fragment"

    fill_in "Caractere", with: @fragment.caractere
    fill_in "Clef", with: @fragment.clef
    fill_in "Key signature", with: @fragment.key_signature
    fill_in "Myscore", with: @fragment.myscore
    fill_in "Nuance", with: @fragment.nuance
    fill_in "Tempo", with: @fragment.tempo
    fill_in "Time signature", with: @fragment.time_signature
    fill_in "Title", with: @fragment.title
    click_on "Create Fragment"

    assert_text "Fragment was successfully created"
    click_on "Back"
  end

  test "should update Fragment" do
    visit fragment_url(@fragment)
    click_on "Edit this fragment", match: :first

    fill_in "Caractere", with: @fragment.caractere
    fill_in "Clef", with: @fragment.clef
    fill_in "Key signature", with: @fragment.key_signature
    fill_in "Myscore", with: @fragment.myscore
    fill_in "Nuance", with: @fragment.nuance
    fill_in "Tempo", with: @fragment.tempo
    fill_in "Time signature", with: @fragment.time_signature
    fill_in "Title", with: @fragment.title
    click_on "Update Fragment"

    assert_text "Fragment was successfully updated"
    click_on "Back"
  end

  test "should destroy Fragment" do
    visit fragment_url(@fragment)
    click_on "Destroy this fragment", match: :first

    assert_text "Fragment was successfully destroyed"
  end
end
