require 'test_helper'

class SessionsHelperTest < ActionView::TestCase

    def setup
      @administrator = administrators(:michael)
      remember(@administrator)
    end
  
    test "current_administrator returns right admin when session is nil" do
      assert_equal @administrator, current_administrator
      assert is_logged_in?
    end
  
    test "current_administrator returns nil when remember digest is wrong" do
      @administrator.update_attribute(:remember_digest, Administrator.digest(Administrator.new_token))
      assert_nil current_administrator
    end
  end