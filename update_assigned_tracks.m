function tracks = update_assigned_tracks(assign, centroids, bboxes, tracks)

% Chu thich:
% Ham nay se thuc thi viec cap nhat lai moi track da duoc gan voi tuong ung
% su phat hien detection.
% Ham se goi phuong phap chung toi su dung o day la visionKalmalFilter de
% hieu chinh vi tri moi cua track.
% Sau do no se luu cac thong tin moi ve bounding box, tang age cua track,
% tang totalvisible cua track len 1 ung voi tung frame dectect duoc.
% Ket thuc ham, ham se dat lai gia tri cua bien invisible cua track = 0.
    for i = 1:size(assign, 1)
        
        trackIdx = assign(i, 1);
        
        detectionIdx = assign(i, 2);
        
        centroid = centroids(detectionIdx, :);
        
        bbox = bboxes(detectionIdx, :);

        % Correct the estimate of the object's location
        % using the new detection.
        correct(tracks(trackIdx).kalman_filter, centroid);

        % Replace predicted bounding box with detected
        % bounding box.
        tracks(trackIdx).bbox = bbox;

        % Update track's age.
        tracks(trackIdx).age = tracks(trackIdx).age + 1;

        % Update visibility.
        tracks(trackIdx).total_visible_count = ...
            tracks(trackIdx).total_visible_count + 1;
        
        tracks(trackIdx).total_invisible_count = 0;
    end
    
end