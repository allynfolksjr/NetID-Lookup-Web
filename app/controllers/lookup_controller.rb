class LookupController < ApplicationController
  def index
  end

  def info
    lookup = Lookup.new(params[:netid])
    unless lookup.validate_netid
      @error_text = "#{params[:netid]} is not a valid NetID"
      render 'error'
    end

    @data = lookup.do

  end
end
