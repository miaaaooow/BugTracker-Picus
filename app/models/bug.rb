class Bug < ActiveRecord::Base
  belongs_to :version
  belongs_to :user
  has_many :records

  validates_presence_of :name, :description

  validates :priority_in_range

  def priority_in_range
    [1, 2, 3, 4, 5].include? :priority
  end
end
