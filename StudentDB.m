classdef StudentDB
    properties
        Students = {};  % Cell array to hold Student objects
    end
    
    methods
        % This method adds new students
        function obj = addStudent(obj, student)
            obj.Students{end+1} = student;
        end
        
        % This method is used to find a student based on ID
        function student = findStudentByID(obj, ID)
            student = [];
            for i = 1:length(obj.Students)
                if strcmp(obj.Students{i}.ID, ID)
                    student = obj.Students{i};
                    return;
                end
            end
            if isempty(student)
                fprintf('Student with ID %s not found.\n', ID);
            end
        end
        
        % This method is used to get students by major 
        function studentsByMajor = getStudentsByMajor(obj, major)
            studentsByMajor = {};
            for i = 1:length(obj.Students)
                if strcmp(obj.Students{i}.Major, major)
                    studentsByMajor{end+1} = obj.Students{i};
                end
            end
        end
        
        % This saves the databse to a file 
        function saveToFile(obj, filename)
            try
                save(filename, 'obj');
                fprintf('Database saved to %s\n', filename);
            catch
                fprintf('Error saving to file.\n');
            end
        end
        
        % This loads a database from a file 
        function obj = loadFromFile(obj, filename)
            try
                loadedData = load(filename, 'obj');
                obj = loadedData.obj;
                fprintf('Database loaded from %s\n', filename);
            catch
                fprintf('Error loading from file.\n');
            end
        end
        
        % This plots the GPAS
        function plotGPADistribution(obj)
            gpas = cellfun(@(s) s.GPA, obj.Students);
            histogram(gpas);
            title('GPA Distribution');
            xlabel('GPA');
            ylabel('Number of Students');
        end
        
        % This plots the average GPA by the major 
        function plotAverageGPAByMajor(obj)
            majors = unique(cellfun(@(s) s.Major, obj.Students, 'UniformOutput', false));
            avgGPA = zeros(length(majors), 1);
            for i = 1:length(majors)
                majorGpas = cellfun(@(s) s.GPA, obj.getStudentsByMajor(majors{i}));
                avgGPA(i) = mean(majorGpas);
            end
            bar(categorical(majors), avgGPA);
            title('Average GPA by Major');
            xlabel('Major');
            ylabel('Average GPA');
        end

        % This plots the age distribution 
        function plotAgeDistribution(obj)
            ages = cellfun(@(s) s.Age, obj.Students);
            histogram(ages);
            title('Age Distribution');
            xlabel('Age');
            ylabel('Number of Students');
        end
    end
end
