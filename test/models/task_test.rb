require 'test_helper'

class TaskTest < ActiveSupport::TestCase

  test "can not save with empty attributes" do
     task = Task.new
     assert !task.save
   end

   test "can not save without an user" do
     task = Task.new
     task.name = 'Tarea1'
     assert_not task.save
   end

   test "can not save without a name" do
     task = Task.new
     task.user_id = tasks(:one).user_id
     assert_not task.save
   end
end
