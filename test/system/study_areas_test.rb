require "application_system_test_case"

class StudyAreasTest < ApplicationSystemTestCase
  setup do
    @study_area = study_areas(:one)
  end

  test "visiting the index" do
    visit study_areas_url
    assert_selector "h1", text: "Study Areas"
  end

  test "creating a Study area" do
    visit study_areas_url
    click_on "New Study Area"

    fill_in "Location", with: @study_area.location
    click_on "Create Study area"

    assert_text "Study area was successfully created"
    click_on "Back"
  end

  test "updating a Study area" do
    visit study_areas_url
    click_on "Edit", match: :first

    fill_in "Location", with: @study_area.location
    click_on "Update Study area"

    assert_text "Study area was successfully updated"
    click_on "Back"
  end

  test "destroying a Study area" do
    visit study_areas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Study area was successfully destroyed"
  end
end
