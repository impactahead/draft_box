class CreateDraftBoxEmails < ActiveRecord::Migration<%= migration_version %>
  def change
    create_table :draft_box_emails<%= primary_key_type %> do |t|
      t.string :subject
      t.text :body
      t.string :from
      t.string :to, array: true, default: []
      t.string :cc, array: true, default: []
      t.string :bcc, array: true, default: []

      t.timestamps
    end
  end
end
