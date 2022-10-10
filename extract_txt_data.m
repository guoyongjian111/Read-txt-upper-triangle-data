clc
close all
clear 
txtPath   = uigetdir([],'txt file path');  %%%% get the directory name of txt file
Dir = dir(fullfile(txtPath,'*.txt'));  %%%% find all the txt file in your folder
FileNames = {Dir.name};

for f = 1:numel(FileNames)
    Data = load(fullfile(txtPath,FileNames{f}));
    Upper_triangular_data = triu(Data,1)';
    Upper_triangular_data = Upper_triangular_data(Upper_triangular_data ~=0);
    filename = [FileNames{f}(1:end-4),'_Upper_triangular_data.txt'];
    filefullname= fullfile(txtPath,filename);
    % writematrix(Upper_triangular_data,filefullname);
    save(filefullname,'Upper_triangular_data','-ascii');
end