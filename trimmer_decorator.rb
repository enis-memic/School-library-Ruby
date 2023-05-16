require_relative 'decorator'
require_relative 'person'
require_relative 'capitalize_decorator'

class TrimmerDecorator < Decorator
    def initialize(nameable)
        super
        @nameable = nameable
    end

    def correct_name
        super[0...10]
    end


end

person = Person.new(22, 'maximilianus')
puts person.correct_name

capitalizedPerson = CapitalizeDecorator.new(person)
puts capitalizedPerson.correct_name

capitalizedTrimmedPerson = TrimmerDecorator.new(capitalizedPerson)
puts  capitalizedTrimmedPerson.correct_name