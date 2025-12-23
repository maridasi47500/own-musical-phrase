require "application_system_test_case"

class PicsTest < ApplicationSystemTestCase
  setup do
    @pic = pics(:one)
  end

  test "visiting the index" do
    visit pics_url
    assert_selector "h1", text: "Pics"
  end

  test "should create pic" do
    visit pics_url
    click_on "New pic"

    fill_in "Mypic", with: @pic.mypic
    fill_in "Newscore", with: @pic.newscore_id
    click_on "Create Pic"

    assert_text "Pic was successfully created"
    click_on "Back"
  end

  test "should update Pic" do
    visit pic_url(@pic)
    click_on "Edit this pic", match: :first

    fill_in "Mypic", with: @pic.mypic
    fill_in "Newscore", with: @pic.newscore_id
    click_on "Update Pic"

    assert_text "Pic was successfully updated"
    click_on "Back"
  end

  test "should destroy Pic" do
    visit pic_url(@pic)
    click_on "Destroy this pic", match: :first

    assert_text "Pic was successfully destroyed"
  end
end
