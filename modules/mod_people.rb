require_relative '../person'
require_relative '../student'
require_relative '../teacher'

module ModPeople
  def list_people
    @people.each do |person|
      if person.is_a?(Student)
        puts "[Student] Name: #{person.name}, ID: #{person.object_id}, Age: #{person.age}"
      elsif person.is_a?(Teacher)
        puts "[Teacher] Name: #{person.name}, ID: #{person.object_id}, Age: #{person.age}"
      else
        puts "Name: #{person.name}"
      end
      puts "\n"
    end
  end

  def create_person
    puts 'Do you want to create a student(1) or a teacher(2)?'
    choice = gets.chomp

    if choice == '1'
      puts 'Age:'
      age = gets.chomp
      puts 'Name:'
      name = gets.chomp
      puts 'Has parent permission? [Y/N]'
      parent_permission = gets.chomp.upcase == 'Y'
      student = Student.new(age, name, parent_permission)
      @people.push(student)
      puts 'You added student successfully'
    elsif choice == '2'
      puts 'Age:'
      age = gets.chomp
      puts 'Name:'
      name = gets.chomp
      puts 'Specialization:'
      specialization = gets.chomp
      teacher = Teacher.new(age, name, specialization)
      @people.push(teacher)
      puts 'You added teacher successfully'
    else
      puts 'Your input is wrong!'
    end
  end

  def people_with_index
    @people.each_with_index do |person, index|
      text = "#{index}: "
      person.instance_variables.each do |var|
        val = person.instance_variable_get(var)
        var = var.to_s.delete('@')
        text += "#{var}:#{val} " unless var.include?('rentals') || var.include?('classroom')
      end
      puts text
    end
  end
end
