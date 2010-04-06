require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Positional" do
  before(:all) do
    Dir.chdir 'spec' # for IO.popen
  end
  describe "Output" do
    before(:each) do
      @dir = '.'  
      @program = 'coilselectioncooling'
      @outputter = Positional::Output.new(@dir, @program)
    end
    it "should have existing program" do
      File.exist?(@outputter.path).should be_true
    end
    it "should send output to coilselection cooling" do
      @outputter.puts('dummy').should == %q{Runtime error 106 at $0804B60C
  $0804B60C
  $0804809F
}
    end
  end
end
