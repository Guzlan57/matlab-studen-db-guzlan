% Author Name: Jude Guzlan
% Email: guzlan57@rowan.edu
% Course: MATLAB Programming - Fall 2024
% Assignment: MidTerm
% Task: Student Database Management  
% Date: October 30th, 2024

db = StudentDB();

% This is the samples for each student 
db = db.addStudent(Student('001', 'Alice', 20, 3.5, 'Engineering'));
db = db.addStudent(Student('002', 'Bob', 22, 3.8, 'Science'));
db = db.addStudent(Student('003', 'Charlie', 21, 2.9, 'Engineering'));
db = db.addStudent(Student('004', 'David', 23, 3.2, 'Mathematics'));

% This displays the students info 
student = db.findStudentByID('001');
if ~isempty(student)
    student.displayInfo();
end

% Get list of students by major
studentsByMajor = db.getStudentsByMajor('Engineering');
fprintf('Students in Engineering:\n');
for i = 1:length(studentsByMajor)
    studentsByMajor{i}.displayInfo();
end

% This saves a database to a file 
db.saveToFile('StudentDatabase.mat');

% This loads a database to a file 
db = db.loadFromFile('StudentDatabase.mat');

% This shows the different figure plots 
figure;
subplot(3, 1, 1);
db.plotGPADistribution();

subplot(3, 1, 2);
db.plotAverageGPAByMajor();

subplot(3, 1, 3);
db.plotAgeDistribution();
