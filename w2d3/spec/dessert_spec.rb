require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", :titleize => "Michelin 3 Star Chef de Cuisine Kee", :bake => "bake more") }
  let(:dessert) { Dessert.new("icecream", 100, chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq("icecream")
    end

    it "sets a quantity" do
      expect(dessert.quantity).to eq(100)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to be_empty
    end

    let(:another_dessert) { Dessert.new("cookies", "one hundred", chef) }

    it "raises an argument error when given a non-integer quantity" do
      expect{ another_dessert }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      dessert.add_ingredient("milk")
      expect(dessert.ingredients).to include("milk")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      allow(dessert.ingredients).to receive(:shuffle!)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      dessert.eat(20)
      expect(dessert.quantity).to eq(80)
    end

    it "raises an error if the amount is greater than the quantity" do
      dessert.eat(90)
      expect { dessert.eat(20) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      expect(dessert.serve).to include(chef.titleize)
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      dessert.make_more
      allow(chef).to receive(:bake)
    end
  end
end
