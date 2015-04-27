class CourtstationsController < ApplicationController
 before_filter :authenticate_user!
#before_filter :redirect_to_station_path
  # GET /courtstations
  # GET /courtstations.json
 

def search
end



 def stationmovements
	@courtstation = Courtstation.find(params[:id])
		@movesearch =@courtstation.movements
		if params[:q].blank?
		@q = @movesearch.none.ransack # so you have a ransack search
		else
		@q = @movesearch.ransack(params[:q])
		end
		@stationmovements =@q.result
end


def index

    @courtstations = Courtstation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @courtstations }
    end
  end

  # GET /courtstations/1
  # GET /courtstations/1.json
  def show
    @courtstation = Courtstation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @courtstation }
    end
  end

  # GET /courtstations/new
  # GET /courtstations/new.json
  def new
    @courtstation = Courtstation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @courtstation }
    end
  end

  # GET /courtstations/1/edit
  def edit
    @courtstation = Courtstation.find(params[:id])
  end

  # POST /courtstations
  # POST /courtstations.json
  def create
    @courtstation = Courtstation.new(params[:courtstation])

    respond_to do |format|
      if @courtstation.save
        format.html { redirect_to @courtstation, notice: 'Courtstation was successfully created.' }
        format.json { render json: @courtstation, status: :created, location: @courtstation }
      else
        format.html { render action: "new" }
        format.json { render json: @courtstation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /courtstations/1
  # PUT /courtstations/1.json
  def update
    @courtstation = Courtstation.find(params[:id])

    respond_to do |format|
      if @courtstation.update_attributes(params[:courtstation])
        format.html { redirect_to @courtstation, notice: 'Courtstation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @courtstation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courtstations/1
  # DELETE /courtstations/1.json

def redirect_to_station_path
    case current_user.station
when "milimani family" then redirect_to 'http://10.66.110.15:81/courtstations/1/casefiles'



end
end
end
