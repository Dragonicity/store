#Rails.configuration.stripe = {
#  :publishable_key => ENV['PUBLISHABLE_KEY'],
#  :secret_key      => ENV['SECRET_KEY']
#}

Stripe.api_key = Rails.application.secrets.SECRET_KEY

StripeEvent.configure do |events|
  events.subscribe 'charge.succeeded',Webhooks::ChargeSucceeded.new
end
