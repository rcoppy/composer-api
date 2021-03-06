class Api::V1::DecisionsController < ApplicationController
  before_action :set_decision, only: [:show, :update, :destroy]
  authorize_resource
  
  # GET /decisions
  def index
    @decisions = Decision.all

    render json: @decisions
  end

  # GET /decisions/1
  def show
    render json: @decision
  end

  # POST /decisions
  def create
    @decision = Decision.new(decision_params)

    if @decision.save
      render json: @decision, status: :created, location: api_v1_decision_url(@decision)
    else
      render json: @decision.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /decisions/1
  def update
    if @decision.update(decision_params)
      render json: @decision
    else
      render json: @decision.errors, status: :unprocessable_entity
    end
  end

  # DELETE /decisions/1
  def destroy
    @decision.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_decision
      @decision = Decision.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def decision_params
      params.require(:decision).permit(:id, :app_id, :date_created, :date_finalized, :is_pending, :is_accepted, :comment, :author_id)
    end
end
