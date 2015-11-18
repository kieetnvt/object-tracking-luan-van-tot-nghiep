function [tracks, nextId] = create_new_tracks(unassignedDetections, centroids, bboxes, tracks, nextId)
    centroids = centroids(unassignedDetections, :);
    bboxes = bboxes(unassignedDetections, :);
    for i = 1:size(centroids, 1)
        centroid = centroids(i,:);
        bbox = bboxes(i, :);

        % tao Kalmal Filter objects su dung contantVelocity
        kalman_filter_config = configureKalmanFilter('ConstantVelocity', ...
            centroid, [200, 50], [100, 25], 100);

        newTrack = struct(...
            'id', nextId, ...
            'bbox', bbox, ...
            'kalman_filter', kalman_filter_config, ...
            'age', 1, ...
            'total_visible_count', 1, ...
            'total_invisible_count', 0);
        
        % them vao mang tracks cua he thong
        tracks(end + 1) = newTrack;
        nextId = nextId + 1;
    end
end