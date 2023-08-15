# frozen_string_literal = true
# Custom contact info validator for JSON type contact info

class ContactInfoValidator < ActiveModel::Validator
  def validate(record)
    if phone_values?(record)
      record.errors.add :phone, "Must add at least one phone number"
    end

    address_values(record)
    email_values(record) unless record.instance_of?(User)
  end

  private

  def phone_values?(record)
    phones = %w[ phone_1 phone_2 ]
    begin
      record.contact_info[phones[0]]&.empty? && record.contact_info[phones[1]]&.empty?
    rescue NoMethodError
      record.errors.add :phone, "Must add at least one phone number"
    end
  end

  def email_values(record)
    emails = %w[email_1 email_2]
    begin
      (record.contact_info[emails[0]]&.empty? || record.contact_info[emails[1]]&.empty?)
    rescue NoMethodError
      record.errors.add :email, "Must have at least one email"
    end
  end

  def address_values(record)
    address_fields = %w[ street_address city state zip ]

    begin
      address_fields.each do |field|
        if record.address[field].empty?
          record.errors.add field.to_sym, "Must have a valid value"
        end
      end
    rescue NoMethodError
      record.errors.add :address, "Must have address field"
    end
  end
end
