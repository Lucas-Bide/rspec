require './lib/enumerable'

RSpec.describe Enumerable do
  describe ".my_select" do
    it "returns an array containing the elements from the original array that match the selection criterion" do
      expect([1,2,3,4,5,6,7].my_select {|n| n < 4}).to eql([1,2,3])
    end

    it "returns an object ID when no block is passed" do
      expect([3,5,3,1,3].my_select).to eql("#<Enumerator: [3,5,3,1,3]:my_select>")
    end

    it "returns an empty array when no element matches the criterion" do
      expect(["a", '20'].my_select {|s| s.is_a? Integer}).to eql([])
    end

    it "returns original array when all elements match the criterion" do
      expect(["a", '20', 6, :map].my_select {|s| true}).to eql(["a", '20', 6, :map])
    end

    it "returns an empty array given an empty array" do
      expect([].my_select {|s| true}).to eql([])
    end
  end
end