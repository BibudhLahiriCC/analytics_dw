class PlotsController < ApplicationController
  # GET /plots
  # GET /plots.xml
  def index
    @plots = Plot.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @plots }
    end
  end

  # GET /plots/1
  # GET /plots/1.xml
  def show
    @plot = Plot.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @plot }
    end
  end

  # GET /plots/new
  # GET /plots/new.xml
  def new
    @plot = Plot.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @plot }
    end
  end

  # GET /plots/1/edit
  def edit
    @plot = Plot.find(params[:id])
  end

  # POST /plots
  # POST /plots.xml
  def create
    @plot = Plot.new(params[:plot])

    respond_to do |format|
      if @plot.save
        format.html { redirect_to(@plot, :notice => 'Plot was successfully created.') }
        format.xml  { render :xml => @plot, :status => :created, :location => @plot }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @plot.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /plots/1
  # PUT /plots/1.xml
  def update
    @plot = Plot.find(params[:id])

    respond_to do |format|
      if @plot.update_attributes(params[:plot])
        format.html { redirect_to(@plot, :notice => 'Plot was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @plot.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /plots/1
  # DELETE /plots/1.xml
  def destroy
    @plot = Plot.find(params[:id])
    @plot.destroy

    respond_to do |format|
      format.html { redirect_to(plots_url) }
      format.xml  { head :ok }
    end
  end
end
