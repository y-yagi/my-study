require 'test_helper'

class StudyDecoratorTest < ActiveSupport::TestCase
  def setup
    @study = Study.new.extend StudyDecorator
  end

  # test "the truth" do
  #   assert true
  # end
end
