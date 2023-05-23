require 'json'
require 'fileutils'

class SaveData
  def self.create_file(path, array)
    FileUtils.mkdir_p('./data')
    FileUtils.touch(path) unless File.exist?(path)
    File.write(path, JSON.pretty_generate(array))
  end

  def self.save_books(books)
    books_array = books.map { |book| { title: book.title, author: book.author } }
    return if books_array.empty?

    create_file('./data/books.json', books_array)
  end
end
