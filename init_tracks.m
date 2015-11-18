function tracks = init_tracks()

% ***********************************************************************
% Ch�ng t�i t?o m?t m?ng tracks, ch?a c�c track, m?i track d�ng ?? bi?u
% di?n 1 ??i t??ng chuy?n ??ng trong video v?i c�c thu?c t�nh nh? sau:
% ***********************************************************************
% Attributes: 
%  id  -- id c?a track
% bbox -- h?p bao ?�ng hi?n t?i c?a v?t th? chuy?n ??ng
% kalman_filter -- l� thu?c t�nh ?? theo d�i ???ng ?i
% age  -- t?ng s? frame m� ??m ???c t? l�c v?t th? ???c tracking
% total_visible_count -- t?ng s? frame m� t?i ?� v?t th? xu?t hi?n
% consecutiveInvisibleCount -- t?ng s? frame li�n ti?p v?t th? kh�ng c�n
% xu?t hi?n.
% ***********************************************************************

tracks = struct(...
        'id', {}, ...
        'bbox', {}, ...
        'kalman_filter', {}, ...
        'age', {}, ...
        'total_visible_count', {}, ...
        'total_invisible_count', {});

end