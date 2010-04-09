
module Positional
  class Pipe
    attr_accessor :input, :input_map, :putput, :output_map, :program,
      :input_value, :output_value
    def initialize(input, input_map, output, output_map, program)
      @input = input
      @output = output
      @input_map = input_map
      @output_map = output_map
      @program = program
    end
    
      
    def connect
      @formatter = Positional::Format.new(@input.extend Positional::Decorator::Message)
      @input_value = @formatter.to_s(@input_map)
      
      IO.popen(@program, 'w+') do |p|
        p.puts @input_value
        @output_value = p.gets
      end
      @result = $?
      @output_value.chomp!
      
      parser = Positional::Parse.new(@output.extend Positional::Decorator::Message)
      @output = parser.parse(@output_value, @output_map)
      @result == 0
    end
  end
end