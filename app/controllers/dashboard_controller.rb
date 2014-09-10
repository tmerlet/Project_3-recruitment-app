class DashboardController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
  end

  def get_current_user
    currentuser = current_user

    respond_to do |format|
      format.html { render json: currentuser }
      format.json { render json: currentuser }
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
  
end
