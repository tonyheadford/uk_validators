class PassportNumberValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    record.errors.add(attribute, invalid_message(record, attribute)) unless valid_passport_number?(value)
  end

private

  # UK format is simply 9 digits
  def valid_passport_number?(value)
    value =~ /^[0-9]{9}$/
  end

  def invalid_message(record, attribute)
    I18n.t  :passport_number,
            scope: "#{record.class.i18n_scope}.errors.models.#{record.class.model_name.i18n_key}.attributes.#{attribute}",
            default: "is not a valid Passport No."
  end

end
