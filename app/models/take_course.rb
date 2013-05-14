class TakeCourse < ActiveRecord::Base

  attr_accessible :course_info_id, :member_id, :take_course_title, :take_course_open_week, :take_course_open_time, :id_of_take_course
  
  belongs_to :member
  belongs_to :course_info

  validate do
    unless member && member.take_course_for?(course_info)
      errors.add(:base, :invalid)
    end
  end

end
