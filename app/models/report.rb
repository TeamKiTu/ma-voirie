class Report < ApplicationRecord
  after_create :send_confirmation_email
  belongs_to :user
  enum :status, ["en cours de validation", "validé", "accepté","en cours","résolu"]

  validates :address, presence: true
  validates :content, presence: true, length: { minimum: 20, maximum: 550 }
  validates :title, presence: true, length: { minimum: 15, maximum: 60 }

  has_many_attached :images, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :replies, through: :comments
  has_many :report_likes, dependent: :destroy

  def send_confirmation_email
    ReportMailer.report_confirmation(self.user).deliver_now
    ReportMailer.admin_report_notification(self.user).deliver_now
  end

end