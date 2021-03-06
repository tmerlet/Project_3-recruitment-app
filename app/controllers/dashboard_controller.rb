class DashboardController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
  end

  def get_current_user_type
    currentusertype = current_user.type

    respond_to do |format|
      format.html { render json: currentusertype }
      format.json { render json: currentusertype }
    end
  end


  def get_current_contractor
    currentuser = current_user

    respond_to do |format|
      format.html { render json: currentuser.to_json(include: :address) }
      format.json { render json: currentuser.to_json(include: :address) }
    end
  end

  def get_current_employee
    currentuser = current_user

    respond_to do |format|
      format.html { render json: currentuser.to_json(include: :company) }
      format.json { render json: currentuser.to_json(include: :company) }
    end
  end

  def get_current_company_jobs
    currentuser = current_user
    companyid = currentuser.company.id

    companyjobs = Job.where(company_id: companyid)
    
    respond_to do |format|
      format.html { render json: companyjobs.to_json(include: [:address, :jobsearches, :qualifications]) }
      format.json { render json: companyjobs.to_json(include: [:address, :jobsearches, :qualifications]) }
    end
  end

  def get_potential_contractors

    potentialcontractors = Contractor.where(available_now: true)

    potentialcontractors.each do |contractor|
      jobsearch = Jobsearch.where(contractor_id: contractor.id, job_id: params[:job_id]).first_or_create
    end
      
    respond_to do |format|
      format.html { render json: potentialcontractors.to_json(include: [:address, :jobsearches, :qualifications]) }
      format.json { render json: potentialcontractors.to_json(include: [:address, :jobsearches, :qualifications]) }
    end
  end

  def update_available_now

      contractor = Contractor.find(params[:id])
      contractor.available_now == true ? (contractor.available_now = false) : (contractor.available_now = true)
      contractor.save

    respond_to do |format|
      format.html { render json: contractor }
      format.json { render json: contractor }
    end
  end

  def update_distance_travel

      contractor = Contractor.find(params[:id])
      contractor.distance_travel = params[:distance_travel]
      contractor.save

    respond_to do |format|
      format.html { render json: contractor }
      format.json { render json: contractor }
    end
  end

  def show_job_interest

    jobsearch = Jobsearch.where(contractor_id: params[:contractor_id], job_id: params[:job_id]).first_or_create

    jobsearch.interested ? (jobsearch.interested = false) : (jobsearch.interested = true)
    jobsearch.save

    respond_to do |format|
      format.html { render json: jobsearch }
      format.json { render json: jobsearch }
    end
  end

  def contact_user

    jobsearch = Jobsearch.where(contractor_id: params[:contractor_id], job_id: params[:job_id]).first_or_create


    jobsearch.contacted ? (jobsearch.contacted = false) : (jobsearch.contacted = true)
    jobsearch.save

    respond_to do |format|
      format.html { render json: jobsearch }
      format.json { render json: jobsearch }
    end
  end

  def offer_user

    jobsearch = Jobsearch.where(contractor_id: params[:contractor_id], job_id: params[:job_id]).first_or_create
    
    jobsearch.offered ? (jobsearch.offered = false) : (jobsearch.offered = true)
    jobsearch.save

    respond_to do |format|
      format.html { render json: jobsearch }
      format.json { render json: jobsearch }
    end
  end

  def accept_user

    jobsearch = Jobsearch.where(contractor_id: params[:contractor_id], job_id: params[:job_id]).first_or_create
    
    jobsearch.accepted ? (jobsearch.accepted = false) : (jobsearch.accepted = true)
    jobsearch.save

    respond_to do |format|
      format.html { render json: jobsearch }
      format.json { render json: jobsearch }
    end
  end

  def reject_user

    jobsearch = Jobsearch.where(contractor_id: params[:contractor_id], job_id: params[:job_id]).first_or_create
    
    jobsearch.rejected ? (jobsearch.rejected = false) : (jobsearch.rejected = true)
    jobsearch.save

    respond_to do |format|
      format.html { render json: jobsearch }
      format.json { render json: jobsearch }
    end
  end

# start of code to update to the current location of the user...  

  # def set_current_location

  #   user = Contractor.find(params[:contractor_id])
  #   currentlatitude = request.location.latitude
  #   currentlongitude = request.location.longitude 

  #   user.address.current_latitude = currentlatitude
  #   user.address.current_longitude = currentlongitude
       
  #   user.save 

  #   respond_to do |format|
  #     format.html { render json: user }
  #     format.json { render json: user }
  #   end
  # end
  
end
