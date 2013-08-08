#coding: utf-8
class Circle < ActiveRecord::Base
  attr_accessor :password, :password_confirmation
  attr_accessible :title, :headline, :circle_type, :belong, :genre, :open, :detail
end
