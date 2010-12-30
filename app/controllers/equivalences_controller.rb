class EquivalencesController < ApplicationController
  # GET /equivalences
  # GET /equivalences.xml
  def index
    @equivalences = Equivalence.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @equivalences }
    end
  end

  # GET /equivalences/1
  # GET /equivalences/1.xml
  def show
    @equivalence = Equivalence.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @equivalence }
    end
  end

  # GET /equivalences/new
  # GET /equivalences/new.xml
  def new
    @equivalence = Equivalence.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @equivalence }
    end
  end

  # GET /equivalences/1/edit
  def edit
    @equivalence = Equivalence.find(params[:id])
  end

  # POST /equivalences
  # POST /equivalences.xml
  def create
    @equivalence = Equivalence.new(params[:equivalence])

    respond_to do |format|
      if @equivalence.save
        
        format.html { redirect_to(@equivalence, :notice => 'Equivalence was successfully created.') }
        format.xml  { render :xml => @equivalence, :status => :created, :location => @equivalence }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @equivalence.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /equivalences/1
  # PUT /equivalences/1.xml
  def update
    @equivalence = Equivalence.find(params[:id])

    respond_to do |format|
      if @equivalence.update_attributes(params[:equivalence])
        format.html { redirect_to(@equivalence, :notice => 'Equivalence was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @equivalence.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /equivalences/1
  # DELETE /equivalences/1.xml
  def destroy
    @equivalence = Equivalence.find(params[:id])
    @equivalence.destroy

    respond_to do |format|
      format.html { redirect_to(equivalences_url) }
      format.xml  { head :ok }
    end
  end
end
