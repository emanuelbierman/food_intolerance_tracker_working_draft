class ApplicationController < ActionController::Base

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def current_day(user_id)
    month_day_year = Time.now.strftime("%m-%d-%y")
    Day.find_or_create_by(month_day_year: month_day_year, user_id: user_id)
  end
end
