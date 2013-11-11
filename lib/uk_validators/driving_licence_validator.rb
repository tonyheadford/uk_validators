class DrivingLicenceValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    record.errors.add(attribute, invalid_message(record, attribute)) unless valid_driving_licence?(value)
  end

private

  def valid_driving_licence?(value)
    # first 5 letters of surname (padded with 9 if shorter than 5)
    # decade of birth
    # month of birth - 5 is added to first digit if female
    # month day of birth
    # year in decade of birth
    # first name and second name initials (9 used if no second name)
    # computer generated check digits (usually 9 followed by 2 alphabetics)
    # Example: for Susan Ann Davis born 23 November 1978: DAVIS761238SA9WE
    # value =~ /^[A-Z][A-Z9]{4}\d[0156]\d[0123]\d\d[A-Z][A-Z9]\d[A-Z]{2}$/i
    valid = false
    # if we get a valid match then check the date of birth looks valid
    if value.present? && match = value.match(/^[A-Z][A-Z9]{4}(\d)([0156]\d)([0123]\d)(\d)[A-Z][A-Z9]\d[A-Z]{2}$/i)
      decade, month, day, year = match.captures
      yy = (decade + year).to_i
      mm = month.to_i
      dd = day.to_i
      mm -= 50 if mm > 50

      if dd > 0 && mm >= 1 && mm <= 12
        if [4, 6, 9, 11].include? mm
          valid = dd <= 30
        elsif mm == 2
          if dd <= 28
            valid = true
          else
            if dd == 29
              if Date.today.year > (2000 + yy)
                valid = Date.leap?(2000 + yy) || Date.leap?(1900 + yy)
              else
                valid = Date.leap?(1900 + yy)
              end
            end
          end
        else
          valid = dd <= 31
        end
      end
    end
    valid
  end

  def invalid_message(record, attribute)
    I18n.t  :driving_licence,
            scope: "#{record.class.i18n_scope}.errors.models.#{record.class.model_name.i18n_key}.attributes.#{attribute}",
            default: "is not a valid Driving Licence number"
  end

end
