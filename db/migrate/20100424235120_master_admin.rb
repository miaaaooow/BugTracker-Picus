class MasterAdmin < ActiveRecord::Migration
  def self.up
    salt =  User.create_salt
    epass = User.encrypt_password("masterpassword", salt)
    User.create({:username => "master",
                :name => "Master Administrator",
                :email => "mateva.maria@gmail.com",
                :encrypted_password => epass,
                :salt => salt,
                :admin => true})
  end

  def self.down
    User.destroy(['username = ?', "master"])
  end
end
