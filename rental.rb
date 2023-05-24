# frozen_string_literal: true

class Rental # rubocop:todo Style/Documentation
  attr_accessor :date, :person, :book

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
  end
end
