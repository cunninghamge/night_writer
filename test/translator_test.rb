require "minitest/autorun"
require "minitest/pride"
require './lib/translator'

class TranslatorTest < Minitest::Test
  def setup
    incoming = File.read('./data/sentence.txt')
    @translator = Translator.new(incoming)
  end

  def test_it_exists
    assert_instance_of Translator, @translator
  end

  def test_attributes
    expected = "this sentence has more than forty characters\n"
    assert_equal expected, @translator.incoming
  end
end
