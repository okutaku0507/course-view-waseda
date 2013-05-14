class Like < ActiveRecord::Base

  attr_accessible :course_info_id
  
  belongs_to :member
  belongs_to :course_info

  validate do
    unless member && member.like_for?(course_info)
      errors.add(:base, :invalid)
    end
  end

end
