class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @task = current_user.tasks.build
      @tasks = current_user.tasks.paginate(page: params[:page])
    end
  end

  def help
  end

  def about
  end
  
  def contact
  end
end
