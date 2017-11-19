require "test_helper"

class StudyTest < ActiveSupport::TestCase
  test "should have hour or time" do
    study = Study.new(user: users(:google), theme: themes(:go))
    assert_not study.valid?
    assert_equal %w(学習時間を入力してください), study.errors[:base]
  end
end
