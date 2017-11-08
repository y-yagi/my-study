class DashboardController < ApplicationController
  def show
    hours = current_user.themes.eager_load(:studies).group('themes.title').sum('studies.hour')
    minutes = current_user.themes.eager_load(:studies).group('themes.title').sum('studies.minute')
    @summary = minutes.merge(hours) { |key, oldval, newval| oldval + newval * 60 }
  end
end
