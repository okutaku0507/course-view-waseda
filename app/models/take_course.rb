class TakeCourse < ActiveRecord::Base
belongs_to :member
belongs_to :course_info

  attr_accessible :course_info_id, :member_id, :take_course_title, :take_course_open_week, :take_course_open_time, :id_of_take_course, :take_course_late_point, :take_course_absent_point, :take_course_note

 


end
