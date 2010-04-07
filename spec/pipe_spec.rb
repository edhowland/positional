require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Pipe" do
  class Input
    attr_accessor :arg1, :arg2, :parm1, :parm2
  end
  
  class Output
    attr_accessor :error_code, :error_message, :calc1, :calc2, :temp1
  end
  
  before(:each) do
    input_map = [:arg1, :arg2, :parm1, :parm2]
    output_map = [:error_code, :error_message, :calc1, :calc2, :temp1]
    @input = Input.new
    @output = Output.new
    program = File.join('spec', 'coilselectionheating')
    @pipe = Positional::Pipe.new @input, input_map, @output, output_map, program 
  end
  
  it "should map and connect up input and output and be true" do
    @input.arg1 = 1
    @input.arg2 = 0.3
    @input.parm1 = 'F'
    @input.parm2 = 0
    @pipe.connect.should be_true
    @output.error_code.should == 0
    @output.error_message.should == "X"
    @output.calc1.should == 32.0
    @output.calc2.should == 0.0
    @output.temp1.should == 212
  end
  it "should map and connect up incorrect valies for input and be false" do
    @input.arg1 = 1
    @input.arg2 = 0.3
    @input.parm1 = 'C'
    @input.parm2 = 32
    @pipe.connect.should be_false
    @output.error_code.should == 255
    @output.error_message.should == "Incorrect value for Celcuiys"
    @output.calc1.should == 0
    @output.calc2.should == 0
    @output.temp1.should == 0
  end
end