require "./vowel"

describe "vowel" do
  it "checks its vowel" do
    expect("o".vowel?).to eql(true)
  end
end
