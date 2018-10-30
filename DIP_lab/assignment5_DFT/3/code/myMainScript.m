%% MyMainScript

tic;
%% Your code here

image=load('../data/image_low_frequency_noise.mat');
im=image.Z;
[h,w]=size(im);
imnew=padarray(im,[h/2,w/2]);
imf=fft2(imnew);
im1=fftshift(imf);

logmag=log(abs(im1)+1);
imagesc(logmag);
colormap(jet);colorbar;

H=zeros(2*h,2*w);

Q=2;

ui=[119 139];vi=[114 150];
R=70;
for i=1:h
    
   for j=1:w
       
      for k=1:Q
         if (i-ui(k))*(i-ui(k)) +(j-vi(k))*(j-vi(k)) <= R*R
            im1(i+h/2,j+w/2)=0;
         end
      end
   end
end

imnew=ifft2(ifftshift(im1));
imnew1=real(imnew);
extract=imnew1(h/2+1:h+h/2,w/2+1:w+w/2);
figure
imshow(extract);















toc;
