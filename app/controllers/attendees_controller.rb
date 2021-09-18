class AttendeesController < ApplicationController
  before_action :set_attendee, only: %i[ show edit update destroy ]
  before_action :set_event, only: [:new, :create]
  before_action :require_current_user, only: [:new, :create]

  # GET /attendees or /attendees.json
  # def index
  #   @attendees = Attendee.all
  # end

  # GET /attendees/1 or /attendees/1.json
  # def show
  # end

  # GET /attendees/new
  def new
    @attendee = Attendee.new()
  end

  # GET /attendees/1/edit
  def edit
  end

  # POST /attendees or /attendees.json
  def create
    if Attendee.find_by name: attendee_params[:name]
      @attendee = Attendee.find_by name: attendee_params[:name]
    else
      @attendee = Attendee.new(attendee_params)
    end
    
    @attendee.events << @event

    respond_to do |format|
      if @attendee.save
        format.html { redirect_to @event, notice: "Attendee was successfully created." }
        # format.json { render :show, status: :created, location: @attendee }
      else
        format.html { render :new, status: :unprocessable_entity }
        # format.json { render json: @attendee.errors, status: :unprocessable_entity }
      end
    end
    
  end

  # PATCH/PUT /attendees/1 or /attendees/1.json
  def update
    respond_to do |format|
      if @attendee.update(attendee_params)
        format.html { redirect_to @attendee, notice: "Attendee was successfully updated." }
        format.json { render :show, status: :ok, location: @attendee }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @attendee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attendees/1 or /attendees/1.json
  def destroy
    @attendee.destroy
    respond_to do |format|
      format.html { redirect_to attendees_url, notice: "Attendee was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attendee
      @attendee = Attendee.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def attendee_params
      params.require(:attendee).permit(:name, :phone_number, :email, event_ids: [])
    end
end
