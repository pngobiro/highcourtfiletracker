class TrackersController < ApplicationController
  # GET casefiles/1/trackers
  # GET casefiles/1/trackers.json

  def data
		[["Date Out","From","To ","Taken by","Reason ","Results","Date of result","Officer taking action","Date in","Remarks"]] +
		@trackers.map do |tracker|
		[tracker.date, tracker.from,tracker.to,tracker.takenby,tracker.reason,tracker.results, tracker.dateofresult,tracker.officer,tracker.datein,tracker.remarks]
		end
end
  def index
    @casefile = Casefile.find(params[:casefile_id])
    @trackers = @casefile.trackers.order('created_at DESC')

    respond_to do |format|
      format.html  #index.html.erb
      format.json { render :json => @trackers }
      format.pdf do 
		pdf = Prawn::Document.new(:page_size => "A4",:page_layout => :landscape)
		pdf.text "Generated on #{Time.now}", size: 12, style: :bold ,:align => :right,:color => "00FF00"
		pdf.text "HIGH COURT OF KENYA", size: 20, style: :bold ,:align => :center,:color => "00FF00"
		# pdf.image "#{Prawn::DATADIR}/images/coat-of-arms.png"
		pdf.text current_user.station , size: 15, style: :bold ,:align => :center,:color => "0000FF"
		pdf.text " #{@casefile.typeofcase} Case", size: 12, style: :bold,:align => :center,:color => "0000FF"
		pdf.move_down 15
		pdf.text " Case Details",size: 8, style: :bold
		pdf.table([["Case Number","#{@casefile.casenumber}"],["Date Filed","#{@casefile.dateoffilling}"],["Parties","#{@casefile.parties_names}"],["Nature of Claim","#{@casefile.natureofclaim}"]])
		pdf.move_down 15
		pdf.text " Listing Tracker(s) for this Case",size: 12, style: :bold
		pdf.move_down 15
		pdf.table(data,:column_widths => [70, 65, 65,65,80,80,70,80,70],:row_colors => ["F0F0F0", "FFFFCC"],:header => true) do
		row(0).font_style = :bold
		columns(1..3).align = :right

		pdf = TrackerPdf.new(@casefile,@tracker)
		send_data pdf.render, filename: "#{@casefile.casenumber}.pdf",
		type: "application/pdf",
		disposition: "inline"

		end
  end
end
  end

  # GET casefiles/1/trackers/1
  # GET casefiles/1/trackers/1.json
  def show
    @casefile = Casefile.find(params[:casefile_id])
    @tracker = @casefile.trackers.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @tracker }
    end
  end

  # GET casefiles/1/trackers/new
  # GET casefiles/1/trackers/new.json
  def new
    @casefile = Casefile.find(params[:casefile_id])
    @tracker = @casefile.trackers.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @tracker }
    end
  end

  # GET casefiles/1/trackers/1/edit
  def edit
    @casefile = Casefile.find(params[:casefile_id])
    @tracker = @casefile.trackers.find(params[:id])
  end

  # POST casefiles/1/trackers
  # POST casefiles/1/trackers.json
  def create
    @casefile = Casefile.find(params[:casefile_id])
    @tracker = @casefile.trackers.build(params[:tracker])

    respond_to do |format|
      if @tracker.save
        format.html { redirect_to([@tracker.casefile, @tracker], :notice => 'Tracker was successfully created.') }
        format.json { render :json => @tracker, :status => :created, :location => [@tracker.casefile, @tracker] }
      else
        format.html { render :action => "new" }
        format.json { render :json => @tracker.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT casefiles/1/trackers/1
  # PUT casefiles/1/trackers/1.json
  def update
    @casefile = Casefile.find(params[:casefile_id])
    @tracker = @casefile.trackers.find(params[:id])

    respond_to do |format|
      if @tracker.update_attributes(params[:tracker])
        format.html { redirect_to([@tracker.casefile, @tracker], :notice => 'Tracker was successfully updated.') }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @tracker.errors, :status => :unprocessable_entity }
      end
    end
  end
  
end
