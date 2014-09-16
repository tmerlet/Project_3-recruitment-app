class JobsController < ApplicationController
  # GET /jobs
  # GET /jobs.json
  def index
    @jobs = Job.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @jobs.to_json(include: [:address, :jobsearches]) }
    end
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
    @job = Job.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @job }
    end
  end

  # GET /jobs/new
  # GET /jobs/new.json
  def new
    
    @job = Job.new
    @job.build_address

    

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @job }
    end
  end

  # GET /jobs/1/edit
  def edit
    @job = Job.find(params[:id])
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @job = Job.new(params[:job])
    @job.company_id = current_user.company_id
    
    # @job.address = Address.new(params[:address])
    

    respond_to do |format|
      if @job.save
        if params["qualifications"]
          params["qualifications"].each do |id| 
            qualification = Qualification.find(id.to_i)
            @job.qualifications << qualification
          end
        end
        @job.save
        # @job.address.save
        format.html { redirect_to root_path, notice: 'Job was successfully created.' }
        format.json { render json: @job, status: :created, location: @job }
      else
        format.html { render action: "new" }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /jobs/1
  # PUT /jobs/1.json
  def update
    @job = Job.find(params[:id])

    respond_to do |format|
      if @job.update_attributes(params[:job]) || @job.update_attributes(params[:qualifications])
        @job.qualifications = []
        #reassigning qualification
        if params["qualifications"]
          params["qualifications"].each do |id| 
            qualification = Qualification.find(id.to_i)
            @job.qualifications << qualification
          end
        end
        @job.save
        format.html { redirect_to root_path, notice: 'Job was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job = Job.find(params[:id])
    @job.destroy

    respond_to do |format|
      format.html { redirect_to jobs_url }
      format.json { head :no_content }
    end
  end
end
