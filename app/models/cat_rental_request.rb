class CatRentalRequest < ActiveRecord::Base

  validates :cat_id, :start_date, :end_date, presence: true
  validates :status, inclusion: { in: ["PENDING", "APPROVED", "DENIED"]}

  validate :cannot_have_overlapping_approved_requests

  belongs_to :cat

  def overlapping_requests
    CatRentalRequest.where(cat_id: cat_id).where.not(id: id)
    .where("(start_date BETWEEN :starting_date AND :ending_date) OR (end_date BETWEEN :starting_date AND :ending_date)",
      starting_date: start_date, ending_date: end_date)

  end

  def overlapping_approved_requests
    if status == "APPROVED"
      overlapping_requests.where(status: "APPROVED")
    else
      []
    end
  end

  def overlapping_pending_requests
    overlapping_requests.where(status: "PENDING")
  end

  def approve!
    transaction do
      self.status = "APPROVED"
      save!
      overlapping_pending_requests.each do |non_important_request|
        non_important_request.deny!
      end
    end
  end

  def deny!
    self.status = "DENIED"
    save!
  end

  private

  def cannot_have_overlapping_approved_requests
    if overlapping_approved_requests.count > 0
      errors[:overlapping_approved_requests] << "Can't have overlapping approved requests!"
    end
  end

end
