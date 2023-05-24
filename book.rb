# frozen_string_literal: true

class Book # rubocop:todo Style/Documentation
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def rent_book(person, date)
    Rental.new(date, self, person)
  end
end
