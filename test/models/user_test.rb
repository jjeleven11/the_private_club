require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
      @user = User.new(first_name: "Example User", last_name: "Example User 2", email: "user@example.com", password: "beaugoss")
    end

    ########################### test#####################
    test "should be valid" do
        assert @user.valid?
      end
      test "first_name should be present" do
      @user.first_name = ""
      assert_not @user.valid?
    end
      test "last_name should be present" do
      @user.last_name = ""
      assert_not @user.valid?
    end

      test "last_name space " do
      @user.last_name = "     "
      assert_not @user.valid?
    end
    test "email should be present" do
     @user.email = "     "
     assert_not @user.valid?
   end
end
