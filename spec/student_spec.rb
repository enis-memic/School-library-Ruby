require_relative 'spec_helper'

describe Student do 
    before :each do
        @student = Student.new(18, 'Enis', false, 200) 
    end

    it 'Checking Student instance variable' do
        expect(@student).to be_instance_of Student
    end

    it 'Checking the student name to Enis' do
        name = @student.name
        expect(name).to eq 'Enis'
    end

    it 'Checking the students age' do
        age = @student.age
        expect(age).to eq 18
    end

    it 'Checking the classroom' do
        classroom = @student.classroom
        expect(classroom).to eq 200
    end

    it 'Can use play_hooky service' do
        service = @student.play_hooky
        expect(service).to eql ('¯(ツ)/¯')
    end
end