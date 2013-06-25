class LookupController < ApplicationController
  def index
  end

  def info
    @netid = params[:netid]
    lookup = Lookup.new(@netid)
    if lookup.validate_netid
      @data = lookup.do
      if params[:embed]
        render "info", layout: "basic"
      end
    else
     @error_text = "#{params[:netid]} is not a valid NetID"
     render 'error', layout: "basic"
   end

 end
end
