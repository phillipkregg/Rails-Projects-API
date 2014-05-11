class ProjectTodoCommentsController < ApplicationController
  before_action :set_project_todo_comment, only: [:show, :edit, :update, :destroy]
  
  before_filter :load_project
  before_filter :load_todo

  # GET /project_todo_comments
  # GET /project_todo_comments.json
  def index
    @project_todo_comments = @project_todo.project_todo_comments.all
  end

  # GET /project_todo_comments/1
  # GET /project_todo_comments/1.json
  def show
    @project_todo_comment = @project_todo.project_todo_comments.find(params[:id])
  end

  # GET /project_todo_comments/new
  def new
    @project_todo_comment = @project_todo.project_todo_comments.new
  end

  # GET /project_todo_comments/1/edit
  def edit
    @project_todo_comment = @project_todo.project_todo_comments.find(params[:id])
  end

  # POST /project_todo_comments
  # POST /project_todo_comments.json
  def create
    @project_todo_comment = @project_todo.project_todo_comments.new(params[:project_todo_comment])

    respond_to do |format|
      if @project_todo_comment.save
        format.html { redirect_to [@project, @project_todo, @project_todo_comment], :notice => 'Project todo comment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @project_todo_comment }
      else
        format.html { render action: 'new' }
        format.json { render json: @project_todo_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_todo_comments/1
  # PATCH/PUT /project_todo_comments/1.json
  def update
    @project_todo_comment = @project_todo.project_todo_comments.find(params[:id])
    respond_to do |format|
      if @project_todo_comment.update_attributes(params[:project_todo_comment])
        format.html { redirect_to [@project, @project_todo, @project_todo_comment], notice: 'Project todo comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @project_todo_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_todo_comments/1
  # DELETE /project_todo_comments/1.json
  def destroy
    @project_todo_comment = @project_todo.project_todo_comments.find(params[:id])
    @project_todo_comment.destroy
    respond_to do |format|
      format.html { redirect_to project_project_todo_project_todo_comments_url }
      format.json { head :no_content }
    end
  end

  private
  
    def load_project
      @project = Project.find(params[:project_id])
    end
  
    def load_todo
      @project_todo = ProjectTodo.find(params[:project_todo_id])
    end
  
  
    # Use callbacks to share common setup or constraints between actions.
    def set_project_todo_comment
      @project_todo_comment = ProjectTodoComment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_todo_comment_params
      params.require(:project_todo_comment).permit(:comment, :project_todo_id)
    end
end
