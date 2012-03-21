class DimPeopleController < ApplicationController
  # GET /dim_people
  # GET /dim_people.json
  def index
    @dim_people = DimPerson.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @dim_people }
    end
  end

  # GET /dim_people/1
  # GET /dim_people/1.json
  def show
    @dim_person = DimPerson.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @dim_person }
    end
  end

  # GET /dim_people/new
  # GET /dim_people/new.json
  def new
    @dim_person = DimPerson.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @dim_person }
    end
  end

  # GET /dim_people/1/edit
  def edit
    @dim_person = DimPerson.find(params[:id])
  end

  # POST /dim_people
  # POST /dim_people.json
  def create
    @dim_person = DimPerson.new(params[:dim_person])

    respond_to do |format|
      if @dim_person.save
        format.html { redirect_to @dim_person, :notice => 'Dim person was successfully created.' }
        format.json { render :json => @dim_person, :status => :created, :location => @dim_person }
      else
        format.html { render :action => "new" }
        format.json { render :json => @dim_person.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /dim_people/1
  # PUT /dim_people/1.json
  def update
    @dim_person = DimPerson.find(params[:id])

    respond_to do |format|
      if @dim_person.update_attributes(params[:dim_person])
        format.html { redirect_to @dim_person, :notice => 'Dim person was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @dim_person.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /dim_people/1
  # DELETE /dim_people/1.json
  def destroy
    @dim_person = DimPerson.find(params[:id])
    @dim_person.destroy

    respond_to do |format|
      format.html { redirect_to dim_people_url }
      format.json { head :ok }
    end
  end
end
