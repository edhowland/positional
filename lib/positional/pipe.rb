
module Positional
  class Pipe
    attr_accessor :input, :input_map, :putput, :output_map, "program" 
    def initialize(input, input_map, output, output_map, program)
      @input = input
      @output = output
      @input_map = input_map
      @output_map = output_map
      @program = program
    end
    def connect
      @vals = ''
      @formatter = Positional::Format.new(@input_map, @input)
      
      IO.popen(@program, 'w+') do |p|
        p.puts @formatter.to_s
        @vals = p.gets
      end
      
      parser = Positional::Parse.new(@output_map, @output)
      @output = parser.parse(@vals)
      @result = $?
      @result == 0
    end
  end
end