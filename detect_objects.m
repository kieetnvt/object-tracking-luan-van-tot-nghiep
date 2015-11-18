function [centroids, bboxes, mask, video] = detect_objects(video, frame)
   
% chúng tôi s? d?ng gi?i thu?t m?i d?a trên background subtraction ?? phát
% hi?n n?n c?a video
%     
% các ch? s? này ph? thu?c vào video + hoàn c?nh khách quan
%     gia tri tau de xac dinh 2 diem anh tru nhau, neu lon tau tuc no la
%     obj mask, nguoc lai la background
    frame_grey = double(rgb2gray(frame));
    
%   params for video new_1
%     gamma = 0.07;
%     tau = 0.2;
    
%   params for video new_2
    gamma = 0.07;
    tau = 0.165;

    radius = 2;
    
    if ~isfield(video, 'backgroundSubtraction');
      video.backgroundSubtraction = frame_grey;     
    end
    video.backgroundSubtraction = gamma * frame_grey + (1 - gamma) * video.backgroundSubtraction;
    mask = abs(video.backgroundSubtraction - frame_grey) > tau;
    
    mask = imclose(mask, strel('disk', radius));
%     mask = imopen(mask, strel('rectangle', [3, 3])); % remove noise: truot inside forground, neu khong du mat tran thi remove diem anh -> 0
%     mask = imclose(mask, strel('rectangle', [15, 15])); % fill hole: truot outside forground, 
%     mask = imfill(mask, [3,3], 1);

% Perform blob analysis to find connected components
% g?i hàm vision.BlobAnalysis c?a th? vi?n vision trong matlab
    [~, centroids, bboxes] = video.blobAnalyser.step(mask);
end