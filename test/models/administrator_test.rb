require 'test_helper'

class AdministratorTest < ActiveSupport::TestCase
  def setup
    @administrator = Administrator.new(name: "Example Admin", email: "admin@example.com",
                               password: "foobar", password_confirmation: "foobar", access_code: "pororo")
  end

  test "should be valid" do
    assert @administrator.valid?
  end

  test "name should be present" do
    @administrator.name = "    "
    assert_not @administrator.valid?
  end

  test "email should be present" do
    @administrator.email = "     "
    assert_not @administrator.valid?
  end

  test "name should not be too long" do
    @administrator.name = "a" * 51
    assert_not @administrator.valid?
  end

  test "email should not be too long" do
    @administrator.email = "a" * 244 + "@example.com"
    assert_not @administrator.valid?
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @administrator.email = invalid_address
      assert_not @administrator.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email addresses should be unique" do
    duplicate_admin = @administrator.dup
    @administrator.save
    assert_not duplicate_admin.valid?
  end

  test "email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @administrator.email = mixed_case_email
    @administrator.save
    assert_equal mixed_case_email.downcase, @administrator.reload.email
  end

  test "password should be present (nonblank)" do
    @administrator.password = @administrator.password_confirmation = " " * 6
    assert_not @administrator.valid?
  end

  test "password should have a minimum length" do
    @administrator.password = @administrator.password_confirmation = "a" * 5
    assert_not @administrator.valid?
  end

  test "authenticated? should return false for an administrator with nil digest" do
    assert_not @administrator.authenticated?('')
  end
end
