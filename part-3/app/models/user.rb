class User < ActiveRecord::Base
  has_many :organized_potlucks, class_name: :Potluck, foreign_key: :organizer_id
  has_many :attended_potlucks, class_name: :Attending, foreign_key: :guest_id
  
  validates_presence_of :email, :username, :password
  validates_uniqueness_of :email, :username
  validate :password_minimum_six_characters
  
  include BCrypt

  def password 
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @raw_password = new_password
    self.password_hash = Password.create(new_password)
  end

  def authenticate(password_attempt)
    password == password_attempt
  end

  def password_minimum_six_characters
    errors.add(:password, "must be at least six characters long") unless @raw_password.length >= 6
  end

end
