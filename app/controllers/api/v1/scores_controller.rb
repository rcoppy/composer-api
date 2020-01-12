class Api::V1::ScoresController < ApplicationController
  before_action :set_score, only: [:show, :update, :destroy]

  # GET /scores
  def index
    @scores = Score.all

    render json: @scores
  end

  # GET /scores/1
  def show
    render json: @score
  end

  def show_tags
    render json: @score.tags
  end

  def show_genres
    render json: @score.genres
  end

  def add_tag
    @score.tags << Tag.find(tag_params[:id])
  end

  def add_genre
    @score.genres << Genre.find(genre_params[:id])
  end

  # POST /scores
  def create
    @score = Score.new(score_params)

    if @score.save
      render json: @score, status: :created, location: api_v1_score_url(@score)
    else
      render json: @score.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /scores/1
  def update
    if @score.update(score_params)
      render json: @score
    else
      render json: @score.errors, status: :unprocessable_entity
    end
  end

  # DELETE /scores/1
  def destroy
    @score.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_score
      @score = Score.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def score_params
      params.require(:score).permit(:id, :user_id, :file, :title, :about, :thumbnail, :app_id, :date_created, :is_deleted)
    end

    def tag_params
      params.require(:tag).permit(:id, :name)
    end
    
    def genre_params
      params.require(:genre).permit(:id, :name)
    end

end
