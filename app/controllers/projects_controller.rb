class ProjectsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @projects = Project.includes(:todos).all
    @todo = Todo.new

    respond_to do |format|
      format.html
      format.json do
        render :json => @projects.to_json(:include => { :todos => { :only => [:id, :text, :isCompleted] } })
      end
    end
  end

  def update
    @todo = Todo.find(params[:todo][:id])
    @todo.update(update_todo_params)
    respond_to do |format|
      format.html { render :text => "Ok" }
    end
  end

  def create
    @project_id = params[:todo][:project_id]
    @project = Project.find(@project_id)
    @project.todos.create(todo_params)
    respond_to do |format|
      format.html { render :text => "Ok" }
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:text,:isCompleted,project_attributes:[:id])
  end

  def update_todo_params
    params.require(:todo).permit(:id, :text, :isCompleted)
  end

end
