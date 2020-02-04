function varargout = monte_carlo_gui(varargin)
% MONTE_CARLO_GUI MATLAB code for monte_carlo_gui.fig
%      MONTE_CARLO_GUI, by itself, creates a new MONTE_CARLO_GUI or raises the existing
%      singleton*.
%
%      H = MONTE_CARLO_GUI returns the handle to a new MONTE_CARLO_GUI or the handle to
%      the existing singleton*.
%
%      MONTE_CARLO_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MONTE_CARLO_GUI.M with the given input arguments.
%
%      MONTE_CARLO_GUI('Property','Value',...) creates a new MONTE_CARLO_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before monte_carlo_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to monte_carlo_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help monte_carlo_gui

% Last Modified by GUIDE v2.5 08-May-2017 20:50:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @monte_carlo_gui_OpeningFcn, ...
    'gui_OutputFcn',  @monte_carlo_gui_OutputFcn, ...
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


% --- Executes just before monte_carlo_gui is made visible.
function monte_carlo_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to monte_carlo_gui (see VARARGIN)

% Choose default command line output for monte_carlo_gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes monte_carlo_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = monte_carlo_gui_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



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


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

SUBWAY_NUM = randi(2)+10;
SUBWAY_DELAY = randi(3);

BUS_NUM = randi(2)+15;
BUS_DELAY = randi(2);

SHUTTLE_INPUT = get(handles.edit1,'string');
SHUTTLE_INPUT_NUM = str2num(SHUTTLE_INPUT{1});
    %
    
for cnt = 1:1:max(SUBWAY_NUM)
    if cnt == 1
        SUBWAY_TIME(cnt) = SUBWAY_DELAY;
        continue;
    end
    SUBWAY_TIME(cnt) = SUBWAY_TIME(cnt-1) + randi(2)+3;
end

for cnt1 = 1:1:SUBWAY_NUM
    if (cnt1 == 1)
        SUBWAY_MEMBER(cnt1) = round(randn(1)+42);
        continue;
    elseif (cnt1 ==2 ) || (cnt1 == 3)
        SUBWAY_MEMBER(cnt1) = round(2*randn(1)+65);
        continue;
    elseif (cnt1 >= 4) && (cnt1 <= 6)
        SUBWAY_MEMBER(cnt1) = round(3*randn(1)+100);
        continue;
    elseif (cnt1 == 7)
        SUBWAY_MEMBER(cnt1) = round(10*randn(1)+120);
        continue;
    elseif (cnt1 ==8 ) || (cnt1 == 9 )
        SUBWAY_MEMBER(cnt1) = round(2*randn(1)+150);
        continue;
    else 
        SUBWAY_MEMBER(cnt1) = round(5*randn(1)+130);
    end
end

for cnt_B1 = 1:1:BUS_NUM
    if cnt_B1 == 1
        BUS_TIME(cnt_B1) = BUS_DELAY;
        continue;
    end
    BUS_TIME(cnt_B1) = BUS_TIME(cnt_B1-1) + randi(3)+1;
end

for cnt_B2 = 1:1:BUS_NUM
    if (cnt_B2 <= 2)
        BUS_MEMBER(cnt_B2) = round(4*randn(1)+30);
        continue;
    elseif (cnt_B2 == 3)
        BUS_MEMBER(cnt_B2) = round(2*randn(1)+34);
        continue;
    else
        BUS_MEMBER(cnt_B2) = round(randn(1)+43);
    end
end
%

cnt_3 = 1;
for SUB_INDEX = 1:1:46%max(SUBWAY_TIME)
    if(SUBWAY_TIME(cnt_3)==SUB_INDEX)
        FINAL_SUB_MEMBER(SUB_INDEX) = SUBWAY_MEMBER(cnt_3);
        cnt_3 = cnt_3+1;
    else
        FINAL_SUB_MEMBER(SUB_INDEX) = 0;
    end
end

