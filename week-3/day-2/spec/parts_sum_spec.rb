require "./parts_sum"

describe "parts_sum" do
  it "returns n times the string" do
    expect(parts_sums([0, 1, 3, 6, 10])).to eql([20, 20, 19, 16, 10, 0])
  end
end
