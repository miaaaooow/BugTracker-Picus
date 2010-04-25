require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "password non empty" do
    ivan = User.new (:username => "i386", :email => "ivan@gmail.com", :password => "")
    assert !ivan.valid?
  end
end
