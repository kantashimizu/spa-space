class AreasController < ApplicationController
  def show
    @tweets = Tweet.where(area_id:params[:id])
  end
end
