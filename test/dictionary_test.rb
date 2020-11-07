require "minitest/autorun"
require "minitest/pride"
require 'mocha/minitest'
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
    assert_equal ["0.", "..", ".."], @dictionary.look_up("a")
    assert_equal ["0.", "00", "0."], @dictionary.look_up("r")
    assert_equal ["00", "00", ".."], @dictionary.look_up("g")
  end
end
