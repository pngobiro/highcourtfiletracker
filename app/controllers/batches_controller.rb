class BatchesController < ApplicationController
before_filter :authenticate_user!


def index
    @courtstation = Courtstation.find(params[:courtstation_id])
    @batches = @courtstation.batches


	    respond_to do |format|
	      format.html # index.html.erb
	      format.json { render :json => @batches }
	    end
  end

  # GET courtstations/1/batches/1
  # GET courtstations/1/batches/1.json
  def show
    @courtstation = Courtstation.find(params[:courtstation_id])
    @batch = @courtstation.batches.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @batch }
    end
  end

  # GET courtstations/1/batches/new
  # GET courtstations/1/batches/new.json
  def new
    @courtstation = Courtstation.find(params[:courtstation_id])
    @batch = @courtstation.batches.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @batch }
    end
  end

  # GET courtstations/1/batches/1/edit
  def edit
    @courtstation = Courtstation.find(params[:courtstation_id])
    @batch = @courtstation.batches.find(params[:id])
  end

  # POST courtstations/1/batches
  # POST courtstations/1/batches.json
  def create
    @courtstation = Courtstation.find(params[:courtstation_id])
    @batch = @courtstation.batches.build(params[:batch])

    respond_to do |format|
      if @batch.save
        format.html { redirect_to([@batch.courtstation, @batch], :notice => 'batch was successfully created.') }
        format.json { render :json => @batch, :status => :created, :location => [@batch.courtstation, @batch] }
      else
        format.html { render :action => "new" }
        format.json { render :json => @batch.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT courtstations/1/batches/1
  # PUT courtstations/1/batches/1.json
  def update
    @courtstation = Courtstation.find(params[:courtstation_id])
    @batch = @courtstation.batches.find(params[:id])

    respond_to do |format|
      if @batch.update_attributes(params[:batch])
        format.html { redirect_to([@batch.courtstation, @batch], :notice => 'batch was successfully updated.') }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @batch.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE courtstations/1/batches/1
  # DELETE courtstations/1/batches/1.json
  def destroy
    @courtstation = Courtstation.find(params[:courtstation_id])
    @batch = @courtstation.batch.find(params[:id])
    @batch.destroy

    respond_to do |format|
      format.html { redirect_to courtstation_batches_url(courtstation) }
      format.json { head :ok }
    end
  end
end
