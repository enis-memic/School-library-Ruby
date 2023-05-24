# frozen_string_literal: true

require_relative 'spec_helper'

describe Person do # rubocop:todo Metrics/BlockLength
  before :each do
    @person = Person.new(20, 'Enis')
  end

  it 'Should have a instance' do
    expect(@person).to be_instance_of Person
  end

  it 'Have an empty rentals' do
    rentals = @person.rentals
    expect(rentals).to eq []
  end

  it 'It should have name Enis' do
    name = @person.name
    expect(name).to eq 'Enis'
  end

  it 'Should have age of 20' do
    age = @person.age
    expect(age).to eq 20
  end

  it 'Can it use services' do
    services = @person.can_use_services?
    expect(services).to be_truthy
  end

  it 'Can not use services if person is younger than 18' do
    sample = Person.new(13, 'Esther')
    person_service = sample.can_use_services?
    expect(person_service).to be_falsy
  end
end
