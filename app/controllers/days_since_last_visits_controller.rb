class DaysSinceLastVisitsController < ApplicationController
  # GET /days_since_last_visits
  # GET /days_since_last_visits.json
  def index
    @days_since_last_visits = DaysSinceLastVisit.histogram params[:gender]

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @days_since_last_visits }
    end
  end
end
