# frozen_string_literal: true

require_relative 'nameable'

class Decorator < Nameable # rubocop:todo Style/Documentation
  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end
