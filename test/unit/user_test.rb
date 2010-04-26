require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "password non empty" do
    ivan = User.new(:username => "i386", :email => "ivan@gmail.com", :password => "")
    assert !ivan.valid?
  end

  test "authentication" do
    salt = User.create_salt
    epass = User.encrypt_password('buzzinga', salt)
    puts m = User.new({:username => 'sheldon',:encrypted_password => epass, :email => 'sheldon@mit.edu', :salt => salt} ) 
    puts m.save
    puts User.find_by_username(m.username)
    assert User.authenticate('sheldon', 'buzzinga')
  end
end
