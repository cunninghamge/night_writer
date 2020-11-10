require_relative './test_helper'
require './lib/braille_translator'

class BrailleTranslatorTest < Minitest::Test
  def setup
    args = ['./data/short.txt', 'braille.txt']
    @translator = Translator.new(args)
  end

  def test_it_exists
    assert_instance_of Translator, @translator
  end

  def test_it_makes_a_file_io
    assert_instance_of FileIO, @translator.file_io
  end

  def test_it_makes_a_parser
    assert_instance_of PrintParser, @translator.parser
  end

  def test_create_line_objects
    actual = @translator.create_line_objects
    assert_instance_of Array, actual
    all_lines = actual.all? do |line|
      line.class == Line
    end
    assert_equal true, all_lines
  end

  def test_separate_print_lines
    text = "this sentence has more than forty characters.\n"

    expected = ["this sentence has more than forty", "characters."]
    assert_equal expected, @translator.separate_lines(text)
  end

  def test_translate_lines
    @translator.translate_lines
    expected = [["0.", "..", ".."], ["0.", "0.", ".."]]
    assert_equal expected, @translator.lines[0].translated_text
  end

  def test_compile_lines
    printed = File.readlines('./data/short.txt')
    translator = BrailleTranslator.new(printed)
    expected = ".0..0.00..0.0.0.0.\n0.........00.000.0\n......0.......0...\n"
    assert_equal expected, translator.compile_lines
  end
end
