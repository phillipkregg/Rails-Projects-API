class ProjectTodosController < ApplicationController
  before_action :set_project_todo, only: [:show, :edit, :update, :destroy]
  
  before_filter :load_project
  
   respond_to :html, :xml, :json

  # GET /project_todos
  # GET /project_todos.json
  def index
    @project_todos = @project.project_todos.all
    
    #render :json => @project_todos
    
  end

  # GET /project_todos/1
  # GET /project_todos/1.json
  def show
    @project_todo = @project.project_todos.find(params[:id])
  end

  # GET /project_todos/new
  def new
    @project_todo = @project.project_todos.new
  end

  # GET /project_todos/1/edit
  def edit
    @project_todo = @project.project_todos.find(params[:id])
  end

  # POST /project_todos
  # POST /project_todos.json
  def create
    @project_todo = @project.project_todos.new(params[:project_todo])

    respond_to do |format|
      if @project_todo.save
        format.html { redirect_to [@project, @project_todo], :notice => 'Project todo was successfully created.' }
        format.json { render action: 'show', status: :created, location: @project_todo }
      else
        format.html { render action: 'new' }
        format.json { render json: @project_todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_todos/1
  # PATCH/PUT /project_todos/1.json
  def update
    @project_todo = @project.project_todos.find(params[:id])
    respond_to do |format|
      if @project_todo.update_attributes(params[:project_todo])
        format.html { redirect_to [@project, @project_todo], notice: 'Project todo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @project_todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_todos/1
  # DELETE /project_todos/1.json
  def destroy
    @project_todo = @project.project_todos.find(params[:id])
    @project_todo.destroy
    respond_to do |format|
      format.html { redirect_to project_project_todos_url}
      format.json { head :no_content }
    end
  end

  private
    
    def load_project
      @project = Project.find(params[:project_id])
    end
      
    # Use callbacks to share common setup or constraints between actions.
    def set_project_todo
      @project_todo = ProjectTodo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_todo_params
      params.require(:project_todo).permit(:title, :project_id)
    end
end
