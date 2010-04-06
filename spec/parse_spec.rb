require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Parse" do
  before(:each) do
    class CoilSelectionCoolingOutput
      attr_accessor :criteria_errors, :ari_errors,
      :face_area, :error_msg
    end
    fmt = [:criteria_errors, :ari_errors, :face_area, :error_msg]
    @parser = Positional::Parse.new(fmt, CoilSelectionCoolingOutput.new)
  end
  
  it "should convert '0' to 0" do
    @parser.convert('0').should == 0
  end
  
  it "should convert '99' to 99" do
    @parser.convert('99').should == 99
  end
  
  it "should convert '18.2'" do
    @parser.convert('18.2').should == 18.2
  end
  
  it "should convert a string" do
    @parser.convert('none').should == 'none'
  end
  
  it "should convert an quoted string" do
    @parser.convert("\"any thing\"").should == 'any thing'
  end
  
  it "should parse input into an object" do
    obj = @parser.parse('0 99 19.01 no')
    obj.criteria_errors.should == 0
    obj.ari_errors.should == 99
    obj.face_area.should == 19.01
    obj.error_msg.should == "no"
  end
  
  it "should parse quoted string input" do
    obj = @parser.parse('0 99 19.01 "no"')
    obj.criteria_errors.should == 0
    obj.ari_errors.should == 99
    obj.face_area.should == 19.01
    obj.error_msg.should == "no"
  end

  it "should find sting start" do
    @parser.string_start?('"any').should be_true
  end
  
  it "should find no string_start" do
    @parser.string_start?('thing').should_not be_true
  end

  it "should find no string_start with string end" do
    @parser.string_start?('thing"').should_not be_true
  end
  
  it "should find string end" do
    @parser.string_end?('any"').should be_true
  end
  
  it "should not find string end" do
    @parser.string_end?('any').should_not be_true
  end

  it "should not find string end for string start" do
    @parser.string_end?('"any').should_not be_true
  end

  it "should cpllect string" do
    @parser.collect_string(['"any', 'thing"']).should == "any thing"
  end

  it "should parse multi-word quoted string input" do
    obj = @parser.parse('0 99 19.01 "any thing"')
    obj.criteria_errors.should == 0
    obj.ari_errors.should == 99
    obj.face_area.should == 19.01
    obj.error_msg.should == "any thing"
  end
  
end