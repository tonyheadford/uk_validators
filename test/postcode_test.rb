require_relative 'test_helper'

class TestPostcodeValidator < MiniTest::Unit::TestCase
  class User < TestModel
    validates :postcode, postcode: true
  end

  def test_valid_postcodes
    valid_postcodes.each { |postcode| assert User.new(postcode: postcode).valid?, "Postcode should be valid: #{postcode}" }
  end

  def test_invalid_postcodes
    invalid_postcodes.each { |postcode| assert User.new(postcode: postcode).invalid?, "Postcode should be invalid: #{postcode}" }
  end

private

  def valid_postcodes
    [
      'EC2N 2DB',     # AA9A 9AA format
      'EC1A1BB',
      'W1A 1HQ',      # A9A 9AA format
      'N1C1AA',
      'S2 4SU',       # A9 9AA format
      'M11AA',
      'B33 8TH',      # A99 9AA format
      'G109WW',
      'CR2 6XH',      # AA9 9AA format
      'BS13PE',
      'RG12 1WA',     # AA99 9AA format
      'EH991SP',
      'AI-2640',      # Anguilla
      'ASCN 1ZZ',     # Ascension Island
      'ASCN1ZZ',
      'STHL 1ZZ',     # St. Helena
      'STHL1ZZ',
      'TDCU 1ZZ',     # Tristanda Cunha
      'TDCU1ZZ',
      'BBND 1ZZ',     # British Indian Ocean Territory
      'BBND1ZZ',
      'BIQQ 1ZZ',     # British Antarctic Territory
      'BIQQ1ZZ',
      'FIQQ 1ZZ',     # Falkland Islands
      'FIQQ1ZZ',
      'GX11 1AA',     # Gibraltar
      'GX111ZZ',
      'PCRN 1ZZ',     # Pitcairn Islands
      'PCRN1ZZ',
      'SIQQ 1ZZ',     # South Georgia and South Sandwich Islands
      'SIQQ1ZZ',
      'TKCA 1ZZ',     # Turks and Caicos Islands
      'TKCA1ZZ',
      'GIR 0AA',      # Girobank / Santander
      'GIR0AA',
    ]
  end

  def invalid_postcodes
    [
      # invalid 1st pos characters - Q,V,X
      'QB1 1AA',
      'V2 4SU',
      'XA12 2AB',

      # invalid 2nd pos characters - I,J,Z
      'BI9 1AA',
      'CJ12 2SA',
      'AZ9 9WC',

      # invalid 3rd pos characters - I,L,M,N,O,Q,R,V,X,Y,Z
      'W1I 1ST',
      'W1L 1ST',
      'W1M 1ST',
      'W1N 1ST',
      'W1O 1ST',
      'W1Q 1ST',
      'W1R 1ST',
      'W1V 1ST',
      'W1X 1ST',
      'W1Y 1ST',
      'W1Z 1ST',

      # invalid 4th pos characters - C,D,F,G,I,J,K,L,O,Q,S,T,U,Z
      'EC1C 2WA',
      'EC1D 2WA',
      'EC1F 2WA',
      'EC1G 2WA',
      'EC1I 2WA',
      'EC1J 2WA',
      'EC1K 2WA',
      'EC1L 2WA',
      'EC1O 2WA',
      'EC1Q 2WA',
      'EC1S 2WA',
      'EC1T 2WA',
      'EC1U 2WA',
      'EC1Z 2WA',

      # invalid final 2 letters, C,I,K,M,O,V
      'BS15 3CE',
      'BS15 3IE',
      'BS15 3KE',
      'BS15 3ME',
      'BS15 3OE',
      'BS15 3VE',
      'BS15 3PC',
      'BS15 3PI',
      'BS15 3PK',
      'BS15 3PM',
      'BS15 3PO',
      'BS15 3PV',

      '',
      ' ',
      '1w23 12e'
    ]
  end
end
