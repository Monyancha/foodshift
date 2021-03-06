class DonationsController < ApplicationController
  before_action :set_donation, only: [:show, :edit, :update, :destroy]

  # GET /donate
  def new
    gon.isSignedInOnLoad = !current_user.nil?
    if !current_user.nil? && current_user.type != User.type_donor
      redirect_to root_path, alert: "Set up a donor account in order to make a donation."
    else
      @user = current_user
      if !@user.nil?
        @profile = DonorProfile.find_by(donor_id: current_user.id)
      end
    end
  end

  # POST /donate
  def create
    donation_form = DonationForm.new(donation_params)
    donation_form.donor = current_user.id
    respond_to do |format|
      if donation_form.create_objects
        @donation = donation_form.donation
        @recipient_ids = Recipient.where(subscribed: true).pluck(:id)
        UserMailer.donation_available(@recipient_ids, @donation).deliver
        @coordinator_ids = Coordinator.pluck(:id)
        UserMailer.coordinator_email(@coordinator_ids, @donation).deliver
        format.html { redirect_to root_path, notice: "Donation was successfully created." }
        format.json { render json: {}, status: :created }
      else
        format.html { redirect_to root_path, alert: "Donation failed because of unsupported file type." }
        format.json { render json: {}, status: :unprocessable_entity }
      end
    end
  end

  # GET /donation/cancel
  def cancel
    donation = Donation.find_by id: params[:format]
    donation.update_attributes status: Donation.type_canceled
    redirect_to donor_profile_path
  end

  private

  def donation_params
    params.require(:donation).permit(
      :address,
      :latitude,
      :longitude,
      :date,
      :start_time,
      :end_time,
      :person,
      :organization,
      :email,
      :phone,
      :refrigeration,
      :additional_info,
      :description,
      :picture,
      :can_dropoff
    )
  end
end
