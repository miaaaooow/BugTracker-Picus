# == Schema Information
# Schema version: 20100425094924
#
# Table name: versions
#
#  id         :integer         not null, primary key
#  name       :string(255)     not null
#  user_id    :integer
#  project_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class Version < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  has_many :bugs

  validates_presence_of :name
end
