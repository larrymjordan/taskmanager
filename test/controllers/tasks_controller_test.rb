require 'test_helper'

class TasksControllerTest < ActionController::TestCase
  setup do
    @task = tasks(:two)
  end

  test "should get index" do
    sign_in users(:two)
    get :index
    assert_response :success
    assert_not_nil assigns(:tasks)
  end

  test "should be redirected to login if user is not logged in" do
    get :new
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should get new when user is logged in" do
    sign_in users(:one)
    get :new
    assert_response :success
  end

  test "shouldn't create task without login" do
    assert_no_difference('Task.count') do
      post :create, task: { name: @task.name, state: @task.state, user_id: @task.user_id }
    end

    assert_response :redirect
    assert_redirected_to new_user_session_path
  end



  test "should get new" do
    sign_in users(:one)
    get :new
    assert_response :success
  end

  test "should create task" do
    sign_in users(:two)
    assert_difference('Task.count') do
      post :create, task: { name: @task.name, state: @task.state, user_id: @task.user_id }
    end

    assert_redirected_to task_path(assigns(:task))
  end

  test "should show task" do
    sign_in users(:two)
    get :show, id: @task
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:two)
    get :edit, id: @task
    assert_response :success
  end

  test "should update task" do
    sign_in users(:two)
    patch :update, id: @task, task: { name: @task.name, state: @task.state, user_id: @task.user_id }
    assert_redirected_to task_path(assigns(:task))
  end

  test "should destroy task" do
    sign_in users(:two)
    assert_difference('Task.count', -1) do
      delete :destroy, id: @task
    end

    assert_redirected_to tasks_path
  end
end
