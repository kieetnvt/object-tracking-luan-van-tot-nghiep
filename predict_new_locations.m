function tracks = predict_new_locations(tracks)
    for i = 1:length(tracks)
        bbox = tracks(i).bbox;

% ch�ng t�i s? d?ng b? l?c Kalman Filter ?? d? ?o�n v? tr� t�m c?a m?i
% track t?i th?i ?i?m frame hi?n t?i v� c?p nh?t l?i h?p bao bbox ?ng v?i
% ??i t??ng (track) n�y.
        predictedCentroid = predict(tracks(i).kalman_filter);

% d?ch chuy?n h?p bao ?ng v?i t�m c?a track ?� t?i v? tr� ???c d? ?o�n.
        predictedCentroid = int32(predictedCentroid) - bbox(3:4) / 2;
        tracks(i).bbox = [predictedCentroid, bbox(3:4)]
        
    end
end