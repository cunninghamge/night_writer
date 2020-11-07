require "minitest/autorun"
require "minitest/pride"
require './lib/dictionary'

class DictionaryTest < Minitest::Test
  def setup
    parent = mock("Translator")
    @dictionary = Dictionary.new(parent)
  end

  def test_it_exists
    assert_instance_of Dictionary, @dictionary
  end

  def test_look_up
    assert_equal ["0.", "..", ".."], @dictionary.look_up
  end
end
