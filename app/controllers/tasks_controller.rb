class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    
    task = Task.new{ 
      name: params["task"]["name"], 
      description: params["task"]["description"],
      completion_date: params["task"]["completion_date"]
    }

    task.save

    redirect_to tasks_path
  end

  def show
    task_id = params[:id]
    @task = Task.find_by(id:task_id)
    unless @task
        head :not_found
    end
  end

end