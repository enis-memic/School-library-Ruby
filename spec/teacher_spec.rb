# frozen_string_literal: true

require_relative 'spec_helper'

describe Teacher do
  before :each do
    @teacher = Teacher.new(45, 'Esther', 'Math')
  end

  it 'Checking Teacher instance variable' do
    expect(@teacher).to be_instance_of Teacher
  end

  it 'Checking the name of the teacher' do
    name = @teacher.name
    expect(name).to eq 'Esther'
  end

  it 'Checking the age of a teacher' do
    age = @teacher.age
    expect(age).to eq 45
  end

  it 'Checking the specialization of teacher' do
    specialization = @teacher.specialization
    expect(specialization).to eq 'Math'
  end

  it 'Checking can_use_services' do
    services = @teacher.can_use_services?
    expect(services).to be_truthy
  end
end
