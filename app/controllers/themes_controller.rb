class ThemesController < ApplicationController
  before_action :set_theme, only: [:show, :edit, :update, :destroy]

  def index
    @themes = current_user.themes
  end

  def new
    @theme = current_user.themes.build
  end

  def show
    @theme = current_user.themes.includes(:studies).find(params[:id])
  end

  def edit
  end

  def create
    @theme = current_user.themes.build(theme_params)

    if @theme.save
      redirect_to @theme, notice: 'Theme was successfully created.'
    else
      render :new
    end
  end

  def update
    if @theme.update(theme_params)
      redirect_to @theme, notice: 'Theme was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @theme.destroy
    redirect_to themes_url, notice: 'Theme was successfully destroyed.'
  end

  private
    def set_theme
      @theme = current_user.themes.find(params[:id])
    end

    def theme_params
      params.require(:theme).permit(:title, :content)
    end
end
