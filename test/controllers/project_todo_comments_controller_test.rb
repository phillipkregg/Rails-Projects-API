require 'test_helper'

class ProjectTodoCommentsControllerTest < ActionController::TestCase
  setup do
    @project_todo_comment = project_todo_comments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:project_todo_comments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project_todo_comment" do
    assert_difference('ProjectTodoComment.count') do
      post :create, project_todo_comment: { comment: @project_todo_comment.comment, project_todo_id: @project_todo_comment.project_todo_id }
    end

    assert_redirected_to project_todo_comment_path(assigns(:project_todo_comment))
  end

  test "should show project_todo_comment" do
    get :show, id: @project_todo_comment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @project_todo_comment
    assert_response :success
  end

  test "should update project_todo_comment" do
    patch :update, id: @project_todo_comment, project_todo_comment: { comment: @project_todo_comment.comment, project_todo_id: @project_todo_comment.project_todo_id }
    assert_redirected_to project_todo_comment_path(assigns(:project_todo_comment))
  end

  test "should destroy project_todo_comment" do
    assert_difference('ProjectTodoComment.count', -1) do
      delete :destroy, id: @project_todo_comment
    end

    assert_redirected_to project_todo_comments_path
  end
end
