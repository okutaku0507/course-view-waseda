class Response < ActiveRecord::Base
  attr_accessible :course_view_id, :member_id, :view_response
  
  belongs_to :member, class_name: "Member", foreign_key: "member_id"
  belongs_to :course_view, class_name: "CourseView", foreign_key: "course_view_id"

  validates :view_response, presence: true
end
