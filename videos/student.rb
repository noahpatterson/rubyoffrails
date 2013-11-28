Student = Struct.new(:first_name,:last_name,:grade) do

# class Student
	# attr_reader :first_name, :last_name, :grade
	# def initialize(first_name,last_name, grade)
	# 	@first_name = first_name
	# 	@last_name = last_name
	# 	@grade = grade
	# end

	def senior?
		grade ==12
	end

	def to_s
		"#{last_name}, #{first_name}"
	end
end

	def seniors(students)
		# senior_students = []
		# students.each do |student|
		# 	senior_students.push(student) if student.senior?
		# end
		# return senior_students 
		students.select {|student| student.senior?}
	end



jeff = Student.new('harris', 'jeff', 12)
sarah = Student.new('jane','sarah',12)
bill = Student.new('bob', 'bill', 9)

students = [jeff,sarah,bill]
# students.each do |student|
# 	puts student.seniors	
# end

seniors(students).each do |student|
	puts student
end


