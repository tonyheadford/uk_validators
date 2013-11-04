require_relative 'test_helper'

class TestNinoValidator < MiniTest::Unit::TestCase
  class User < TestModel
    validates :ni_number, nino: true
  end

  def test_valid_ninos
    valid_ninos.each { |nino| assert User.new(ni_number: nino).valid?, "Bad nino #{nino}" }
  end

  def test_invalid_ninos
    invalid_ninos.each { |nino| assert User.new(ni_number: nino).invalid? }
  end

private

  def valid_ninos
    [
      'aa123456a',
      'bb940321b',
      'cc987654c',
      'ee903221d',
      'gg849302 ', # apparently space is valid for the final character
      'hh123849a',
      'jj123849b',
      'kk123849c',
      'll123849d',
      'mm123849 ',
      'nn123849a',
      'on123849b',
      'pp123849c',
      'rr123849d',
      'ss123849 ',
      'tt123849a',
      'ww123849b',
      'xx123849c',
      'yy123849d',
      'za123849 '
    ]
  end

  def invalid_ninos
    [
      'aa123456e',
      'bb940321f',
      'cc987654g',
      'ee903221h',
      'gg849302i',
      'hh123849j',
      'jj123849k',
      'kk123849l',
      'll123849m',
      'mm123849n',
      'nn123849o',
      'on123849p',
      'pp123849q',
      'rr123849r',
      'ss123849s',
      'tt123849t',
      'ww123849u',
      'xx123849v',
      'yy123849w',
      'zz123849x',
      'aa123456y',
      'bb940321z',
      'cc9854c',
      'e',
      'ga',
      '1w',
      'a ',
      'a1',
      ' ',
      '2s123456a',
      'a4123849c',
      'll 23849d',
      'mm1e3849 ',
      'nn12f849a',
      'on123b49b',
      'pp1238v9c',
      'rr12389md',
      's1238492a',
      'gb123849a',
      'bg123849b',
      'nk123849c',
      'kn123849d',
      'tn123849a',
      'nt123849b',
      'zz123849c'
    ]
  end
end

