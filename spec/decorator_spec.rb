# frozen_string_literal: true

require_relative 'spec_helper'

describe Decorator do
  context 'When testing the Decorator class' do
      it 'Should create a new instance of Decorator' do # rubocop:todo Layout/IndentationWidth
          new_person = Person.new(54, 'Esther') # rubocop:todo Layout/IndentationWidth
          expect(Decorator.new(new_person)).to be_instance_of(Decorator)
      end
  end
end
