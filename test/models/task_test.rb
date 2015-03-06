require 'test_helper'

class TaskTest < ActiveSupport::TestCase

  test "que el task no se guarde vacio" do
    task = Task.new
    assert !task.save
  end

  test "El nombre de la task debe ser minimo de 6 letras" do
    task = Task.new
    task.name = 'short'
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
