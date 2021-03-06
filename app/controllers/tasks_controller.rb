class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_param)
    @task.save
    # Will raise ActiveModel::ForbiddenAttributesError
    # redirect_to tasks_path
  end

  private

  def task_param
    params.require(:task).permit(:title, :rating)
  end
end
