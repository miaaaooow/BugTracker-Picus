class Bug < ActiveRecord::Base
  belongs_to :version
  belongs_to :status
  has_one :user
  has_and_belongs_to_many :users
  has_many :records

  validates_presence_of :name, :description, :priority, :status
  validates_uniqueness_of :name
  validates :priority_in_range

  #change this.
  def priority_in_range
    [1, 2, 3, 4, 5].include? :priority
  end
end
