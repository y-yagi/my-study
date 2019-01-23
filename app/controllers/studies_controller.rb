class StudiesController < ApplicationController
  before_action :set_study, only: [:show, :edit, :update, :destroy]

  def index
    @studies = current_user.studies.order(id: :desc).page(params[:page])
  end

  def show
  end

  def new
    @study = current_user.studies.build
    set_themes_for_select
  end

  def edit
    set_themes_for_select
  end

  def create
    @study = current_user.studies.build(study_params)

    if @study.save
      redirect_to @study, notice: 'Study was successfully created.'
    else
      set_themes_for_select
      render :new
    end
  end

  def update
    if @study.update(study_params)
      redirect_to @study, notice: 'Study was successfully updated.'
    else
      set_themes_for_select
      render :edit
    end
  end

  def destroy
    @study.destroy
    redirect_to studies_url, notice: 'Study was successfully destroyed.'
  end

  private
    def set_study
      @study = current_user.studies.find(params[:id])
    end

    def set_themes_for_select
      @themes = current_user.themes.pluck(:title, :id)
    end

    def study_params
      params.require(:study).permit(:content, :theme_id, :hour, :minute)
    end
end
