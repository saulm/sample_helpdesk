class SupportRequest < ApplicationRecord
  VALID_STATUSES = ["new", "in progress", "resolved"]

  validates :name, :description, :email, :status, presence: true
  validates :status, inclusion: VALID_STATUSES
  validates :email, email: true
  belongs_to :admin_user, optional: true

  before_update do
    self.status = "resolved" if self.response.present?
  end

  after_update do
    send_email if self.resolved?
  end

  def is_new?
    status == "new"
  end

  def in_progress?
    status == "in progress"
  end

  def resolved?
    status == "resolved"
  end

  private

  def send_email
    Rails.logger.info("Sending email to #{email}: #{response}")
  end
end
