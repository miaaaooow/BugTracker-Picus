require 'test_helper'

class BugTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "valid priority number" do
    spider = Bug.new
    assert !spider.valid?

    spider = Bug.new(:name => "bug123", :description => "some issue", :priority => -1, :status => Status.new(:name => "OPEN"))
    assert !spider.valid?
    assert_equal "Priority out of range", spider.errors.on(:priority)
    spider = Bug.new(:name => "bug12", :description => "some issue", :priority => 0, :status => Status.new(:name => "REJECTED"))
    assert !spider.valid?
    assert_equal "Priority out of range", spider.errors.on(:priority)
    spider = Bug.new(:name => "bug134", :description => "some issue", :priority => 2.5, :status => Status.new(:name =>  "OPEN"))
    assert !spider.valid?
    assert_equal "Priority out of range", spider.errors.on(:priority)
    spider = Bug.new(:name => "bug125", :description => "some issue", :priority => 6, :status => Status.new(:name => "OPEN"))
    assert !spider.valid?
    assert_equal "Priority out of range", spider.errors.on(:priority)

    spider = Bug.new(:name => "bug12", :description => "some issue", :priority => 5, :status => Status.new(:name => "OPEN"))
    assert spider.valid?
    spider = Bug.new(:name => "bug12", :description => "some issue", :priority => 1, :status => Status.new(:name => "WORKS HERE"))
    assert spider.valid?
  end

  test "valid status string" do
    ladybird = Bug.new(:name => "some", :description => "some issue", :priority => 3, :status => Status.new(:name => "OPEN"))
    assert ladybird.valid?
    ladybird = Bug.new(:name => "some", :description => "some issue", :priority => 3, :status => Status.new(:name => "REJECTED"))
    assert ladybird.valid?
    ladybird = Bug.new(:name => "some", :description => "some issue", :priority => 3, :status => Status.new(:name =>  "NEW"))
    assert ladybird.valid?
    ladybird = Bug.new(:name => "some", :description => "some issue", :priority => 3, :status =>  Status.new(:name => "REOPEN"))
    assert ladybird.valid?
    ladybird = Bug.new(:name => "some", :description => "some issue", :priority => 3, :status =>  Status.new(:name => "WORKS HERE"))
    assert ladybird.valid?
    ladybird = Bug.new(:name => "some", :description => "some issue", :priority => 3, :status =>  Status.new(:name => "DISASTER"))
    assert ladybird.valid?
    ladybird = Bug.new(:name => "some", :description => "some issue", :priority => 3, :status =>  Status.new(:name => "CLOSED"))
    assert ladybird.valid?
     
    ladybird = Bug.new(:name => "some", :description => "some issue", :priority => 3, :status =>  Status.new(:name => "closed"))
    assert !ladybird.valid?
    ladybird = Bug.new(:name => "some", :description => "some issue", :priority => 3, :status =>  Status.new(:name => "buzzword"))
    assert !ladybird.valid?
    ladybird = Bug.new(:name => "some", :description => "some issue", :priority => 3, :status =>  Status.new(:name => "New"))
    assert !ladybird.valid?
    ladybird = Bug.new(:name => "some", :description => "some issue", :priority => 3, :status =>  Status.new(:name => 1))
    assert !ladybird.valid?

  end
end
