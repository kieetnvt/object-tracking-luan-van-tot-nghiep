function [assignments, unassignedTracks, unassignedDetections] = ...
        detection_track_to_assignment(tracks, centroids)

    n_tracks = length(tracks);

    n_detections = size(centroids, 1); % tinh so track, lenght cua array centroids

    cost = zeros(n_tracks, n_detections);
    
    for i = 1:n_tracks
        cost(i, :) = distance(tracks(i).kalman_filter, centroids);
    end

% gi� tr? l?n nh?t m� s? ph�t hi?n ??i t??ng kh�ng ???c g�n v�o c�c track
% s? d?ng h�m assignDetectionsToTracks c?a th? vi?n vision trong matlab
    costOfNonAssign = 20;
    [assignments, unassignedTracks, unassignedDetections] = ...
        assignDetectionsToTracks(cost, costOfNonAssign);
end