cnt = 1;
for BUS_INDEX = 1:1:46%max(BUS_TIME)
    if(BUS_TIME(cnt)==BUS_INDEX)
        FINAL_BUS_MEMBER(BUS_INDEX) = BUS_MEMBER(cnt);
        cnt = cnt+1;
    else
        FINAL_BUS_MEMBER(BUS_INDEX) = 0;
    end
end


cnt_ST2 =1;
SHUTTLE_T = 0;
while(1)
    if(SHUTTLE_INPUT_NUM==10)
        SHUTTLE_TIME=[7 11 15 19 23 27 31 35 39 43 47];
        break;
    end
      if(SHUTTLE_INPUT_NUM==8)
          SHUTTLE_TIME=[6 10 14 18 22 26 30 34 38 42 46];
          break;
      end
    
    SHUTTLE_T = SHUTTLE_T + fix(45/SHUTTLE_INPUT_NUM); 
    if(SHUTTLE_T>45)
        break;
    end
    SHUTTLE_TIME(cnt_ST2)=SHUTTLE_T;
    cnt_ST2 = cnt_ST2+1; 
end
if(SHUTTLE_INPUT_NUM~=8 )
    if(SHUTTLE_INPUT_NUM==10 )
    else
        SHUTTLE_TIME(cnt_ST2) = 0;
    end
end

cnt_ST3 = 1;
for SHUTTLE_INDEX = 0:1:45
    if(SHUTTLE_TIME(cnt_ST3) == SHUTTLE_INDEX)
        SHUTTLE_MEMBER(SHUTTLE_INDEX+1) = randi(5)+50;
       cnt_ST3 = cnt_ST3 +1;
    else
    SHUTTLE_MEMBER(SHUTTLE_INDEX+1) = 0;
    end
end



REMAIN_MEMBER=randi(10)+20;

for REMAIN_INDEX = 1:1:46
    if(FINAL_SUB_MEMBER(REMAIN_INDEX) > 0)
        REMAIN_MEMBER = REMAIN_MEMBER + FINAL_SUB_MEMBER(REMAIN_INDEX);
    end
    
    if(FINAL_BUS_MEMBER(REMAIN_INDEX) >0 )
        REMAIN_MEMBER = REMAIN_MEMBER - FINAL_BUS_MEMBER(REMAIN_INDEX);
    end
    
    if( SHUTTLE_MEMBER(REMAIN_INDEX) >0 )
        REMAIN_MEMBER = REMAIN_MEMBER - SHUTTLE_MEMBER(REMAIN_INDEX);
    end
    
    if(REMAIN_MEMBER < 0)
        TOTAL(REMAIN_INDEX) = 0;
        REMAIN_MEMBER=0;
    else
        TOTAL(REMAIN_INDEX) = REMAIN_MEMBER;
    end
end

for wow = 0 : 1 : 45
    pause(0.01)
    axes(handles.axes1);
    bar(wow,TOTAL(wow+1),'g','EdgeColor','k');
    axis([0 46 0 700]);
    xlabel('시간(분)');
    ylabel('기다리는 인원(명)');
    hold on;
    
    axes(handles.axes2)
    bar(wow,FINAL_SUB_MEMBER(wow+1),'r','EdgeColor','k');
    %bar(t,FINAL_SUB_MEMBER);
    axis([0 46 0 250]);
    xlabel('시간(분)');
    ylabel('지하철 - 하차 인원(명)');
    hold on; 
   
    axes(handles.axes3)
    bar(wow,FINAL_BUS_MEMBER(wow+1),'y','EdgeColor','k');
    bar(wow,SHUTTLE_MEMBER(wow+1),'b','EdgeColor','k');
    %bar(t,FINAL_BUS_MEMBER);
    axis([0 46 0 60]);
    xlabel('시간(분)');
    ylabel('버스 - 탑승 인원(명)');
    hold on;
    
    set(handles.text3,'string',FINAL_SUB_MEMBER(wow+1));
    set(handles.text4,'string',FINAL_BUS_MEMBER(wow+1)+SHUTTLE_MEMBER(wow+1));
    set(handles.text5,'string',TOTAL(wow+1));
    set(handles.text10,'string',wow);
end





% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
