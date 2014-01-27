function [inputMatrix, outputMatrix] = getDataMatrixFromHandle(handles)

if get(handles.additionalInputCheckbox, 'Value') == 1
    inputMatrix = zeros(2, 5);
    outputMatrix = zeros(1, 5);
    
    inputMatrix(1, 1) = str2double(get(handles.initInput11, 'String'));
    inputMatrix(1, 2) = str2double(get(handles.initInput21, 'String'));
    inputMatrix(1, 3) = str2double(get(handles.initInput31, 'String'));
    inputMatrix(1, 4) = str2double(get(handles.initInput41, 'String'));
    inputMatrix(1, 5) = str2double(get(handles.additionalInput1, 'String'));
    
    inputMatrix(2, 1) = str2double(get(handles.initInput12, 'String'));
    inputMatrix(2, 2) = str2double(get(handles.initInput22, 'String'));
    inputMatrix(2, 3) = str2double(get(handles.initInput32, 'String'));
    inputMatrix(2, 4) = str2double(get(handles.initInput42, 'String'));
    inputMatrix(2, 5) = str2double(get(handles.additionalInput2, 'String'));
    
    outputMatrix(1, 1) = str2double(get(handles.initOutput1, 'String'));
    outputMatrix(1, 2) = str2double(get(handles.initOutput2, 'String'));
    outputMatrix(1, 3) = str2double(get(handles.initOutput3, 'String'));
    outputMatrix(1, 4) = str2double(get(handles.initOutput4, 'String'));
    outputMatrix(1, 5) = str2double(get(handles.additionalOutput, 'String'));
else
    inputMatrix = zeros(2, 4);
    outputMatrix = zeros(1, 4);
    
    inputMatrix(1, 1) = str2double(get(handles.initInput11, 'String'));
    inputMatrix(1, 2) = str2double(get(handles.initInput21, 'String'));
    inputMatrix(1, 3) = str2double(get(handles.initInput31, 'String'));
    inputMatrix(1, 4) = str2double(get(handles.initInput41, 'String'));
    
    inputMatrix(2, 1) = str2double(get(handles.initInput12, 'String'));
    inputMatrix(2, 2) = str2double(get(handles.initInput22, 'String'));
    inputMatrix(2, 3) = str2double(get(handles.initInput32, 'String'));
    inputMatrix(2, 4) = str2double(get(handles.initInput42, 'String'));
    
    outputMatrix(1, 1) = str2double(get(handles.initOutput1, 'String'));
    outputMatrix(1, 2) = str2double(get(handles.initOutput2, 'String'));
    outputMatrix(1, 3) = str2double(get(handles.initOutput3, 'String'));
    outputMatrix(1, 4) = str2double(get(handles.initOutput4, 'String'));
end;

