function varargout = gui(varargin)
% GUI MATLAB code for gui.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui

% Last Modified by GUIDE v2.5 26-Jan-2014 11:39:05

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before gui is made visible.
function gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui (see VARARGIN)

% Choose default command line output for gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in plotOutputSurfaceBtn.
function plotOutputSurfaceBtn_Callback(hObject, eventdata, handles)
plotOutputSurface();


% --- Executes on button press in plotSwitchFunctionBtn.
function plotSwitchFunctionBtn_Callback(hObject, eventdata, handles)
plotSwitchFunction();


% --- Executes on button press in initNetworkBtn.
function initNetworkBtn_Callback(hObject, eventdata, handles)
dataMatrix = getDataMatrixFromHandle(handles);
activFunction = get(get(handles.activFunctionGroup, 'SelectedObject'), 'Tag');
switch activFunction
    case 'activFunctionRadioLin'
        [weights, bias] = initializeNetwork('purelin', dataMatrix);
    case 'activFunctionRadioThr'
        [weights, bias] = initializeNetwork('logsig_hard', dataMatrix);
    case 'activFunctionRadioSig'
        [weights, bias] = initializeNetwork('logsig', dataMatrix);
end;
set(handles.networkWeight1, 'String', roundTo(weights(1), 3));
set(handles.networkWeight2, 'String', roundTo(weights(2), 3));
set(handles.networkBias, 'String', roundTo(bias(1), 3));
handles.dataMatrix = dataMatrix;
guidata(hObject, handles);


% --- Executes on button press in trainNetworkBtn.
function trainNetworkBtn_Callback(hObject, eventdata, handles)
dataMatrix = handles.dataMatrix;
numEpochs = str2double(get(handles.numEpochs, 'String'));
learningRate = str2double(get(handles.learningRate, 'String'));
momentum = str2double(get(handles.momentum, 'String'));
[weights, bias] = trainNetwork(dataMatrix, numEpochs, learningRate, momentum);
set(handles.networkWeight1, 'String', roundTo(weights(1), 4));
set(handles.networkWeight2, 'String', roundTo(weights(2), 4));
set(handles.networkBias, 'String', roundTo(bias(1), 4));


function momentum_Callback(hObject, eventdata, handles)
% hObject    handle to momentum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of momentum as text
%        str2double(get(hObject,'String')) returns contents of momentum as a double


% --- Executes during object creation, after setting all properties.
function momentum_CreateFcn(hObject, eventdata, handles)
% hObject    handle to momentum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function learningRate_Callback(hObject, eventdata, handles)
% hObject    handle to learningRate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of learningRate as text
%        str2double(get(hObject,'String')) returns contents of learningRate as a double


% --- Executes during object creation, after setting all properties.
function learningRate_CreateFcn(hObject, eventdata, handles)
% hObject    handle to learningRate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function numEpochs_Callback(hObject, eventdata, handles)
% hObject    handle to numEpochs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of numEpochs as text
%        str2double(get(hObject,'String')) returns contents of numEpochs as a double


% --- Executes during object creation, after setting all properties.
function numEpochs_CreateFcn(hObject, eventdata, handles)
% hObject    handle to numEpochs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function testInput1_Callback(hObject, eventdata, handles)
% hObject    handle to testInput1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of testInput1 as text
%        str2double(get(hObject,'String')) returns contents of testInput1 as a double


% --- Executes during object creation, after setting all properties.
function testInput1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to testInput1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function testInput2_Callback(hObject, eventdata, handles)
% hObject    handle to testInput2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of testInput2 as text
%        str2double(get(hObject,'String')) returns contents of testInput2 as a double


% --- Executes during object creation, after setting all properties.
function testInput2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to testInput2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in testOutputBtn.
function testOutputBtn_Callback(hObject, eventdata, handles)
% hObject    handle to testOutputBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = [0 0];
input(1) = str2double(get(handles.testInput1, 'String'));
input(2) = str2double(get(handles.testInput2, 'String'));
output = roundTo(testNetwork(input), 4);
set(handles.testOutput, 'String', output);


