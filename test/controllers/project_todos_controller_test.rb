require 'test_helper'

class ProjectTodosControllerTest < ActionController::TestCase
  setup do
    @project_todo = project_todos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:project_todos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project_todo" do
    assert_difference('ProjectTodo.count') do
      post :create, project_todo: { project_id: @project_todo.project_id, title: @project_todo.title }
    end

    assert_redirected_to project_todo_path(assigns(:project_todo))
  end

  test "should show project_todo" do
    get :show, id: @project_todo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @project_todo
    assert_response :success
  end

  test "should update project_todo" do
    patch :update, id: @project_todo, project_todo: { project_id: @project_todo.project_id, title: @project_todo.title }
    assert_redirected_to project_todo_path(assigns(:project_todo))
  end

  test "should destroy project_todo" do
    assert_difference('ProjectTodo.count', -1) do
      delete :destroy, id: @project_todo
    end

    assert_redirected_to project_todos_path
  end
end
