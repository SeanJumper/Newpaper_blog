require 'test_helper'
require "minitest/autorun"
#assert(test, msg = nil)
#Fails unless test is a true value.

class UserTest < Minitest::Test


  def test_user
    @user = User.new
    refute(@user.save, msg = 'you saved an empty user')
  end

  def test_duplicate
    @user = User.new(email: "offset@testing.com",password:"123456789")
    @user2 = User.new(email: "offset@testing.com",password:"123456789")
    refute(@user2.valid?, msg ='you created a user witha  duplicate email')
  end

  def test_sign_in
  
  end

    
end
