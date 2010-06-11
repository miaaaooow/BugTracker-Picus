require 'digest/sha1'

class User < ActiveRecord::Base
  has_many :bugs
  has_and_belongs_to_many :bugs
  has_many :records
  has_many :projects
  has_many :versions

  validates_presence_of :username, :password, :password_confirmation, :email
  validates_uniqueness_of :username, :email

  validate :email_correct 
  
  validates_confirmation_of :password
  validate :password_non_blank

  #virtual attribute
  def password
    @password
  end

  def password=(pwd)
    @password = pwd
    return if pwd.empty?
    self.salt = create_salt
    self.encrypted_password = encrypt_password(pwd, salt)
    self.name = choose_system_name
  end
  
  def choose_system_name
    #This is the case in which a user didn't enter a specific name to be called
    if self.name.empty? && !self.username.empty? 
      self.username 
    elsif self.name.empty?
      self.name.downcase.gsub(/\b\w/) {|first| first.upcase}
    else
      nil
    end
  end

  def self.authenticate(username, pass) 
    candidate = User.find_by_username(username)
    if candidate && candidate.encrypted_password == encrypt_password(pass, candidate.salt)
      candidate
    else
      nil
    end
  end

  def self.create_salt
    salt = ""
    3.times{salt += rand.to_s}
    salt
  end

  def self.encrypt_password(password, salt) 
    Digest::SHA1.hexdigest(salt + password + salt)
  end

private
  def email_correct
    errors.add(:email, "Invalid email format") if :email !~ /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/
  end

  def password_non_blank
    errors.add(:password, "Empty password") if self.encrypted_password.nil? or self.encrypted_password.empty?
  end
end


