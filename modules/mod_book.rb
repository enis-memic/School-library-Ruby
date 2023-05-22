require_relative '../book'
require_relative '../app'

module ModBook
  def list_books
    @books.each do |book|
      book.instance_variables.each do |var|
        text = ''
        value = book.instance_variable_get(var)
        var = var.to_s.delete('@')
        var = var.capitalize
        text += "#{var}:#{value}" unless var.include?('Rentals')
        puts text
      end
    end
  end

  def create_book
    puts 'Title:'
    title = gets.chomp
    puts 'Author:'
    author = gets.chomp
    book = Book.new(title, author)
    @books.push(book)
    puts 'Book created successfully'
  end
end
