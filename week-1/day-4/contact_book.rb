# frozen_string_literal: true

# Represents a Contact
class Contact
  # @param [String] name
  # @param [String] number
  def initialize(name, number)
    @name = name
    @number = number
  end

  attr_reader :name
  attr_accessor :number
end

# Manages Contacts
class ContactDirectory
  def initialize
    # @type [Array<Contact>]
    @contacts = []
  end
  attr_reader :contacts

  def empty?
    @contacts.empty?
  end

  # @param [Contact] contact
  def add(contact)
    @contacts << contact
    "Added #{contact.name} to the directory with Phone: #{contact.number}"
  end

  def update(contact_id, new_phone_number)
    @contacts[contact_id].number = new_phone_number
    "Updated #{@contacts[contact_id].name} Phone Number"
  end

  def delete(contact_id)
    contact_name = @contacts[contact_id].name
    @contacts.delete_at contact_id
    "Removed #{contact_name}"
  end
end

# Allows you to keep a list of persons and their contact information
class PhoneBook
  def initialize
    @dir = ContactDirectory.new
    @last_msg = ''
    ask_cmd
  end

  def clear
    system('clear') || system('cls')
  end

  def ask_cmd
    print_actions
    cmd = gets.strip.downcase.to_sym
    clear
    method(cmd).call if methods.include? cmd
    ask_cmd
  end

  def print_actions
    clear
    puts 'What would you like to do?'
    puts "-- Type 'add' to add a contact."
    puts "-- Type 'update' to update a contact."
    puts "-- Type 'display' to display all contacts."
    puts "-- Type 'delete' to delete a contact."
    puts "Log: #{@last_msg}" unless @last_msg.empty?
  end

  def print_contacts
    fmt = ->(text) { text.ljust 8 }
    @dir.contacts.each_with_index do |contact, id|
      puts "#{id} Name: #{fmt[contact.name]} Phone No: #{fmt[contact.number]}"
    end
  end

  # Asks for user input. If a block is given, won't return the answer
  # unless the block returns true
  # @param question [String]
  # @param empty_msg [String]
  # @param allow_empty [Boolean]
  # @yield [String]
  # @yieldparam [String]
  # @yieldreturn [Boolean] Must return true if the input is valid
  def ask(question, allow_empty = true, empty_msg = 'Invalid Input')
    loop do
      print "#{question} "
      answer = gets.strip
      unless (!allow_empty && answer.empty?) || (block_given? && !yield(answer))
        return answer
      end

      puts empty_msg
    end
  end

  def add
    puts 'New contact'.center 32, '-'
    name = ask('What is the contact name?', false, 'Name must not be empty')
    name = name.split.map(&:capitalize).join ' '
    phone = ask 'What is the phone number?'
    @last_msg = @dir.add Contact.new(name, phone)
  end

  def update
    return ((@last_msg = 'Nothing to update') && ask_cmd) if @dir.empty?

    puts 'Update contact'.center 32, '-'
    print_contacts
    target = ask('Which one would you like to update? (ID):', false,
                 'Invalid ID, please try again') do |answer|
                   !@dir.contacts[answer.to_i].nil?
                 end
    phone = ask "What's the new phone number?"
    @last_msg = @dir.update(target.to_i, phone)
  end

  def display
    puts 'Directory'.center 32, '-'
    print_contacts
    @last_msg = ''
    ask 'Press Enter to continue'
  end

  def delete
    return ((@last_msg = 'Nothing to delete') && ask_cmd) if @dir.empty?

    puts 'Delete contact'.center 32, '-'
    print_contacts
    target = ask('Which one would you like to delete?', false,
                 'Invalid ID, please try again') do |answer|
                   !@dir.contacts[answer.to_i].nil?
                 end
    @last_msg = @dir.delete target.to_i
  end
end

PhoneBook.new
