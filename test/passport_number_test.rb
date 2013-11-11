require_relative 'test_helper'

class TestPassportNumberValidator < MiniTest::Unit::TestCase
  class HolidayMaker < TestModel
    validates :passport, passport_number: true
  end

  def test_valid_passport_numbers
    valid_passport_numbers.each { |passport| assert HolidayMaker.new(passport: passport).valid?, "Passport No. should be valid: #{passport}" }
  end

  def test_invalid_passport_numbers
    invalid_passport_numbers.each { |passport| assert HolidayMaker.new(passport: passport).invalid?, "Passport No. should be invalid: #{passport}" }
  end

private

  def valid_passport_numbers
    [
      '012345678',
      '987654321',
      '000000000',
      '111111111',
      '222222222',
      '333333333',
      '444444444',
      '555555555',
      '666666666',
      '777777777',
      '888888888',
      '999999999',
    ]
  end

  def invalid_passport_numbers
    [
      '01234567',
      '9876543',
      '012345',
      '98765',
      '0123',
      '987',
      '01',
      '9',
      '',
      ' ',
      'a12345678',
      '0b2345678',
      '01b345678',
      '012c45678',
      '0123d5678',
      '01234e678',
      '012345f78',
      '0123456g8',
      '01234567h',
      'ijklmnopq',
      '1234&*()['
    ]
  end
end
