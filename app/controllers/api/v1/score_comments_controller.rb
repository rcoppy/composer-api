class Api::V1::ScoreCommentsController < ApplicationController
  before_action :set_score_comment, only: [:show, :update, :destroy]
  authorize_resource
  
  # GET /score_comments
  def index
    @score_comments = ScoreComment.all

    render json: @score_comments
  end

  # GET /score_comments/1
  def show
    render json: @score_comment
  end

  # POST /score_comments
  def create
    @score_comment = ScoreComment.new(score_comment_params)

    if @score_comment.save
      render json: @score_comment, status: :created, location: api_v1_score_comment_url(@score_comment)
    else
      render json: @score_comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /score_comments/1
  def update
    if @score_comment.update(score_comment_params)
      render json: @score_comment
    else
      render json: @score_comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /score_comments/1
  def destroy
    @score_comment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_score_comment
      @score_comment = ScoreComment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def score_comment_params
      params.require(:score_comment).permit(:id, :score_id, :author_id, :date, :text, :is_flagged)
    end
end
