require 'test_helper'

class AdministratorPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "Transparency"
  end

  test "should get help" do
    get help_path
    assert_response :success
    assert_select "title", "Help | Transparency"
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "About | Transparency"
  end

  test "should get contact" do
    get contact_path
    assert_response :success
    assert_select "title", "Contact | Transparency"
  end

end
