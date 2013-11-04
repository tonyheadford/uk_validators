class NinoValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    record.errors.add(attribute, invalid_message(record, attribute)) unless valid_nino?(value)
  end

private

  def valid_nino?(value)
    value =~ /^[A-CEGHJ-PRSTW-Z][A-CEGHJ-NPRSTW-Z][0-9]{6}[A-D\s]$/i && value !~ /^(GB|BG|NK|KN|TN|NT|ZZ)/i
  end

  def invalid_message(record, attribute)
    I18n.t  :nino,
            scope: "#{record.class.i18n_scope}.errors.models.#{record.class.model_name.i18n_key}.attributes.#{attribute}",
            default: "is not a valid National Insurance No."
  end

end
