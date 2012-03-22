class DaysSinceLastVisitsController < ApplicationController
  # GET /days_since_last_visits
  # GET /days_since_last_visits.json
  def index
    puts "gender = " + params[:gender]
    @days_since_last_visits = DaysSinceLastVisit.histogram params[:gender]
    #puts @days_since_last_visits.class
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @days_since_last_visits }
    end
  end
end
