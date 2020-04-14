class ContactBook
    def initialize
        @dir = {}
        @last_msg = ""
        clear
        ask_cmd
    end
    def clear
        system("clear") || system("cls")
    end
    def ask_cmd
        puts "What would you like to do?"
        puts "-- Type 'add' to add a contact."
        puts "-- Type 'update' to update a contact."
        puts "-- Type 'display' to display all contacts."
        puts "-- Type 'delete' to delete a contact."
        puts "Log: #@last_msg" if not @last_msg.empty?
        cmd = gets.strip.downcase.to_sym
        clear
        ask_cmd unless self.methods.include? cmd
        self.method(cmd).call
    end
    def print_contacts
        @dir.each do |k,v|
            id = @dir.keys.index k
            puts "#{id} Name: #{k.ljust 8} Phone No: #{v.ljust 8}"
        end
    end
    def add
        puts "New contact".center 32,"-"
        def get_name 
            print "What is the contact name? "
            name = gets.strip.split.map{|x| x.capitalize}.join ' '
            if name.empty?
                puts "Name must not be empty"
                name = get_name
            else
                name
            end
        end
        name = get_name
        print "What is the phone number? "
        phone = gets.strip
        @dir[name] = phone
        @last_msg = "Added #{name} to the directory with Phone: #{phone} "
        clear
        ask_cmd
    end
    def update
        if @dir.empty?
            @last_msg = "Nothing to update" 
            return ask_cmd 
        end
        puts "Update contact".center 32,"-"
        print_contacts
        print "Which contact would you like to update? (ID): "
        while @dir.keys.at(target = gets.strip.to_i) == nil
            puts "Invalid Contact, please try again"
        end
        puts "What's the new phone number?"
        while (phone = gets.strip).empty?
            puts "Please input a phone number"
        end
        name=@dir.keys[target]
        @dir[name] = phone
        @last_msg = "Updated #{name} Phone Number"
        clear
        ask_cmd
    end
    def display
        puts "Directory".center 32,"-"
        print_contacts
        @last_msg = ""
        puts "Press Enter to continue"
        gets
        clear
        ask_cmd
    end
    def delete
        if @dir.empty?
            @last_msg = "Nothing to delete" 
            return ask_cmd 
        end
        puts "Delete contact".center 32,"-"
        puts "Which contact would you like to delete"
        print_contacts
        while @dir.keys.at(target = gets.strip.to_i) == nil
            puts "Invalid Contact, please try again"
        end
        name = @dir.keys[target]
        @dir.delete name
        @last_msg = "Removed #{name}"
        clear
        ask_cmd
    end
end

ContactBook.new