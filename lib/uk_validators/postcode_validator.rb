class PostcodeValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    record.errors.add(attribute, invalid_message(record, attribute)) unless valid_postcode?(value)
  end

private

  def valid_postcode?(value)
    value =~ /^([A-PR-UWYZ]([0-9]{1,2}|([A-HK-Y][0-9]|[A-HK-Y][0-9]([0-9]|[ABEHMNPRV-Y]))|[0-9][A-HJKS-UW])\s?[0-9][ABD-HJLNP-UW-Z]{2}|(GIR\s?0AA)|(AI-2640)|(SAN\s?TA1)|(BFPO\s?(C\/O\s)?[0-9]{1,4})|((ASCN|BBND|[BFS]IQQ|PCRN|STHL|TDCU|TKCA)\s?1ZZ))$/i
  end

  def invalid_message(record, attribute)
    I18n.t  :postcode,
            scope: "#{record.class.i18n_scope}.errors.models.#{record.class.model_name.i18n_key}.attributes.#{attribute}",
            default: "is not a valid postcode."
  end

end
