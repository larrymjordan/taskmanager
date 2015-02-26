require 'test_helper'

class TaskTest < ActiveSupport::TestCase

  test "requires user_id not to be blank" do
    t = Task.new(name: 'Another simple task')
    assert_not t.save
    assert_equal t.errors.messages[:user_id].first, "can't be blank"
  end
end
