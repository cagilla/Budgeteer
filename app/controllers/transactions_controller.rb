class TransactionsController < ApplicationController
  before_filter :signed_in_user
 
  # GET /transactions
  # GET /transactions.json
  def index
    @account = Account.find(params[:account_id])
    #get the starting balance for the page
    if (params[:page].nil?)
      page_num = 1;
    else
      page_num = Integer(params[:page])
    end
    if (Integer(page_num)>1)
      prior_transactions=@account.transactions.paginate(:page => 1, :per_page => 15*(page_num-1), :order => "date DESC")
      @page_balance = @account.final_balance - prior_transactions.to_a.sum {|transaction| transaction.amount}
    else
      @page_balance = @account.final_balance
    end

    @transactions = @account.transactions.paginate(:page => page_num, :per_page => 15, :order => "date DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @transactions }
    end
  end

  def reconcile
    @account = Account.find(params[:id])
    ##get the starting balance for the page
    # if (params[:page].nil?)
    #   page_num = 1;
    # else
    #   page_num = Integer(params[:page])
    # end
    # if (Integer(page_num)>1)
    #   prior_transactions=@account.transactions.paginate(:page => 1, :per_page => 15*(page_num-1), :order => "date DESC")
    #   @page_balance = @account.final_balance - prior_transactions.to_a.sum {|transaction| transaction.amount}
    # else
    #   @page_balance = @account.final_balance
    # end
    @transactions = @account.unreconciled

    respond_to do |format|
      format.html #{ render index.html.erb }
      format.json { render json: @transactions }
    end
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
    #1st you retrieve the post thanks to params[:post_id]
    account = Account.find(params[:account_id])
    #2nd you build a new one
    @transaction = account.transactions.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @transaction }
    end
  end

  # GET /transactions/new
  # GET /transactions/new.json
  def new
    #1st you retrieve the post thanks to params[:post_id]
    account = Account.find(params[:account_id])
    #2nd you build a new one
    @transaction = account.transactions.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @transaction }
    end
  end

  # GET /transactions/1/edit
  def edit
    account = Account.find(params[:account_id])
    @transaction = account.transactions.find(params[:id])
  end

  # POST /transactions
  # POST /transactions.json
  def create
    account = Account.find(params[:account_id])
    @transaction = account.transactions.create(params[:transaction])

    respond_to do |format|
      if @transaction.save
        format.html { redirect_to account_transactions_path(account), notice: 'Transaction was successfully created.' }
        format.json { render json: @transaction, status: :created, location: [@transaction.account, @transaction] }
      else
        format.html { render action: "new" }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /transactions/1
  # PUT /transactions/1.json
  def update
    account = Account.find(params[:account_id])
    @transaction = account.transactions.find(params[:id])
    respond_to do |format|
      if @transaction.update_attributes(params[:transaction])
        format.html { redirect_to [@transaction.account, @transaction], notice: 'Transaction was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  def  clone
    @transaction = Transaction.find(params[:id]).dup
    @transaction.date = Date.today
    @transaction.is_cleared = false
    respond_to do |format|
      if @transaction.save
        format.html { redirect_to account_transactions_path(@transaction.account), notice: 'Transaction was successfully cloned.' }
        format.json { render json: @transaction, status: :created, location: [@transaction.account, @transaction] }
      else
        format.html { render action: "new" }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end    
    end
     
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    account = Account.find(params[:account_id])
    @transaction = account.transactions.find(params[:id])
    @transaction.destroy

    respond_to do |format|
      format.html { redirect_to account_transactions_url }
      format.json { head :no_content }
    end
  end
end
