class CalendarController < ApplicationController
  
  def show
    @user=User.find(params[:id])
    events=Array.new
    @user.tasks.each do |task|
      event=Hash.new
      event[:title] = task.title
      event[:start] = task.due_at
      events << event
    end
  render :json => events
  end

end
