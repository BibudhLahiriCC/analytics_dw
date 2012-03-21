class DaysSinceLastVisitsController < ApplicationController
  # GET /days_since_last_visits
  # GET /days_since_last_visits.json
  def index
    @days_since_last_visits = DaysSinceLastVisit.histogram
    #puts @days_since_last_visits.class
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @days_since_last_visits }
    end
  end

  # GET /days_since_last_visits/1
  # GET /days_since_last_visits/1.json
  def show
    @days_since_last_visit = DaysSinceLastVisit.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @days_since_last_visit }
    end
  end

  # GET /days_since_last_visits/new
  # GET /days_since_last_visits/new.json
  def new
    @days_since_last_visit = DaysSinceLastVisit.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @days_since_last_visit }
    end
  end

  # GET /days_since_last_visits/1/edit
  def edit
    @days_since_last_visit = DaysSinceLastVisit.find(params[:id])
  end

  # POST /days_since_last_visits
  # POST /days_since_last_visits.json
  def create
    @days_since_last_visit = DaysSinceLastVisit.new(params[:days_since_last_visit])

    respond_to do |format|
      if @days_since_last_visit.save
        format.html { redirect_to @days_since_last_visit, :notice => 'Days since last visit was successfully created.' }
        format.json { render :json => @days_since_last_visit, :status => :created, :location => @days_since_last_visit }
      else
        format.html { render :action => "new" }
        format.json { render :json => @days_since_last_visit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /days_since_last_visits/1
  # PUT /days_since_last_visits/1.json
  def update
    @days_since_last_visit = DaysSinceLastVisit.find(params[:id])

    respond_to do |format|
      if @days_since_last_visit.update_attributes(params[:days_since_last_visit])
        format.html { redirect_to @days_since_last_visit, :notice => 'Days since last visit was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @days_since_last_visit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /days_since_last_visits/1
  # DELETE /days_since_last_visits/1.json
  def destroy
    @days_since_last_visit = DaysSinceLastVisit.find(params[:id])
    @days_since_last_visit.destroy

    respond_to do |format|
      format.html { redirect_to days_since_last_visits_url }
      format.json { head :ok }
    end
  end
end
