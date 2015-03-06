require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "que el task no se guarde vacio" do
     task = Task.new
     assert !task.save
   end
   
   test "que el task no se guarde sin usuario" do
     task = Task.new
     task.name = 'Tarea1'
     assert_not task.save
   end
   
   test "que el task no se guarde sin nombre" do
     task = Task.new
     task.user_id = tasks(:one).user_id
     assert_not task.save
   end
end
