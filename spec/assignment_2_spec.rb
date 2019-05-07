#spec/assignment-2-spec.rb
load './Assignment-2.rb'

RSpec.describe Enumerable do
  describe "#my_any?" do
    context "verify if at least one element is higher than 10." do
      it { expect([1, 4, 8, 9, 11].my_any? {|i| i > 10 }).to eql(true) }
    end

    context "verify if at least one element is an integer." do
      it { expect([nil,"ruby", true, 'a', 11].my_any?(Integer)).to eql(true) }
    end

    context "verify if any element is neither false nor nil" do
      it { expect([nil, false].my_any?).to eql(false) }
    end
  end

  describe "#my_all?" do
    context "check if every element is higher than 5" do
      it { expect([1, 4, 8, 9, 11].my_all? {|i| i > 5}).to eql(false) }
    end

    context "check if every element inside the array is a String" do
      it { expect(["a", "aa", "aaa"].my_all?(String)).to eql(true) }
    end

    context "verify if any element never returns nil or false" do
      it { expect([].my_all?).to eql(true) }
    end

    context "check if every String has 's' in it's content" do
      it { expect(["cats", "dogs", "pigs", "birds"].my_all?(/s/)).to eql(true) }
    end
  end

  describe "#my_select" do
    context "returns an array containing elements that satisfy the condition" do
       it { expect([1, 4, 8, 9, 11].select {|i| i > 10} ).to eql([11]) }
    end
  end

  describe "#my_none?" do
    context "Verify if none of the elements are an integer" do
      it { expect([2.2, "number", true].my_none?(Integer)).to eql(true) }
    end

    context "check if none of the elements returns true" do
      it { expect([nil].my_none?).to eql(true) }
    end

    context "check if none of the elements returns true" do
      it { expect([nil, false, true].my_none?).to eql(false) }
    end
  end

  describe "#my_count" do
    context "return the number of elements in the array" do
      it { expect([1, 2, 3, 4, 5].my_count).to eql(5) }
    end

    context "return the number of elements that are higher than 2" do
      it { expect([1, 2, 3, 4, 5].my_count { |i| i > 2}).to eql(3) }
    end
  end

  describe "#my_map" do
    context "Multiply every single element by 2" do
      it { expect([2, 4, 6, 8, 10].my_map { |i| i * 2}).to eql([4, 8, 12, 16, 20]) }
    end
  end
end
