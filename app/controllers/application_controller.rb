class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :format_price, :current_cart

  def format_price(num)
    s = num.to_s

    "$#{s.insert(-3, '.')}"
  end

  def current_cart
    current_user.current_cart
  end

end
