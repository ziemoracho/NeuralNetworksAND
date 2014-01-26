function [dataMatrix] = getDataMatrixFromHandle(handles)

dataMatrix = zeros(3, 4);

dataMatrix(1, 1) = str2double(get(handles.initInput11, 'String'));
dataMatrix(1, 2) = str2double(get(handles.initInput21, 'String'));
dataMatrix(1, 3) = str2double(get(handles.initInput31, 'String'));
dataMatrix(1, 4) = str2double(get(handles.initInput41, 'String'));

dataMatrix(2, 1) = str2double(get(handles.initInput12, 'String'));
dataMatrix(2, 2) = str2double(get(handles.initInput22, 'String'));
dataMatrix(2, 3) = str2double(get(handles.initInput32, 'String'));
dataMatrix(2, 4) = str2double(get(handles.initInput42, 'String'));

dataMatrix(3, 1) = str2double(get(handles.initOutput1, 'String'));
dataMatrix(3, 2) = str2double(get(handles.initOutput2, 'String'));
dataMatrix(3, 3) = str2double(get(handles.initOutput3, 'String'));
dataMatrix(3, 4) = str2double(get(handles.initOutput4, 'String'));