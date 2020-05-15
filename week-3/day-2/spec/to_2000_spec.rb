require "./to_2000"

describe "to_2000" do
  it "greets you" do
    expect("hola como estas".to_2000).to eql("HoLa cOmO EsTaS")
  end
end
