# coding: utf-8

class TopController < ApplicationController
  def index
      redirect_to :course_infos
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
