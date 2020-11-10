require_relative './test_helper'
require './lib/print_translator'

class PrintTranslatorTest < Minitest::Test
  def setup
    args = ['./data/short_braille.txt', 'message.txt']
    @translator = PrintTranslator.new(args)
  end

  def test_it_exists
    assert_instance_of PrintTranslator, @translator
  end

  def test_it_makes_a_file_io
    assert_instance_of FileIO, @translator.file_io
  end

  def test_it_makes_a_parser
    assert_instance_of BrailleParser, @translator.parser
  end

  def test_create_line_objects
    actual = @translator.create_line_objects
    assert_instance_of Array, actual
    all_lines = actual.all? do |line|
      line.class == Line
    end
    assert_equal true, all_lines
  end

  def test_separate_braille_lines
    expected = []
    assert_equal expected, @translator.separate_braille_lines
  end

  def test_translate_lines
    args = ['./data/one_char.txt', 'braille.txt']
    translator = PrintTranslator.new(args)

    expected = [[".0..0.00..0.0.0.0.\n", "0.........00.000.0\n", "......0.......0...\n"]]
    assert_equal expected, translator.lines[0].translated_text
  end

  def test_compile_lines
    assert_equal "i am here\n", translator.compile_lines
  end

  def test_multiple_lines
    args = ['./data/sentence_braille.txt', 'message.txt']
    @translator = PrintTranslator.new(args)

    expected = "this sentence has more than forty\ncharacters\nthis one does not\n"
    assert_equal expected, parser.compile_print
  end
end
