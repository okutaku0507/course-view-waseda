class CourseView < ActiveRecord::Base
  belongs_to :member, class_name: "Member", foreign_key: "member_id"
  belongs_to :course_info, class_name: "CourseInfo", foreign_key: "course_info_id"

   attr_accessible :view, :evaluation, :teacher_rank, :member_id, :course_info_id, :course_info, :title_of_course, :id_course, :id_member

  # バリデーション
  validates :view, presence: true, length: { nimimum: 10, maximum: 2000 }
  validates :teacher_rank, presence: true
end
