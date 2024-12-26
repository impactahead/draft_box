unless Rails.respond_to?(:autoloaders) && Rails.autoloaders.zeitwerk_enabled?
  require_dependency 'draft_box/application_controller'
end

module DraftBox
  class EmailsController < ApplicationController
    before_action :set_emails, only: [:index, :show]

    def index; end

    def show
      @email = DraftBox::Email.find(params[:id])
    end

    def destroy
      DraftBox::Email.find(params[:id]).destroy!
      redirect_to draft_box.emails_path
    end

    def destroy_all
      DraftBox::Email.destroy_all
      redirect_to draft_box.emails_path
    end

    private

    def set_emails
      @emails = DraftBox::Email.includes(:attachments).order(created_at: :desc)
    end
  end
end
