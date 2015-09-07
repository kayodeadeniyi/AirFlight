class Booking < ActiveRecord::Base
  belongs_to :flight
  belongs_to :user
	has_many :passengers
  accepts_nested_attributes_for :passengers

  def paypal_url(return_url, invoice, ordered_items, notify_url)
    values = {
      :business => 'kayodeadeniyi001-facilitator@yahoo.com',  # Seller's email
      :cmd => '_cart',                  # tells paypal to expect a cart
      :upload => 1,                     # we are doing a once all payment
      :rm => 2,                         # we want a post response from PayPal with payment details
      :return => return_url,            # PayPal redirects to this url after transaction is complete
      :invoice => invoice,             # invoice id
      :notify_url => notify_url,       # email that PayPal sends due notification for the payment
    }

    counter = 1
    ordered_items.each do |details|
      values.merge!({
        "amount_#{counter}" => details[:price],
        "item_name_#{counter}" => details[:details],
        "item_number_#{counter}" => counter,
      })
      counter += 1
    end
    "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
  end

end
