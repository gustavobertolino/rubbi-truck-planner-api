require 'rspec/autorun'

describe "basic_test" do
  describe "sort list" do
    it "sort list in reverse order" do
      @list = [1, 9, 6, 5, 3]
      expect(@list.sort.reverse).to eq([9, 6, 5, 3, 1])
    end
  end
end
