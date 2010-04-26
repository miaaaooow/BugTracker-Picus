# == Schema Information
# Schema version: 20100425094924
#
# Table name: projects
#
#  id          :integer         not null, primary key
#  name        :string(255)     not null
#  description :text
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Project < ActiveRecord::Base
  has_many :versions
  belongs_to :user
  
  validates_presence_of :name
  validates_uniqueness_of :name
end
