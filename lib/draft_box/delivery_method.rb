module DraftBox
  class DeliveryMethod
    attr_accessor :settings

    def initialize(options = {})
      self.settings = options
    end

    def deliver!(mail)
      validate_mail!(mail)

      ActiveRecord::Base.transaction do
        email = DraftBox::Email.create!(
          subject: mail.subject,
          body: mail.parts.empty? ? mail.body.to_s : mail.parts.find { |p| p.content_type.start_with?('text/html', 'text/plain') }&.body.to_s,
          from: mail.from.first,
          recipients: mail.to,
          carbon_copies: mail.cc || [],
          blind_copies: mail.bcc || []
        )

        mail.attachments.each do |attachment|
          email.attachments.create!(
            filename: attachment.filename,
            content_type: attachment.content_type,
            data: attachment.body.to_s
          )
        end
      end
    end

    private

    def validate_mail!(mail)
      if !mail.smtp_envelope_from || mail.smtp_envelope_from.empty?
        raise ArgumentError, "SMTP From address may not be blank"
      end

      if !mail.smtp_envelope_to || mail.smtp_envelope_to.empty?
        raise ArgumentError, "SMTP To address may not be blank"
      end
    end
  end
end
