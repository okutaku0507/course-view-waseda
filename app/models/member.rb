#coding: utf-8
class Member < ActiveRecord::Base
  include EmailAddressChecker
  include PasswordChecker

  has_many :course_views, dependent: :destroy
  has_many :course_infos, through: :course_views, source: :course_info

  has_many :likes, dependent: :destroy
  has_many :like_voted_courses, through: :likes, source: :course_info

  has_many :bads
  has_many :bad_voted_courses, through: :bads, source: :course_info

  has_many :take_courses, dependent: :destroy
  has_many :taked_courses, through: :take_courses, source: :course_info

  has_many :teacher_ranks, dependent: :destroy
  has_many :ranked_teacher, through: :teacher_ranks, source: :course_info

  has_many :responses, dependent: :destroy
  has_many :response_view, through: :responses, source: :course_view

  has_many :circle_creaters, dependent: :destroy
  has_many :create_circle, through: :circle_creaters, source: :circle

   attr_accessor :password, :password_confirmation, :initial_password

  ACCESSIBLE_ATTRS = [ :family_name, :first_name, :full_name, :university, :faculty, :subject, :email, :email_confirmation, :password, :password_confirmation, :gender ]
  attr_accessible *ACCESSIBLE_ATTRS
  attr_accessible *(ACCESSIBLE_ATTRS + [ :administrator ]), as: :admin

  #バリデーション
  validates :email, presence: {on: :create},
    confirmation: { allow_blank: true }

  validates :family_name, presence: {on: :create}, length: { maximum: 20 }
  validates :first_name, presence: {on: :create}, length: { maximum: 20 }
  validates :subject, presence: true

  validates :password,  presence: {on: :update},confirmation: { allow_blank: true, on: :update}, length: { minimum: 8, maximum: 16, on: :update}

  # メールチェック
  validate :check_email
  validate :check_password
  validates :email, uniqueness: { case_sensitive: false }

  # パスワードの暗号化
  def password=(val)
    if val.present?
      self.hashed_password = BCrypt::Password.create(val)
    end
    @password = val
  end

  # 登録時にパスワードを自動生成
  def before_create
    self.initial_password = random_password
    self.hashed_password = BCrypt::Password.create(initial_password)
  end

 before_create :before_create

  # like機能
    def like_for?(course_info)
      !likes.exists?(course_info_id: course_info.id)
    end

  # bad機能

    def bad_for?(course_info)
      !bads.exists?(course_info_id: course_info.id)
    end

  # take_course機能
    def take_course_for?(course_info)
      !take_courses.exists?(course_info_id: course_info.id)
    end

  # teacher_rank
    def teacher_rank_for?(course_info)
      !teacher_ranks.exists?(course_info_id: course_info.id)
    end

  private
  def check_email
    if email.present?
        errors.add(:email, :invalid) unless
           well_formed_as_email_address(email)
    end
  end

  def check_password
    if password.present?
        errors.add(:password, :invalid) unless
           well_formed_as_password(password)
    end
  end

  private
  def random_password(size=16)
    [*0..9, *'a'..'z', *'A'..'Z'].sample(size).join
  end

  class << self

  # 検索
    def search(query)
      rel = order("id")
      if query.present?
        rel = rel.where("family_name LIKE ? OR first_name LIKE ?", "%#{query}%", "%#{query}%")
      end
      rel
    end

  # session
    def authenticate(email, password)
      member = find_by_email(email)
      if member && member.hashed_password.present? &&
         BCrypt::Password.new(member.hashed_password) == password
        member
      else
        nil
      end
    end
  end
end
