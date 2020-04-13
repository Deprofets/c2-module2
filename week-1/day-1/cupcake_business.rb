class CupcakeBusiness
    @@presentations = [1,6,12]
    @@ingredients = {
        "Bread" =>{
            "Vanilla" => 0.50,
            "Chocolate" => 0.75,
            "Red Velvet" => 0.85,
        },
        "Frosting" => {
            "Vanilla" => 0.60,
            "Oreo" => 1.10,
            "Mint chocolate" => 1.45,
        },
        "Filling" =>  {
            "Nutella" => 1.00,
            "Strawberry" => 0.55,
            "Peanut butter" => 0.45,
        }
    }
    
    @@breads = @@ingredients["Bread"]
    @@frostings = @@ingredients["Frosting"]
    @@fillings = @@ingredients["Filling"]

    def ask_qty
        print("How many would you like? 1, 6, 12? ")
        @qty = gets.to_i
        return ask_qty unless @@presentations.include? @qty
    end

    def ask_bread
        
        print "Which bread? #{@@breads.keys.join ', '}? "
        @bread = gets.strip.capitalize
        return ask_bread unless @@breads.include? @bread
    end

    def ask_frosting
        
        print "Which frosting? #{@@frostings.keys.join ', '}? "
        @frosting = gets.strip.capitalize
        return ask_frosting unless @@frostings.include? @frosting
    end

    def ask_filling
        
        print "Which filling? #{@@fillings.keys.join ', '}?"
        @filling = gets.strip.capitalize
        unless @@fillings.include? @filling or @filling.empty?
            return ask_filling
        end
    end

    def show_total
        total = @@breads[@bread] + @@frostings[@frosting]
        puts total
        total+= @@fillings[@filling] unless @filling.empty?
        case @qty
        when 1
            discount = 0
        when 6
            discount = 4
        else
            discount = 10
        end
        total*= @qty*(100-discount)/100.0
        total = total.round 2
        puts "Your order: #{@qty} #{@bread} bread #{@filling} filled cupcakes with #{@frosting} frosting"
        puts "Total: #{total}, Discount applied: #{discount}%"
    end
end

shop = CupcakeBusiness.new
shop.ask_qty
shop.ask_bread
shop.ask_frosting
shop.ask_filling
shop.show_total