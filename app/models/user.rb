class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :charges

  def stripe_customer
    if stripe_id?
      Stripe::Customer.retrieve(stripe_id)
    else
      stripe_customer = Stripe::Customer.create(email: email)
      update(stripe_id: stripe_customer.id)
      stripe_customer
    end
  end

  def subscribed?
    # Check for subscribed and free trial 
    stripe_subscription_id? || (expires_at? && Time.zone.now < expires_at)
  end
end
