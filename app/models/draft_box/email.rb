module DraftBox
  class Email < ApplicationRecord
    self.table_name = 'draft_box_emails'

    has_many :attachments, class_name: 'DraftBox::Attachment', dependent: :destroy, foreign_key: :draft_box_email_id

    if connection.class.to_s.match?(/mysql/i)
      serialize :recipients, coder: JSON
      serialize :carbon_copies, coder: JSON
      serialize :blind_copies, coder: JSON
    end
  end
end

