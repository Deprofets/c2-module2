$input = <<doc
Category, (Symbol) Price, Stock, Amount, Name
Sporting Goods, USD 49.99, true, 10, Football
Sporting Goods, PEN 9.99, true, 3, Baseball
Sporting Goods, ARS 29.99, false, 0, Basketball
Electronics, PEN 99.99, true, 5, iPod Touch
Electronics, USD 399.99, false, 0, iPhone 5
Electronics, PEN 199.99, true, 2, Nexus 7
doc

# Transform it to an array of hashes and print out the total USD value of goods
# in stock, as well as the product with the most stock value in the storage.
RATES = {
  USD: { PEN: 3, ARS: 40, USD: 1 },
}.freeze

def transform(input)
  db = input.lines[1..-1].map do |line|
    cat, price, stock, amount, name = line.split ', '
    currency, value = price.split
    {
      cat: cat,
      currency: currency.to_sym,
      value: value.to_f,
      stock: eval(stock),
      amount: amount.to_i,
      name: name.chomp,
    }
  end

  usd = lambda { |value, currency| currency == :USD ? value : value / RATES.dig(:USD, currency) }
  # most expensive product
  costly = db.max_by { |item| item[:amount] * usd[item[:value], item[:currency]] }
  # total
  total = db.reduce(0) do |sum, entry|
    sum + (entry[:stock] ? usd[entry[:value], entry[:currency]] * entry[:amount] : 0)
  end

  [costly, total]
end

p transform $input
