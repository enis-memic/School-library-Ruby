# frozen_string_literal: true

require_relative 'spec_helper'
describe Classroom do
  before :each do
       @classroom = Classroom.new(18) # rubocop:todo Layout/IndentationWidth
  end
  it 'Should have a instance' do
    expect(@classroom).to be_instance_of Classroom
  end
  it 'Should have a Class Number 18' do
    class_number = @classroom.label
      expect(class_number).to be(18) # rubocop:todo Layout/IndentationConsistency
  end
end
