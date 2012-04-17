class DaysSinceLastVisitsController < ApplicationController
  # GET /days_since_last_visits
  # GET /days_since_last_visits.json
  def index
    @days_since_last_visits = DaysSinceLastVisit.histogram(
                                params[:gender],
                                params[:age_group])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @days_since_last_visits }
    end
    #render :partial => "days_snc_lst_vst"
  end

  def load_f_n_t
    @f_n_t = DaysSinceLastVisit.f_n_t("2008-12-17", "2010-03-27", 100, 30)
    @f_n_t.to_json
  end
end
