require "rails/generators"

module Generators
  module DraftBox
    class InstallGenerator < ::Rails::Generators::Base
      source_root File.expand_path("templates", __dir__)

      namespace "draft_box:install"
      desc "Creates a DraftBox migration files."

      def create
        timestamp = Time.zone.now.to_s.tr('^0-9', '')[0..13]
        template "emails_migration.rb", "db/migrate/#{timestamp}_create_draft_box_emails.rb"

        timestamp = (Time.zone.now + 1).to_s.tr('^0-9', '')[0..13]
        template "attachments_migration.rb", "db/migrate/#{timestamp}_create_draft_box_attachments.rb"
      end

      private

      def migration_version
        "[#{Rails::VERSION::MAJOR}.#{Rails::VERSION::MINOR}]"
      end

      def primary_key_type
        primary_key_string
      end
 
      def primary_key_string
        key_string = options[:primary_key_type]
        ", id: :#{key_string}" if key_string
      end
    end
  end
end
