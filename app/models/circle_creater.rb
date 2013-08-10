#coding: utf-8
class CircleCreater < ActiveRecord::Base
  attr_accessible :circle_id, :member_id
  
  belongs_to :circle
  belongs_to :member
end
