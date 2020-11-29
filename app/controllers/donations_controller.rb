class DonationsController < ApplicationController
  before_action :set_donation, only: [:show, :edit, :update, :destroy]

  # GET /donations
  # GET /donations.json
  def index
    @donations = Donation.where(user: current_user).order(date: :desc)

    if params[:year] && params[:year] =~ /\A\d+\z/
      start_of_year = Date.new(params[:year].to_i)
      end_of_year = start_of_year.end_of_year
      @donations = @donations.where(date: start_of_year..end_of_year)
    else
      params.delete(:year)
    end
  end

  # GET /donations/1
  # GET /donations/1.json
  def show
  end

  # GET /donations/new
  def new
    @donation = Donation.new(date: Date.today)
  end

  # GET /donations/1/edit
  def edit
  end

  # POST /donations
  # POST /donations.json
  def create
    @donation = Donation.new(donation_params)
    @donation.user = current_user

    respond_to do |format|
      if @donation.save
        format.html { redirect_to @donation, notice: "Donation was successfully recorded." }
        format.json { render :show, status: :created, location: @donation }
      else
        format.html { render :new }
        format.json { render json: @donation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /donations/1
  # PATCH/PUT /donations/1.json
  def update
    respond_to do |format|
      if @donation.update(donation_params)
        format.html { redirect_to @donation, notice: "Donation was successfully updated." }
        format.json { render :show, status: :ok, location: @donation }
      else
        format.html { render :edit }
        format.json { render json: @donation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /donations/1
  # DELETE /donations/1.json
  def destroy
    @donation.destroy

    respond_to do |format|
      format.html { redirect_to donations_url, notice: "Donation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_donation
    @donation = Donation.find(params[:id])
    render_404 unless @donation.user == current_user
  end

  def donation_params
    donation_params = params.require(:donation).permit(
      :amount,
      :recipient_name,
      :date,
      :method,
      :status,
    )
    donation_params[:amount]&.gsub!("$", "")
    donation_params
  end
end
