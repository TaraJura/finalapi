class VisitorsController < ApplicationController
  before_action :set_visitor, only: %i[ show create edit update destroy ]

  # GET /visitors or /visitors.json
  def index
    @visitors = Visitor.all
  end

  # GET /visitors/1 or /visitors/1.json
  def show
  end

  # GET /visitors/new
  def new
    @visitor = Visitor.new
  end

  # GET /visitors/1/edit
  def edit
  end

  # POST /visitors or /visitors.json
  def create
    @visitor = Visitor.new(visitor_params)

    if @visitor.visitor_type == "1"
      @visitor.expires = Time.now + 1.days
    end

    if @visitor.visitor_type == "2"
      @visitor.expires = Time.now + 5.years
    end

    if params[:all_zones] == "1"
      @visitor.zones = Zone.all 
    end

    respond_to do |format|
      if @visitor.save
        format.html { redirect_to visitor_url(@visitor), notice: "Visitor was successfully created." }
        format.json { render :show, status: :created, location: @visitor }
      else
        puts @visitor.errors.inspect
        puts params.inspect
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @visitor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /visitors/1 or /visitors/1.json
  def update
    respond_to do |format|
      if @visitor.update(visitor_params)
        format.html { redirect_to visitor_url(@visitor), notice: "Visitor was successfully updated." }
        format.json { render :show, status: :ok, location: @visitor }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @visitor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /visitors/1 or /visitors/1.json
  def destroy
    @visitor.destroy

    respond_to do |format|
      format.html { redirect_to visitors_url, notice: "Visitor was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_visitor
      @visitor = Visitor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def visitor_params
      params.require(:visitor).permit(:name, :escort_flag, :visitor_id_expiration, :email, :phone, :identity_card_type, :identity_card_number, :expires, :visitor_type, :customer_id, visitorsZoneAcce_attributes:[:zone_id] )
    end
end

