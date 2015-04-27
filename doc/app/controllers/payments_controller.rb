class PaymentsController < ApplicationController
  # GET casefiles/1/payments
  # GET casefiles/1/payments.json
  def index
    @casefile = Casefile.find(params[:casefile_id])
    @payments = @casefile.payments

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @payments }
    end
  end

  # GET casefiles/1/payments/1
  # GET casefiles/1/payments/1.json
  def show
    @casefile = Casefile.find(params[:casefile_id])
    @payment = @casefile.payments.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @payment }
    end
  end

  # GET casefiles/1/payments/new
  # GET casefiles/1/payments/new.json
  def new
    @casefile = Casefile.find(params[:casefile_id])
    @payment = @casefile.payments.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @payment }
    end
  end

  # GET casefiles/1/payments/1/edit
  def edit
    @casefile = Casefile.find(params[:casefile_id])
    @payment = @casefile.payments.find(params[:id])
  end

  # POST casefiles/1/payments
  # POST casefiles/1/payments.json
  def create
    @casefile = Casefile.find(params[:casefile_id])
    @payment = @casefile.payments.build(params[:payment])

    respond_to do |format|
      if @payment.save
        format.html { redirect_to([@payment.casefile, @payment], :notice => 'Payment was successfully created.') }
        format.json { render :json => @payment, :status => :created, :location => [@payment.casefile, @payment] }
      else
        format.html { render :action => "new" }
        format.json { render :json => @payment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT casefiles/1/payments/1
  # PUT casefiles/1/payments/1.json
  def update
    @casefile = Casefile.find(params[:casefile_id])
    @payment = @casefile.payments.find(params[:id])

    respond_to do |format|
      if @payment.update_attributes(params[:payment])
        format.html { redirect_to([@payment.casefile, @payment], :notice => 'Payment was successfully updated.') }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @payment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE casefiles/1/payments/1
  # DELETE casefiles/1/payments/1.json
  def destroy
    @casefile = Casefile.find(params[:casefile_id])
    @payment = @casefile.payments.find(params[:id])
    @payment.destroy

    respond_to do |format|
      format.html { redirect_to casefile_payments_url(casefile) }
      format.json { head :ok }
    end
  end
end
