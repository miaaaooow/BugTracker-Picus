class User < ActiveRecord::Base
  validates_presence_of :name, :username, :password, :email
  validates_uniqueness_of :username, :email

  validate :email_validate

  def email_validate
  end
end
