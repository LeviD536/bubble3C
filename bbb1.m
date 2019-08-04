function varargout = bbb1(varargin)
% BBB1 MATLAB code for bbb1.fig
%      BBB1, by itself, creates a new BBB1 or raises the existing
%      singleton*.
%
%      H = BBB1 returns the handle to a new BBB1 or the handle to
%      the existing singleton*.
%
%      BBB1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BBB1.M with the given input arguments.
%
%      BBB1('Property','Value',...) creates a new BBB1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before bbb1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to bbb1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help bbb1

% Last Modified by GUIDE v2.5 19-Feb-2016 10:55:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @bbb1_OpeningFcn, ...
                   'gui_OutputFcn',  @bbb1_OutputFcn, ...
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


% --- Executes just before bbb1 is made visible.
function bbb1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to bbb1 (see VARARGIN)

% Choose default command line output for bbb1
handles.output = hObject;

global flag;
global step;
global x;
global y;
flag=0;
step=0;
x=[40 50 60 40 50 60 40 50 60];
y=[40 40 40 50 50 50 60 60 60];
scatter(x,y);
axis([0 100 0 100]); 
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes bbb1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = bbb1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global flag;
global step;
global x;
global y;
flag=1;

set(handles.pushbutton1, 'string', 'Resume');

R=3;
LMAX=3*R;LMIN=2*R+1;
T=str2double(get(handles.edit1,'string'));

while(flag||step)
    %¼ÆËãxc,yc
    xc=sum(x)/9;
    yc=sum(y)/9;
    
    [lm1,im1]=seekm(x,y,1);% find the point nearest to x1  
    [lm2,im2]=seekm(x,y,2);% find the point nearest to x2
    [lm3,im3]=seekm(x,y,3);
    [lm4,im4]=seekm(x,y,4);% find the point nearest to x4  
    [lm5,im5]=seekm(x,y,5);% find the point nearest to x5
    [lm6,im6]=seekm(x,y,6);
    [lm7,im7]=seekm(x,y,7);% find the point nearest to x7 
    [lm8,im8]=seekm(x,y,8);% find the point nearest to x8
    [lm9,im9]=seekm(x,y,9);
    
    [x1,y1]=locatexyC(x,y,1,lm1,im1,LMAX,LMIN,R,xc,yc);      
    [x2,y2]=locatexyC(x,y,2,lm2,im2,LMAX,LMIN,R,xc,yc); %get x2,y2
    [x3,y3]=locatexyC(x,y,3,lm3,im3,LMAX,LMIN,R,xc,yc);
    [x4,y4]=locatexyC(x,y,4,lm4,im4,LMAX,LMIN,R,xc,yc);      
    [x5,y5]=locatexyC(x,y,5,lm5,im5,LMAX,LMIN,R,xc,yc); %get x5,y5
    [x6,y6]=locatexyC(x,y,6,lm6,im6,LMAX,LMIN,R,xc,yc);
    [x7,y7]=locatexyC(x,y,7,lm7,im7,LMAX,LMIN,R,xc,yc);      
    [x8,y8]=locatexyC(x,y,8,lm8,im8,LMAX,LMIN,R,xc,yc); %get x5,y5
    [x9,y9]=locatexyC(x,y,9,lm9,im9,LMAX,LMIN,R,xc,yc);
    
    % Update the coordinates
    x(1)=x1;y(1)=y1;
    x(2)=x2;y(2)=y2;
    x(3)=x3;y(3)=y3;
    x(4)=x4;y(4)=y4;
    x(5)=x5;y(5)=y5;
    x(6)=x6;y(6)=y6;
    x(7)=x7;y(7)=y7;
    x(8)=x8;y(8)=y8;
    x(9)=x9;y(9)=y9;
    % margin limit
    for j=1:1:9
        if(x(j)>100)
            x(j)=100;
        elseif(x(j))<0
            x(j)=0;
        end
        if(y(j)>100)
            y(j)=100;
        elseif(y(j))<0
            y(j)=0;
        end
    end
    % plot the points
    scatter(x,y);
    axis([0 100 0 100]); 
    % show in the table
    %lm=[lm1;lm2;lm3;lm4;lm5;lm6;lm7;lm8;lm9];
    set(handles.uitable1,'Data',[x' y';sum(x)/9 sum(y)/9]);
    if(step==1)     
        step=0;
        break;
    else
        pause(T);
    end
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global flag;
flag=0;


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x;
global y;
x=[40 50 60 40 50 60 40 50 60];
y=[40 40 40 50 50 50 60 60 60];
scatter(x,y);
axis([0 100 0 100]);
set(handles.uitable1,'Data',[x' y';50 50]);
set(handles.pushbutton1, 'string', 'Start');



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global step;
step=1;
pushbutton1_Callback(hObject, eventdata, handles);
