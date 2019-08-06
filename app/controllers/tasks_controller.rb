class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params) # uses strong params
    if @task.save
      redirect_to task_path(@task)
    else
      render 'tasks/new'
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
   @task = Task.find(params[:id])
    if @task.completed == true
      redirect_to tasks_path
    else
      @task.update(task_params)
      redirect_to task_path(@task)
  end
end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end


private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

end
