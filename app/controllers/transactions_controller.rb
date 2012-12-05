class TransactionsController < ApplicationController
  before_filter :signed_in_user
  before_filter :correct_user, only: :destroy
  
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
    @transaction.destroy
    redirect_to current_user
  end
  
private
  def correct_user
    @transaction = current_user.transactions.find_by_id(params[:id])
    redirect_to root_url if @transaction.nil?
  end
end