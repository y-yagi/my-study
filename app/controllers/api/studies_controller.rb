class Api::StudiesController < Api::ApplicationController
  def show
    @study = current_user.studies.find(params[:id])
  end
end
