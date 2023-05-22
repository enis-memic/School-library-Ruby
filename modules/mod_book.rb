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

  def books_with_index
    @books.each_with_index do |book, index|
      text = "#{index}: "
      book.instance_variables.each do |var|
        val = book.instance_variable_get(var)
        var = var.to_s.delete('@')
        text += "#{var}:#{val} " unless var.include?('rentals') || var.include?('classroom')
      end
      puts text
    end
  end
end
