require_relative 'test_helper'

class TestDrivingLicenceValidator < MiniTest::Unit::TestCase
  class User < TestModel
    validates :licence_number, driving_licence: true
  end

  def test_valid_driving_licences
    valid_licences.each { |licence| assert User.new(licence_number: licence).valid?, "Licence should be valid: #{licence}" }
  end

  def test_invalid_driving_licences
    invalid_licences.each { |licence| assert User.new(licence_number: licence).invalid?, "Licence should be invalid: #{licence}" }
  end

private

  def valid_licences
    [
      'ABCDE703120AB9AB',
      'ABCD9703120AB9AB',
      'ABC99703120AB9AB',
      'AB999703120AB9AB',
      'A9999703120AB9AB',
      'ABCDE752292AB9AB',
      'ABCDE753120AB9AB',
      'ABCDE761120AB9AB',
      'ABCDE703220AB9AB',
      'ABCDE703310AB9AB',
    ]
  end

  def invalid_licences
    [
      '',
      '1BCDE402149AB8AB',
      'A2CDE402149AB8AB',
      'AB3DE402149AB8AB',
      'ABC4E402149AB8AB',
      'ABCD5402149AB8AB',
      'ABCDEF02149AB8AB',
      'ABCDE4G2149AB8AB',
      'ABCDE4GH149AB8AB',
      'ABCDE4G2I49AB8AB',
      'ABCDE4G21J9AB8AB',
      'ABCDE4G214KAB8AB',
      'ABCDE4G21491B8AB',
      'ABCDE4G2149A28AB',
      'ABCDE4G2149ABVAB',
      'ABCDE4G2149AB81B',
      'ABCDE4G2149AB8A2',
      'ABCDE402149AB8A',
      'ABCDE402149AB8',
      'ABCDE402149AB',
      'ABCDE402149A',
      'ABCDE402149',
      'ABCDE40214',
      'ABCDE4021',
      'ABCDE402',
      'ABCDE40',
      'ABCDE4',
      'ABCDE',
      'ABCD',
      'ABC',
      'AB',
      'A',
      'ABCDE402149AB8AB1',
      'ABCDE763120AB9AB',
      'ABCDE702300AB9AB',
      'ABCDE752294AB9AB',

    ]
  end
end

