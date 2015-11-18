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

% v?i m?i frame h�nh, ch�ng t�i ph�t hi?n ??i t??ng v� l?y nh?ng thu?c t�nh
% c?a ??i t??ng ???c ph�t hi?n
        [centroids, bboxes, mask, video] = detect_objects(video, frame);

% s? d?ng ph??ng ph�p Kalman Filter ?? d? ?o�n v� tr� ti?p theo c?a ??i
% t??ng ?� ???c ph�t hi?n
        tracks = predict_new_locations(tracks);

% ?�y l� b??c ti?n x? l� c�c kh?i, so s�nh gi?a v� tr? m� b? l?c Kalman
% Filter ti�n ?o�n v?i c�c ??i t??ng ch�nh x�c do gi�c thu?t ph�t hi?n
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