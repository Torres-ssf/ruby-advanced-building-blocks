#spec/assignment-2-spec.rb
load './Assignment-2.rb'

RSpec.describe Enumerable do
  let(:test_array_1) { [1, 4, 8, 9, 11] }
  let(:test_array_2) { [1, 2, 3, 4, 5] }
  describe "#my_any?" do
    it "verify if at least one element is higher than 10." do
       expect(test_array_1.my_any? {|i| i > 10 }).to eql(true)
    end

    it "verify if at least one element is an integer." do
      expect([nil,"ruby", true, 'a', 11].my_any?(Integer)).to eql(true)
    end

    it "verify if any element is neither false nor nil" do
      expect([nil, false].my_any?).to eql(false)
    end
  end

  describe "#my_all?" do
    it "check if every element is higher than 5" do
      expect(test_array_1.my_all? {|i| i > 5}).to eql(false)
    end

    it "check if every element inside the array is a String" do
      expect(["a", "aa", "aaa"].my_all?(String)).to eql(true)
    end

    it "verify if any element never returns nil or false" do
      expect([].my_all?).to eql(true)
    end

    it "check if every String has 's' in it's content" do
      expect(["cats", "dogs", "pigs", "birds"].my_all?(/s/)).to eql(true)
    end
  end

  describe "#my_select" do
    it "returns an array containing elements that satisfy the condition" do
      expect(test_array_1.select {|i| i > 10} ).to eql([11])
    end
  end

  describe "#my_none?" do
    it "Verify if none of the elements are an integer" do
      expect([2.2, "number", true].my_none?(Integer)).to eql(true)
    end

    it "check if none of the elements returns true" do
      expect([nil].my_none?).to eql(true)
    end

    it "check if none of the elements returns true" do
      expect([nil, false, true].my_none?).to eql(false)
    end
  end

  describe "#my_count" do
    it "return the number of elements in the array" do
      expect(test_array_2.my_count).to eql(5)
    end

    it "return the number of elements that are higher than 2" do
      expect(test_array_2.my_count { |i| i > 2}).to eql(3)
    end
  end

  describe "#my_map" do
    it "Multiply every single element by 2" do
      expect([2, 4, 6, 8, 10].my_map { |i| i * 2}).to eql([4, 8, 12, 16, 20])
    end
  end

  describe "#my_inject" do
    it "return the multiplication of every single one element." do
      expect(test_array_2.my_inject { |i, y| i * y}).to eql(120)
    end

    it "return the sum of every single one element." do
      expect(test_array_2.my_inject { |i, y| i + y}).to eql(15)
    end

    it "return the division of every single one element." do
      expect([10000, 100, 10].my_inject { |i, y| i / y}).to eql(10)
    end
  end
end
