# == Schema Information
# Schema version: 20100425094924
#
# Table name: statuses
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Status < ActiveRecord::Base
  has_many :bugs
end
