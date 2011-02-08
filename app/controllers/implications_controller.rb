class ImplicationsController < ApplicationController
  # GET /implications
  # GET /implications.xml
  def index
    @implications = Implication.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @implications }
    end
  end

  # GET /implications/1
  # GET /implications/1.xml
  def show
    @implication = Implication.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @implication }
    end
  end

  # GET /implications/new
  # GET /implications/new.xml
  def new
    @implication = Implication.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @implication }
    end
  end

  # GET /implications/1/edit
  def edit
    @implication = Implication.find(params[:id])
  end

  # POST /implications
  # POST /implications.xml
  def create
    @implication = Implication.new(params[:implication])

    respond_to do |format|
      if @implication.save
        format.html { redirect_to(@implication, :notice => 'Implication was successfully created.') }
        format.xml  { render :xml => @implication, :status => :created, :location => @implication }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @implication.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /implications/1
  # PUT /implications/1.xml
  def update
    @implication = Implication.find(params[:id])

    respond_to do |format|
      if @implication.update_attributes(params[:implication])
        format.html { redirect_to(@implication, :notice => 'Implication was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @implication.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /implications/1
  # DELETE /implications/1.xml
  def destroy
    @implication = Implication.find(params[:id])
    @implication.destroy

    respond_to do |format|
      format.html { redirect_to(implications_url) }
      format.xml  { head :ok }
    end
  end
end
