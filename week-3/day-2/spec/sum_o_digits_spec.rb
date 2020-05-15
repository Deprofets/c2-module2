require "./sum_o_digits"

describe "sum_o_digits" do
  it "returns the recursive sum of digits" do
    expect(digital_root(1234)).to eql(1)
  end
end
