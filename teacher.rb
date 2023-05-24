require_relative 'person'

class Teacher < Person # rubocop:todo Style/Documentation
  attr_reader :specialization

  def initialize(age, name, specialization)
    super(age, name)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
