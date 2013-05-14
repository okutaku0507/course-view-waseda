class CourseInfo < ActiveRecord::Base

  has_many :course_views, dependent: :destroy
  has_many :members, through: :course_views, source: :member

  has_many :likes, dependent: :destroy
  has_many :like_voters, through: :likes, source: :member

  has_many :bads, dependent: :destroy
  has_many :bad_voters, through: :bads, source: :member

  has_many :take_courses, dependent: :destroy
  has_many :take_course_members, through: :take_courses, source: :member

   attr_accessible :title, :teacher, :open_faculty, :day_of_the_week, :open_time, :open_term, :test_existence

  validates :title, presence: true
  validates :teacher, presence: true

  class << self 
    def search(query)
      rel = order("id")
      if query.present?
      words = query.split(/ +/)
        conditions = []
        values = []
        words.each do |word|
          conditions << "title LIKE ?"
          conditions << "teacher LIKE ?"
          values << "%#{word}%"
          values << "%#{word}%"
        end
        rel = rel.where(conditions.join(" OR "), *values)
      end
      rel
    end
  end
end
