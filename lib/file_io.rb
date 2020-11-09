class FileIO
  attr_reader :readable, :writeable

  def initialize(args)
    @readable = args[0]
    @writeable = args[1]
  end

  def read
    File.readlines(@readable)
  end

  def write_to_file(text)
    writer = File.open(@writeable, "w")
    writer.write(text)
    writer.close
  end
end
