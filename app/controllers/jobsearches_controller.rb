class JobsearchesController < ApplicationController
  before_filter :authenticate_user!
  # GET /jobsearches
  # GET /jobsearches.json
  def index
    @jobsearches = Jobsearch.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @jobsearches }
    end
  end

  # GET /jobsearches/1
  # GET /jobsearches/1.json
  def show
    @jobsearch = Jobsearch.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @jobsearch }
    end
  end

  # GET /jobsearches/new
  # GET /jobsearches/new.json
  def new
    @jobsearch = Jobsearch.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @jobsearch }
    end
  end

  # GET /jobsearches/1/edit
  def edit
    @jobsearch = Jobsearch.find(params[:id])
  end

  # POST /jobsearches
  # POST /jobsearches.json
  def create
    @jobsearch = Jobsearch.new(params[:jobsearch])

    respond_to do |format|
      if @jobsearch.save
        format.html { redirect_to @jobsearch, notice: 'Jobsearch was successfully created.' }
        format.json { render json: @jobsearch, status: :created, location: @jobsearch }
      else
        format.html { render action: "new" }
        format.json { render json: @jobsearch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /jobsearches/1
  # PUT /jobsearches/1.json
  def update
    @jobsearch = Jobsearch.find(params[:id])

    respond_to do |format|
      if @jobsearch.update_attributes(params[:jobsearch])
        format.html { redirect_to @jobsearch, notice: 'Jobsearch was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @jobsearch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobsearches/1
  # DELETE /jobsearches/1.json
  def destroy
    @jobsearch = Jobsearch.find(params[:id])
    @jobsearch.destroy

    respond_to do |format|
      format.html { redirect_to jobsearches_url }
      format.json { head :no_content }
    end
  end
end