function initOutput4_Callback(hObject, eventdata, handles)
% hObject    handle to initOutput4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of initOutput4 as text
%        str2double(get(hObject,'String')) returns contents of initOutput4 as a double


% --- Executes during object creation, after setting all properties.
function initOutput4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to initOutput4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function initOutput3_Callback(hObject, eventdata, handles)
% hObject    handle to initOutput3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of initOutput3 as text
%        str2double(get(hObject,'String')) returns contents of initOutput3 as a double


% --- Executes during object creation, after setting all properties.
function initOutput3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to initOutput3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function initOutput2_Callback(hObject, eventdata, handles)
% hObject    handle to initOutput2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of initOutput2 as text
%        str2double(get(hObject,'String')) returns contents of initOutput2 as a double


% --- Executes during object creation, after setting all properties.
function initOutput2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to initOutput2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function initOutput1_Callback(hObject, eventdata, handles)
% hObject    handle to initOutput1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of initOutput1 as text
%        str2double(get(hObject,'String')) returns contents of initOutput1 as a double


% --- Executes during object creation, after setting all properties.
function initOutput1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to initOutput1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function initInput42_Callback(hObject, eventdata, handles)
% hObject    handle to initInput42 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of initInput42 as text
%        str2double(get(hObject,'String')) returns contents of initInput42 as a double


% --- Executes during object creation, after setting all properties.
function initInput42_CreateFcn(hObject, eventdata, handles)
% hObject    handle to initInput42 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function initInput32_Callback(hObject, eventdata, handles)
% hObject    handle to initInput32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of initInput32 as text
%        str2double(get(hObject,'String')) returns contents of initInput32 as a double


% --- Executes during object creation, after setting all properties.
function initInput32_CreateFcn(hObject, eventdata, handles)
% hObject    handle to initInput32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function initInput22_Callback(hObject, eventdata, handles)
% hObject    handle to initInput22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of initInput22 as text
%        str2double(get(hObject,'String')) returns contents of initInput22 as a double


% --- Executes during object creation, after setting all properties.
function initInput22_CreateFcn(hObject, eventdata, handles)
% hObject    handle to initInput22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function initInput12_Callback(hObject, eventdata, handles)
% hObject    handle to initInput12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of initInput12 as text
%        str2double(get(hObject,'String')) returns contents of initInput12 as a double


% --- Executes during object creation, after setting all properties.
function initInput12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to initInput12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function initInput41_Callback(hObject, eventdata, handles)
% hObject    handle to initInput41 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of initInput41 as text
%        str2double(get(hObject,'String')) returns contents of initInput41 as a double


% --- Executes during object creation, after setting all properties.
function initInput41_CreateFcn(hObject, eventdata, handles)
% hObject    handle to initInput41 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function initInput31_Callback(hObject, eventdata, handles)
% hObject    handle to initInput31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of initInput31 as text
%        str2double(get(hObject,'String')) returns contents of initInput31 as a double


% --- Executes during object creation, after setting all properties.
function initInput31_CreateFcn(hObject, eventdata, handles)
% hObject    handle to initInput31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function initInput21_Callback(hObject, eventdata, handles)
% hObject    handle to initInput21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of initInput21 as text
%        str2double(get(hObject,'String')) returns contents of initInput21 as a double


% --- Executes during object creation, after setting all properties.
function initInput21_CreateFcn(hObject, eventdata, handles)
% hObject    handle to initInput21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function initInput11_Callback(hObject, eventdata, handles)
% hObject    handle to initInput11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of initInput11 as text
%        str2double(get(hObject,'String')) returns contents of initInput11 as a double


% --- Executes during object creation, after setting all properties.
function initInput11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to initInput11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
