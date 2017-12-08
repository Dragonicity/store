class Charge < ApplicationRecord
  belongs_to :user

  def receipt
    Receipts::Receipt.new(
      id: id,
      product:"Store",
      company: {
        name:     "Dragonicity Ltd",
        address:  "17/F, 248 Des Voeux Road, Central, Hong Kong",
        email:    "admin@dragonicity.com",
        logo:     Rails.root.join("app/assets/images/dragonicity-logo-english.jpg")
      },
      line_items: [
        ["Date",          created_at.to_s],
        ["Acount Billed", user.email],
        ["Product",       "Monthly subscription"],
        ["Currency",      stripe_currency],
        ["Amount",        amount / 100],
        ["Card Charged",  "#{card_brand} (**** **** **** #{card_last4})"]
      ]
    )
  end
end
