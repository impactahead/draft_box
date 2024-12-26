module DraftBox
  class Attachment < ApplicationRecord
    self.table_name = 'draft_box_attachments'

    belongs_to :email, class_name: 'DraftBox::Email', foreign_key: :draft_box_email_id
  end
end
