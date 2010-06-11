require 'test_helper'

class ProjectTest < ActiveSupport::TestCase

  test "missing properties" do
    project = Project.new
    assert !project.valid?
    assert project.errors.invalid?(:name)
    assert project.errors.invalid?(:user_id)
  end

end
