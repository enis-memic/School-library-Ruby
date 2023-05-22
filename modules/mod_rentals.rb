require_relative '../book'
require_relative '../person'

module ModRentals

    def create_rental
        puts 'Select a book from the following list by number'
        books_with_index
        selected_book = gets.chomp.to_i
        puts 'Select a person from the following list by number (not ID)'
        people_with_index
        selected_person = gets.chomp.to_i
        print 'Date: '
        date = gets.chomp
        book = @books[selected_book]
        person = @people[selected_person]
        rental = Rental.new(date, book, person)
        @rentals.push(rental)
        puts 'Rental created successfully'
      end
    
      def list_rentals
        print 'To see person rentals enter the person ID: '
        id = gets.chomp.to_i
        puts 'Rented Books:'
        @rentals.each do |rental|
          person = rental.instance_variable_get(:@person)
          person_id = person.instance_variable_get(:@id)
    
          next unless person_id == id
    
          book = rental.instance_variable_get(:@book)
          title = book.instance_variable_get(:@title)
          author = book.instance_variable_get(:@author)
          puts "Date: #{rental.date} Book: #{title} by Author: #{author} "
        end
      end


end