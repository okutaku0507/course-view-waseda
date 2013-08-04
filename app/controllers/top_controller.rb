# coding: utf-8

class TopController < ApplicationController
  def index
    if @current_member
      redirect_to :account
    else
      @member = Member.new
      render "top", layout: "before_login"
    end
  end

  def use_policy
  end

  def privacy
  end

  def rabbit
  end

  def not_found
    raise ActionController::RoutingError,
        "No route matches #{request.path.inspect}"
  end
end
