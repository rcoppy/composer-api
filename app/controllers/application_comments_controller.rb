class ApplicationCommentsController < ApplicationController
  before_action :set_application_comment, only: [:show, :update, :destroy]

  # GET /application_comments
  def index
    @application_comments = ApplicationComment.all

    render json: @application_comments
  end

  # GET /application_comments/1
  def show
    render json: @application_comment
  end

  # POST /application_comments
  def create
    @application_comment = ApplicationComment.new(application_comment_params)

    if @application_comment.save
      render json: @application_comment, status: :created, location: @application_comment
    else
      render json: @application_comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /application_comments/1
  def update
    if @application_comment.update(application_comment_params)
      render json: @application_comment
    else
      render json: @application_comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /application_comments/1
  def destroy
    @application_comment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_application_comment
      @application_comment = ApplicationComment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def application_comment_params
      params.require(:application_comment).permit(:id, :app_id, :author_id, :date_created, :text, :is_flagged)
    end
end
