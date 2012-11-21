class TransactionsController < ApplicationController
  before_filter :signed_in_user
  
  def index
    
  end
  
  def create
    @transaction = current_user.transactions.build(params[:transaction])
    if @transaction.save
      flash[:success] = "Transaction added!"
    end
    redirect_to current_user
  end
  
  def destroy
    
  end
end