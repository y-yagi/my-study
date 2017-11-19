class Settings::TokensController < ApplicationController
  before_action :set_token, only: [:show, :destroy]

  def index
    @tokens = current_user.tokens
  end

  def new
    @token = current_user.tokens.build
  end

  def show
  end

  def create
    @token = current_user.tokens.build(token_params)
    @token.build_token

    if @token.save
      redirect_to settings_token_path(@token), notice: 'Token was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @token.destroy
    redirect_to settings_tokens_url, notice: 'Token was successfully destroyed.'
  end

  private
    def set_token
      @token = current_user.tokens.find(params[:id])
    end

    def token_params
      params.require(:token).permit(:description)
    end
end
