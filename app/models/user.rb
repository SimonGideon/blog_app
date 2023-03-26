class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :trackable
  has_many :posts
  has_many :comments
  has_many :likes
  validates :name, presence: true

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end

  def after_confirmation
    WelcomeMailer.send_greetings_notification(self).deliver_now
  end

  def admin?
    role == 'admin'
  end
end
