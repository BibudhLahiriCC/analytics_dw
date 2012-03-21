class FctVisitsController < ApplicationController
  # GET /fct_visits
  # GET /fct_visits.json
  def index
    @fct_visits = FctVisit.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @fct_visits }
    end
  end

  # GET /fct_visits/1
  # GET /fct_visits/1.json
  def show
    @fct_visit = FctVisit.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @fct_visit }
    end
  end

  # GET /fct_visits/new
  # GET /fct_visits/new.json
  def new
    @fct_visit = FctVisit.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @fct_visit }
    end
  end

  # GET /fct_visits/1/edit
  def edit
    @fct_visit = FctVisit.find(params[:id])
  end

  # POST /fct_visits
  # POST /fct_visits.json
  def create
    @fct_visit = FctVisit.new(params[:fct_visit])

    respond_to do |format|
      if @fct_visit.save
        format.html { redirect_to @fct_visit, :notice => 'Fct visit was successfully created.' }
        format.json { render :json => @fct_visit, :status => :created, :location => @fct_visit }
      else
        format.html { render :action => "new" }
        format.json { render :json => @fct_visit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /fct_visits/1
  # PUT /fct_visits/1.json
  def update
    @fct_visit = FctVisit.find(params[:id])

    respond_to do |format|
      if @fct_visit.update_attributes(params[:fct_visit])
        format.html { redirect_to @fct_visit, :notice => 'Fct visit was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @fct_visit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /fct_visits/1
  # DELETE /fct_visits/1.json
  def destroy
    @fct_visit = FctVisit.find(params[:id])
    @fct_visit.destroy

    respond_to do |format|
      format.html { redirect_to fct_visits_url }
      format.json { head :ok }
    end
  end
end
