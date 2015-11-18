function [assignments, unassignedTracks, unassignedDetections] = ...
        detection_track_to_assignment(tracks, centroids)

    n_tracks = length(tracks);

    n_detections = size(centroids, 1); % tinh so track, lenght cua array centroids

    cost = zeros(n_tracks, n_detections);
    
    for i = 1:n_tracks
        cost(i, :) = distance(tracks(i).kalman_filter, centroids);
    end

% giá tr? l?n nh?t mà s? phát hi?n ??i t??ng không ???c gán vào các track
% s? d?ng hàm assignDetectionsToTracks c?a th? vi?n vision trong matlab
    costOfNonAssign = 20;
    [assignments, unassignedTracks, unassignedDetections] = ...
        assignDetectionsToTracks(cost, costOfNonAssign);
end