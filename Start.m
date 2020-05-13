clc; %for clearing the command window
clear; %for clearing the workspace,freeing up system memory

filename="flower.mp4";
vid = VideoReader(filename); %reading the video

%*********************** convert movie to grayscale********************

%******* It will be save at matlab path:'C:\Windows\System32' *********
newVid = VideoWriter('grayFlower.avi');
open(newVid);
numFrames = vid.NumFrames;

for frame = 1 : numFrames
    % Extract the frame from the movie structure.
    thisFrame = read(vid, frame); 
    %Convert each frame to black and white
    gray = rgb2gray(thisFrame);  
    writeVideo(newVid,gray); 
end
close(newVid); 
%******************************* END ***********************************

%************** Convert Video to 3D image (single channel) *************
g_filename="C:/Windows/System32/grayFlower.avi";
obj = VideoReader(g_filename);
g_vid = read(obj);
g_row=obj.Height;
g_col=obj.Width;
g_frame=obj.NumFrames;
Image3D=zeros(g_row,g_col,g_frame,'uint8');
for x = 1 : g_frame
    Image3D(:,:,x)=g_vid(:,:,1,x);
end
[S,U,V,W] = TruncatedHosvd(Image3D,720,1280,126);
H = Mult(Mult(Mult(S,U,1),V,2),W,3);
%******************************* End ***********************************

%****************** Convert Tensor to video ****************************
VidObj = VideoWriter('movie.avi','Grayscale AVI'); %set your file name and video compression
VidObj.FrameRate = 25; %set your frame rate
open(VidObj);
H = cast(H,'uint8');
for f = 1:size(H, 3)
      writeVideo(VidObj,H(:,:,f));
end
close(VidObj);
%******************************** End *********************************
