require_relative './test_helper'
require './lib/translator'

class TranslatorTest < Minitest::Test
  def setup
    args = ['./data/short.txt', 'braille.txt']
    @translator = Translator.new(args)
  end

  def test_it_exists
    assert_instance_of Translator, @translator
  end

  def test_it_makes_braille_lines
    actual = @translator.create_braille_lines
    assert_instance_of Array, actual
    all_braille = actual.all? do |line|
      line.class == BrailleLine
    end
    assert_equal true, all_braille
  end
end
