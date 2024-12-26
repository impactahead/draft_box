class CreateDraftBoxAttachments < ActiveRecord::Migration<%= migration_version %>
  def change
    create_table :draft_box_attachments<%= primary_key_type %> do |t|
      t.references :draft_box_email, null: false, foreign_key: true
      t.string :filename
      t.string :content_type
      t.binary :data
    end
  end
end

