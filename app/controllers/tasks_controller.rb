class TasksController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      flash[:success] = "タスクが保存されました"
      redirect_to root_url
    else
      @tasks = []
      render 'static_pages/home'
    end
  end

  def destroy
    @task.destroy
    flash[:success] = "タスクが削除されました"
    redirect_to request.referrer || root_url
  end
  
  def show
    @task = current_user.tasks.find(params[:id])
  end
  
  def update
     @task = current_user.tasks.find(params[:id])
    if @task.save
      flash[:success] = "タスクの変更が保存されました"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  private

    def task_params
      params.require(:task).permit(:title)
    end
    
    def correct_user
      @task = current_user.tasks.find_by(id: params[:id])
      redirect_to root_url if @task.nil?
    end
end
