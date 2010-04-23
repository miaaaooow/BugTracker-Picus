class User < ActiveRecord::Base
  has_many :bugs
  has_and_belongs_to_many :bugs
  has_many :records
  has_many :projects
  has_many :versions

  validates_presence_of :username, :password, :email
  validates_uniqueness_of :username, :email

  validates_format_of :email, 
        :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/

end
