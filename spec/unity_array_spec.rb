class UnityArray < Array
  alias :old_ndx :[]
  def [](index)
    raise StandardError.new("Range error (#{index < 1 ? '<' : '>'})") if index < 1 or index > length
    old_ndx(index-1)
  end
end

describe "1 based Array" do
  before(:each) do
    @qs=UnityArray.new 20
  end
  it "should raise error if out of range" do
    lambda {@qs[0]}.should raise_error
    lambda {@qs[21]}.should raise_error
  end
  it "should not raise error if in ramge" do
    lambda {@qs[1]}.should_not raise_error
    lambda {@qs[20]}.should_not raise_error
  end
end
