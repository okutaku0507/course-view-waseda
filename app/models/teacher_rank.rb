class TeacherRank < ActiveRecord::Base
  attr_accessible :teacher_rank, :course_info_id
    
  belongs_to :member
  belongs_to :course_info

  validate do
    unless member && member.teacher_rank_for?(course_info)
      errors.add(:base, :invalid)
    end
  end


end
