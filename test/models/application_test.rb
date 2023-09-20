require 'test_helper'

class ApplicationTest < ActiveSupport::TestCase
  fixtures :applications, :jobs

  def setup
    @application = applications(:one)
  end

  test "belongs to job" do
    job = jobs(:one)

    assert_equal @application.job, job
  end

  test "may have many attached files" do
    assert_not_nil @application.files
  end

  test "should have a default status of 'draft'" do
    assert_equal 'draft', @application.status
  end

  test "should allow valid status values" do
    valid_statuses = ['draft', 'submitted', 'screening', 'passed', 'rejected', 'cancelled']

    valid_statuses.each do |status|
      @application.status = status
      assert @application.valid?, "#{status} should be a valid status"
    end
  end
end
