class LikesController < ApplicationController
  before_action :set_like, only: :destroy
  before_action :authenticate_like_user, only: :destroy

  # POST /likes
  # POST /likes.json
  def create
    @like = Like.new(like_params)
    @like.user_id = current_user&.id

    respond_to do |format|
      if @like.save
        format.html { redirect_to dogs_path, notice: 'You have liked the dog!' }
        format.json { render json: @like, status: :ok }
      else
        format.html { redirect_to dogs_url, alert: @like.errors.values }
        format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /likes/1
  # DELETE /likes/1.json
  def destroy
    @like.destroy

    respond_to do |format|
      format.html { redirect_to dogs_url, notice: 'Dog was successfully unliked. :(' }
      format.json { head :no_content }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def like_params
      params.permit(:dog_id, :like_id)
    end

    def set_like
      @like = Like.find(params[:like_id])
    end

    def authenticate_like_user
      if @like.user != current_user
        redirect_to dogs_path, alert: "This isn't your like."
      end
    end

  end
