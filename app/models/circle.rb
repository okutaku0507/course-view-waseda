#coding: utf-8
class Circle < ActiveRecord::Base
  include PasswordChecker
  
  has_one :circle_creater, class_name: "CircleCreater", dependent: :destroy
  has_one :image, class_name: "CircleTopImage", dependent: :destroy
  
  attr_accessor :password, :password_confirmation
  attr_accessible :title, :headline, :circle_type, :belong, :genre, :open, :detail, :password, :password_confirmation, :image_attributes
  accepts_nested_attributes_for :image, allow_destroy: true
  
  validates :title, presence: true
  validates :headline, presence: true
  validates :circle_type, presence: true
  validates :belong, presence: true
  validates :genre, presence: true
  validates :open, presence: true
  validates :detail, presence: true
  
  validates :password,  presence: {on: :update},confirmation: { allow_blank: true, on: :update}, length: { minimum: 8, maximum: 16, on: :update}
  
  validate :check_password
  
  def password=(val)
    if val.present?
      self.hashed_password = BCrypt::Password.create(val)
    end
    @password = val
  end
  
  scope :search, lambda { |params|
    rel = order("id")
    if params[:circle_keywords].present?
      circle = params[:circle_keywords]
       words = circle.split(/ +/)
        conditions = []
        values = []
        words.each do |word|
          conditions << "genre LIKE ?"
          conditions << "detail LIKE ?"
          values << "%#{word}%"
          values << "%#{word}%"
        end
        rel = rel.where(conditions.join(" OR "), *values)
    end
    
    rel
  }
  
  private
  
  def check_password
    if password.present?
        errors.add(:password, :invalid) unless 
           well_formed_as_password(password)
    end
  end
  
  class << self
  
  def authenticate(id, password)
      circle = find_by_id(id)
      if circle && circle.hashed_password.present? &&
         BCrypt::Password.new(circle.hashed_password) == password
        circle
      else
        nil
      end
    end
  end
end
