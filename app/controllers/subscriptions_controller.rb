class SubscriptionsController < ApplicationController
  before_action :authenticate_user!
  
  def new
  end

  def create
    customer = current_user.stripe_customer
  end

end