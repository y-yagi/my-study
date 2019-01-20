class Api::StudiesController < Api::ApplicationController
  def show
    @study = current_user.studies.find(params[:id])
  end

  def create
    @study = current_user.studies.build(study_params)
    @study.theme = current_user.themes.find_by(title: params[:theme])

    @study.save
  end

  private
    def study_params
      params.require(:study).permit(:content, :hour, :minute)
    end
end
