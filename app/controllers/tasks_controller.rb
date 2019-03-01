class TasksController < ApplicationController
  before_action :set_list
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  
  def index
    @tasks = Task.all_tasks(@list.id)
  end

  def show
  end

  def new
    @task = @list.tasks.new
    render "form"
  end

  def create
    @task = @list.tasks.new(task_params)
    if @task.save
      redirect_to list_tasks_path
    else
      render "form"
    end
  end

  def edit
    render "form"
  end

  def update
    if @task.update(task_params)
      redirect_to list_tasks_path
    else
      render "form"
    end
  end

  def destroy
    @task.destroy
    redirect_to list_tasks_path
  end

  private
  def task_params
    params.require(:task).permit(:name, :priority, :description, :list_id)
  end

  def set_task
    @task = Task.find_task(params[:id], @list.id)
  end

  def set_list
    @list = List.find(params[:list_id])
  end

end
