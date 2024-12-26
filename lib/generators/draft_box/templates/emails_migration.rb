class CreateDraftBoxEmails < ActiveRecord::Migration<%= migration_version %>
  def change
    create_table :draft_box_emails<%= primary_key_type %> do |t|
      t.string :subject
      t.text :body
      t.string :from
    <% if mysql? -%>
      t.string :recipients, default: '[]'
      t.string :carbon_copies, default: '[]'
      t.string :blind_copies, default: '[]'
    <% elsif sqlite? %>
      t.json :recipients, null: false, default: []
      t.json :carbon_copies, null: false, default: []
      t.json :blind_copies, null: false, default: []
      t.check_constraint "JSON_TYPE(recipients) = 'array'", name: 'draft_box_emails_recipients_is_array'
      t.check_constraint "JSON_TYPE(carbon_copies) = 'array'", name: 'draft_box_emails_carbon_copies_is_array'
      t.check_constraint "JSON_TYPE(blind_copies) = 'array'", name: 'draft_box_emails_blind_copies_is_array'
    <% else %>
      t.string :recipients, array: true, default: []
      t.string :carbon_copies, array: true, default: []
      t.string :blind_copies, array: true, default: []
    <% end -%>

      t.timestamps
    end
  end
end
