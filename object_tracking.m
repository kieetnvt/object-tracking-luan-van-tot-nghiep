function object_tracking()
% kh?i t?o bi?n h? th?ng
    file_video = uigetfile('*.*');
    video = setup(file_video);
    tracks = init_tracks();
    nextId = 1;
    while ~isDone(video.reader)
%         if  waitforbuttonpress
%         end
        frame = read_frame(video);

% v?i m?i frame hình, chúng tôi phát hi?n ??i t??ng và l?y nh?ng thu?c tính
% c?a ??i t??ng ???c phát hi?n
        [centroids, bboxes, mask, video] = detect_objects(video, frame);

% s? d?ng ph??ng pháp Kalman Filter ?? d? ?oán ví trí ti?p theo c?a ??i
% t??ng ?ã ???c phát hi?n
        tracks = predict_new_locations(tracks);

% ?ây là b??c ti?n x? lý các kh?i, so sánh gi?a ví tr? mà b? l?c Kalman
% Filter tiên ?oán v?i các ??i t??ng chính xác do giác thu?t phát hi?n
% ???c.
        [assignments, unassignedTracks, unassignedDetections] = ...
            detection_track_to_assignment(tracks, centroids);
        
        % buoc gan nhung doi tuong vao track, chinh xac hoc doi tuong
        tracks = update_assigned_tracks(assignments, centroids, bboxes, tracks);
        
        tracks = update_unassigned_tracks(unassignedTracks, tracks);
        
        tracks = delete_lost_tracks(tracks);
        
        [tracks, nextId] = create_new_tracks(unassignedDetections, centroids, bboxes, tracks, nextId);

        display_output(video, frame, mask, tracks);
    end
end