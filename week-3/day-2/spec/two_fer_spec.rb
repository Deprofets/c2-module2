require "./two_fer"

describe "two_fer" do
  it "greets you" do
    expect(two_fer(name: "johnny")).to eql("One for johnny, one for me.")
  end
end
