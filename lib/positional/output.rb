module Positional
  class Output
    attr_accessor :program, :dir
    
    def initialize(dir, program)
      @dir = dir
      @program = program
    end
    
    def path
      File.join @dir, @program
    end
    
    def puts(message)
      output=''
      IO.popen(path, 'w+') do |io|
        io.write(message)
        output = io.read
      end
      output
    end
  end
end