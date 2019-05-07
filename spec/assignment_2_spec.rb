#spec/assignment-2-spec.rb
load './Assignment-2.rb'

RSpec.describe Enumerable do
  describe "#my_any" do
    it "returns true if the block ever returns a value other than false or nil." do
      test_array = [1, 4, 8, 9, 11]
      expect(test_array.my_any? {|i| i > 10 }).to eql(true)
    end

    it "returns true if the block ever returns a value other than false or nil." do
      test_array = [nil,"ruby", true, 'a', 11]
      expect(test_array.my_any?(Integer)).to eql(true)
    end

    it "returns true if the block ever returns a value other than false or nil." do
      test_array = [nil, false]
      expect(test_array.my_any?).to eql(false)
    end
  end
end
