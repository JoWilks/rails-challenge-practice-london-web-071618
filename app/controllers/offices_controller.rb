class OfficesController < ApplicationController

  def show
    @office = Office.find(params[:id])
  end

end
