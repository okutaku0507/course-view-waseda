class CourseInfo < ActiveRecord::Base

  has_many :course_views, dependent: :destroy
  has_many :members, through: :course_views, source: :member

  has_many :likes, dependent: :destroy
  has_many :like_voters, through: :likes, source: :member

  has_many :bads, dependent: :destroy
  has_many :bad_voters, through: :bads, source: :member

  has_many :take_courses, dependent: :destroy
  has_many :take_course_members, through: :take_courses, source: :member

  has_many :teacher_ranks, dependent: :destroy
  has_many :teacher_rank_members, through: :teacher_ranks, source: :member

   attr_accessible :title, :teacher_family_name, :teacher_first_name, :open_faculty, :day_of_the_week, :open_time, :open_term, :test_existence

  validates :title, presence: true
  validates :teacher_family_name, presence: true
  validates :teacher_first_name, presence: true
  
  def full_name
      [ teacher_family_name, teacher_first_name ].compact.join
  end

  scope :search, lambda { |params|
    rel = order("open_time")
    if params[:course].present?
      course = params[:course]
      rel = rel.where("title like ?", "%#{course}%")
    end
    
    if params[:teacher].present?
      teacher = params[:teacher]
      rel = rel.where("teacher like ?", "%#{teacher}%")
    end
    
    if params[:all_course].present?
    else
      faculty = params[:faculty]
      rel = rel.where("open_faculty like ?", "%#{faculty}%")
    end
    
    if params[:time].present?
      time = params[:time]
      rel = rel.where("open_time like ?", "%#{time}%")
    end
    
    if params[:week].present?
      week = params[:week]
      rel = rel.where("day_of_the_week like ?", "%#{week}%")
    end
    rel
  }


  class << self 
#    def search(query)
#      rel = order("id")
#      if query.present?
#      words = query.split(/ +/)
#        conditions = []
#        values = []
#        words.each do |word|
#          conditions << "title LIKE ?"
#          conditions << "teacher LIKE ?"
#          values << "%#{word}%"
#          values << "%#{word}%"
#        end
#        rel = rel.where(conditions.join(" OR "), *values)
#      end
#      rel
#    end
  end
end
