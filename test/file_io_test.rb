require_relative './test_helper'
require './lib/io_to_braille'

class FileIOTest < Minitest::Test
  def setup
    print_args = ['./data/short.txt', 'braille.txt']
    @io_to_braille = FileIO.new(print_args)
    args = ['./data/short_braille.txt', 'message.txt']
    @io_to_print = FileIO.new(braille_args)
  end

  def test_it_exists
    assert_instance_of FileIO, @io_to_braille
  end

  def test_args
    assert_equal './data/short.txt', @io_to_braille.readable
    assert_equal 'braille.txt', @io_to_braille.writeable
  end

  def test_read
    assert_equal "i am here\n", @io_to_braille.read
  end

  def test_it_makes_a_file
    assert_equal true, File.exist?('./braille.txt')
  end

  def test_it_writes_to_file
    expected = ".0..0.00..0.0.0.0.\n0.........00.000.0\n......0.......0...\n"
    assert_equal expected, File.read('./braille.txt')
  end

  def test_it_also_reads_braille
    expected = [".0..0.00..0.0.0.0.\n", "0.........00.000.0\n", "......0.......0...\n"]
    assert_equal expected, @file_io_to_print.read
  end

  def test_it_also_writes_printed_text
    assert_equal "i am here\n", File.read('./message.txt')
  end
end
