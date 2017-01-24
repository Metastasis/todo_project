class ProjectsController < ApplicationController
  def index
    @projects = Project.all
    @todo = Todo.new
  end

  def update
    @todo = Todo.find(params[:todo][:id])
    @todo.update(update_todo_params)
    redirect_to :back
  end

  def create
    @project_id = params[:todo][:project_id]
    @project = Project.find(@project_id)
    @project.todos.create(todo_params)
    redirect_to :back
  end

  private

  def todo_params
    params.require(:todo).permit(:text,:isCompleted,project_attributes:[:id])
  end

  def update_todo_params
    params.require(:todo).permit(:id, :text, :isCompleted)
  end

end
