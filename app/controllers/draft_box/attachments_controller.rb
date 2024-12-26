module DraftBox
  class AttachmentsController < ApplicationController
    def show
      @email = DraftBox::Email.find(params[:email_id])
      @attachment = @email.attachments.find(params[:id])

      send_data @attachment.data, filename: @attachment.filename, type: @attachment.content_type
    end
  end
end
