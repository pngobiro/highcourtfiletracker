class TrackersController < ApplicationController
  # GET casefiles/1/trackers
  # GET casefiles/1/trackers.json
 def data
  [["Date Out","From","To ","Taken by","Reason ","Results","Date of result","Officer taking action","Date in","Remarks"]] +
    @trackers.map do |tracker|
      [tracker.Date, tracker.From,tracker.To,tracker.TakenBy,tracker.Reason,tracker.Results, tracker.DateofResult,tracker.JudgeMagistrate,tracker.DateIn,tracker.Reamarks]
    end
  end
 
  def index
    @casefile = Casefile.find(params[:casefile_id])
    @trackers = @casefile.trackers.order("created_at DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @trackers }
      format.pdf do
          pdf = Prawn::Document.new(:page_size => "A4",:page_layout => :landscape)
        pdf.text "Generated on ##{Time.now}", size: 7, style: :bold ,:align => :right,:color => "00FF00"
    pdf.text "HIGH COURT OF KENYA", size: 20, style: :bold ,:align => :center,:color => "00FF00"
    # pdf.image "#{Prawn::DATADIR}/images/coat-of-arms.png"
    pdf.text "Milimani Civil Division", size: 15, style: :bold ,:align => :center,:color => "0000FF"
    pdf.text  " \##{@casefile.Typeofcase} Case", size: 12, style: :bold,:align => :center,:color => "0000FF"
    pdf.move_down 15
    pdf.text " Case Details",size: 12, style: :bold
    pdf.table([["Case Number","##{@casefile.CaseNumber}"],["Date Filed","##{@casefile.DateofFilling}"],["Plaintiff/Advocate","##{@casefile.plaintiff_advocate}"],["Defendant/Advocate","##{@casefile.defendant_advocate}"],["Nature of Claim","##{@casefile.natureofclaim}"]])
    pdf.move_down 15
    pdf.text " Listing Tracker(s) for this Case",size: 12, style: :bold
    pdf.move_down 15
    pdf.table(data,:column_widths => [75, 70, 75,70,90,90,70,90],:row_colors => ["F0F0F0", "FFFFCC"],:header => true) do 
    row(0).font_style = :bold
      columns(1..3).align = :right
    end
        send_data pdf.render, filename: "{@casefile.CaseNumber}.pdf",
                              type: "application/pdf",
                              disposition: "inline"
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

  # DELETE casefiles/1/trackers/1
  # DELETE casefiles/1/trackers/1.json
  def destroy
    @casefile = Casefile.find(params[:casefile_id])
    @tracker = @casefile.trackers.find(params[:id])
    @tracker.destroy

    respond_to do |format|
      format.html { redirect_to casefile_trackers_url(casefile) }
      format.json { head :ok }
    end
  end
  
end
