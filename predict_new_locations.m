function tracks = predict_new_locations(tracks)
    for i = 1:length(tracks)
        bbox = tracks(i).bbox;

% chúng tôi s? d?ng b? l?c Kalman Filter ?? d? ?oán v? trí tâm c?a m?i
% track t?i th?i ?i?m frame hi?n t?i và c?p nh?t l?i h?p bao bbox ?ng v?i
% ??i t??ng (track) này.
        predictedCentroid = predict(tracks(i).kalman_filter);

% d?ch chuy?n h?p bao ?ng v?i tâm c?a track ?ó t?i v? trí ???c d? ?oán.
        predictedCentroid = int32(predictedCentroid) - bbox(3:4) / 2;
        tracks(i).bbox = [predictedCentroid, bbox(3:4)]
        
    end
end